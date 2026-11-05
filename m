Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ACA606A926
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUKz8Tj8;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SbpvMrFY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=urrgTOdhrZbA2FGtYgxftgMNBud/Y8/6+LuWZZfe/7k=; b=xUKz8Tj8HMcDmP
	ielga1VhRDh+Rld/HQnLfFBTu0pVdzTkAQb8uHyXp/n6BeedLM2wba+l0bVb2tvZr0Ss20ZMq4jAG
	k4G3WDvYLeW+pBjHIGQxblXD5hAZvFRiE3wReuo01Dyxt40hnF8uspX8EMrAjDhVm7uv8CWQZJhbP
	hohuqWXu7fXmzdKB1segaEib1+DvzDte09+JXeEIViWlv8wvWngHndjstS9IUqqd4JfdWVubmFeMW
	jm7QrWOJtr6+/EaaUOJvbNOM79p89v8szmrUS0DuvuqM/J6SDySKp/wBtxf/J204YcyLx/de6pcw0
	hKa+Uu4D9E5bHSCww3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvum-00000008jX2-1RL5;
	Thu, 05 Nov 2026 11:45:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuf-00000008jHK-0LHS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10754825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879147; x=1794483947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urrgTOdhrZbA2FGtYgxftgMNBud/Y8/6+LuWZZfe/7k=;
        b=SbpvMrFYfHqp0Y8E9iiT72YDIjuec5nNVG6QlhAkAlO1R5FmU0taqjSJfN0xBIgH5V
         I/7PvEhDjFBboGZhXwRQYvDgf+6r0zhBTg7l4q9PSgXRFG/MSlSuwiTuYvX/M1dtLzoK
         XKFDFbkXPxU9qcVuhTVwcfizWkE8E1np3wyPPegP88QixVbM1Kv0YSLIoN8ahW8ZcAwT
         XREQ16BE80GjZIAwBgjWp4Z0yfKTGe9SIcsmTrz2+lganK8wbpVDVwtZww3b7ni5ijAH
         SXaTYJqTPNO2E/EJYWnB25R5zcAvUCFSfuWxcQ/9PvmjqSETGNGgWgi/K44JtYgumwfj
         WXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879147; x=1794483947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urrgTOdhrZbA2FGtYgxftgMNBud/Y8/6+LuWZZfe/7k=;
        b=aJgPBF7goAWN4Cyhj5mrnnlG0V25jw4fqXhqbLlWmV2RfYsKLv/A2fD1nbyF3T1pQN
         qjHy/GFWWE+8fldE8qnjDE6GYxq2zv0uYl0yV3c3HBFm0SxHblga8xGYAXpillEStqg/
         F/NVFFOUdyz7hNQY5qiOTCBfEeGinIDspONv9JsUI19oqjzaSrx2m3b+ESmAWM76arTU
         9tUavi7U/kfvZJXzhcqtf9kn8dXp3VNGDqRbNiNfHIvnuTZaTzXHari2rITeMWYz4HlJ
         vSsdKa1ynBt9yUct2PKbzp7wMs9PM4krSsrpCQlQ58/2ySDAv/RtKRb/mi8tNCZXk1OM
         tjoA==
X-Forwarded-Encrypted: i=1; AKwUvBzPTew6gA7J4UaX6CBpODlg5zK7DQlJ+xBvnY8TvsUMTdRRZXXsJqzZZMG11CCzoTzB8fLqMPls/nvwqKvfb7vm@lists.infradead.org
X-Gm-Message-State: APuU4Z9kTPG1uqZ45z+pMuA2CJqKLocVu5FvR8pC/fLeW4TV6ejWbohb
	+yGAMvHIco7SobWXhb9xZwIPzZg5ZkKtoEojAT/iTFHqQTcOQh0Ye+R5e1hxMCFmqcc=
