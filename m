Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1632C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4kDojqUMiIFkZnyNMg3tExxWOhbTs+aQLMwWb7s2ao=; b=xuy5VGmPFSyFGnho4ZsD45p0DX
	lH5VpbJ773rzj2wOyHVJokUb/YSmiRVRWTQXRccvpBM/aRCSDSftK1JbXsWsxe9C+zN0jCvhg5Ki/
	hUxMueAhnmA/BzOzHoccZ6w2sMoog/3/ZaJUODDbCsK0Y35tdjJFLNcSu1ezvfTAoRKvYegp4kzlf
	7/QS7t990IUWhyPPDeM1iNvRUZyuQO9f/k+kxkwsfPa01F6Gh2vEa61AJRzNK5ux9pdlRNzdODxUN
	GqiRecgs/MlsXJawFk9DCmnPokqjeCTbCsMvGBfwabsn/XUP/adqhcPyeE2SVFgD58vzJ8J3szNe2
	NidzG2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpsr-00000000vAj-0fEB;
	Fri, 17 Jan 2025 17:11:49 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpkA-00000000tQY-2vKX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:02:51 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2efb17478adso4111143a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 09:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737133369; x=1737738169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4kDojqUMiIFkZnyNMg3tExxWOhbTs+aQLMwWb7s2ao=;
        b=mlw299ymotwluSeItH3RbKKRur2ft4IDoUcosTnsww67tstdUydZK8SgiJM4b4VkFl
         McDHnnqP1GCh2rcbLnnnMC8+vfQUzxdgvMO02Ew0x46rqfQyUa1rmFZpY/HENYfvmpiY
         sodGatPQHCV9QVwssAxwVStN12E/WEXSTmnTdcA1W9Nr5l25n+1EGlcl2DkK0V6CzSBW
         bsxv5ZyacPL4aHKxugwoZfgYBjtS1v4OZQ/LhZ2VZGplonz+gJTE0XlwVeMwSsKf+Uix
         Gi4O04Nn6uoiR2KrdcZ8dTys+cr87iUtvf3LSVQGJtzL33NpBGePeE9hOiumEGSZs7l1
         htxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133369; x=1737738169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4kDojqUMiIFkZnyNMg3tExxWOhbTs+aQLMwWb7s2ao=;
        b=sjGDydfJLtwcbGyp3eM+at1IXm1AHNVYvEF7/Gpcr6lTYH6tKg2uDqkDjoiqL85Mou
         TGezE1e58IjIBEvOyp2mhCLbuPHl1qU+XHL9ZmSVgQ5A8eOfFgTmjDITxVvcPOOd0PLi
         UkItF5rnM+91h2PSe4zny74DgBC/ZkJzXZORfwI+KPwErVRfNAe2ujGY6cy5PJd0BNyB
         f1QH4kNB9YySom7djHoYRL9v5GLmI/GGzZk+AVE/p75vtSLH0Gsz62v1gYQiN4+O+UxK
         /5nKl/gu5skNE2v0uQ+JC3F+8DEybJudHidM8LlWnPLnSrgtXIcfKe7ziyplpXWDgDKS
         5N7A==
X-Forwarded-Encrypted: i=1; AJvYcCXSTmJHixXs8BUse7Zrw70CtS6x4fjTYuiLrhaXs1vaLF0MbArBLIFqNRCyNb9o99Z/V7E2HTwdUDgR6WA61VCT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZftZeiQZZwO39fNVAWTLk4y53YrR2uglBKjmee4Z8JdHtGlYF
	ZpPsjBvbrS65q4mmMvP8xkO+YyGn18ib4Zf87eHFssUi0xiR20Dk
X-Gm-Gg: ASbGncu52Ij5zLBDYvor5Duj1sBVxczl8mjpWXtyvqdSX39iMeJ1qnCTj+ZFOmLf95z
	CglIqpOxhYc6te4+muJgaZUk552IF97nN5d+XKO+EZpFyIAR3sHLxNMjoCx6it10XfU0axWTdaA
	sHv2uy60i6Vb/irUyeyJd1uHnCLt0YPUv5iko/ArslTLzFSU9JZbvFidohPUdOArEs1B1kTRvk6
	znM+MQrJ80gs7e54NNAuN1Ebzao7ce4n4v4yOoRIhMb6gJNU876LU2/xg==
X-Google-Smtp-Source: AGHT+IFSKYz5MJBYL73PaQgH4rfTufNnsapr7Rut4pl5xrZYZx9FoXciCNIkw1AxE63eVLgrgYPDDw==
X-Received: by 2002:a17:90b:2f50:b0:2ee:fdf3:38ea with SMTP id 98e67ed59e1d1-2f782d32c45mr4034054a91.23.1737133369113;
        Fri, 17 Jan 2025 09:02:49 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2f72c1ccf46sm5544422a91.22.2025.01.17.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:02:48 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured to fire FIQ
Date: Sat, 18 Jan 2025 01:02:27 +0800
Message-ID: <20250117170227.45243-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_090250_735770_0C33EACF 
X-CRM114-Status: GOOD (  11.12  )
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

The CPU PMU in Apple SoCs can be configured to fire its interrupt in one
of several ways, and since Apple A11 one of the method is FIQ. Only handle
the PMC interrupt as a FIQ when the CPU PMU has been configured to fire
FIQs.

Cc: stable@vger.kernel.org
Fixes: c7708816c944 ("irqchip/apple-aic: Wire PMU interrupts")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/irqchip/irq-apple-aic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index da5250f0155c..c3d435103d6d 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -577,7 +577,8 @@ static void __exception_irq_entry aic_handle_fiq(struct pt_regs *regs)
 						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
 	}
 
-	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
+	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) &
+	    (FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {
 		int irq;
 		if (cpumask_test_cpu(smp_processor_id(),
 				     &aic_irqc->fiq_aff[AIC_CPU_PMU_P]->aff))

base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.48.1


