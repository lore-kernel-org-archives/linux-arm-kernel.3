Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A01BC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5WzYhFz75MYyGJKrN0oKx4Q271RmkLAfslHRzunJQ/g=; b=xQcUgGRvCAU+Y6kD5epBGtDd0t
	9h4mqa2hhrmUuHgsYeUPbm/oOfUgh5G+UwTLGCp9ICbuAmvw6X3CdLpRG8nRneAVohw+Tk2RKoYRk
	dyPikTAIKJohisDXmft3pCwHCv1yFab4lwpu84y+xyTLyID3zbFyN/rIrHQ0pcBPwZB4SDhIYRzgv
	BX9pZIekdSjBXTcwqzoZ7vetdMIP7CiXf68O7uOgo5nkkSt+gAW3PMe2uNdY+LwPp91MSCy8NRbRp
	DetG2NfbRFefcBPjduO1JfBbo9hc2Ml790sAoM2q7k8V+lcs111dDiqQgL0de4tZu9ToezuE9G673
	+RbAfE3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoHK-0000000CKle-0qEz;
	Thu, 13 Mar 2025 19:31:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsoFe-0000000CKSo-0cob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 19:29:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22401f4d35aso28956145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741894193; x=1742498993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WzYhFz75MYyGJKrN0oKx4Q271RmkLAfslHRzunJQ/g=;
        b=PKekWYxVSaNhM5pCZNfG6ITSCA5ltbxYqCAeEyHUUul2bLPuXlLV8/+DuoHPSMp0YC
         nP/Ilk359OCfuYZFerFl09TwWBtFgIqn1sx3hQqSsV2jYWrUtYvG/33p72jDB21VivFt
         PFhuG4RVZq5JiwJitN0I8/Y44m25RSU/AS4u+T7sHrjhLEr85Y4bsH/CxaTlQ2MlrYq2
         lormv/iZl3SkZ4BwJffBvaKR8aVhCvKj8cGh49RzEj/fcVUsqioDNeBc9EI+OwTG5dI0
         c8Jnnx770KFMExcATmy6/B1MCRufAZbjkFVWLEMl58IjMJDsCgGg7qrI0ikcwD/rRcZF
         zUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741894193; x=1742498993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WzYhFz75MYyGJKrN0oKx4Q271RmkLAfslHRzunJQ/g=;
        b=LifH6eRZhy5kv0af0ejRltGQq6d09YFiKQXr1T9y4dpYyZrPE9bzRRF393RG5xR8YT
         LHl9EWJiCKqLU44pzAQkmeiTwklbX0m4CIl65Me5RVbyBpplX6fBcVJUNxkZ29TbQf4L
         PE7j1dO7TCvWaP39o8o6d486zl+2MFL+gP/5FgBYLhoB9XKsJx0p0F3bzP2vVPW/kF9B
         YS4REgfcu3Y1GFVHL0moL6GrRtOBhSIBA9jdM5PaeKhHiEAd4TvctEeNf2+P48T5MAIs
         YO1nC6UP5CFYsFQL0QjEjpunMHTeumoVXu6z3Bk7wNKe6k+RgSBKnWsKnYPE1aVpS1T9
         ffsw==
X-Forwarded-Encrypted: i=1; AJvYcCUeav2i59ELc+5Bb95hMgK7UMvIkGwfa8BxSO0yMyCTaHjUNZtWSfLb3C7rpvZEZNFf32Wpx+1ApfhGIUondr73@lists.infradead.org
X-Gm-Message-State: AOJu0YxPZIvpF3IInwPLB0UvceRk0A5G1OXs9NblwcRb29DvEAoxg6BZ
	rJ7H1ey3DzZj+JE7GgtMsaGGL1A5oVfpcUfLEcFvUiWcvHugfXuvON56JQ==
X-Gm-Gg: ASbGncvGJxUqvzrOQgkJphrLDvkvHYgO6lKgfn9YkwpR9dRcTWCLz02SP1ndEEMDhY9
	yPfplSSy8eG4yVrmQgZXlwwHZIt5pvldtyjG1Xthka2iwacovhnAh/tDYGvzimM7GzoebdVyhQf
	UsMycodu/DetMqW7C1A8IyPXrtk9xApwqyKusPgKEZuPjTQSN2uxt8zgmjRGUV0hB6SCBP4+1Mq
	V8vmADX9XwbwASQhm2BE5SH/6673l9RBnt6gdQtdijY3J6rScEM75GMc93508c3hS4Mym0Hmay2
	nNn/WoZ5TAkhP1hP+vs3NlqCnlNZtcwMnBSZa3gyOq2OB/B6ivhlGaV/3YDL7ExRNMAhMw==
X-Google-Smtp-Source: AGHT+IEUgx2DVCYAAUuPSgRmUlBxQLiJVMReq3nG/oUsNMMokeDSasYT0i+P+p+CCrzyfd2fGdnh4A==
X-Received: by 2002:a17:903:32d2:b0:220:ea90:191e with SMTP id d9443c01a7336-22592e2016fmr189900155ad.4.1741894193056;
        Thu, 13 Mar 2025 12:29:53 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:abab:f7ee:5b0a:8554])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba7280sm17114245ad.147.2025.03.13.12.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 12:29:52 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: imx: Fix the iim compatible string
Date: Thu, 13 Mar 2025 16:29:43 -0300
Message-Id: <20250313192943.1547330-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_122954_185762_E03AEDF9 
X-CRM114-Status: GOOD (  11.09  )
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

Per imx-iim.yaml, the compatible string should only contain a single
entry.

Change it accordingly to fix the following dt-schema warnings:

efuse@83f98000: compatible: ['fsl,imx51-iim', 'fsl,imx27-iim', 'syscon'] is too long

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx31.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx31.dtsi b/arch/arm/boot/dts/nxp/imx/imx31.dtsi
index 00006c90d9a7..637415564c64 100644
--- a/arch/arm/boot/dts/nxp/imx/imx31.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx31.dtsi
@@ -218,7 +218,7 @@ spi2: spi@50010000 {
 			};
 
 			iim: efuse@5001c000 {
-				compatible = "fsl,imx31-iim", "fsl,imx27-iim";
+				compatible = "fsl,imx31-iim";
 				reg = <0x5001c000 0x1000>;
 				interrupts = <19>;
 				clocks = <&clks 25>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index cc88da4d7785..5627c5a925ee 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -476,7 +476,7 @@ aipstz2: bridge@83f00000 {
 			};
 
 			iim: efuse@83f98000 {
-				compatible = "fsl,imx51-iim", "fsl,imx27-iim", "syscon";
+				compatible = "fsl,imx51-iim";
 				reg = <0x83f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 845e2bf8460a..4829861ab488 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -668,7 +668,7 @@ aipstz2: bridge@63f00000 {
 			};
 
 			iim: efuse@63f98000 {
-				compatible = "fsl,imx53-iim", "fsl,imx27-iim", "syscon";
+				compatible = "fsl,imx53-iim";
 				reg = <0x63f98000 0x4000>;
 				interrupts = <69>;
 				clocks = <&clks IMX5_CLK_IIM_GATE>;
-- 
2.34.1


