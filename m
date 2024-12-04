Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70B1E77160
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 00:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9FbCJ3x5IuqiKm/j7Dkcx5/WgXv4GorOvwEXGeUN44=; b=30prI+IiOjnfmGt+cHSU8e+vxo
	QODgkuNiiS42/hmtg/3g9cRkzuOPHNeeSIU+IipuQuVB6xGXJ5VoaklY8AW/SH+LUbJeKCGwlvv4b
	kXY3YXWK1W9dWOIQ6ySXDpMD5c72lF9XzvKtz6wkACdaaLwO25zHKVWjPVSiT8Axqulttsru6AHSU
	ve2Fz0iioh+aVB0AMwXqHtrXXpMyihzWbOhq9lzSjqPg1hrX50FJC701EXchQoTaxiWj+wMvod8lk
	S4EHZaVj4rjzuXkkm+o10J4kd/oOafpjARI2247F2Ot5tk23/ISO5O5CXj8jeG8vn+shptycqVLNX
	utWejPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIdCS-0000000B7H9-0C6y;
	Wed, 04 Dec 2024 00:25:04 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIdBQ-0000000B76O-2uX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 00:24:02 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3a74d9aeb38so21677065ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 16:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733271839; x=1733876639; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9FbCJ3x5IuqiKm/j7Dkcx5/WgXv4GorOvwEXGeUN44=;
        b=W1Dw70KrzwpytP5RU7iRTpNCRegZ2N0naEJrOwW2aeSHfYWW6FO2kXTzBxhk+guaOt
         csJRWiMl0oDTH7tDMg3fnkwUMmWNFdJHuMbMKkHEZ6DrZbOJ4VAl5BEHSgt1/MaIHgQ9
         7Y9YgPkj9pPEoU8yL6wc1Wt5/of6UguZKLsoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733271839; x=1733876639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9FbCJ3x5IuqiKm/j7Dkcx5/WgXv4GorOvwEXGeUN44=;
        b=Z0E0LbY9I9rqym6hyogY6rRUWHl4sbpChzw844HFDlWGfcXEs9zDLDXVPJ870GENlT
         3XS6hes4CEAs7ykGgM8k2pON+7lC/tMb9d0syjiqUBPPA1RzV+9XDg+SXr06t12IguUF
         rp8Xdzw75JfH5hdb2p4aEvllZP1Sd5DdmicF1w481LR9AgLAzb12ME1/9XcvXSD4feSU
         HYG5XG4DpHDnOTGBNfiFiS+PzPJMyfvLtMjQZOb8E/WadROqKu5CdkxfNhZLjLKWLMb4
         +XyPeKzwJ2nQY/6UAs6WHHtKJ0o1ejYn+WcQA5WuydmtWjG79BhWZXvnPfGXlp2QGkTM
         IX4Q==
X-Gm-Message-State: AOJu0Yw7FWGJ2Zt0Vv3wT6Yo+AjRIsVx84pLV0FJJ58XyDUwTrTFggWE
	gUhmGFrlipCvp0A0s5auSH4JEVL5THPFO7ABf9NolatwCkpZqVJqKKAvgIdU8S4=
X-Gm-Gg: ASbGncs0LVZmuHNvao8e025ekrtKdz5olDN4IAKWoV1Sd385aKGs1Gu0c+o1TcKDHdN
	AuKumbk2emzpfZsjFzbRO2sbx1LRBHd+ieG6oqwziRgIiySkDmnC0GN/Wvut0tCJ46h37D7RG30
	c+PY1NdFeiADpPuZzF0Q+aXheRKB8V/vbG1qZxh5NmB7fQp+eOhZSg/iYDgrLPbSJ9PsviggzGi
	mampJJ9YOPuHYgC75dUueCX9Q2vRQA1eioHCXqw39EHQM974CMZtSsR4kAXAw==
X-Google-Smtp-Source: AGHT+IFFmMu7amT4tAHwLTX5LZYeNDtyDgTZPdJhuoc5E5+fNYPSbpXnhLVmJnXlu2dY0WS4xaa5Ow==
X-Received: by 2002:a05:6e02:19c8:b0:3a7:c5b1:a55c with SMTP id e9e14a558f8ab-3a7f99baa4fmr55303285ab.0.1733271839042;
        Tue, 03 Dec 2024 16:23:59 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230e9064esm2736966173.156.2024.12.03.16.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 16:23:58 -0800 (PST)
