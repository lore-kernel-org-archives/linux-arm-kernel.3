Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CAC606A928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dynC3pjR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=IlxBkT2v;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=So5awr5d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=; b=dynC3pjRodKwvC
	cEt4kJSCLngkYbUW+LT8/Yv8Q0y/Cu8tfQa0UxDwd0wLTB4+vpgHlC9jYaf+4yJ90tBkht9Ub+w/4
	/bLbuKo8IBpb+hFjzhaXfZVJGmkpd9bt2gghae/pncGXFoYhnF81d7FRqHdWb0FbSc5htLWysa8Kj
	pOY3RtWBn19aUGtnlaRF4nKg6C5UEbxcdz4SvKBcLnjURPhCv/6VyV9Bmv1KYn+Ji5G59RT0rAqKI
	68+3N7MhJrElaRlfLzp7HxlvKsDCxcxCe+EFTDlZLmzXAlnD5TQM2RUUJoun+5oGleT9iFqeh+8SY
	M8Rudi4X4v+Ux0X+XrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvum-00000008jY4-3WGe;
	Thu, 05 Nov 2026 11:45:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvug-00000008jLQ-3yNo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Nov 2026 11:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=; b=IlxBkT2v/U+ODyA6HKBl5qloue
	IQzqVmJJQMiRwMhS+U5VWq23lnich2Aquem39rE9tG9co9xbWBVVv6F5q6KgR47uruRth2vp5y/0R
	KAXqKiDKnIdC2Ibd6uJwwCyuf3Uil8FiNyBsma8zZYGMkfo/96kapGzxsRxD9MWTisbsNwVzMM+8a
	+uuyl1kVWsIElXfK7UjJwdR9yI5LtvIkdCtEL8urv8czyds/g0av5TJ9fSs+fOwPmd9sPP/D6TVMW
	cVi1BgOwvtjVVuIPxVyq0V9TnByd8lJO60nlO7jGFpm2LyizU7iV0Uv6LsZWvgrf7AQyNCh3FWvbi
	t4iqk0mg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvud-00000007nHv-1LQr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20024765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879146; x=1794483946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
        b=So5awr5dRpjQySJWNwQig6hMRlRbzmMRxvZbwCd5ga+asQertXe4hHWmLVc89g8jtD
         6sShg6JibrgsDCizHLGpm0S4Aso6cnQfQkSQ7hO/rcIg8cMb5izFj5YWpPI2EKW6fAeT
         0ydvmxeWjNaQkZK1RXf+WKb0o2S0+CA9/HET2eLxSjw3QtJOK/kXo4rWfmL9zhkzRU8w
         DfjySyyjlhAyS6+u1ajUelM8uzTn+Zb4VisLjdpmD1NJEIadvnsFJIOFwPNYwc41sDOs
         GJte8YePzW4hAUuZFOolgUV0qvcPVFl8FmwZLSoJomK3T5SQpvIiQ13NDGWmpKG7l4U0
         Xcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879146; x=1794483946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PU/EFB+VchMZfy9q7Y3QQl5gRcVp9NfFdbFPAQA+Sio=;
        b=tkffJBblBLhXeVBnlHIi+7dl2Nsn+CROmVAiluk7nCa0Y2vS5ipbikl7QHXkFIT+k5
         dO0iH+skD8Xibt5R3qS4eanHi+IkcP11PUzFRkDIsJa1zkO4CgqHdN2KZR+TNkJzKjZC
         pg+n6rPwdWkvtXm/Qvhb2+gHCfDRP5sz1MY3Pe8NOnb1/HAflLNJ7gcP19i0GHdbo3ox
         aU+XxphsRI4wFx5cbIlH7uTNxqu8F6gk8/rDZsmxUB9b3Ak+OeHKtfokeFEpJribi6uK
         x+fsJP7BWszavJGqQ0TkSEeS2geMAVhWLHXcZLoj9J2CbPAqsDINwu5GRhO4QkkQoRDU
         FmoA==
X-Forwarded-Encrypted: i=1; AKwUvBx934RXMQd155zpMguNEl6Uy0MXt4w+BBZXgc7cc4q2UxRlErmsPRrPpEgY6gxKpmU/6imXK0KeB2x0CWNcA+dJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+zF9hCEKC6lg3b5KnZzUrfysK7TkZE4DSAfjBX+Bsy1ywDz1HX
	tFWeJtYFgR8cVherC81M7iBcDO8YEdHW1aAh67fcjmqCPq+t4Mb7zYFfL8ilH981wYA=
