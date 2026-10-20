Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4E7606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ny/neiyw;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RZTxKc7P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4Iip/s7oVuzCnYoFEs3DZuJtsQZW95G7/pZOVyPUeg=; b=ny/neiywmS3s5QsqJ0FhUIYEPB
	Q8qho2JnXLkIGXuwvWvK/J7fAqSDOHLSHCfrNsSaCfBMpIlj1PY+Sw+j9+2WAJpevCI9d7NX9lpco
	0n6tg5X8dhzGT+axRpvwUnYaLkicUtRFValRsrTq7+9NlMabmUYlUYovXU5tV0/YhMds4ex5G/Odi
	r/8PcedcWjcF2Xm8q+/a2KzDJjqNNEjWLJ9TYbV8U6Ckt58vheR8wNnJsciKHGNr8n4uneSBnYAMC
	6KPMsnuEn4gLiJYKJkLeNX2D+eRjkPy6AQ1GEOIzw7OaCjaFvkPh9upE+epfYEq5fCm2fyoxlDhWS
	stw8I3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAwN-00000009xno-3c18;
	Tue, 20 Oct 2026 14:35:47 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAwL-00000009xnB-1bqp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:35:46 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso33343025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792506943; x=1793111743; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4Iip/s7oVuzCnYoFEs3DZuJtsQZW95G7/pZOVyPUeg=;
        b=RZTxKc7PX0Qvhao3od/553ldLOcWp4cyJjugtmPWG0pQYEVi24crcxFbWZwj5kLqQV
         v9NK4DuZfo7tsuehxw0wrjrk7SBXVLnkf1awbWMD025lqAIg4daU5kVbw8mH/fNIMT+q
         KbgdL31XBOb69tvsvxzjKFcRu7SOTkYjItz5vqYt0DAtfjiT1pGxVsULWkK487u5D1p7
         ZpqsllUXnaZ8FKQViptsxNC1U4acJ9KhvuY7cRTmGZaARB3jmBG2zK3FwwwMCznSasE9
         XM7EFH36RBT70Bq3FwrXVWguq/DdtTxMALpRHMCK0FyK+htgVOvrwEIHnuCKntjn3IS0
         MbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506943; x=1793111743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4Iip/s7oVuzCnYoFEs3DZuJtsQZW95G7/pZOVyPUeg=;
        b=RqkVC5kxg5aZRoWV7IO6gV8PlISE3/UkQHPP1oeb6+o+CjL6hQ4gmySZTJC9JeAB9U
         0vSDkuYO8wbwk00nyaUgxJWX4imTTGoLU3wWlicpc86fxvW4HWXY8ZXB9o1CZzPhKwIP
         MYFNAy+tMYkEesfDQCcAG0lAXWJNo++aWeAYpNyv1IsYx6zByis0BsEEXH0hHF4HayiS
         bSBwpeqAS0Ggywu0I1pPLz9SugBa6G/UGaq/Tvg+ms9yICX5+7VWyleCX2upy6tIXXFp
         wGxiP5ADnlto4AePOjBlyVToK/LgI8SuzU8z7TwOvE6WfAl+UWdcqZQ+WvJXbUXkKDCl
         6eQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiaq5rXld9SfUmC0HD0er0Il9p21iziBqeIZXWlKqUiQtjVSo/rEkigP7bCYyJaAvCeuYhjS8A29ZZ8bHYbIQ6@lists.infradead.org
X-Gm-Message-State: AFq9FYIMJIINKemoc3YkMpt6PAeRCtzKBxuBkXawIAZhtM4N/JzI9Pv9
	6xXct5hhYkp4c2F0yBHD/XcdPi1eYx7QbxKn+21NRCsC/64jNsoWGSLQAnJqu+87/vhMWzIW9F7
	01V9Gx1l1kg==
X-Gm-Gg: AYBFou0C8s40FETq6JMe9uMpArBSPzl/77HGaFtU6uyFfxN6MWQi9rhm1x8zvqY/ghK
	PQzOR6EMLz8WT2jGKiIL7fabI37Q1VVAk88VRWOLUKEoLSiYcD3t2ISdnP1uaBr4QdFdYGCT1Ho
	PfI4JGcmtojLU76Oev+Tgww5aTZv0gfYqAtX39XMgWTDSdR4nSH2V14Uca59DRPB11LpGDKyLJk
	9CXVfAq8wNCSjp7IvKABZs9uNkuou5yATvy+LyNovAuFZMS/3zrMnSrSqlDEHBZnq84uRS196n7
	zrZOXJrtFp15/q6QvkICzT7gtYG2BsaUe++KuLu8P24VFPK24cRX3CbFSbTvZEpy5QrGKcUC6Ar
	G3H+swgKmwrD87zaLtHz8kb5SfLZBwfcnq6YEhofSHO82GFI8grwgI2jH9mVyCzi2YdufH6Jwt0
	P7p97C65ZhL3XkWt3nlCNLxLhrINj3waZT1cuy/jB3qxkZnQIld5HnRHAioT4XuINmfuCMFApa1
	erlS0ghaCIezQ==
