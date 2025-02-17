Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6428C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=; b=M25q8Pq5meO4YvC/AOFpAH3nqZ
	C+ShrmXD6KwGZYJbT6PXS51tNLElRpOzWxPF5m6iYJAB6CLmlnitogLY0ek6YhAsq5ApTDFKKpHYD
	vWqABY0RZYaauSb4m9p/IWVGL1c015ozziyOR7ZF3xRNsMDTIy1b9Tx7e9gyZ1vcauQCG9AuZbSjp
	XIJVUduVdvchuM42IRZn5SEI/jh1jJEsL8Q8p6Q00LgZ19NyWPayZgkFVEoQsj0DuvkrRu98eWUK+
	kdUia9xGqi2INP2RjHNz2JqxvI0tXWOSiGfqQsSTbVd62FeiwiKs15n6KJAColbB4OJbEaj47TSHh
	whw1i5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5HR-00000005WCw-1Zl5;
	Mon, 17 Feb 2025 17:51:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk47a-00000005I7g-39GJ;
	Mon, 17 Feb 2025 16:37:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso29757645e9.0;
        Mon, 17 Feb 2025 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810245; x=1740415045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
        b=KEOJEkv4VE4uzdT9nw6rIiRbgwjTmIuxU9+6M2IrLLIjjxtgSsGMrdlm1I1LOL6YuG
         +XTG+vVA3S4C0gh4xIGyPEAnlkCcCRSJEAJv+LXKe0ltIN1pNqBJy19tA196q3+fNq54
         yVPiYfNrTYc0I4ZmdXGdAA2Lk61hsRTL/1pTFmykiQR8tGErr/ZES5NQu43JaQRVmqzY
         iaUS/W3RzQzzBg9Crb/s0nQQc66R1+uo1zIfjrqVI+gESmZ82AuaGwS3GiH2EzAHGqrr
         0jgYhdtVcGPtYpGz9lLsp+MaI980+2Ov5JzCihE31qGM3K3FWxuQly4iayS2M3p2AdOF
         EuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810245; x=1740415045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/0biRJus/9M4PhuIap27DDVgRLzlMn9BGl57AT63dU=;
        b=uGTE5Xzabmm5jwaMVsZM7QvAC+4FSDeLk42b9PfRmRJ8H6I7CmeaW9YqX85wH374Ri
         eAmn95AupL3t6A4ENJ3k2Zn6TuEyQM3W7SlPo20S1+0Ld2u9+dxxUQyj40P5Mt0pGJGI
         gZDHnGK6iZxZ0J4gphpNvcPePv+IlUf55jbbCHgGZsTTagDOmYdGEUn3IGpNUQ+Mtwxe
         EhuRV/uNd5o4YtUYl8WJC3i94eZ1lK6/DmBMSxUSPkELoqoI3AUllt8yUzxL4Mhoqa5S
         EmaB1rF4xdYru7aBJE6fmadTj+OtXEjN1e3DbESp6FhRmsJo/4Was0Y7UYrXpwjqFtcg
         gwTw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Gt8G/xorcpx9kjTsFEjPGN50sVFjiHYSPfmJZTC2x0BZXn8aUA9X7+XL7vKWnhEHZ3RPzwK56iryldhqXob/@lists.infradead.org, AJvYcCWJmq0v7JpDHpl9e04HbXV78iNKtzv42MS+m6mH3lPac2j+S7pRnb6nyHAwgyP6zr74ZBNiXSKuU6P0Jsg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3zk6IIHBk0JFzBVAJmVCaRSrR/TVCvYmdZp9eqEJg+jz3vjUf
	b5biTm1VBNlcmVjOTHehNAzYsS6uhDu72hOufqVh9/k95XFDbxDi
X-Gm-Gg: ASbGncuk6ek8ZOYR8E6Br3+qN6B2a33WFOgoE7axoFSjmEasVB90eQII6p7pK43j4Rt
	HLBLm2KMzq6F/KXjBEU+n0Jeb2UAVH3ppuWHqQ33aXpxPh2f93q2L8onVpBSzE7Fv7n6eHSQDjn
	2Y+mDsCieDelhM32tiqa8ocN7TMiMA6AVJYeFaNiRqS9tqScFD/2qFmjiLGoExCXuuc2Z3oOU9N
	InBK210HeMwcHFJXEGg8oO9DIASuAEHY/MtbwI2bUxLN5ktq8KP8kMVIdRZA/HBpWbn8qjg1piB
	0Dt2q8oXV/qgJpiTbZvjxiPnhFIBteVnYRT8OC8FnH9qGpKLeEbcWR81e0Mo+bmP1wdbtZnFC0x
	t7Vmskgk=