X-Gm-Gg: AYBFou2QiwctLddIMjODT8ZI+93ipEPW6XHmS/yPtnFjN30DupW21N55nTKxg46V60f
	qF6eMMPnTLTJHJDtXvTlpbT3iWjSoXfJugD8Y532JGvX7Xn0HcANXXOpbbIOXD5QvMNnlaRLM4t
	IP7913O+v+WsCIgW1DMtnJ3b7Dq3MBV+N8v/ziAB0iN1RUQa6Vc4RgynCc1SAFsTR9PHQEKV1sT
	LcbdZHPUnoTgIeAWXbuoH4JqaLourMlnFcOL1UaDCs2cbYrQxZhdAqlNBnVfGt8br/9ccKhi5ta
	Yb8Yd8KUbPosyQwvY7BRTDOSUSvB9Egn63NNXA5MkK5GqZGlffbr8yAXeLMIDIMDcXeo3Tmjiqo
	KJIlh0yHsPGSYiCSFdc6c4z5/KEA5UKvi7DfaG8JWxYZaiNBA67G5SjYG3q2ytcnZBclUSQunpZ
	jgrMf7U/g418YnRRajwQziVVUEOQvbTZQ1fvEp+pASLKMw58Moc4UmwDSYVsJeuJH5pIsbCq0Ah
	9Sa/Nr+UmpxHd4VcNzh3YOfaqMcfP4QHSSwBAHlXqGlcV5tqBjrJFIdYrVxa65KoqT2mquQts6f
	OgjqEdEPJXcYY4K6QUFHpCO6TRidip27
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr397731085e9.14.1793879145713;
        Thu, 05 Nov 2026 03:45:45 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:45:05 +0000
Subject: [PATCH v4 17/19] perf test: cs-etm: Add test for per-thread mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-17-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_114548_117968_4F963625 
X-CRM114-Status: GOOD (  12.69  )
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

Test that per-thread mode works when the process migrates across CPUs
and that the decode happens in the correct order.

A TODO is left in for when support for decoding in order with Perf
records is added.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/shell/coresight/per-thread.sh | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/tools/perf/tests/shell/coresight/per-thread.sh b/tools/perf/tests/shell/coresight/per-thread.sh
new file mode 100755
index 000000000000..8a1ab9d8f1e7
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/per-thread.sh
@@ -0,0 +1,48 @@
+#!/bin/bash -e
+# CoreSight per-thread CPU attribution (exclusive)
+
+# SPDX-License-Identifier: GPL-2.0
+
+# If CoreSight is not available, skip the test
+perf list pmu | grep -q cs_etm || exit 2
+
+if ! tmpdir=$(mktemp -d /tmp/perf-cs-per-thread-test.XXXXXX); then
+	echo "mktemp failed"
+	exit 1
+fi
+
+cleanup_files()
+{
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+trap cleanup_files EXIT
+trap 'cleanup_files; exit 1' TERM INT
+
+echo "Recording..."
+perf record -o "$tmpdir/data" -e cs_etm//u --per-thread -- \
+	taskset --cpu-list 0 taskset --cpu-list 1 taskset --cpu-list 2 true > /dev/null 2>&1
+
+echo "Decoding..."
+perf script -i "$tmpdir/data" --itrace=b -F comm,cpu 2> /dev/null | \
+	grep -Eo '(taskset|true).*(\[[0-9]+\])' | \
+	uniq | tail -n 3 > "$tmpdir/script" 2>/dev/null
+
+# Check that the decode says it ran on CPU 0, 1, 2, in that order. TODO: The
+# correct result should be "taskset [0,1,2], true 2" but we don't decode trace
+# in order of the Perf events yet, so everything is associated with the last
+# exec.
+cat > "$tmpdir/expected" << EOF
+true [000]
+true [001]
+true [002]
+EOF
+
+if ! diff -q "$tmpdir/script" "$tmpdir/expected"; then
+	echo "FAIL: per-thread output doesn't match expected:"
+	cat "$tmpdir/script"
+	exit 1
+fi
+
+exit 0

-- 
2.43.0


