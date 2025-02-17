Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFEAC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=; b=djOiVJxfszNmXdjj+BFF91gha3
	hqs5HbGeE4ZXGw/TJ29AfLnBdig4G2sbXCwYIystAItuLk+tctMJkkvu6LtrmxwHIuswxnR/ZSf7J
	fXDMf0p7MifstN48P5Uqnd4vKcWakr3CSNaj/3QfqUNzKOHnaf2Kcdkaja8kSlMU79tyuHkqeUWvV
	Dq5DmdS/rpgkFOIT+Fp3xt8vb27SauDNuER0LkAkbL1bk0m7myT3dGR1wzfMA1x896pRQaXyvYXQd
	2AlMafqKfMLeTFOGKPMH52MVFey1gZHtUO4wRyD+c+jS0S12OBIu4r9rBJJQ3bQty/2L8hEAabors
	qr4VagOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5U1-00000005YSs-0J2m;
	Mon, 17 Feb 2025 18:04:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk47j-00000005ICe-05GT;
	Mon, 17 Feb 2025 16:37:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38de1a5f039so4444069f8f.2;
        Mon, 17 Feb 2025 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810253; x=1740415053; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
        b=e+hNyY4gKBOqWrP9LbHeKj13gy/kkoFmY9SAfuCch9eHapc5xsiybo6hw51wDkiKUO
         3PCLmQ07TBxh1abNS1EWJlsM4M0vX1C/QOzxX7AtL3VXe5NT1Urna7pYkM9ZyR7D5Y0m
         p1Qz0uMdMngMbGRCpUwxCDLP70KnCRY4IExpu5OzDZ0U8qs/Oa0AhfYyLf5azxgh/eRz
         SlNDqIfiwlW0KWkHya6Ytsx1Y7YdBI+DiShD7CVevjRxhtZjE8MDn/SO+33BVFufdMkq
         K6JKmF/vFymPbDy0yOfjBAdDfkR85HDUCyN5c0E+OetdF9f47jj/H/Dwaxn+zpjxT3Tv
         szjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810253; x=1740415053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
        b=IOFEosnVjqx9wKvE4xUtkaZNtsPkPOqhaP5MpsjNaFKDkC4/XQNjzM76MmztCh5+El
         rNRA8X+54yMvdaupqBwPViplD8lkagAhWBCkMlrze13x1zb3Eie8k1+a+61l6KuFiv3z
         YTcUx6YRPT5In+wVhy8a/zme+ySdMIn+hHIUetyQAmsLqrokkJx/DRx9iBvu3Eg94Dr3
         mmMrDHQvnLgVDrnPea4l+6ujj27LDa+qq3lJOmSV+W11oLr2h/eKtPcXEUpo0/i1SnVu
         Ou7vGp3Sp+DfyNDww8GV6UBQ5S67smYODcPsXCVEAq3m+RGuATEP55fYeQ0gy8BeFh67
         4/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCV2kOQ4cAYfWwkBTPJaLBHtfipwYl1A5hZT/y7w9OCgN19uVUtn+rpwheez7Q/26XttjiWnsrxM5KdD5NbXx+PJ@lists.infradead.org, AJvYcCWCmO+Eobs7RbGcL4SrgHK6gy5JbWlWb6j2k+AFo7E26mqX+a4hWhVrO68JxdBWKffai0aEvp1ahSomxys=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEExlOl87sAgyiDHiSpAdh9ksnfc7140wuchIfzf5p57sSTy7K
	4iSVQZ1kE0rsOBg/dcct24ZjE97eRsTvYqKdWtJq2XWPGG6WlAsX
X-Gm-Gg: ASbGncvTi2nkk3cszFUjBaMjTB0R16gcC6fjvlizzWqs79o/E0k0W6gZpMnC5OB6qJP
	hQVURLgFSI7GMaXivg4qns8nzKgDLGFNIU8/8nBsAmZOGleqK8pURpeqKQTJdEwgA0m1y/ef+4X
	pQpe58F3q3PZnhlw5zblnyFTbX92R7KOtrWNXEnCIpmIGtdvbSEQ2hwBctfo70obM3ogOAEd4kN
	soSKYlr5sWqSZtTl8zYPjqbFwbelFZq2Ytq08WvNXg+DnqjRymI3H446KcxU5uJMd6S6OVEz1ja
	G0Fl8inFN1xDaiXq4Y56FEKCWKtsh23cv2Tbecx4Sq6EmmEufiKjpGyey8G4uwnKjbXwLMbD5fT
	z1/4jrnk=
X-Google-Smtp-Source: AGHT+IGTsVCL+NTHpDgAjbfPGCf82Ky2fpMBBCHIOPIzC5FN2MM8zcjn3L7PrIBL8Fr/RKV6YFjIXQ==
X-Received: by 2002:a5d:64c6:0:b0:38d:cab2:921a with SMTP id ffacd0b85a97d-38f33f1249bmr8380187f8f.1.1739810253132;
        Mon, 17 Feb 2025 08:37:33 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259f7979sm12509797f8f.83.2025.02.17.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:32 -0800 (PST)
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
Subject: [PATCH 6/7] irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
Date: Mon, 17 Feb 2025 17:37:12 +0100
Message-ID: <20250217163713.211949-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_083735_059948_13B40C68 
X-CRM114-Status: GOOD (  14.66  )
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

This enables the syscore callbacks to obtain the IRQ chip context
without relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 83b009881e2a..61ba06a28fc4 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore_ops	syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,7 +27,11 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
+static inline struct gpcv2_irqchip_data *
+from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct gpcv2_irqchip_data, syscore);
+}
 
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
@@ -35,14 +40,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,22 +55,13 @@ static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 
 static void gpcv2_wakeup_source_restore(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
 
-static struct syscore_ops imx_gpcv2_syscore_ops = {
-	.suspend	= gpcv2_wakeup_source_save,
-	.resume		= gpcv2_wakeup_source_restore,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -275,8 +267,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore_ops(&imx_gpcv2_syscore_ops);
+	cd->syscore.suspend = gpcv2_wakeup_source_save;
+	cd->syscore.resume = gpcv2_wakeup_source_restore;
+	register_syscore_ops(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.48.1


