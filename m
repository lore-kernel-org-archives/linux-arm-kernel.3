Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D48C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 16:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbRVJgB2du8ydGrHNeqxiskz3OR4/cSTNp5c0THLTGc=; b=pE6GEgxo0BLFL3
	lwkupe/nfDRq5I9eg9Bi4l75dzV79GFO3LGGh5CasWO4zztm8SDwQHkEmZhx1QRKR7kitTY+9Babr
	LeJBEK9wsMraeGureSDFb0+5/ZXMt737+e7Zuvpxljs6zVeBdjDIg1hBZCUKCTMKHQ0QrRDx2Ma+Z
	fD4rBFb6FIwAZXkEOl7c6VUX145ffOo/7un0l5neni8JtlC20+USxuRwiZih2wuyxk8qAOR57G2PW
	Y6dJuPdJKEjqo/kso4PhIuDhJqEBMSDSC9djjx91TURprzozTW0MlpZhCe87xPu0KyWml0SytBMT+
	N8AETuCAF53lcbkN148A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pmt-00000001INm-3jhF;
	Mon, 07 Apr 2025 16:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oUx-00000000ydV-2qik
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 15:34:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RbRVJgB2du8ydGrHNeqxiskz3OR4/cSTNp5c0THLTGc=; b=ZWULl4jnJ7q+8EylF8+wPHx+40
	EWDtB9AWwv4iqYjb3tb4l/MNbxQekX4kZUhQaXPwBLQKJtA/LC2rYvdne8WA5v7cH0kn3z3uV8cqh
	q9QqnZsgbng3skNeClEY830UacN6y3cy2N6Jrq60JD9SLY4VGRBIDhyqPFhf9gwvYWgavE1RKn2IL
	OXzeT1/JbW34iYi0hoxhVEtWPQ3tjjZtFVArZik+yWg7MabIBN4JDMDNlv/1KZB2T+d8xiWdyG/eI
	PYo+fm2ngerWu3nqTu9LcFYbD5bbuBDarwKcOevOWqT1g4+Y7r2VY5LGaNh2Y8fvoZttlu8EbSL6H
	2ZRaEvjw==;
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oUt-000000081aA-3L84
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 15:34:54 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 537FYfgc408834
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Apr 2025 10:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744040081;
	bh=RbRVJgB2du8ydGrHNeqxiskz3OR4/cSTNp5c0THLTGc=;
	h=From:Subject:Date:To:CC;
	b=ad4OZuzTQbR7oa5jv2Mr4p5+GNh4KULRcSEoMX/KpfPmvWmCw1PjziQ1tDIAXGb/j
	 ivM6Ul/+XcXMHmuB7jzyNiqkDWL+jagIUOFVOkjt4LqIIezAsL6yLF9aiaa8iXqwr0
	 ft22Pq42U0YROUTLU7ZG+aGsqk1K2LkIcYApsRxw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 537FYfM3024411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Apr 2025 10:34:41 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 7
 Apr 2025 10:34:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 7 Apr 2025 10:34:40 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 537FYeOf090531;
	Mon, 7 Apr 2025 10:34:40 -0500
From: Bryan Brattlof <bb@ti.com>
Subject: [PATCH v4 0/3] arm64: dts: ti: introduce basic support for the
 AM62L
