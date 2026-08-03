Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86A7C55190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+SO+R/V6Ge89ssABva1yLlWc8p9DcPOdPCnLnTBJE8=; b=godJ2rEz2xiWfnREtj2/IUXiox
	ASFKKB5tp8zGK7Oo88LCJyuxUiuxYj7EPq9i+f9d6Aip7/dHQMmwGpFITvVAWoURtUTE22G22msv8
	fUvMnJWorTeAz53UkccEOnu9X2LgHDSz+c5lXjkLdYu6Ns6vH8KMLYTxLxLBLGLzAkcbm2iW5VDP+
	vBweTiEx3uRFd01QQm6n0h+hQXOSDWBBQ3VesuW/aJqZg/1PPcXh3mHiDrA+cawjK11Mtu2mLvzZq
	YyQeeLmDKRAEsXnxfhDJQ4BN35Yu5baqiFOVbaW1CoC6sxqu+kSnPy6NLqZAcdg8a/wdL4Xoi+/i3
	WwM0ygww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodX-0000000GeEU-0qay;
	Mon, 03 Aug 2026 09:07:07 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqodS-0000000Ge9l-22K5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:07:03 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6735RIfb4132303;
	Mon, 3 Aug 2026 02:06:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=c+SO+R/V6Ge89ssABva1yLlWc8p9DcPOdPCnL
	nTBJE8=; b=EinxRZfejF6rKOW0m/JwinbQmt1LlTLGXgcZ62OHtuO52jAMZt5/T
	p8j2toJF7ENvMoZFqLkPeBFgLFX8OPTZoeUQ+8IpP6B71eWOiAXxttC7jLmpACFb
	Y6UmME7rkKyJUyATct47urtM2xOnTHP6ODPm53VbPKI65tVMI4oMvAcU7YYwVrqV
	WmUD9hPd0mw9DMRadPZtOz5sl+CVYjS9bl3+JGu+PRv40rRPuNrOo6wNHOlTi78p
	IeeBJdrny81nCqheYibvwsb86dtI87rHOmnJI9X22FeXQOFfI3ZNElhg5r1ZSCKl
	n/qWYQv7Jkv4j/ysiSiYnLVig3xPISncg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4fsc41rnwb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 03 Aug 2026 02:06:49 -0700 (PDT)
Received: from localhost (2620:10d:c0a8:1c::1b) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.45; Mon, 3 Aug
 2026 09:06:47 +0000
From: Amir Ayupov <aaupov@fb.com>
To: <linux-perf-users@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan
	<leo.yan@arm.com>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar
	<mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim
	<namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
CC: <linux-doc@vger.kernel.org>, Mike Leach <mike.leach@arm.com>,
        Jonathan
 Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Swapnil
 Sapkal <swapnil.sapkal@amd.com>
Subject: [PATCH 7/9] perf test cs-etm: Test branch history on existing samples
Date: Mon, 3 Aug 2026 02:06:38 -0700
Message-ID: <20260803090640.2412336-7-aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260803090640.2412336-1-aaupov@fb.com>
References: <20260803090640.2412336-1-aaupov@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1c::1b]
X-Proofpoint-GUID: Uwx-xw5nabgVRgdm1-hy5amTsiWNpHKK
X-Proofpoint-ORIG-GUID: Uwx-xw5nabgVRgdm1-hy5amTsiWNpHKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX+yO3pMt5q5LQ
 /7Lq+Vu/CGENMXAzWxgA+Ptls1goIc3FAjoV9xeKKewzWWg5wBeAAl2D7hbTU7T86HRNonWwg9J
 b5xnpdFAQEf0Bq8Gg4J1Cyr3nTRP8pmSOR2yecG4FwBRfQoDknJLqW6/+wxNM+Ric5WC2PB33IG
 dUrml8JTw/AQvUe3Mipp92NR2ntUVoqOY2yAt9hBK+OXVqrgKFAopNYsxn3mR5E7YYdPOCho74X
 sLvmEGcxZpjBM2gozo1c/oBmh0lbklMzrmcbT+1bpmDi3biOshWF5NhgdKxrnjOA+QwkJ/Jbvwo
 rw/i5uC74xCjIySR0XttsvbsW4PKrANTdcuwHfZW0lcBku7lveoiCQBkK6p1YLfXsk2RZBg2o2I
 0CgA3SRhb3cBn4jaN6QF60rh/5i6Sdp58stv8f/0pFaiFsyPp3JVy0s4ZLmwMmEfKfk1/xQ6gOY
 uPuTnSqlRI1UMDt7u1w==
X-Authority-Analysis: v=2.4 cv=A7Fc+aWG c=1 sm=1 tr=0 ts=6a705a29 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=8elwO82fXORLTBIkMd32:22 a=FOH2dFAWAAAA:8 a=HirZfp3U6wNsbMr5dk0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MSBTYWx0ZWRfX+bl3j/AbHVhi
 vGg5ypA2/aeaVdlY7wxfDcQg5KaNL5NE0bp+vR2OISMSikQTG1tjh+32H7475udN3S/ejzYwoJK
 RU0yTdFv5EJLNhjKKBtOXGfg33g0cG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_020702_546278_F3286B7E 
X-CRM114-Status: GOOD (  19.46  )
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

Add a CoreSight shell test for --itrace=L. Record timestamped ETM trace
with explicit -T sample timestamps and AUX pause/resume events, then
check that the pause samples carry both a multi-frame callchain and a
non-empty branch stack for each of the workload's two processes.

