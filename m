Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D101088E60
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dck90428BvoqEpkmWusaTQb8k98b4TyQG0pbU+HYgI=; b=zy9DQZGXNKIWxcmyiGMKbF0CJw
	oZPTiBSX38cCEacZCMmR5jGmlORO3vzeb9U0roY6thde9Q1OUR4rwxrUruafFk5vdraBwaoIRMSzK
	NdNWI4n3od2rMcCrnnikmi1T4HXEle2Lz4dUBYIfuurnWGanzAL8YEtZ7arvIw2qRCQYMk2yFyPgW
	0o2bgIioxk6S/iyT0e9puI1qb0NOCva+ebsL4VV4IpQsgirdBBMHW8lCbbOUGj0JfqMYjvfyjoPEN
	WqgfI9YnPkMJWXZ7lpn5ukhfHptmejDBr84qc1ZQeTF8k82Kp9YAETcj/0SzTs+9RvMuFsEGVhdFW
	JVphbS6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKa-0000000BDYg-3m8U;
	Thu, 19 Mar 2026 17:38:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKV-0000000BDWl-0aan
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 17:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=2dck90428BvoqEpkmWusaTQb8k98b4TyQG0pbU+HYgI=; b=c0Uni6Q6kOuIcnGPF5KVPERW46
	RmzXXIkvJl9cyzY2OVz9h7eTqIIZioc7FikVBYkRNAcXREd0zz/Wf7NaTtjUXOC5WCc6AnP9wdpiS
	VUUxhblHNgEB/n6SyZd7j9awek4p5Dca0eOOc7aRPzbjj45v7mUHQFmR2yLLfW7Jp3C0e6ROQI6Z8
	vVVkmPd5bpKWpdYa3QE51W6paIWRyRe6QurjnIYRiCySYzGCLBAxvIC7yWjBbBBbqa3DFFTt4PEPL
	u0094PyqU/nQpwYIa9g+rIRb28pWqujWCwfO3HBEBHATLr0cAYfBrfuV/LktPJ+4R+Jz1P8KDsVOm
	4syJ4BOA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HKS-0000000E8FC-0zc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 17:38:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so7139855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 10:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773941918; x=1774546718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dck90428BvoqEpkmWusaTQb8k98b4TyQG0pbU+HYgI=;
        b=BDPKbbAFsJNBrmslP+s/NU1vzr4ttX63M4hrUEkp+eVnrdvD5yK28TvV6wLKM89mZE
         lzSRPFcTG5eUEQ+395L81SfJ52PXQ/KrVsPTLhMCyy8wHOpVFT7KU/hom0u3GkwPi6G8
         WstJlnFNxarwpcpcEW3L4bv9Pf5q/AodhU1cr0lIsykhUp+KTHkgfSVnDYgbUTpAWEn6
         2eIhmUoH2hA3chHkA9kzAoe4/uX2iG8asySrWiCgqSbochaBqdOWeOLc+KF+MXhCah0H
         bUJsZx4Z2ch+ym+FGnTeRqzxjcUN755POH5x8nLLgeJiQHBVeq5qPUqjqp7aIhdpgPb0
         HeaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773941918; x=1774546718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dck90428BvoqEpkmWusaTQb8k98b4TyQG0pbU+HYgI=;
        b=b5Ha74+RKCimztg8CXryIyu3E63Hp4kMNft618Qpidx9M51avXevPaUqaeBe13O104
         DFRDaaadYMIr9oro/gl7BgKT5SVR0BdfkrsSTgMK/6n+wJfdTmeAel8mIY3k+Z0J9qM7
         vlgpkxc4mu+MQmgahUDGwohCtuc9I9aot4pMH3v13gRHvV9jIEsdsXxs+Bm++iU4Qnom
         1NkQr4xNkGiJUA4VWzbz3SjKPniNsES+BdXRXhHLMmR6F6iAPanhG4LkHZu8hmd7M022
         j0q93CKVMvEZJDX4saHkfLW4mbndmpabIkA2OHj8uKN6VNCpttx/KEypWxfUp6dLSuEX
         wBwA==
X-Forwarded-Encrypted: i=1; AJvYcCW0rTE95pY1ZR8oIe6KrEICblnpy8lymj7cplOdaaf7Z5JL/FlS8JkcWEgOMw604ftHEZ7EqESJReHJS+uJtIOI@lists.infradead.org
X-Gm-Message-State: AOJu0YxXFojF1tZmk9M4dpRnw9fipOw4qQlM9OP5kDxz3Fjdli+ry1hf
	axY1OvB/QE8tz6fFeACXlmXdHOxOP74TNN1yHsEUf8qN2rpEPdsW8zGK
