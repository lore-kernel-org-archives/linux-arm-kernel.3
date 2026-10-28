Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE1606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 18:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0Q2uMLUs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pbYwD5G9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=; b=0Q2uMLUse4SJknpcsQvPr/h7XE
	+8EmtOUmg4V1cw7RhmFGAUKO0w248RlJb0fvytxr8vNO5GX+eyekjjPBPVoSOlzsKKYZ7540q7R8w
	0BlqFT6ppMEszMr7R9sjsva6W20BLbVdErRgbz7z27kIJVFuWE1oCW3Q0GCaOilLlHc32GIuL0kjo
	iEfvxKYZSg8FHggiK8aTpf3+32cuqc29Pj2L5AIbKbv3xwMqy7X+RiTqPzvOFRbHno4UIwyR4wDOm
	JwWEqa28TofmwaVEJrz6GfMwV0qOdz0L83FpAuVvhoo03VFeE9gyQVKTbHuCtlslTSF+u6imW+2vy
	8YURgipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8R6-00000007kq2-1E01;
	Wed, 28 Oct 2026 18:31:44 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8R4-00000007kpU-0KSF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 18:31:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so6727135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 11:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793212299; x=1793817099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
        b=pbYwD5G9Or1i3JepSFP57Ruu089lkfQqj2+BndLrGjPr4YO++M4XyXuMJC5nKb6bOC
         CxIkHlnxQtYMylhgVkhu96RVw8X9FIOS0yjKzUo9F+b3Yi9iWH1GY7niE6yAcsGAoSkH
         6RfS1Ggmy7e+g6YTDjQEcQY8Tfe3kTgVdwOjM4TWThO/hrTIRwrkhvDWl/dnCWi8tQKi
         oswynsdC1btUztwKai2hRc2e8mzPrHjpPYheUSypyX100mVy2ZxmGHq3sy0rwGdRZnGT
         vhRVljNrWbIAyjhtFURVdrAZCxWo59dGuhGb3HHdIDPWS5elWMaeqCcH00Y1siDKdj1G
         Djfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212299; x=1793817099;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X+QvVRHeWMxizCTRKzuAHQ+22/m0nu959maLN9qWALg=;
        b=MoeY7Gwd2VVeLM3a0xTKdeyJSyQVN63TIJdILXI8G3447ULsVKRYBHMjEhkQEsC02G
         by5R+zT0iUbt1tXf5cAt41C5/SLtsbNcMLqRqFUJgi4bYOGNyUyWF6+ZP79HRkmiNTIF
         AP1MGjNROkxxXPf0RiPTyhqCrEEdDtZK+Ligch6cDrs+GXLQaE7N/7zJ2dsCFXIuOaeZ
         aBkUHCe/a/WEur9arNepn+BIYMiRJ/fmcfppdwXkZQBtcTBhRK/wxsJfu6Ob1HrmPtH+
         JtlEttExv8rqZAUR5WOUz8Y386PLfVHlSHdivUeTWK2GdBs1BCkgclucEsDMKn/aFYUg
         oWLA==
X-Forwarded-Encrypted: i=1; AKwUvBxgZ2GO4OFNb8MLS/qhe3OAmByn2dHb6cXsFpgUQrbNwZG64B26+cx72RPL5IE3lydSrIwBsiMfuLLQMA4t+hGY@lists.infradead.org
X-Gm-Message-State: AFq9FYJzD4VUhl63juLacNcXvP5kPbxVKZCmhc9ssEk2aNmDY4TJoSQ5
	CK3kbASXDQq+VsNk+BuIdlQL7ygIaouQCYmEZf1xKU4H2Z3E8o1VStWs
X-Gm-Gg: AYBFou0gYFJavXsCS2gD7jsIwe54uvX/HWQsEsnjs8nf8JmskbBROMaMX8XZxfuyUdq
	AB3G64LJ8CQC0xulIV6HlcgAOBzhggnoNfg3qTwQFblBagL6lTIf67FBfdlDOriJlj5YJbwhloq
	Nku9AiS9is2rYPCEPuyTqhlsAGw6ovHmRTq3uSOLCzCvXtx0dUsmYJgGC8bpw8y+VcIivMr6VZV
	s5vPjmgZ/cnsEMeYSNidyL0xPwGmGfh1xHKRio4ZUSuHbnA/UXLxPIi+xbYgUtSM/qz3yPLdfIy
	NSXjKdNXEhElI7vxbHWId5dHcrJokSibYXgPHH8E+lrbd6LXWvBWG7eWQK0bV+G59OglGQ3duST
	lIlr0O3JtJ8XXEsBozXkmIZUoiBhUAHhG8/lAc5U3mgf07IyFpznVYSVTG2qf8AMPVXF/5x3C7R
	/P15PBXMaaNPXsZ/D6tM8ZX99l0QfnfnMVoseiPScgYy+8FO9GwWJj4KV16kw91RED4XZs0nN5V
	aVF+VcZOJsXbUxhfUQaB5IfJNLzCzjv4qlkjWp3zHNuvQfobk54rzO/oEK+FB4o5yFNmhfd8xgO
	DXkijfRl0bv1iFwD3V4nByjHdDEm4gggaeGsbepuhUmtX9d/
X-Received: by 2002:a05:600c:4452:b0:4a2:fe3:121b with SMTP id 5b1f17b1804b1-4aa4eb767d1mr29197025e9.28.1793212299033;
        Wed, 28 Oct 2026 11:31:39 -0700 (PDT)
Received: from localhost ([5.83.201.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm29193591f8f.2.2026.10.28.11.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:31:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: John Garry <john.garry@linux.dev>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" -> "shouldn't"
Date: Wed, 28 Oct 2026 18:31:37 +0000
Message-ID: <20261028183137.537812-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_113142_140761_B4141B54 
X-CRM114-Status: GOOD (  13.06  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There is a spelling mistake in a pr_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/perf/util/cs-etm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index bdcf94813129..65bce2450549 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
 			continue;
 
 		if (!intlist__empty(etmq->traceid_list)) {
-			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
+			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
 			return -EINVAL;
 		}
 
-- 
2.55.0


