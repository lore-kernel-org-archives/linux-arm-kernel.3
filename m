Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6A0606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qMznmp7x;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RSIWGdgm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PwLKLb7Ybxb7dpIE4IVyJShyxd5syhw2GQeVgctsT8s=; b=qMznmp7xZ6ivV1
	8cY15LbB1MHaBuC8bIQlTQKNLCS4YIhpIRifVf7QPsYVuaWGBpS+QGLxWnDSk4xZ1VpVwxu50pfGj
	VgpUNL7n3QVbG8B5z+ckqZbWRKERGtL+QDzmGkkYSKXnI5feiHdyrlJUx/ud+tBAvG/RLl7dat1fk
	Br9IxKA8TabMAz/9WIHvahImGWmp2Fz8j0+gsThuvvhvKmCCWNs8rp3k9tDRoD/yHMwpbmqB5Y6/x
	hdlt1dXVr2JH5WFBQYLFX72vJj131Yw6xWXZ2Hhoz2yXubPQ2ZfM8halqRdDcZ/l+m1ZHQ5BGfAEo
	2ElOtCe47fp63eBGF/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxU-0000000GR4o-2f5N;
	Mon, 02 Nov 2026 12:16:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqxL-0000000GQiG-0ZYB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:16:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so19311755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621765; x=1794226565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwLKLb7Ybxb7dpIE4IVyJShyxd5syhw2GQeVgctsT8s=;
        b=RSIWGdgmTzCRrcPOKGIWU4DGW4C97BtLE9/ziuQkisPtDBw7OFKTQ8FYlw5zVT+gpR
         6h5NSWoi0ZDfJPZ+hgOKXJD9BdK7IbKx7awPM+35ju7kAK7c14dXYwbmu4XbA3kWmeX6
         jO2dWzmGty6UzzZbVzTQC0BkwCUoPJ6sA2FayZxpcSWW9EjmJznJkXh7ejGzO+gK7Ewl
         fNXJUU5p2YNB06wZbJk+7BRxuV6LeitsEp78GjNpUmh4DIDb1wP1+Vh0RAAO2DYEYNHf
         RLxp5Y+DCrOss2rYyZoOq8dKV4tYyE/+2s6t4M30/qwoaFCi7kj+Cmf0yy7B5+cO66x1
         GaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621765; x=1794226565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwLKLb7Ybxb7dpIE4IVyJShyxd5syhw2GQeVgctsT8s=;
        b=ANsSBGp47psF9ybqdTY0os8AoRGMhCLkQUE3xOKjsTvCiJhS87O9zgJfAZenCBVjjX
         f9VK/DDB4vXGudesS1Y36fqTQsXHErPE+sI5Dpw5qZxOYAWgNItlLlWTDi03xFeukd4/
         Wfmyr1//jhm4AYxl2phb/fAkldBllCpPTjN7fZHgEhscA8fMRWcDtcI7nf6F041Yo+UN
         55z0fbzGTllUwWlfEd38EW8vcADiGErmcB+ml7N97U1KfXgCgonJGhoPJ9L7BMqZCdV7
         r48ld20WESDuT5m9UMn1KkVySYN6QzlAgOWKyvAUr2RSnkVg5N/wKm7YUnawo0mGaUmc
         dIIQ==
X-Forwarded-Encrypted: i=1; AKwUvByohFA7DnV2cV0E4Ebrom8H9dYJd9a12CrRleKcYZSqeEcm+SWB+BkOIOIvHwV+pFOyWdMRksWdWwSS1iJG1f2x@lists.infradead.org
X-Gm-Message-State: AFq9FYKz9zllKlXCarj7xR5Tpi1XrQIzKI6Ksk1VScsRz5waRzlxfNqD
	A/fg9abpqf2938BGkWrSFOkaJ9wHw+H4wCY1YnAohWMmgW3W4x+CaEwNHGGtJxAFt/8=
X-Gm-Gg: AYBFou2TkiP3njqG9x0yfae+iR7cRRdg/2vi+yPxic29z/jAyTpXqj59RDG+1NZLcOR
	IaiUMKFi3B9613yXbkDEf7OCEgp132OmRm0+SLdoVb6gybIN1JTRUC/5+6FwOIBpvk1i4QsdX6y
	5AXxc8QNNlzmKFmisFvoy54ZK0ohd+uHFuGTTjsvN04T2pGecsD9pzEFnTB5tGsZBJZ8HAFfDgK
	0xIujoB7ewxQQ80omh9cqFHfCm2/5RdOBT9mhvSbP5OPoF1Ttx3RXj1EuqYBk+zYbemS1bBlQZl
	XWtvnukVj0ieNxk5wsNl3Zt5ddcGPvwbQbX/LmJAZ14vXYXgCljboWfY38Pk9DJVblYizgCsdwH
	IrBrZkITXznCaiMNnGuurd92s/jeHbBFFYZG6rN0tTyXuNffhhDpE0x+8D8A87Kfr+5cftNmrXE
	4WsNzPxZsXRIvIplA9jlPZYFHMD13bVCL1+jPcp1323TjTz1E4kGl+qanx0z8oKUIPf9N1mjpfY
	Ro5S8xIJN3RlgunewL/Jnv382B+8jTiD7RnIuhP+OzST5/+7qQxJ3dYTph2tpTFTgRjgsKtlm17
	c18Kf8qrLYIQhYvnbmPWRlX1FjLom0/e
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr201378935e9.29.1793621765487;
        Mon, 02 Nov 2026 04:16:05 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:16:05 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:31 +0000
Subject: [PATCH v3 17/18] perf test: cs-etm: Add test for per-thread mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-17-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
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
X-CRM114-CacheID: sfid-20261102_041607_243245_5A2844FF 
X-CRM114-Status: GOOD (  15.41  )
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


