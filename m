Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAC606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZlQaDcuC;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f5rPZ/Bb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=; b=ZlQaDcuCPxn80UUs0qqe3AGBi/
	hFjuEOjZHMgQIZBk6Ri8e4CXBmRS+gINTWU+0X1nCD+zBA3rz7ovVLgdINTKMEzDhE8A34nfHUvH1
	N2N93z9ZwtO3QM6okG9B73kPQYtDYAoCt6rquUiAx3NY3yCLU6QkQFBDyS5QlnzsQBPhz6tl2Jm4m
	/rsEAS39wD4R0Nt3VJAe3V4dYFNrfUimm7tWRxhgD4fLfk5HxvN6sR2faKPL2OvZWUHYnPKGrrGpH
	mBB3lCgLXaD6cBvziyE5UoWArd2kzSPuC9qRDw/6hcUCsJ2JOq1kl3mleh43G+DdpJozCA/Sfbpku
	8gE94yrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCVv-0000000GA1P-49Dh;
	Fri, 23 Oct 2026 10:28:44 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCVs-0000000GA0p-3p7j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:28:42 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so607469a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792751319; x=1793356119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
        b=f5rPZ/Bb69iHHEoK3NLH6TwmiNhlXW5674iOrPB6Q7IWYH3K5w7YG+nnqnvGXeOzCv
         CccJwUsLddOBy5VrMzOG1+tTzEbim2XW289kgJ3U67s7Xw29V4Td6WpfUeqFAz95IWeS
         UB0l9RLj1gsJR+4kcU7MP+sY07naLMqF1v/F1Nj6cLx8093s3uEVOkXMGSDCD3WwQNYu
         Z6ieo9iP3pQZuH5JFiwzXRNd7puno66Cxv46hcnyLWfuLQB0aObr4+PHy1KYz6dIB48i
         zlAHNXsjJzRDDFFPZFFcJlM8dBroc/xD4i5yhg/juKG2Uxg2vULMNyXrQEfhJ9VNVBcH
         SlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751319; x=1793356119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSiqZT2td7X8PBpUFev+SBKmb9LVtdkGi5NisJg23+o=;
        b=CsTVrN1USkYJFUHz/EaKQnSddiwsxLPwf+MZnBLXmHE05lPIAXrNSYZrLsLBQczR33
         4XWZ/Sq0dtk5Xv10APd3iul9Ex4vyV153RZn5S/4yfuSU7jSuK4RIBMnGYA0AHulKil1
         E/H23QMJh1En1Dt8Ta+E8RkzTfldgyEYpFnKFq5uLfpvlzlVhTqDZtNzZFY+i+hIZihk
         9hUEj1sDQcnG42BhW6DX3AVDw4oMOFDVlolm5qw+At8Sz2H3HSENGkieIUMIP2FEn31o
         1Lw4UULTPeCaMCVANAvBd/jyfTrGRR48Mekz96vdzTqhzyqpiPdoqZwrrtpihpmH4wKD
         hb4A==
X-Forwarded-Encrypted: i=1; AKwUvBzDjaSrmhfRS/tXMQ7HfR72C5ZdnwKVXYv81x0bhhBzw0pTyiJrUmdYl9UuErm4RwjWhr7wFzKwc08sdPojdfI2@lists.infradead.org
X-Gm-Message-State: AFq9FYJIsnyoMo+u200enojSIbLTKGOQrUuV4pdpJfObW8oLzXjtm8e/
	LYInNoG64MIT9Kg2bUe72GeM7tw9oCg8oSahbJKWse9zKeaRI0A+r6b/
X-Gm-Gg: AYBFou2hE6WOutRJ7VjRMpEHUQTEuFTf4kVSApIbe6ZOx2sDCUR+QEFYxAqnfukWLMD
	ipMIND7C8uQO6tAaclVIDVuIAKX3vEUCz0c/l7ViHCQ42rgbTYyj0B/oJT1s+orHhZuvol0bXEv
	XmvvQmnvS0YfdVmx+VNEW9QIPvgn++R3jMZSgSxyAdngalYyLN9LugTVtLqncu/cN1V5d1Bf+ol
	117oUa3R/1uVLi6THfizgvJPM5xtHSljZamGwFc8/Uv5rBzcsSCOjeShXLeNn7ksT6guW7dfShF
	h/suRwI8QcRuGgIB+VsPv+8VbxAVEfzLGN3vewKa85b7tHbgNv4s8e4g5OlUdOUWx2XCG5WzIFa
	V9mync1Qq4jUGL8PN+ewdfjiQB98zjh+hZl3n0bDfH/lb/Pt9NvWSYxnMY873DlXAcGdm0BHg+Q
	onlnoqZX7cNNeVvWPh+m1IV7FNL9nJ9OChp0UZ1/KfvxO9pRwUh5TWs/vNaSiP7yU2zNVQsfAXs
	dFx2x0j5yag2NtURnasybXx3hnbJ3ui8lMx0gHDXU7exNEOy8v4Y/EdQaY7Wc6W7KytWoj78mFr
	LtxVBKLvS5zJ5/3/qqDoUjwOhF4GgVfBvwIhABalvjHN5T3pBOAv4QB9yEq3sogJdsfFzvLS9Sc
	rNJ4uoxhfVbtKD5rY
