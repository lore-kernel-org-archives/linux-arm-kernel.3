Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACE360A5BE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pAdov4md;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CmpdRQJi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=; b=pAdov4md/SC4h2
	lnzl0V6oLCIa+GjOQq8pJRjJFWehQnbwpnWNbzOwNH2Nk5GjuONeN/L/farlRA/wkoDFnJw/bpFwD
	kvzqhfTnrzj7TjGPzmP/tnQbVO4WUy9TwuwlEedqnx+1ZOfSwWDttESJEhyJpc1StcEscOgZh2FmV
	xUB1I4pi12+qQUbp/obk1RsSExh1JNWuipwGnhcgR46fQ3ceZY5zXthYnpRl895zrHasAznePaPNe
	RAK+ucP/67UEoAHcBVzbSUfVKQyzx88bsMfze2y96SJ+X92Io9AH1vAeqvgYldG1Qudj0sI/9IogP
	hz7+zobx8ys7YjzaYtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuK-00000008ikW-25lk;
	Thu, 05 Nov 2026 11:45:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvuF-00000008iga-3c5S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:45:26 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso13812105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879122; x=1794483922; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
        b=CmpdRQJiNMrcKayuidMP0No9EkTedcGiNtnYvT81S02pZ8Zml1js4QpihjGm/0m1aO
         9s7hg/SYIc2MegrB3ePW6RtQHOxOiNmXzCEecWhY3EvlfFVxgeAb/+W9MXazj+yqQPYp
         bNSsqOWlpuptll5WGNIJonHgD+YB46o7TbECNirsT7K7m8fmrMoCs440blFZPjlHuDZ7
         v8HRClZDlfEdNEgintZG4RH6u+LMRCZCgbpfMmwMO8j6caNrcmVQ2NKkakDz/03GboqM
         iraVaYF14QLYdCYJzbyTTFH3MvK1u4oMirCQYS2dhWB/Yb2n7Usk0Y69NAgd9CWMa4gd
         mzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879122; x=1794483922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
        b=hudy+OhI+c2IBBrEvxZMGQ5GefzKa2i5xgwi8XWKSv9NJMzUuD/x23cqvDCE2qQhVL
         INPdLUAl+mX8lAu3wTXkLyaAVM6qAXxewq2srujA2VK8wc7SXPqbb1tTZ2WU5t4T8+tY
         GfwYYapcr6tPYq0Ct12GWiCIlIS/jjJOxMgbiyOFVj8xzWdepxAt5U5J9dfuUw+9AHjB
         lCPqwJAXVxJK5Dpc5Rwodi0OjdpqOyZ896tk33cZpdQJGFs2fDby4lvLSEDjZRhFsRUR
         DoGyLfHBqZkdL4Wz67Xe/awTmMhPlxlESJ8DHqUT2NHr8X4cNsrKsEadV1pLwQ08HraY
         J3Gg==
X-Forwarded-Encrypted: i=1; AKwUvByGTU8d1aDYyuVgAY9R/88Ip9HIj+bDAg7LJ0jur3ZP4i3LUGe13Igj3+wsrWTwblza8YZCLZxQf+73tKIDwjvN@lists.infradead.org
X-Gm-Message-State: APuU4Z9oUEfntEUCOzIxU+yioHUjchnQOT5HRGeuRUv30iFn3RndRjTA
	pMUZzr8WengGgM26djnniILy7D6BOI7L+eHY4z2hv6rzhJQW/LCZiiyh8ywIilD975I=
X-Gm-Gg: AYBFou3cnfLOfFPcKjXZd2KIPtuqSersDib08xnbFM6dTaOGWBpx20Oduwa1PqRaajS
	c8kl9RL7PM35QR6wjZUiNdwIXXwdrNYCp+LXszgSl7sar5NqIVnGeSfu4Gr9ImJBWBEmCFtB2o6
	GcXlcrNvolqgf4jyQVc23M7PglvFMPM2RDpEc5YXJhWcvNXLNBTgxniREG4jIzIYE+8oHi0VJkp
	uXztOOKavXKvPwCnhjMKh4l1vP98LNsPaW/fTRhmjlgpGlVmtr/Qx53NMNc1Oa29YrHWQiEqLPL
	+4SQRPWoD+LoG1DNeTt235+YWr1K7682Fr0sCqJi9V/9ExkAt9UJGhZ6/o4h+5I0KX4ueOrQLaT
	hsw9rBvXqrIzKXT7EinP8AUS/LethAdcCB8S/6eJmY0KzBOetMdyR8zfO/me0SmGCGtqWEdt1ix
	vXf8QeDyyiZIB4hd33f3YbcrQrzsfeXtn3gSajLvafTS6iUdqs/xX5A/peVf2usTsKFkZ1HbFtM
	7vr0huQi9Or/WBM0YHrbuuSM8xpmvX/4ZpR52FgaSkFT3zcyT1/XsE/SHpKUCgNXY1N3pwpC6lB
	FySddkOdvBW2/2IhRQk3htlZoFQCLTMh3w==
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr385653795e9.26.1793879121877;
        Thu, 05 Nov 2026 03:45:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:50 +0000
Subject: [PATCH v4 02/19] perf cs-etm: Warn for invalid timestamp option
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-2-7759e0ce2449@linaro.org>
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
X-CRM114-CacheID: sfid-20261105_034523_922752_7D1E08E9 
X-CRM114-Status: GOOD (  13.05  )
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

Instead of silently returning an error, print a useful warning.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0