Date: Mon, 7 Apr 2025 10:34:37 -0500
Message-ID: <20250407-am62lx-v4-0-ce97749b9eae@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAI3w82cC/02MwQqDMBAFf0Vybkqymibpqf9Regi6qQtVSyLBI
 v57E6HS4zzezMoiBsLIrtXKAiaKNI0ZmlPF2t6NT+TUZWYgoJEAgrvhAq+Ft8421qDvjEaWz++
 AnpY9dH9k7inOU/js3QRlLQklpDC/RAIuuDISjHK17oy/zXRup4EVP9X/jj2cOjvopZaojVWgD
 2fbti/CBEoczQAAAA==
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817; i=bb@ti.com;
 h=from:subject:message-id; bh=yz2gwwXZp8QwPMQsFpWcLfMGnpdMV1SmNYXV+W0y0PQ=;
 b=owNCWmg5MUFZJlNZjGVlSgAAYf///3990nf6fb/zxnN73/u6/+lz6o97P3/38W+Z+/vP/t+wA
 RsxpDJ6hoANAADQANABoAGgA0AAGRkADQAB6g9QaDTQyNNGmmQ008oyep5RptJkQNNNDRkaaANA
 AGjTQaMnqeoAaGjJoGjIaDQMjajQaDQDIA000GmnpBk00A0AYRoDFDRoDTQNDQDQA0xA00aGgNG
 gAA0xDTIyYjQMjTIDQDTEAAAAxDQBoxkECMF5CqnoTSIXYWaFdcAQSjhObSlfF7GCwLBz5efqBU
 5DD+Vjg/QlNW3kU8weGbd0VowtrKF2BJVwBxHwxVcGhnbzjLNNpBVdBSWYenxyXNSTfzgWi4VAC
 v7cPSPKpdiUSz2/nGBCJfmJw+ZM/Z5KUr3LUFWCGEjZ3XklGrcxFA4ubWXelkWKpHGuj+oEASCl
 CyIz7Bc/QcOkKS94t1RQAyqflVBjDn0Rc84qwDY5N3v2HWhdJ+GjJpVg1dZhrH1Sx97FJiBApky
 Np/s0srgiEay7MYxLUSthESYYXVlBqELn6eYM59KUuOGZIz126vOFT96aPfL4gCcGrfZWDsCEIT
 W9SckMaKbBJAxGHrvzLFZLiG7+/HsKNlAT4X1uVjSUaBwjlERWF4NQlZsBGYb/7YBqEvdyvAYmF
 4YMqlzpA6zNs0Yi/Z/xdyRThQkIxlZUoA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_163452_260942_FD8C827B 
X-CRM114-Status: GOOD (  12.35  )
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

This small series adds the initial support (currently just a UART) for 
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
which is located here:

	https://www.ti.com/lit/pdf/sprujb4

Happy Hacking
~Bryan

Changes in v1:
 - switched to non-direct links so TRM updates are automatic
 - fixed indentation issues with a few nodes
 - separated bindings into a different patch
 - removed current-speed property from main_uart0{}
 - removed empty reserved-memory{} node
 - removed serial2 from aliases{} node
 - corrected the main_uart0{} pinmux
 - Link: https://lore.kernel.org/all/20241117-am62lx-v1-0-4e71e42d781d@ti.com/

Changes in v2:
- alphabetized phandles
- corrected macro and node names for main_uart0 pinmux
- Link to v2: https://lore.kernel.org/r/20250108-am62lx-v2-0-581285a37d8f@ti.com

Changes in v3:
- added more nodes which have been validated
- added link to data sheet which is now public
- Link to v3: https://lore.kernel.org/r/20250109-am62lx-v3-0-ef171e789527@ti.com

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Bryan Brattlof (1):
      dt-bindings: arm: ti: Add binding for AM62L SoCs

Vignesh Raghavendra (2):
      arm64: dts: ti: k3-am62l: add initial infrastructure
      arm64: dts: ti: k3-am62l: add initial reference board file

 Documentation/devicetree/bindings/arm/ti/k3.yaml |   6 +
 arch/arm64/boot/dts/ti/Makefile                  |   3 +
 arch/arm64/boot/dts/ti/k3-am62l-main.dtsi        | 672 +++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62l-thermal.dtsi     |  19 +
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi      | 144 +++++
 arch/arm64/boot/dts/ti/k3-am62l.dtsi             | 121 ++++
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts         | 294 ++++++++++
 arch/arm64/boot/dts/ti/k3-am62l3.dtsi            |  67 +++
 arch/arm64/boot/dts/ti/k3-pinctrl.h              |   2 +
 9 files changed, 1328 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241220-am62lx-ca9498efd87e

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


