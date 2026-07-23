Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B68C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 08:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyM8MlyD+NPze9KzqJFx0sc15raowUeSYwkhCExYjsw=; b=g9w0FAyHSWTLVUdE8JX0q8BI69
	TJxMBbIi0I1KfutmT7NkgxkxMkijKo5jwIRq+nJfvsKXGnAgQDqOxSnb2Zo0peGk7SVCd61NKsUpV
	fPo9tJ7isjd/a+csh9ZXfc4rm+8wweuyJ/4HqgEvkre1tw5KWLMqg9l7OUA3kyu120iz9zEdg9iv3
	ocvX9U6qn+YGcEKkrN5T3JZPqZuiYxRhlaBmuFgroFuzV32kfWXnR48WIty8K7muvVSrcfCC7i0y3
	rIph6+EpRUQIW1pscxZZMns9Ie9AgUc+RJuyvpkazDDT+VBrtG+jBR+URqvEl2zI0JvdSbVegw2Tb
	p0YAaczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrq-0000000De0k-0WVj;
	Thu, 23 Jul 2026 07:29:18 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnrd-0000000Ddsj-3kPw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 07:29:08 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1784791740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WyM8MlyD+NPze9KzqJFx0sc15raowUeSYwkhCExYjsw=;
	b=D21llxJwhytH302JkyH+8bz/6BmPAzDf7rzow8TTmgllpFV2nifwuOzifAZCjX67FqBTF0
	S0xSl3hiSXO6MQXjK562Br2yUXxuYYy1oVcF75yv72JaODd6sxDRyjFO5RoQ73iIn2QzCI
	Sg4KF7D6rikzjDExHOwUvaYdcZW2/3wKPyrL9ViLCNMyKuCxDfU6rCCWcxgcthWPjR81Ns
	WcvwIxuRHFsLu3/NAGv33vAl1N9JFIwwM0iaGi4uFc7ti3JEF2GwGyxZnJf63PzOiLJMBo
	ua/3GqXzuoq5ueE9N6fo44b2uKQSSf0dR1Z8flDPgNUXfjqlgc5O0BbCXncc1Q==
Date: Thu, 23 Jul 2026 09:27:32 +0200
Subject: [PATCH v3 10/11] arm64: dts: Add common include for i.MX93 ELE
 firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-10-e26930345b4c@kontron.de>
References: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
In-Reply-To: <20260723-upstreaming-next-20260609-imx-ocotp-ele-v3-0-e26930345b4c@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=M0hVY+f81C54spjSt4uzwzn1ZOcQMZubpkUYUZsOXPE=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvx0Da1vnhxTx732637Hs1/7Oy98/KjWYu1F/T5502Ke
 632puhyRykLgxgXg6yYIosUv8VrW7NYH/lj1VEwc1iZQIYwcHEKwETaTjMyXJ8XukfVc7Nhy2ev
 qo9eLkcD3u/8xp4ue/rSgni+S7tUoxgZmncbZc9b1CEh+eT3gQXz7zOuk/1XsU18n+AJraIEfXV
 VZgA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_002906_181117_4F213BEE 
X-CRM114-Status: GOOD (  12.52  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

To make it easier for boards to configure the EdgeLock Secure Enclave
on i.MX93, add a common include file that contains sane defaults. It
specifies the memory node, enables the ELE firmware node and adds a
reference to NVMEM OCOTP driver.

The 1MB memory area required for the firmware is placed in the first
256MB of the DDR. Boards that require a more specific alignment can
override this accordingly.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx93-firmware.dtsi | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
new file mode 100644
index 000000000000..58614158ef90
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-firmware.dtsi
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2026 Kontron Electronics GmbH
+ */
+
+/{
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_memory: ele-memory {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x10000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	status = "okay";
+	memory-region = <&ele_memory>;
+};
+
+&ocotp {
+	secure-enclave = <&hsm0>;
+};

-- 
2.55.0


