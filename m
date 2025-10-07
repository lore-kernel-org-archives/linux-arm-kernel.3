Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CF5CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qxUFkx3TIQhAfsBZkcTY7Gt7i9ylaZPTGmpdbY/RyQ=; b=mWCmVyxCLY5z4TKGMI50Dzu3VL
	yzvogxacwe0YWjoVbDmwgDVKxsvtH/vpZnFLE8YKHGBOPHEsExi4xa0LZYXs6YUuiQ361RQYBMOGR
	uNcPKYmsV4HxYBt5YLuP9OXvVATaTJhVaq1ZjzBUoRSCd/GFJUjgOKzmX8ogeZo4bGLcoLyAqiRYh
	0aOsWDdUexET302Gu5cKMEcR9asKhCV+vWHUKZuDZGSWxBR7CpqQ/GwkSBnJ/3sUYkAf1WR6GSBjK
	shKNXRfSwtlU8Zw+moAt8y3VH5rdRRLa15FFz4mYZhzxRj3CmysisbI+6RT8VHGG/DumYUOga41Jf
	hqxpOFdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JS-000000028A6-0A6s;
	Tue, 07 Oct 2025 14:05:10 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68JP-0000000288V-28RV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:05:08 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-33255011eafso6449676a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845906; x=1760450706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6qxUFkx3TIQhAfsBZkcTY7Gt7i9ylaZPTGmpdbY/RyQ=;
        b=XdE7tsLPVviU2JbqNlxX8WLTcT1Ex7K/+J2enJP0AXPZSrPLr4FESwRtjQlY7DsCUu
         9Ilswb6/U4hk/Ggrx3bpU92dzbkIsfUzrw/LbI6i1a2/0RlJ31BhJ1eDmSDSl/zgousk
         v5PhbFFuykrHQ3bWQH1u3soR2dTFBiaJaOcdqQvZPLdc5fhFFmXi3t4tddr8R0C+rNwn
         3VanvUnTG29nxEMGg3JaE2sTcfFyNqEVDnVBLODoChaRy6peSQQ/E68Q573wnvXP2zH8
         KYRJXNNYLjx3IFSDbTMoCP07K3KgMEmk4KTwq0oncKV4K7NnrlvqYBTMdjGkwqe8okNj
         VOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyaX+Xk5RXTy5yqhql41fnZdrSd7ZQQPnpi/YlTtul2B9L1oOpAHuT9G6Wggf29cF0dvIdw1S3ky8DcFeChWSn@lists.infradead.org
X-Gm-Message-State: AOJu0YwycmaPLuu7XeMQ2yI59hRJr85Dt/sKsGnGXMoxtShmK09Qw+u4
	AK+Njy7NqYwPU/YQkLCfsfzvf20ig6KILXGaHG56myLnXC4L6LCt+JWPXT8qfGwhrpeevo5U3ng
	SwC10LYk7PDgGbtVZ0yE6HrARs5sDGlwvKcWq9/GYFxbUbYby51c4vEo+Ofce4hIDt0OTdCFTCQ
	/cSdm5dsCWIWqfaIGBlFNr/v2kdWckL6ViuoL4hDB3Ri38aCzhoe886vlP3OHAbUwq0U5kdGVKn
	tp66gGg7jSdk5nHz5RpXWoNegQ=
X-Gm-Gg: ASbGncvr7YESuut2KgVv43tGpP7i7S2WXQYaqY0uBuhNq4cxGt9mIi3WE5NmFxA6IOG
	p+kD6b5JnzEAH/krXO7iBx+0wyCKUf1OA66vPw/xEN6bL9GLg/AKAXULaT2zT2weXo+5tYxkA63
	ZQf+pDdpAhvtvzBhkfggpYoRiQ7GiTlVlX+ubiUZqDGvUX+ItPkEuewMhrn2kg7cmUpdfFTbmiV
	yP7sarS3LLfB9+5WXCI3XZ4CRfnIRzAnVg4rRaOIwC15jfuB5g4P2FfTClNo3tW6xWtf7RO7fgd
	Ke6tV2VT9+4ziisUAPNrdrVz/wIj/Zhc6+pj49rp3oAiaNwc0ZDOfgC7pbJqWdKQ9g4uw3v/jHD
	+iVpK6HLSg58e6uUmDi8XztJ1Cp56ouhKtRrnl5Wpxw2meRnuEUC1lwGZ3AzaBtISbUUrQp7A/H
	RAcQ==
