meta:
  id: nbfx
  file-extension: nbfx
  endian: le
seq:
  - id: records
    type: record
    repeat: eos
types:
  record:
    seq:
      - id: rec_type
        type: u1
      - id: rec_body
        type:
          switch-on: rec_type
          cases:
            0x01: end_element
            0x07: dictionary_attribute
            0x09: xmlns_attribute
            0x0a: short_dictionary_xmlns_attribute
            #0x06: short_dictionary_attribute
            0x0b: dictionary_xmls_attribute
            0x0c: prefix_dictionary_attribute
            0x0d: prefix_dictionary_attribute
            0x0e: prefix_dictionary_attribute
            0x0f: prefix_dictionary_attribute
            0x10: prefix_dictionary_attribute
            0x11: prefix_dictionary_attribute
            0x12: prefix_dictionary_attribute
            0x13: prefix_dictionary_attribute
            0x14: prefix_dictionary_attribute
            0x15: prefix_dictionary_attribute
            0x16: prefix_dictionary_attribute
            0x17: prefix_dictionary_attribute
            0x18: prefix_dictionary_attribute
            0x19: prefix_dictionary_attribute
            0x1a: prefix_dictionary_attribute
            0x1b: prefix_dictionary_attribute
            0x1c: prefix_dictionary_attribute
            0x1d: prefix_dictionary_attribute
            0x1e: prefix_dictionary_attribute
            0x1f: prefix_dictionary_attribute
            0x20: prefix_dictionary_attribute
            0x21: prefix_dictionary_attribute
            0x22: prefix_dictionary_attribute
            0x23: prefix_dictionary_attribute
            0x24: prefix_dictionary_attribute
            0x25: prefix_dictionary_attribute
            0x26: prefix_attribute
            0x27: prefix_attribute
            0x28: prefix_attribute
            0x29: prefix_attribute
            0x2a: prefix_attribute
            0x2b: prefix_attribute
            0x2c: prefix_attribute
            0x2d: prefix_attribute
            0x2e: prefix_attribute
            0x2f: prefix_attribute
            0x30: prefix_attribute
            0x31: prefix_attribute
            0x32: prefix_attribute
            0x33: prefix_attribute
            0x34: prefix_attribute
            0x35: prefix_attribute
            0x36: prefix_attribute
            0x37: prefix_attribute
            0x38: prefix_attribute
            0x39: prefix_attribute
            0x3a: prefix_attribute
            0x3b: prefix_attribute
            0x3c: prefix_attribute
            0x3d: prefix_attribute
            0x3e: prefix_attribute
            0x3f: prefix_attribute
            0x42: short_dictionary_element
            0x44: prefix_dictionary_element
            0x45: prefix_dictionary_element
            0x46: prefix_dictionary_element
            0x47: prefix_dictionary_element
            0x48: prefix_dictionary_element
            0x49: prefix_dictionary_element
            0x4a: prefix_dictionary_element
            0x4b: prefix_dictionary_element
            0x4c: prefix_dictionary_element
            0x4d: prefix_dictionary_element
            0x4e: prefix_dictionary_element
            0x4f: prefix_dictionary_element
            0x50: prefix_dictionary_element
            0x51: prefix_dictionary_element
            0x52: prefix_dictionary_element
            0x53: prefix_dictionary_element
            0x54: prefix_dictionary_element
            0x55: prefix_dictionary_element
            0x56: prefix_dictionary_element
            0x82: one_text
            0x88: int8_text
            0x89: int8_text
            0x98: chars8_text
            0x99: chars8_text
            0xaa: dictionary_text
            0xab: dictionary_text
            0xac: uniqueid_text
            0xad: uniqueid_text
            #_: unknown_byte
  prefix_dictionary_attribute:
    seq:
      - id: name_id
        type: multi_byte_int31
      # - id: value
      #   type: record
  chars8_text:
    seq:
      - id: length
        type: u1
      - id: bytes
        size: length
  one_text: {}
  prefix_attribute:
    seq:
      - id: name
        type: nbfx_string
      - id: value
        type: nbfx_string
  prefix_dictionary_element:
    seq:
      - id: name_id
        type: multi_byte_int31
      # How the hell should we determine the number of attributes here?
  short_dictionary_element:
    seq:
      - id: name_id
        type: multi_byte_int31
  dictionary_attribute:
    seq:
      - id: prefix
        type: nbfx_string
      - id: name
        type: multi_byte_int31
      - id: value
        type: record
  dictionary_text:
    seq:
      - id: string_id
        type: multi_byte_int31
  xmlns_attribute:
    seq:
      - id: prefix
        type: nbfx_string
      - id: name
        type: nbfx_string
  short_dictionary_xmlns_attribute:
    seq:
      - id: value
        type: multi_byte_int31
  int8_text:
    seq:
      - id: value
        type: u1
  multi_byte_int31: # https://formats.kaitai.io/vlq_base128_be/
    seq:
      - id: multibytes
        type: multibyte
        repeat: until
        repeat-until: not _.has_next
    instances:
      last:
        value: multibytes.size - 1
      value:
        value: |
          (multibytes[last].value
          + (last >= 1 ? (multibytes[last - 1].value << 7) : 0)
          + (last >= 2 ? (multibytes[last - 2].value << 14) : 0)
          + (last >= 3 ? (multibytes[last - 3].value << 21) : 0)).as<u4>
  multibyte:
    seq:
      - id: has_next
        type: b1
      - id: value
        type: b7
  dictionary_xmls_attribute:
    seq:
      - id: prefix
        type: u2
      - id: value
        type: multi_byte_int31
  uniqueid_text:
    seq:
      - id: uuid
        size: 16
  end_element: {}
  nbfx_string:
    seq:
      - id: str_len
        type: multi_byte_int31
      - id: str
        type: str
        size: str_len.value
        encoding: ascii
  unknown_byte:
    seq:
      - id: value
        type: u1