Decode the same recording with L4 and L64 and reject any branch stack
deeper than the requested depth.

The test skips when cs_etm is absent, when not run as root, or when the
recording turns out to lack virtual timestamps. It exercises the
timestamp-gated path and the requested-depth bound; it does not attempt
to verify that the attached history is correlated to the sample.

Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../tests/shell/coresight/add_last_branch.sh  | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)
 create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh

diff --git a/tools/perf/tests/shell/coresight/add_last_branch.sh b/tools/perf/tests/shell/coresight/add_last_branch.sh
new file mode 100755
index 0000000000000..4654069ad651f
--- /dev/null
+++ b/tools/perf/tests/shell/coresight/add_last_branch.sh
@@ -0,0 +1,175 @@
+#!/bin/bash -e
+# SPDX-License-Identifier: GPL-2.0
+# CoreSight branch history on existing samples (exclusive)
+
+perf list pmu | grep -q 'cs_etm//' || exit 2
+
+if [ "$(id -u)" != 0 ]; then
+	echo "[Skip] No root permission"
+	exit 2
+fi
+
+tmpdir=$(mktemp -d /tmp/perf-cs-add-last-branch.XXXXX)
+
+cleanup()
+{
+	rm -rf "$tmpdir"
+	trap - EXIT TERM INT
+}
+
+# shellcheck disable=SC2317 # Called through trap.
+trap_cleanup()
+{
+	cleanup
+	exit 1
+}
+trap trap_cleanup EXIT TERM INT
+
+record_data()
+{
+	if perf record -T -o "$tmpdir/data" -C 0 \
+		-e cs_etm/aux-action=start-paused,timestamp/u \
+		-e cycles/aux-action=resume,period=550019/u \
+		-e cycles/aux-action=pause,period=100003,call-graph=fp/u -- \
+		taskset --cpu-list 0 perf test -w context_switch_loop 100000 \
+		>/dev/null 2>"$tmpdir/stderr"; then
+		return 0
+	fi
+
+	echo "Failed to record ETM trace with AUX pause/resume" >&2
+	cat "$tmpdir/stderr" >&2
+	return 1
+}
+
+decode()
+{
+	local size=$1
+	local output=$2
+
+	if perf script -i "$tmpdir/data" --itrace="L$size" \
+		-F comm,pid,tid,event,ip,brstack >"$output" \
+		2>"$tmpdir/stderr"; then
+		return 0
+	fi
+
+	if grep -q "itrace=L requires virtual timestamped trace" \
+		"$tmpdir/stderr"; then
+		echo "[Skip] Virtual CoreSight timestamps are not available"
+		cleanup
+		exit 2
+	fi
+
+	cat "$tmpdir/stderr" >&2
+	return 1
+}
+
+check_process_samples()
+{
+	local output=$1
+	local comm
+
+	for comm in proc1 proc2; do
+		awk -v comm="$comm" '
+			$1 == comm && /cycles\/aux-action=pause/ {
+				in_sample = 1
+				next
+			}
+			!NF {
+				in_sample = 0
+				next
+			}
+			in_sample && /0x[[:xdigit:]]+\/0x[[:xdigit:]]+\// {
+				found = 1
+			}
+			END { exit !found }
+		' "$output" || {
+			echo "No pause-event branch stack found for $comm" >&2
+			return 1
+		}
+	done
+}
+
+check_callchains()
+{
+	local output="$tmpdir/script-callchain"
+
+	perf script -i "$tmpdir/data" -F comm,event,ip >"$output" 2>/dev/null
+
+	awk '
+		/cycles\/aux-action=pause/ {
+			in_sample = 1
+			frames = 0
+			next
+		}
+		!NF {
+			if (in_sample && frames >= 2)
+				found = 1
+			in_sample = 0
+			next
+		}
+		in_sample && /^[[:space:]]+[[:xdigit:]]+([[:space:]]|$)/ {
+			frames++
+		}
+		END {
+			if (in_sample && frames >= 2)
+				found = 1
+			exit !found
+		}
+	' "$output" || {
+		echo "No multi-frame pause-event callchain found" >&2
+		return 1
+	}
+}
+
+check_branch_stacks()
+{
+	local output=$1
+	local max_entries=$2
+
+	local ret
+
+	if awk -v max="$max_entries" '
+		/0x[[:xdigit:]]+\/0x[[:xdigit:]]+\// {
+			entries = 0
+			for (i = 1; i <= NF; i++)
+				if ($i ~ /^0x[[:xdigit:]]+\/0x[[:xdigit:]]+\//)
+					entries++
+			if (entries)
+				found = 1
+			if (entries > max) {
+				status = 2
+				exit
+			}
+		}
+		END {
+			if (status)
+				exit status
+			if (!found)
+				exit 1
+		}
+	' "$output"; then
+		return 0
+	else
+		ret=$?
+	fi
+
+	case $ret in
+	1) echo "No ETM branch stacks found" >&2 ;;
+	2) echo "Branch stack exceeds requested L$max_entries depth" >&2 ;;
+	esac
+	return 1
+}
+
+record_data
+check_callchains
+
+decode 4 "$tmpdir/script-l4"
+check_process_samples "$tmpdir/script-l4"
+check_branch_stacks "$tmpdir/script-l4" 4
+
+decode 64 "$tmpdir/script-l64"
+check_process_samples "$tmpdir/script-l64"
+check_branch_stacks "$tmpdir/script-l64" 64
+
+cleanup
+exit 0
-- 
2.52.0