X-Google-Smtp-Source: AGHT+IGnpGd1arKCvdVh8OB0EDoGo4KblVvIlIVVW7BFnKV8rTfrkS3K0VNVohWAHieTwgBwEJe4Nw==
X-Received: by 2002:a05:600c:4688:b0:439:89e9:4eff with SMTP id 5b1f17b1804b1-43989e951bbmr25428885e9.10.1739810245015;
        Mon, 17 Feb 2025 08:37:25 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4398872fa85sm24012905e9.28.2025.02.17.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:23 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] MIPS: Embed syscore_ops in PCI context
Date: Mon, 17 Feb 2025 17:37:08 +0100
Message-ID: <20250217163713.211949-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083726_807499_140A7DF2 
X-CRM114-Status: GOOD (  14.30  )
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

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the PCI context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/mips/pci/pci-alchemy.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index a20de7160b6b..02f0616518e1 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -33,6 +33,7 @@
 
 struct alchemy_pci_context {
 	struct pci_controller alchemy_pci_ctrl; /* leave as first member! */
+	struct syscore_ops pmops;
 	void __iomem *regs;			/* ctrl base */
 	/* tools for wired entry for config space access */
 	unsigned long last_elo0;
@@ -46,6 +47,12 @@ struct alchemy_pci_context {
 	int (*board_pci_idsel)(unsigned int devsel, int assert);
 };
 
+static inline struct alchemy_pci_context *
+syscore_to_pci_context(struct syscore_ops *ops)
+{
+	return container_of(ops, struct alchemy_pci_context, pmops);
+}
+
 /* for syscore_ops. There's only one PCI controller on Alchemy chips, so this
  * should suffice for now.
  */
@@ -306,9 +313,7 @@ static int alchemy_pci_def_idsel(unsigned int devsel, int assert)
 /* save PCI controller register contents. */
 static int alchemy_pci_suspend(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return 0;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	ctx->pm[0]  = __raw_readl(ctx->regs + PCI_REG_CMEM);
 	ctx->pm[1]  = __raw_readl(ctx->regs + PCI_REG_CONFIG) & 0x0009ffff;
@@ -328,9 +333,7 @@ static int alchemy_pci_suspend(struct syscore_ops *ops)
 
 static void alchemy_pci_resume(struct syscore_ops *ops)
 {
-	struct alchemy_pci_context *ctx = __alchemy_pci_ctx;
-	if (!ctx)
-		return;
+	struct alchemy_pci_context *ctx = syscore_to_pci_context(ops);
 
 	__raw_writel(ctx->pm[0],  ctx->regs + PCI_REG_CMEM);
 	__raw_writel(ctx->pm[2],  ctx->regs + PCI_REG_B2BMASK_CCH);
@@ -354,11 +357,6 @@ static void alchemy_pci_resume(struct syscore_ops *ops)
 	alchemy_pci_wired_entry(ctx);	/* install it */
 }
 
-static struct syscore_ops alchemy_pci_pmops = {
-	.suspend	= alchemy_pci_suspend,
-	.resume		= alchemy_pci_resume,
-};
-
 static int alchemy_pci_probe(struct platform_device *pdev)
 {
 	struct alchemy_pci_platdata *pd = pdev->dev.platform_data;
@@ -478,7 +476,9 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 
 	__alchemy_pci_ctx = ctx;
 	platform_set_drvdata(pdev, ctx);
-	register_syscore_ops(&alchemy_pci_pmops);
+	ctx->pmops.suspend = alchemy_pci_suspend;
+	ctx->pmops.resume = alchemy_pci_resume;
+	register_syscore_ops(&ctx->pmops);
 	register_pci_controller(&ctx->alchemy_pci_ctrl);
 
 	dev_info(&pdev->dev, "PCI controller at %ld MHz\n",
-- 
2.48.1


