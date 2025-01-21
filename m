Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABCCC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8UNMkmjwCpd6qZ4CJI0+xRiZ0ilYmNbqYa4oKXCUIlI=; b=wWQu5eTQ5MxFeL
	2w/3L+MGKH7n6zDPO32UiOWOgUCU05H7wTWtGZCYbZoA4wZzWsA6i40z/3uffOgcZ1h4MWSnzfDVp
	7H4a80W9IKUFbzKh/Q+o9krYM7D+keXKayPGmOgadZu1e/UT2OwEbbA3hWzLbM9gO+H0TfFHXbmGp
	WpWAzfsRa3OCEpsCk36iYT4wZNMRmZW7Fb7tphAWcBj57QOAV+zBhWaOxVve55SllI2zk5vyODjHa
	M31b1H/lgLMQTDlRNwRMbhPm5LL5CSAJ9eVJ1kGNJN6MQBzq9+srTENFy82OQlIrg6SyPU89128Di
	UmCsib3K1F7h+llmNRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAf2-00000007QbM-2MC5;
	Tue, 21 Jan 2025 09:35:04 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAdj-00000007QKp-3LTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:33:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7A9B1C0006;
	Tue, 21 Jan 2025 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737452019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8UNMkmjwCpd6qZ4CJI0+xRiZ0ilYmNbqYa4oKXCUIlI=;
	b=FA7E1pczT9u6XmIxUxNYNpIQ1RkhJ5DeINCqUVr6iwwEE6+K3ia5q6igxakhazBM6+uzWC
	2QtbQroIULXiY1n23A6R8O0w48t/18rCIOyQYirMddc7w9c2xQ5naicrQNzG5wyiWk6/+B
	ac0ptiCxFJY+/S+qJ5o8CZ+TxYg3y3brCiuSOX9dz0PSf3a+xPDxP1KkK/oxJ/cD7mwEVa
	cr6vn4UhU9Gw0e2NE7+kbNVOceLG4rm4/sb13omueWPcrdjV0i9hL4oV6anqpNPfajdcGO
	AGL5c0vK2MFbpAXddgyUOlHV1bEwEmik0jwKPapAeSuY5S8T4FID72slmUHMLA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/3] Add Variscite i.MX6UL SoM and Concerto board support
Date: Tue, 21 Jan 2025 10:33:26 +0100
Message-Id: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZpj2cC/x3MwQqDMAyA4VeRnA20gcnmq4iHtkYXmK0kKgPx3
 Vd2/A7/f4GxChv0zQXKp5iUXOHbBtI75IVRpmogRw/nyeEZ1MraHR9MJSfWveC0Gwb3jEyhI/+
 KUONNeZbvfzyM9/0DWaBevWgAAAA=
X-Change-ID: 20250120-varsom6ul-concerto-dts-a08be2a6219b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Yrr6+sL4PDvZqpAhOqmq92ZkNW+ncfmsb3ojTV7Ynno=;
 b=kA0DAAgB0YBBQCmjqDYByyZiAGePafLI5kXIzUixcZ2/mO6PcFxRFi49bBVzfhtUNeiu9ofvT
 okCMwQAAQgAHRYhBIZIclGI3UAbuaDT/9GAQUApo6g2BQJnj2nyAAoJENGAQUApo6g2T/oP/2/s
 hRdTgAD8oO423tEY9PNlCv1U2cQAECgmXWNaqhM3kImMwot0Ng0rQgepqCR9sE4ZQ90uB/+yDq3
 PtpiLkJm8SxSPx2jT2/MezEgQNuHCjZiXBaYklKxKU4oAAb3NqDLhrGQzOstkPPCPhod7yY+CkN
 QupzZeI9ezCCX061W5N75uoyjP44+StBE/WshJDxOboe9S1tSN4rQWDAuLDib7oSFbxssvTNxxt
 sf2cB842TPd5j4mdP+Q9/9sxbAzUX1kG6N6Q819Z7GcpAoJupu4dntvG33aGkBIjk79gP2qTc2p
 x2Tn3IseLfAXzp/og3gYDdRWE9VEvV7db1G7o24DII9/PlEM3j3zNmtw6zSrImlCCo8DbEc7jER
 Y/GKzeouluZ8RVP/rOEQa22lKttzJsBc8aMbSSIw3qYX0ft4NxQagK1OzvinZMPi7TRniHd2Qlp
 ClfLXiXKvsZQzc3xX13aMlx2qn9CigCpDcUsjpuD81IN1es6Hk2r6EtQZVmQcTFXvBbcKbzKRl+
 x1LrBS8O7Yr5+L2A+BZr/foswK0QiS/1/+Qj7Uq7byOqsxog4Xcnn9RQNBVnXv91yH8tiKvByYX
 u02BofUAbLRsbV5B0U1pIL7VxDtcxKfmD+PLCHF04jZvt+U7N9SxG1vP3FEgXEfnzeeKd46X89w
 PF1gJ
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_013344_136149_5BCCC177 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

This patch series adds support for the i.MX6UL Variscite SoM
(VAR-SOM-6UL) and the Variscite Concerto Carrier Board.

I tested this with a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A (one variant
of this SoM), meaning I couldn't test all of the possible options of the
SoM - so this device tree includes partial support for it.

These are based on the 5.15 Variscite kernel fork but adapted for
mainline.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (3):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
      ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
      ARM: dts: imx6ul: Add Variscite Concerto board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 331 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 232 +++++++++++++++
 4 files changed, 570 insertions(+)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250120-varsom6ul-concerto-dts-a08be2a6219b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


