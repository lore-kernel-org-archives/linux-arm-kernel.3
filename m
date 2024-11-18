Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D40DD10F37
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 05:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Gv4FihppQNNBVUuce2/24rNSfyawZefVO6AC+eDXS4=; b=gKh/ZNrvZX2Sd2
	j3YD0qSODLpdbGPyhPz++waGRLdZ5VJ/n6jZwvhtuO5UEplqDJx/PDytCQMmH8a8Rw0byrJwTbNJ8
	rWGlWegJ8FvkuZhnSuqpzpn8Bzx2X0LR4z4s9dSPZSXC0WeOsJwAkH4AApeKSkhX7+EJ03WsootRU
	/VUJyvWhhxz2N0JYKcfsYOCsDRdztHj/pygxbVWAueW0O8q6/nNZRtOLxj27XqW6WIUO0EGvPC3s/
	tu5JpC+jek6QjYVBjPHHNvAWpHfJ7uwF2xaBQyQf1hQqudWN/iTcVFsyLw9chIBzAxvEOa1Qekp5a
	b7wU1E2+ZvkMUIyR65aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuQd-00000008PrB-1IVT;
	Mon, 18 Nov 2024 05:36:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCuOp-00000008PcV-3rJI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 05:34:13 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y8rJ031967;
	Sun, 17 Nov 2024 23:34:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731908048;
	bh=/Gv4FihppQNNBVUuce2/24rNSfyawZefVO6AC+eDXS4=;
	h=From:Subject:Date:To:CC;
	b=vFUrg9h7fd2I8T6pTXkZlFzOt0/LL36KWY9LmfQ3mDgEjN905vF2OS5Q+CHq+mF/a
	 KXUAqGTQ8EIKBdrVfOpYcAWgduHzbPFZAsI0uxZGb+h8r489bKmTctoqxbl3pOTbpf
	 jJqyTka07okCZJzxL66UWX+7XVrahNmbvaqLT91U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y8HI013775;
	Sun, 17 Nov 2024 23:34:08 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 17
 Nov 2024 23:34:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 17 Nov 2024 23:34:08 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AI5Y7jS041445;
	Sun, 17 Nov 2024 23:34:08 -0600
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH 0/2] arm64: dts: ti: introduce basic support for the AM62L
Date: Sun, 17 Nov 2024 23:34:06 -0600
Message-ID: <20241117-am62lx-v1-0-4e71e42d781d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM7ROmcC/z3MQQrCMBCF4auUWRuZGTRSV95DukjTqR2wrSQlV
 Erubqzg8n88vg2iBJUI12qDIEmjzlMJOlTgBzc9xGhXGhj5RMhn40bLz9Ug1763zgsiQTm/gvS
 67tC9KT1oXObw3t1E3/VHEP6JRAZN29Xs0LaCF3tb9OjnEZqc8wdMsL1KmQAAAA==
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_213412_067234_9A0CCEF8 
X-CRM114-Status: UNSURE (   8.39  )
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

Hello Everyone,

This small series adds the initial support (currently just a UART for 
TI's AM62L SoC family.

The AM62L is a lite, low power and performance optimized family of 
application processors that are built for Linux application development. 
AM62L is well suited for a wide range of general-purpose applications 
with scalable ARM Cortex-A53 core performance and embedded features such 
as: Multimedia DSI/DPI support, integrated ADC on chip, advanced lower 
power management modes, and extensive security options for IP protection 
with the built-in security features.

Additionally, the AM62Lx devices includes an extensive set of 
peripherals that make it a well-suited for a broad range of industrial 
applications while offering intelligent features and optimized power 
architecture as well. In addition, the extensive set of peripherals 
included in AM62Lx enables system-level connectivity, such as: USB, 
MMC/SD, OSPI, CAN-FD and an ADC.
 
AM62L is a general purpose processor, however some of the applications 
well suited for it include: Human Machine Interfaces (HMI), Medical 
patient monitoring , Building automation, Smart secure gateways, Smart 
Thermostats, EV charging stations, Smart Metering, Solar energy and 
more.
 
Some highlights of AM62L SoC are:
 - Single to Dual 64-bit Arm® Cortex®-A53 microprocessor subsystem up to 
   1.25GHz Integrated Giga-bit Ethernet switch supporting up to a total 
   of two external
 - 16-bit DDR Subsystem that supports LPDDR4, DDR4 memory types.
 - Display support: 1x display support over MIPI DSI (4 lanes DPHY) or 
   DPI (24-bit RGB LVCMOS)
 - Multiple low power modes support, ex: Deep sleep and Standby
 - Support for secure boot, Trusted Execution Environment (TEE) & 
   Cryptographic Acceleration

For more information check out our Technical Reference Manual (TRM) 
which is loacted here:

	https://www.ti.com/lit/ug/sprujb4/sprujb4.pdf   

Happy Hacking
~Bryan

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |  6 ++
 arch/arm64/boot/dts/ti/Makefile                  |  3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 52 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 33 +++++++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 89 ++++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 54 ++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            | 67 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |  2 +
 8 files changed, 306 insertions(+)
---
base-commit: 767b6a0d0900c951e8b42306bd636268481a97ae
change-id: 20241025-am62lx-029cf6ace001

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