X-Received: by 2002:a17:90b:3c0a:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3adce0cbffcmr1612715a91.37.1792751319402;
        Fri, 23 Oct 2026 03:28:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add263384dsm1074082a91.1.2026.10.23.03.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:28:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: xilinx: formatter_pcm: Fix read-modify-write of AUD_CTRL in hw_params
Date: Fri, 23 Oct 2026 17:28:18 +0700
Message-ID: <20261023102818.523331-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_032840_968235_BACB3B4B 
X-CRM114-Status: GOOD (  11.32  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: bui duc phuc <phucduc.bui@gmail.com>

xlnx_formatter_pcm_hw_params() does a read-modify-write on XLNX_AUD_CTRL
but only ORs in the new data width and active channel values without
clearing the old ones. If hw_params is called more than once on an
open stream, these fields may retain bits from the previous configuration,
resulting in an incorrect sample width or channel count.

Clear both fields before writing the new values, and use FIELD_PREP() so
the values cannot spill into neighbouring bits.

Fixes: 6f6c3c36f091 ("ASoC: xlnx: add pcm formatter platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only.

The field masks follow the Control register layout in the Audio Formatter product guide (PG330).
https://docs.amd.com/r/en-US/pg330-audio-formatter/S2MM-Control-Register-0x10

 sound/soc/xilinx/xlnx_formatter_pcm.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 304220d9aaf5..781508aef885 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -6,6 +6,7 @@
 //
 // Author: Maruthi Srinivas Bayyavarapu <maruthis@xilinx.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -55,8 +56,8 @@
 #define CFG_S2MM_XFER_SHIFT	29
 #define CFG_S2MM_PKG_MASK	BIT(28)
 
-#define AUD_CTRL_DATA_WIDTH_SHIFT	16
-#define AUD_CTRL_ACTIVE_CH_SHIFT	19
+#define AUD_CTRL_DATA_WIDTH_MASK	GENMASK(18, 16)
+#define AUD_CTRL_ACTIVE_CH_MASK		GENMASK(22, 19)
 #define PERIOD_CFG_PERIODS_SHIFT	16
 
 #define PERIODS_MIN		2
@@ -506,28 +507,29 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	writel(high, stream_data->mmio + XLNX_AUD_BUFF_ADDR_MSB);
 
 	val = readl(stream_data->mmio + XLNX_AUD_CTRL);
+	val &= ~(AUD_CTRL_DATA_WIDTH_MASK | AUD_CTRL_ACTIVE_CH_MASK);
 	bits_per_sample = params_width(params);
 	switch (bits_per_sample) {
 	case 8:
-		val |= (BIT_DEPTH_8 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_8);
 		break;
 	case 16:
-		val |= (BIT_DEPTH_16 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_16);
 		break;
 	case 20:
-		val |= (BIT_DEPTH_20 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_20);
 		break;
 	case 24:
-		val |= (BIT_DEPTH_24 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_24);
 		break;
 	case 32:
-		val |= (BIT_DEPTH_32 << AUD_CTRL_DATA_WIDTH_SHIFT);
+		val |= FIELD_PREP(AUD_CTRL_DATA_WIDTH_MASK, BIT_DEPTH_32);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	val |= active_ch << AUD_CTRL_ACTIVE_CH_SHIFT;
+	val |= FIELD_PREP(AUD_CTRL_ACTIVE_CH_MASK, active_ch);
 	writel(val, stream_data->mmio + XLNX_AUD_CTRL);
 
 	val = (params_periods(params) << PERIOD_CFG_PERIODS_SHIFT)
-- 
2.43.0