X-Google-Smtp-Source: AGHT+IHVIMNAtrGc6MrWY2ieexySaMuCyrz/O4Sfmc61SV8wST7Nz7QrOsbTHG9YrG3TpPd5vRDmXz9nAUf9
X-Received: by 2002:a17:90b:17cf:b0:32e:5646:d43f with SMTP id 98e67ed59e1d1-339c2786c64mr21158988a91.19.1759845906344;
        Tue, 07 Oct 2025 07:05:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-339b4f3385dsm1578200a91.7.2025.10.07.07.05.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:05:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-818bf399f8aso166560006d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759845905; x=1760450705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qxUFkx3TIQhAfsBZkcTY7Gt7i9ylaZPTGmpdbY/RyQ=;
        b=Q28SovqKt8cyNfxJlOeeDtLf1qlaQSNo+niJSXNdEGwoOGsnbQWojoORsWmaS5yIQR
         KCw38dsAtqCQepKO4yg5cw6dUHd0TZ1eZfnPdfTgGw77R31cgssf5TewOMbhhD8hYN9e
         4auimh1sIylJyNYxpa+Yw6fH1RaI09En2uXRs=
X-Forwarded-Encrypted: i=1; AJvYcCUi+8JZD1xFUg+mL62Cj4wpxXeRiHdTxeasAmx1VAu9M7hmGSLhkKlmdzwzzB5uYm0+MK3vwW1wnhQi95Ds3MkV@lists.infradead.org
X-Received: by 2002:a05:6214:1254:b0:70d:6df4:1b21 with SMTP id 6a1803df08f44-879dc87fd21mr239627976d6.62.1759845905216;
        Tue, 07 Oct 2025 07:05:05 -0700 (PDT)
X-Received: by 2002:a05:6214:1254:b0:70d:6df4:1b21 with SMTP id 6a1803df08f44-879dc87fd21mr239626916d6.62.1759845904420;
        Tue, 07 Oct 2025 07:05:04 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60b67sm142718956d6.9.2025.10.07.07.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:05:03 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 4/5] mmc: sdhci-brcmstb: Add BCM74371 support
Date: Tue,  7 Oct 2025 10:04:32 -0400
Message-Id: <20251007140434.606051-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007140434.606051-1-kamal.dasu@broadcom.com>
References: <20251007140434.606051-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_070507_554642_A7EBD472 
X-CRM114-Status: GOOD (  12.49  )
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

Added "brcm,bcm74371-sdhci" compatibility to the controller driver.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mmc/host/sdhci-brcmstb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index d25bf71d79f4..42709ca8111d 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -299,6 +299,11 @@ static struct brcmstb_match_priv match_priv_7425 = {
 	.ops = &sdhci_brcmstb_ops,
 };
 
+static struct brcmstb_match_priv match_priv_74371 = {
+	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
+	.ops = &sdhci_brcmstb_ops,
+};
+
 static struct brcmstb_match_priv match_priv_7445 = {
 	.flags = BRCMSTB_MATCH_FLAGS_BROKEN_TIMEOUT,
 	.ops = &sdhci_brcmstb_ops,
@@ -324,6 +329,7 @@ static struct brcmstb_match_priv match_priv_74165b0 = {
 static const struct of_device_id __maybe_unused sdhci_brcm_of_match[] = {
 	{ .compatible = "brcm,bcm2712-sdhci", .data = &match_priv_2712 },
 	{ .compatible = "brcm,bcm7425-sdhci", .data = &match_priv_7425 },
+	{ .compatible = "brcm,bcm74371-sdhci", .data = &match_priv_74371 },
 	{ .compatible = "brcm,bcm7445-sdhci", .data = &match_priv_7445 },
 	{ .compatible = "brcm,bcm72116-sdhci", .data = &match_priv_72116 },
 	{ .compatible = "brcm,bcm7216-sdhci", .data = &match_priv_7216 },
-- 
2.34.1


