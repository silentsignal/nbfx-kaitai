meta:
  id: nbfx
  file-extension: nbfx
  endian: le
seq:
  - id: dictionary_table
    type: dictionary_table
  - id: records
    type: record
    repeat: eos
types:
  dictionary_table:
    seq:
      - id: size
        type: multi_byte_int31
      - id: entries
        type: dictionary_entries
        size: size.value
  dictionary_entries:
    seq:
      - id: entry
        type: nbfx_string
        repeat: eos
  record:
    seq:
      - id: rec_type
        type: u1
      - id: rec_body
        type:
          switch-on: rec_type
          cases:
            0x01: end_element
            0x02: comment
            0x03: array_record
            0x04: short_attribute
            0x05: attribute
            0x06: short_dictionary_attribute
            0x07: dictionary_attribute
            0x09: xmlns_attribute
            0x0a: short_dictionary_xmlns_attribute
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
            0x40: short_element
            0x41: element
            0x42: short_dictionary_element
            0x43: dictionary_element
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
            0x57: prefix_dictionary_element
            0x58: prefix_dictionary_element
            0x59: prefix_dictionary_element
            0x5a: prefix_dictionary_element
            0x5b: prefix_dictionary_element
            0x5c: prefix_dictionary_element
            0x5d: prefix_dictionary_element
            0x5e: prefix_element
            0x5f: prefix_element
            0x60: prefix_element
            0x61: prefix_element
            0x62: prefix_element
            0x63: prefix_element
            0x64: prefix_element
            0x65: prefix_element
            0x66: prefix_element
            0x67: prefix_element
            0x68: prefix_element
            0x69: prefix_element
            0x6a: prefix_element
            0x6b: prefix_element
            0x6c: prefix_element
            0x6d: prefix_element
            0x6e: prefix_element
            0x6f: prefix_element
            0x70: prefix_element
            0x71: prefix_element
            0x72: prefix_element
            0x73: prefix_element
            0x74: prefix_element
            0x75: prefix_element
            0x76: prefix_element
            0x77: prefix_element
            0x78: reserved
            0x79: reserved
            0x7a: reserved
            0x7b: reserved
            0x7c: reserved
            0x7d: reserved
            0x7e: reserved
            0x7f: reserved
            0x80: zero_text
            0x81: zero_text
            0x82: one_text
            0x83: one_text
            0x84: false_text
            0x85: false_text
            0x86: true_text
            0x87: true_text
            0x88: int8_text
            0x89: int8_text
            0x8a: int16_text
            0x8b: int16_text
            0x8c: int32_text
            0x8d: int32_text
            0x8e: int64_text
            0x8f: int64_text
            0x90: float_text
            0x91: float_text
            0x92: double_text
            0x93: double_text
            0x94: decimal_text
            0x95: decimal_text
            0x96: date_time_text
            0x97: date_time_text
            0x98: chars8_text
            0x99: chars8_text
            0x9a: chars16_text
            0x9b: chars16_text
            0x9c: chars32_text
            0x9d: chars32_text
            0x9e: bytes8_text
            0x9f: bytes8_text
            0xa0: bytes16_text
            0xa1: bytes16_text
            0xa2: bytes32_text
            0xa3: bytes32_text
            0xa4: start_list_text
            0xa5: reserved
            0xa6: end_list_text
            0xa7: reserved
            0xa8: empty_text
            0xa9: empty_text
            0xaa: dictionary_text
            0xab: dictionary_text
            0xac: uniqueid_text
            0xad: uniqueid_text
            0xae: time_span_text
            0xaf: time_span_text
            0xb0: uuid_text
            0xb1: uuid_text
            0xb2: uint64_text
            0xb3: uint64_text
            0xb4: bool_text
            0xb5: bool_text
            0xb6: unicode_chars8_text
            0xb7: unicode_chars8_text
            0xb8: unicode_chars16_text
            0xb9: unicode_chars16_text
            0xba: unicode_chars32_text
            0xbb: unicode_chars32_text
            0xbc: qname_dictionary_text
            0xbd: qname_dictionary_text
            #_: unknown_byte
  reserved: {}
  zero_text: {}
  false_text: {}
  true_text: {}
  start_list_text: {}
  end_list_text: {}
  empty_text: {}
  qname_dictionary_text:
    seq:
      - id: prefix
        type: u1
      - id: name
        type: multi_byte_int31
  unicode_chars8_text:
    seq:
      - id: num_bytes
        type: u1
      - id: string
        type: str
        encoding: UTF-16LE
        size: num_bytes
  unicode_chars16_text:
    seq:
      - id: num_bytes
        type: u2
      - id: string
        type: str
        encoding: UTF-16LE
        size: num_bytes
  unicode_chars32_text:
    seq:
      - id: num_bytes
        type: u4
      - id: string
        type: str
        encoding: UTF-16LE
        size: num_bytes
  uint64_text:
    seq:
      - id: value
        type: u8
  bytes8_text:
    seq:
      - id: num_bytes
        type: u1
      - id: bytes
        type: u1
        repeat: expr
        repeat-expr: num_bytes
  bytes16_text:
    seq:
      - id: num_bytes
        type: u2
      - id: bytes
        type: u1
        repeat: expr
        repeat-expr: num_bytes
  bytes32_text:
    seq:
      - id: num_bytes
        type: u2
      - id: bytes
        type: u1
        repeat: expr
        repeat-expr: num_bytes
  prefix_element:
    seq:
      - id: name
        type: nbfx_string
  element:
    seq:
      - id: prefix
        type: nbfx_string
      - id: name
        type: nbfx_string
  dictionary_element:
    seq:
      - id: prefix
        type: nbfx_string
      - id: name
        type: multi_byte_int31
  short_element:
    seq:
      - id: name
        type: nbfx_string
  attribute:
    seq:
      - id: prefix
        type: nbfx_string
      - id: name
        type: nbfx_string
      - id: value
        type: nbfx_string
  array_record:
    seq:
      - id: element
        type: record
      - id: end_element
        type: u1
      - id: record_type
        type: u1
      - id: length
        type: multi_byte_int31
      - id: data
        repeat: expr
        repeat-expr: length.value
        type:
          switch-on: record_type
          cases:
            0xb5: bool_text
            0x8b: int16_text
            0x8d: int32_text
            0x8f: int64_text
            0x91: float_text
            0x93: double_text
            0x95: decimal_text
            0x97: date_time_text
            0xaf: time_span_text
            0xb1: uuid_text
  short_attribute:
    seq:
      - id: name
        type: nbfx_string
      - id: value
        type: record
  short_dictionary_attribute:
    seq:
      - id: name
        type: multi_byte_int31
      - id: value
        type: record
  uuid_text:
    seq:
      - id: uuid
        type: u2
  time_span_text:
    seq:
      - id: value
        type: u1
  date_time_text:
    seq:
      - id: value
        type: u2
  decimal_text:
    seq:
      - id: value
        type: u2
  bool_text:
    seq:
      - id: int_value
        type: u1
  comment:
    seq:
      - id: content
        type: nbfx_string
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
      - id: string
        type: str
        encoding: UTF-8
        size: length
  chars16_text:
    seq:
      - id: length
        type: u2
      - id: string
        type: str
        encoding: UTF-8
        size: length
  chars32_text:
    seq:
      - id: length
        type: u4
      - id: string
        type: str
        encoding: UTF-8
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
  int16_text:
    seq:
      - id: value
        type: u2
  int32_text:
    seq:
      - id: value
        type: u4
  int64_text:
    seq:
      - id: value
        type: u8
  float_text:
    seq:
      - id: value
        type: u4
  double_text:
    seq:
      - id: value
        type: u8
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
          (multibytes[0].value
          | (last >= 1 ? (multibytes[1].value << 7) : 0)
          | (last >= 2 ? (multibytes[2].value << 14) : 0)
          | (last >= 3 ? (multibytes[3].value << 21) : 0)).as<u4>
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
        encoding: ASCII
  unknown_byte:
    seq:
      - id: value
        type: u1

