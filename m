Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5801C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jnHT8pxDxVP+7w5heuoy29BHYqRqmLa4rbZcp55hLz8=; b=JbCqIy+ntqm9uapPen3F9V1nxi
	A7a/bzOUTghLNLfnlkD5WsP714WN0zGm7WAqu69N9eFwnulJB/2zjawR3BgNMCSt6bJu6bnfY95Wk
	fxgGToedcqxUj1MOhOV4vNre0IbJ+OxEB8d0P3jGwpE8rzntKpS6sJw6OQOH7GbiUE55YLxxaYpJp
	CRetDiWMWRbDlu8DjxcCuARSN2o9mj+z12rllWIgg+djD1EvNGgKZX4exV2aX+mTRK0goQ9YwafXM
	KZxdAmQ/3P8+I0p51RJSVeL76Ua2UKNLda/MA3MCJcAux5FZX6ATEL6vLxS/28Ux/gU5zpXRk4X43
	vu1ZyJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExrb-0000000Ddtu-3QVk;
	Tue, 13 May 2025 22:12:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExfH-0000000DcQf-3ZAv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 21:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jnHT8pxDxVP+7w5heuoy29BHYqRqmLa4rbZcp55hLz8=; b=U2t4pTq8+pxJyQcLSz26GoF7I2
	3/eLaMyGT/m7S25v8YnTCh2tMkHCcBUT69MwEIEu0cX/bg9sO/QYIAqzH9/c/wbeB3GGljCyITcmd
	huXgAOgGc8R1j+RTERSTiVcYVUqgj+duyW6oxwTLnA9VulnHOnxHJz4xJOOICYSQ3qTwDaJlmhQ0R
	E6X+MXX/+ECA547i2wnrBxVoD5u6qHGlBPM53KEOh9aQtmifK26JJ45UPrmnwySSZbyxoDPnnzyBE
	U/7G9s93bdTIB3qJbY7ewdeAdNexVG4xZnlU11LCEaAnLCuOPetA/+8ZCwCNMEvk7lwZhtxo1hL9g
	Pmx44NHg==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uExfD-0000000H2lZ-3A5i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:54 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54DLxZs22431440
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 16:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173575;
	bh=jnHT8pxDxVP+7w5heuoy29BHYqRqmLa4rbZcp55hLz8=;
	h=From:To:CC:Subject:Date;
	b=ERIPej2xrbzviCKtULWnltF915ieOQyQ737wTjYJ3yrGmUpTP4MagUxPdM8O0F1Pt
	 EbklfBSl+HoN5NdjbmKOLjpTXimwonpHNs1xOKiqdUj5SdD12gZFIeRATv9Jfavpnm
	 2HmrTZKeOXO4CeBS5q2InDFhaOwDku6AnqMAYj5Y=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54DLxZQb033002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:34 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:34 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdB111031;
	Tue, 13 May 2025 16:59:34 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/7] Introduce PRU UART driver
Date: Tue, 13 May 2025 16:59:27 -0500
Message-ID: <20250513215934.933807-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_225952_828878_EC358F6A 
X-CRM114-Status: GOOD (  16.15  )
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

The PRU_ICSSG subsystems in am64x SoC, the PRU subsystem in am62 SoC, and
PRU_ICSS subsystem in am335x SoC include a UART sub-module. This patch
series introduces the driver and the corresponding binding documentation
for this UART sub-module.

The DTS patches for adding PRU UART nodes and enabling PRU UART is added
in this v1 version, but marked as DONOTMERGE since the patches only add
context to this series.

This driver version has been tested on the following boards: am64x SK and
am62x SK.

The RFC version of this driver has been previously tested on am335x SK as
well. DTS patches for enabling PRU UART for am335x SK will be sent as a
separate series once this series is merged.

Changes since RFC:
- Add DTS patches 3-6
- Fix include list
- Switch to platform_get_resource & uart_read_port_properties
- Remove custom speed hack in pruss8250_get_divisor
- Use port->serial_out functions provided by core driver instead of
  local writel() functions
- Switch to UPIO_MEM32 since largest UART register is 18 bits in length
- Cleanup whitspace, comments, variable/structure names, error paths
  and GPL licensing

Link to RFC:
https://lore.kernel.org/all/20250501003113.1609342-1-jm@ti.com/

Bin Liu (2):
  dt-bindings: serial: add binding documentation for TI PRUSS UART
  serial: 8250: Add PRUSS UART driver

Judith Mendez (5):
  dt-bindings: soc: ti: pruss: Add documentation for PRU UART support
  DONOTMERGE: arm64: dts: ti: k3-am64-main: Add PRU UART nodes
  DONOTMERGE: arm64: dts: ti: k3-am642-sk: Enable PRU UART
  DONOTMERGE: arm64: dts: ti: k3-am62-main: Add PRU UART node
  DONOTMERGE: arm64: dts: ti: k3-am62x-sk: Enable PRU UART

 .../bindings/serial/ti,pruss-uart.yaml        |  54 ++++++
 .../devicetree/bindings/soc/ti/ti,pruss.yaml  |   7 +
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi      |   9 +
 .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi |  14 ++
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi      |  18 ++
 arch/arm64/boot/dts/ti/k3-am642-sk.dts        |  16 ++
 drivers/tty/serial/8250/8250_pruss.c          | 178 ++++++++++++++++++
 drivers/tty/serial/8250/Kconfig               |  11 ++
 drivers/tty/serial/8250/Makefile              |   1 +
 9 files changed, 308 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/ti,pruss-uart.yaml
 create mode 100644 drivers/tty/serial/8250/8250_pruss.c


base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
-- 
2.49.0