Message-ID: <115bb206-8401-4475-977d-7dd98a2b872c@linuxfoundation.org>
Date: Tue, 3 Dec 2024 17:23:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: arm coresight: sysfsmode testing
To: Linu Cherian <lcherian@marvell.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org, james.clark@arm.com
Cc: linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, sgoutham@marvell.com, gcherian@marvell.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241129083813.3056909-1-lcherian@marvell.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241129083813.3056909-1-lcherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_162401_065209_5173443E 
X-CRM114-Status: GOOD (  24.68  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/29/24 01:38, Linu Cherian wrote:
> Add sysfs mode selftest for ARM Coresight hardware tracer.

Please add details on what this test does in here. Include
the output from the test?

Does this test have dependencies on config? If it does, does
this test detect and skip if config isn't enabled?

> 
> Signed-off-by: Linu Cherian <lcherian@marvell.com>
> ---
>   .../drivers/hwtracing/coresight/Makefile      |   5 +
>   .../hwtracing/coresight/sysfs_test_trace.sh   | 144 ++++++++++++++++++
>   2 files changed, 149 insertions(+)
>   create mode 100644 tools/testing/selftests/drivers/hwtracing/coresight/Makefile
>   create mode 100755 tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> 
> diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/Makefile b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
> new file mode 100644
> index 000000000000..7dc68ae1c0a9
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/hwtracing/coresight/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +TEST_PROGS = sysfs_test_trace.sh
> +
> +include ../../../lib.mk
> diff --git a/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> new file mode 100755
> index 000000000000..0d6307fff1d2
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/hwtracing/coresight/sysfs_test_trace.sh
> @@ -0,0 +1,144 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2024 Marvell.
> +
> +# Test Arm CoreSight trace capture in sysfs mode
> +# Based on tools/perf/tests/shell/test_arm_coresight.sh
> +
> +glb_err=0
> +
> +arm_cs_report() {
> +	if [ $2 != 0 ]; then
> +		echo "$1: FAIL"
> +		glb_err=$2
> +	else
> +		echo "$1: PASS"
> +	fi
> +}
> +
> +is_device_sink() {
> +	# If the node of "enable_sink" is existed under the device path, this
> +	# means the device is a sink device.
> +
> +	if [ -e "$1/enable_sink" ]; then
> +
> +		return 0
> +	else
> +		return 1
> +	fi
> +}
> +
> +# Configure sink for buffer mode
> +cfg_sink_buf_mode() {
> +	sink_dev=$1
> +	mode=$2
> +	# Set buffer mode if supported
> +	if [ -e "$sink_dev/buf_modes_available" ]; then
> +		cat $sink_dev/buf_modes_available | grep -E -q $mode
> +		if [ $? -eq 0 ]; then
> +			echo $mode > $sink_dev/buf_mode_preferred
> +			return 0
> +		fi
> +	fi
> +
> +	return 1
> +}
> +
> +run_app() {
> +
> +	taskset -c $1 dd if=/dev/urandom  of=/dev/null bs=1M count=64
> +}
> +
> +sysfs_trace() {
> +	src_dev=$1
> +	sink_dev=$2
> +	cpu=$3
> +
> +	# Enable sink device
> +	echo 1 > $sink_dev/enable_sink
> +	# Enable source device
> +	echo 1 > $src_dev/enable_source
> +
> +	# Run app to be traced
> +	run_app $cpu
> +
> +	# Read back trace data
> +	dd if=/dev/$sink_dev_name of=/tmp/tracedata
> +
> +	# Verify if read is successful
> +	err=$?
> +
> +	# Disable source device
> +	echo 0 > $src_dev/enable_source
> +
> +	# Diskable sink device
> +	echo 0 > $sink_dev/enable_sink
> +
> +	arm_cs_report "CoreSight path testing (CPU$cpu -> $sink_dev_name)" $err
> +}
> +
> +try_sysfs_trace_resrv_buf() {
> +	src_dev=$1
> +	sink_dev=$2
> +	cpu=$3
> +
> +	# Configure the resrved buffer mode if available
> +	cfg_sink_buf_mode $sink_dev "resrv"
> +	if [ $? -eq 0 ]; then
> +		echo "Running sysfs trace with resrv buf mode"
> +		sysfs_trace $src_dev $sink_dev $cpu
> +		# Restore buffer mode
> +		cfg_sink_buf_mode $sink_dev "auto"
> +		if [ $? -eq 1 ]; then
> +			echo "Failed to restore default buf mode"
> +		fi
> +	fi
> +}
> +
> +arm_cs_iterate_devices() {
> +	src_dev=$1
> +	cpu=$3
> +	for cdev in $2/connections/out\:*; do
> +
> +		# Skip testing if it's not a directory
> +		! [ -d $cdev ] && continue;
> +
> +		# Read out its symbol link file name
> +		sink_dev=`readlink -f $cdev`
> +
> +		# Extract device name from path, e.g.
> +		#   sink_dev = '/sys/devices/platform/20010000.etf/tmc_etf0'
> +		#     `> sink_dev_name = 'tmc_etf0'
> +		sink_dev_name=$(basename $sink_dev)
> +
> +		if is_device_sink $sink_dev; then
> +			# Run trace with resrv buf mode (if available)
> +			try_sysfs_trace_resrv_buf $src_dev $sink_dev $cpu
> +
> +			# Run the default mode
> +			echo "Running sysfs trace with default settings"
> +			sysfs_trace $src_dev $sink_dev $cpu
> +		fi
> +
> +		arm_cs_iterate_devices $src_dev $cdev $cpu
> +
> +	done
> +}
> +
> +arm_cs_etm_traverse_path_test() {
> +	# Iterate for every ETM device
> +	for dev in /sys/bus/event_source/devices/cs_etm/cpu*; do
> +		# Canonicalize the path
> +		dev=`readlink -f $dev`
> +
> +		# Find the ETM device belonging to which CPU
> +		cpu=`cat $dev/cpu`
> +
> +		# Use depth-first search (DFS) to iterate outputs
> +		arm_cs_iterate_devices $dev $dev $cpu
> +	done
> +}
> +
> +arm_cs_etm_traverse_path_test
> +
> +exit $glb_err

thanks,
-- Shuah

