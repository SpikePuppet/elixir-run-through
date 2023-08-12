defmodule KV.BucketTest do
  # Async makes this run in parrallel with other async
  # test cases!
  use ExUnit.Case, async: true

  # Sets up a setup callback - a macro which runs before
  # every test
  setup do
    bucket = start_supervised!(KV.Bucket)
    %{bucket: bucket}
  end

  test "stores value by key", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "sody") == nil

    KV.Bucket.put(bucket, "sody", 3)
    assert KV.Bucket.get(bucket, "sody") == 3
  end

  test "deletes value from bucket and returns the last value that was set", %{bucket: bucket} do
    KV.Bucket.put(bucket, "sody", 3)
    assert KV.Bucket.delete(bucket, "sody") == 3
    assert KV.Bucket.get(bucket, "sody") == nil
  end
end
