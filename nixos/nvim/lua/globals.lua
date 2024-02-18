return {
  save_call = function(code, ...)
    local ok, ret = pcall(code, ...)
    if not ok then
      return nil
    else
      return ret
    end
  end,
  save_require = function(module)
    local ok, ret = pcall(require, module)
    if not ok then
      pcall(function()
        print(ret)
      end)
      return {}
    else
      return ret
    end
  end
}
