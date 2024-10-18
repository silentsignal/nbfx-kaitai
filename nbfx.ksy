meta:
  id: nbfx
  file-extension: nbfx
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
            #0x06: short_dictionary_attribute
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
            0x56: prefix_dictionary_element
            _: unknown_byte

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
  multi_byte_int31:
    seq:
      - id: foo
        type: u1
  nbfx_string:
    seq:
      - id: str_len
        type: u1
      - id: str
        type: str
        size: str_len
        encoding: ascii
  unknown_byte:
    seq:
      - id: value
        type: u1