X-Gm-Gg: ATEYQzz9i3s7H7oH18FUigo84Lq2nWe2yN59KGgwUC5+C9bCukmpV6tBlw04x9540yk
	rNMkgTl8lnkhIwAR07GlCusF7sVprbeFAuk3LDWspsLFoz/j0G9wyBqLyLMbC1Tcn4DG74v+dmD
	v1ww5LHQpdAw8oIRd+M8YFw56etV2wYt5/kilHNbI/5AjqET3sAbQ7GosSp92GniJf5/OZaKF56
	Z5sM3cBqijF+sd8t6LqgHsqTghN0wwis/rjZNufXNQlCBOeSBdGJ5WVFSxeTSPa1kTRLRHzd5N9
	3pxjYAmszNtKJq14ci34fQU1t1sUSOjzlOdGaQUIHShmuh3fSv2TxrCGaC4ybeEipClmCIZpJp+
	cOdL1FpQUTxoJHTmLZO4btCN5OR38tVAnAozaYkpX2ZYciMT+CJchQJQBzP6lrb9wDLSUJIpEH4
	zDNziYWurF7BAopcI9OxW3uqj5+r/4Tkr8FA==
X-Received: by 2002:a05:600c:55d7:b0:485:4f11:aabc with SMTP id 5b1f17b1804b1-486f8b80e07mr59487305e9.15.1773941917725;
        Thu, 19 Mar 2026 10:38:37 -0700 (PDT)
Received: from debian.lan ([171.22.85.208])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm212845f8f.16.2026.03.19.10.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 10:38:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: [PATCH v6] mmc: sdhci-esdhc-imx: remove redundant mx25 handling and consolidate soc data
Date: Thu, 19 Mar 2026 18:38:32 +0100
Message-ID: <20260319173832.15543-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_173840_323791_36019E05 
X-CRM114-Status: GOOD (  13.70  )
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

Remove the is_imx25_esdhc check and redundant mx25-specific handling as it's no longer necessary since the new_soc initialization. Consolidate the drive data structs for imx25/35.

Signed-off-by: Adrián García Casado <adriangarciacasado42@gmail.com>
---
 drivers/mmc/host/sdhci-esdhc-imx.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index a7a5df673b0f6..3dc43f1e517aa 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -256,11 +256,7 @@ struct esdhc_soc_data {
 	u32 quirks;
 };
 
-static const struct esdhc_soc_data esdhc_imx25_data = {
-	.flags = ESDHC_FLAG_ERR004536,
-};
-
-static const struct esdhc_soc_data esdhc_imx35_data = {
+static const struct esdhc_soc_data esdhc_imx25_35_data = {
 	.flags = ESDHC_FLAG_ERR004536,
 };
 
@@ -391,8 +387,8 @@ struct pltfm_imx_data {
 };
 
 static const struct of_device_id imx_esdhc_dt_ids[] = {
-	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_data, },
-	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx35_data, },
+	{ .compatible = "fsl,imx25-esdhc", .data = &esdhc_imx25_35_data, },
+	{ .compatible = "fsl,imx35-esdhc", .data = &esdhc_imx25_35_data, },
 	{ .compatible = "fsl,imx51-esdhc", .data = &esdhc_imx51_data, },
 	{ .compatible = "fsl,imx53-esdhc", .data = &esdhc_imx53_data, },
 	{ .compatible = "fsl,imx6sx-usdhc", .data = &usdhc_imx6sx_data, },
@@ -412,10 +408,6 @@ static const struct of_device_id imx_esdhc_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, imx_esdhc_dt_ids);
 
-static inline int is_imx25_esdhc(struct pltfm_imx_data *data)
-{
-	return data->socdata == &esdhc_imx25_data;
-}
 
 static inline int is_imx53_esdhc(struct pltfm_imx_data *data)
 {
@@ -873,11 +865,8 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
 		new_val = val & SDHCI_CTRL_LED;
 		/* ensure the endianness */
 		new_val |= ESDHC_HOST_CONTROL_LE;
-		/* bits 8&9 are reserved on mx25 */
-		if (!is_imx25_esdhc(imx_data)) {
-			/* DMA mode bits are shifted */
-			new_val |= (val & SDHCI_CTRL_DMA_MASK) << 5;
-		}
+		/* DMA mode bits are shifted */
+		new_val |= (val & SDHCI_CTRL_DMA_MASK) << 5;
 
 		/*
 		 * Do not touch buswidth bits here. This is done in

base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
prerequisite-patch-id: bf56dcdce62cb97741b7aa11b04c7a9648fb2d6a
prerequisite-patch-id: bb57e0fd9cad8c81bcf7a6389f3cb294bbe1eb52
-- 
2.47.3