X-Received: by 2002:a05:600c:8709:b0:4a1:7b05:3a6d with SMTP id 5b1f17b1804b1-4a1d75e6fa6mr206342555e9.8.1792506943206;
        Tue, 20 Oct 2026 07:35:43 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm82506805e9.13.2026.10.20.07.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:35:42 -0700 (PDT)
Message-ID: <0792487e-b6fc-4b9d-8120-83281a15217c@linaro.org>
Date: Tue, 20 Oct 2026 15:35:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/25] perf test: Add CoreSight AUX sample decoding test
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-24-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-24-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073545_491389_FBC56093 
X-CRM114-Status: GOOD (  32.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 15/09/2026 16:49, Leo Yan wrote:
> Add a shell test that records the brstack workload with 8 KiB AUX
> samples attached to cycle events. Pin the workload to a CPU with a TRBE
> sink and use per-thread recording with trace timestamps and context IDs
> disabled, exercising decoding with the owning sample's context.
> 
> Check branch stacks and callchains with --itrace=L4, L64, G3 and G3L64.
> Require at least one sample to reach both requested depths, with all
> callchain frames belonging to the workload, and reject samples exceeding
> either limit. Use a callchain depth of three to match the nested calls
> in brstack.
> 
> Compare with AUX decoding enabled and disabled to verify that adding
> history preserves the original PMU samples.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/tests/shell/coresight/aux_sample.sh | 189 +++++++++++++++++++++++++
>   1 file changed, 189 insertions(+)
> 
> diff --git a/tools/perf/tests/shell/coresight/aux_sample.sh b/tools/perf/tests/shell/coresight/aux_sample.sh
> new file mode 100755
> index 0000000000000000000000000000000000000000..887ad6a085eacdfd192db3863fbb61dae1aa19b5
> --- /dev/null
> +++ b/tools/perf/tests/shell/coresight/aux_sample.sh
> @@ -0,0 +1,189 @@
> +#!/bin/bash -e
> +# SPDX-License-Identifier: GPL-2.0
> +# CoreSight AUX samples with callchains and branch stacks (exclusive)
> +
> +export LC_ALL=C
> +
> +skip()
> +{
> +	echo "[Skip] $1"
> +	exit 2
> +}
> +
> +perf list pmu | grep -q 'cs_etm//' || skip "cs_etm is not available"
> +perf check feature -q libopencsd || skip "perf was built without OpenCSD"
> +[ "$(id -u)" = 0 ] || skip "No root permission"
> +command -v taskset >/dev/null || skip "taskset is not available"
> +
> +# AUX sample now supports per CPU sink (e.g., TRBE). Select a usable CPU
> +# and name its sink explicitly to avoid a shared sink.
> +sink=
> +for dev in /sys/bus/coresight/devices/trbe[0-9]*; do
> +	[ -d "$dev" ] || continue
> +	name=${dev##*/}
> +	cpu=${name#trbe}
> +	[ -e "/sys/bus/event_source/devices/cs_etm/cpu$cpu" ] || continue
> +	if taskset -c "$cpu" true 2>/dev/null; then
> +		sink=$name
> +		break
> +	fi
> +done
> +[ -n "$sink" ] || skip "No usable TRBE CPU is available"
> +
> +tmpdir=$(mktemp -d /tmp/perf-cs-aux-sample.XXXXXX)
> +
> +cleanup()
> +{
> +	rm -rf "$tmpdir"
> +}
> +
> +trap cleanup EXIT
> +trap 'exit 1' TERM INT
> +
> +fail()
> +{
> +	echo "$1" >&2
> +	cat "$tmpdir/stderr" >&2
> +	exit 1
> +}
> +
> +cf="$tmpdir/ctl"
> +af="$tmpdir/ack"
> +mkfifo "$cf" "$af"
> +
> +# Disable trace timestamps and context IDs to use the owning sample's context.
> +# Use a per-thread mmap so the explicit sink is only used on the pinned CPU.
> +if ! taskset -c "$cpu" perf record -o "$tmpdir/data" --aux-sample=8192 \
> +	-e "{cs_etm/@$sink,timestamp=0,contextid=0/u,cycles/period=100003/u}" \
> +	--per-thread -D -1 --control fifo:"$cf","$af" -- \

Minor nit, but on "[PATCH 00/14] perf cs-etm: Per-thread mode fixes and 
snapshot wrap support" I just did:

+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping output validation"
+	exit 0
+fi

I know looking up the actual sink, passing it in and also using 
--per-thread mode is "technically correct", but I think we can assume 
that any normal record command will work on any system with TRBE.

Otherwise, we should re-write all of the tests to only target CPUs with 
known loaded ETM instances instead of hard coding CPU 0 etc.

Other than that LGTM:

Reviewed-by: James Clark <james.clark@linaro.org>

> +	perf test --record-ctl fifo:"$cf","$af" -w brstack 1000000 \
> +	>/dev/null 2>"$tmpdir/stderr"; then
> +	# Kernels without snapshot_aux reject the sampling event at open time.
> +	if grep -Eq 'sys_perf_event_open.*event \(.*cycles.*\): Invalid argument' \
> +		"$tmpdir/stderr"; then
> +		skip "Kernel does not accept CoreSight AUX sampling"
> +	fi
> +	fail "Failed to record CoreSight AUX samples"
> +fi
> +
> +perf evlist -v -i "$tmpdir/data" >"$tmpdir/evlist" 2>"$tmpdir/stderr" ||
> +	fail "Failed to read AUX sample attributes"
> +grep -Eq 'sample_type:.*\|AUX(,|\|).*aux_sample_size: 8192(,|$)' \
> +	"$tmpdir/evlist" || fail "Missing AUX sample attributes"
> +
> +check_history()
> +{
> +	local options=$1
> +	local max_branches=$2
> +	local max_callchains=$3
> +	local output="$tmpdir/script-$options"
> +
> +	perf script -i "$tmpdir/data" --itrace="$options" \
> +		-F comm,pid,tid,cpu,event,ip,sym,brstack >"$output" \
> +		2>"$tmpdir/stderr" || fail "Failed to decode AUX samples with $options"
> +
> +	# Some windows may contain incomplete trace. Require at least one cycle
> +	# sample to reach both requested depths, and reject any that exceed them.
> +	if ! awk -v max_branches="$max_branches" \
> +		-v max_callchains="$max_callchains" '
> +		function check_sample() {
> +			if (in_sample == 0) {
> +				return
> +			}
> +
> +			if (branch_entries > max_branches || callchain_frames > max_callchains) {
> +				depth_exceeded = 1
> +			}
> +
> +			# Both depths must be reached in the same sample, with all
> +			# callchain frames belonging to the brstack workload.
> +			if (branch_entries == max_branches &&
> +			    callchain_frames == max_callchains &&
> +			    workload_frames == max_callchains) {
> +				found_sample = 1
> +			}
> +
> +			branch_entries = 0
> +			callchain_frames = 0
> +			workload_frames = 0
> +			in_sample = 0
> +		}
> +		{
> +			# A blank line marks the end of a sample.
> +			if (NF == 0) {
> +				check_sample()
> +				next
> +			}
> +
> +			# Sample header: comm pid/tid [cpu] event ...
> +			# The event may include a PMU prefix and configuration terms.
> +			if ($4 ~ /(^|\/)cycles([,\/:]|$)/) {
> +				check_sample()
> +				in_sample = 1
> +			}
> +			if (in_sample == 0) {
> +				next
> +			}
> +
> +			# Each branch entry is a field in 0xFROM/0xTO/... form.
> +			for (i = 1; i <= NF; i++) {
> +				if ($i ~ /^0x[[:xdigit:]]+\/0x[[:xdigit:]]+\//) {
> +					branch_entries++
> +				}
> +			}
> +
> +			# Callchain rows start with a hexadecimal IP, then a symbol.
> +			if ($1 ~ /^[[:xdigit:]]+$/) {
> +				callchain_frames++
> +				if ($2 ~ /^brstack(_|$)/) {
> +					workload_frames++
> +				}
> +			}
> +		}
> +		END {
> +			# Account for the last sample even without a trailing blank line.
> +			check_sample()
> +
> +			if (depth_exceeded != 0) {
> +				print "AUX sample history exceeds the requested depth" > "/dev/stderr"
> +				exit 1
> +			}
> +			if (found_sample == 0) {
> +				printf "No sample has %d branches and %d workload callchain frames\n", \
> +					max_branches, max_callchains > "/dev/stderr"
> +				exit 1
> +			}
> +			exit 0
> +		}
> +	' "$output"; then
> +		head -n 80 "$output" >&2
> +		fail "Missing AUX sample history or incorrect depth with $options"
> +	fi
> +}
> +
> +check_sample_identity()
> +{
> +	local fields=comm,pid,tid,cpu,event,ip
> +
> +	# Hiding history must leave exactly the original PMU samples, including
> +	# their PID/TID, CPU and sampled IP, with no synthesized events. Per-thread
> +	# recording does not require sample timestamps.
> +	perf script -i "$tmpdir/data" --no-itrace -F "$fields" \
> +		>"$tmpdir/original" 2>"$tmpdir/stderr" || fail "Failed to read cycle samples"
> +	perf script -i "$tmpdir/data" --itrace=L4 -F "$fields" \
> +		>"$tmpdir/decoded" 2>"$tmpdir/stderr" || fail "Failed to decode cycle samples"
> +	diff -u "$tmpdir/original" "$tmpdir/decoded" ||
> +		fail "AUX decoding changed the original cycle samples"
> +}
> +
> +check_history L4 4 0
> +check_history L64 64 0
> +
> +# brstack -> brstack_bench -> brstack_foo -> brstack_bar provides three
> +# nested calls whose caller frames can be reconstructed from an AUX window.
> +check_history G3 0 3
> +check_history G3L64 64 3
> +
> +check_sample_identity
> +
> +echo "CoreSight AUX sample decoding: PASS"
> 


