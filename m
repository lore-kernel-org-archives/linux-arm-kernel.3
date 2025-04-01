Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5939EC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 09:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHg1j5SRCLwzgT0V2I01YJ55FD5KxXYRr0NXYKKGCQU=; b=p10tjBu13yQ4OPv3pMlTLgBezz
	LlVtWsydL5Gq1rxJINsES2F90ew7+xZLFPvSwuQYs4D0xDORZPDrc2G1NZ/+Zt2DMbuuFkvu39bxb
	W3fZMV7CYfvJf1Y3N8SdzMXTaedMsGZb+TSSqXK4nfxCLcO+thCWE+EVOVpUIOWJMOxZPamGBho1H
	+wDsOCoa1jEJxh0ttJ5pU0UCapewmcgHsJqbqSBHHxP1rqATiRpB0zFfP/YWBbvbUpY7SiSN/zmwI
	6+QE9YXnIZ33dfWncjd0fmynG5BBUKEHW5oZGxLhsZR+RmdKUm3E/Bopm/ABJ7lkuAf8sAH/KTkbZ
	hL42dBKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzY6y-00000002VVE-2RaF;
	Tue, 01 Apr 2025 09:40:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzXkZ-00000002ReQ-22b5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45CB644E30;
	Tue,  1 Apr 2025 09:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD5EC4CEFA;
	Tue,  1 Apr 2025 09:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743499058;
	bh=AxgUPpe7veMz43oEYyqKVd2CX9jpZjZQhL1wqg2ys4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2Lu4yvjmBvDOFtlxJkxvjaYq0Hj9ZzcE60GMXnxdKlhfGXG/S0wYU5MnkVXhNT9G
	 RkJ9jupOJE5FqGVhfqZ6KrXxBcgcFn+eo2H7KPGBEtvXMEiWiEwYmcJiCJh8v6DiX7
	 xb2hpGPaaiqAqDJN0O2w56cLclzRoaCJI8QVgD/D4EEKnFa7XqbmrsLoRpIuOJpZ9S
	 D0V5KJUcOb93HL6m6C6/p8UoFTS1KfIzVIbEzTSmbtgUJiiYMIiIm/z+ntyolCokWk
	 oI8UzETL74D8ghCcIicA1coopW2K2LNadYKwNuooEPqBth57IWKlUeYowkOY2B8i4X
	 VHCLvKyKsQApA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tzXkW-001GqU-DE;
	Tue, 01 Apr 2025 10:17:36 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: [PATCH v3 07/13] PCI: apple: Move away from INTMSK{SET,CLR} for INTx and private interrupts
Date: Tue,  1 Apr 2025 10:17:07 +0100
Message-Id: <20250401091713.2765724-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alyssa@rosenzweig.io, j@jannau.net, marcan@marcan.st, sven@svenpeter.dev, bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, krzk+dt@kernel.org, mark.kettenis@xs4all.nl
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_021739_610359_E0ADC1BD 
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

T602x seems to have dropped the rather useful SET/CLR accessors
to the masking register.

Instead, let's use the mask register directly, and wrap it with
a brand new spinlock. No, this isn't moving in the right direction.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-apple.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 6d3aa186d9c5f..6b04bf0b41dcc 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -142,6 +142,7 @@ struct apple_pcie {
 };
 
 struct apple_pcie_port {
+	raw_spinlock_t		lock;
 	struct apple_pcie	*pcie;
 	struct device_node	*np;
 	void __iomem		*base;
@@ -261,14 +262,16 @@ static void apple_port_irq_mask(struct irq_data *data)
 {
 	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
 
-	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKSET);
+	guard(raw_spinlock_irqsave)(&port->lock);
+	rmw_set(BIT(data->hwirq), port->base + PORT_INTMSK);
 }
 
 static void apple_port_irq_unmask(struct irq_data *data)
 {
 	struct apple_pcie_port *port = irq_data_get_irq_chip_data(data);
 
-	writel_relaxed(BIT(data->hwirq), port->base + PORT_INTMSKCLR);
+	guard(raw_spinlock_irqsave)(&port->lock);
+	rmw_clear(BIT(data->hwirq), port->base + PORT_INTMSK);
 }
 
 static bool hwirq_is_intx(unsigned int hwirq)
@@ -387,7 +390,7 @@ static int apple_pcie_port_setup_irq(struct apple_pcie_port *port)
 		return -ENOMEM;
 
 	/* Disable all interrupts */
-	writel_relaxed(~0, port->base + PORT_INTMSKSET);
+	writel_relaxed(~0, port->base + PORT_INTMSK);
 	writel_relaxed(~0, port->base + PORT_INTSTAT);
 
 	irq_set_chained_handler_and_data(irq, apple_port_irq_handler, port);
@@ -537,6 +540,8 @@ static int apple_pcie_setup_port(struct apple_pcie *pcie,
 	port->pcie = pcie;
 	port->np = np;
 
+	raw_spin_lock_init(&port->lock);
+
 	port->base = devm_platform_ioremap_resource(platform, port->idx + 2);
 	if (IS_ERR(port->base))
 		return PTR_ERR(port->base);
-- 
2.39.2