X-Gm-Gg: AYBFou0dQZZ5qtd6JaWf+bw31KWKmzCvei/BBe849r+H20l3Sl34G4WntdHsNaM6L1X
	Q6axgYCrS3wAiaQTfc7BMaWAka+q7PzYW57X9AYIS0sY3Y5bK+HqeK7OOFXyDpGn04d2bBEo0zK
	SI+Ui/H6RFxl4qTe58tsHR6ZD1xNXdtK8hpyk2+iGDMIlHupSGIivq8plYxAMpuOf4Mh9/62hez
	+Ge3aX0nycLqr2hc0WnONBpsqq4m3iHmUVnUmYe+hyn/FQRcKPQIFZEEKjuKhZD+ta9smBmxlZM
	GVmByU8LUIADzeSpvSwp0Ux2HmVBI4FgsV+EicpwPB7W5Lfj3eNi5X6znu9C7DkpBxsbsHg3xCs
	ZPAMH3sOVW5w0XMfAa6sk3RxKuPz0KPrHNnC7EAo8gAtccWGctKBRMXqX6uxnEj1hJgwYXKQWHe
	+avGDkTCA2Il61bWf10sShsfkxA+Lkoog6u6+BWDDOlp2FTpHcbnLnJUk8CDWRrx1+QV3L+vAX3
	MeCIjGFMpSjti+DLe71yaPQl0z6kRoNcScCzAJfDVixDx1bdua+M/MbzghWSNPOuoUazVcAdxVn
	gyaUbhhiZFgJ2B9tSCoyDqBOUwnXtX1D
X-Received: by 2002:a05:600c:608d:b0:4a2:1197:1de0 with SMTP id 5b1f17b1804b1-4ac18b7dcdbmr405802955e9.19.1793879147059;
        Thu, 05 Nov 2026 03:45:47 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:06 +0000
Subject: [PATCH v4 18/19] perf test: cs-etm: Test multiple per-thread
 threads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-18-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_034549_279186_C403360C 
X-CRM114-Status: GOOD (  16.44  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Launch something that has multiple child threads, attach to it and
make sure that all child threads are present in the samples

This will only work with 1:1 sinks/sources, and looking for TRBE is an
easy way to guarantee this. In theory this could also work for ETR
sinks, but we'd have to attempt to record and skip if that fails, which
would make the test silently skip if the record command started failing
on TRBE too.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 .../perf/tests/shell/coresight/per-thread-multi.sh | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread-multi.sh b/tools/perf/tests/shell/coresight/per-thread-multi.sh
new file mode 100755
index 000000000000..bace76cb6a51
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread-multi.sh
@@ -0,0 +1,76 @@
+#!/bin/bash -e
+# CoreSight per-thread multiple threads (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-multi-test.XXXXXX); then
+	echo "mktemp failed"
+	exit 1
+fi
+
+cleanup_files()
+{
+	if [[ $parent ]]; then
+		kill -9 $parent
+		wait $parent || true
+	fi
+	if [[ $perf ]]; then
+		kill -9 $perf
+		wait $perf || true
+	fi
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+# Multiple --per-thread events are only supported with 1:1 sinks/sources
+if ! ls /sys/bus/coresight/devices/trbe* > /dev/null 2>&1; then
+	echo "No TRBE sinks, skipping"
+	exit 2
+fi
+
+# Launch 2 threads to run indefinitely
+nthreads=2
+perf test -w named_threads $nthreads 0 &
+parent=$!
+
+# While parent still exists, wait for the 2 children to spawn
+while kill -0 "$parent" 2>/dev/null; do
+  threads=(/proc/"$parent"/task/*)
+
+  if (( ${#threads[@]} >= $(($nthreads + 1)))); then
+    break
+  fi
+
+  sleep 0.1
+done
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -Se -m,128K --pid $parent > /dev/null 2>&1 &
+perf=$!
+
+sleep 1
+
+kill $parent
+wait $parent || true
+unset parent
+wait $perf
+unset perf
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" > "$tmpdir/script" 2>/dev/null
+
+# Check all threads were traced and they have the correct thread name and symbol
+for i in $(seq 1 $nthreads); do
+	if ! grep -q "thread${i} .* named_threads_thread${i}" "$tmpdir/script"; then
+		echo "Error: thread${i} missing" >&2
+		exit 1
+	fi
+done
+
+exit 0

-- 
2.43.0


