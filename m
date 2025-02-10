Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590E8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5S5//aZhfmSjDDmMcuWe14/vJFESxxanw/t/AbW1rU=; b=RSOJuow273f9VE33IiUyhNgFHa
	pTNuM+qt8GdJsxqgpGnFTemjsO6UopVDdnwd7V7CK46kuIxJCUFPfRb4zSOrS9OqqxWXNBdbjY1hr
	JkgBr/on1eiRvo7+QYOi4C4caTV7IXUQ4I6jmJAqBdU7YPEDfK8HQzy5oadNE4B9ynQIMXxDHFv84
	qEnl1QI6tXr299RiD3Pcw+BzbFiKUlMBeQtKV1DkzkUcZVIPrawEev1tFWqURAuxoExrFO8TtWf+S
	aCxqlr8ZEjp2hJSe9Vb7AqcaXZDi1FKTZgoy1cj526Q1ROuEt5jJu6WcLtT9sVAwkT72Bszpp+zVy
	vYwEbzoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcFF-00000001eT7-2YZS;
	Mon, 10 Feb 2025 22:27:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc4A-00000001cSx-3EDJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D5S5//aZhfmSjDDmMcuWe14/vJFESxxanw/t/AbW1rU=; b=mR9mWe0NIWOFzs4A3ns30gOklQ
	Sf0GULccpBb/B832qCb3edgY8D+oK+H3sKyhcz32GO2IA+lwb57DBTAi3F9qarLr6boHCyjmRz6Mn
	SUzhPFALPna1d+LYbZnlj0Jcpvl3phGTcw3zsQG+y4WKoH6SD8OVgsNWjUO5bkEomxboFPIYUpIrw
	2msHSax0j3ZjUgJ3HfqkPMCOUiyhYRQ616PVHv5tJoNCODHdSVlBeuDec5LoqNzccCgRZGeYALbBx
	xBXf2QC03QcUqucnqjH8OEXVizoHyPnT12DBNeYj3A9CsHt9KVthDt79DMzp1Hggp6KHbEANxtQaW
	rAAtxmAg==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc45-00000000JUL-3b0L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:15:44 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVdL121117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:15:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=D5S5//aZhfmSjDDmMcuWe14/vJFESxxanw/t/AbW1rU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=efs5kKzt52QOnKV3daqB/l9E4wTgIzg9hnwuL8PhSw/lHNCFca0Dc0J1Q487NDdbP
	 JNuQs5JTBXReL21bWTK4p6y8Gyg7fI9T5AnpgFvOJJY1mdQrLLSIQ7hsJLKuC9S8hL
	 DNoxPO5D4jYDGISNWud2jjWGtrSK6IwEV2W9ME2k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVqk002427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:15:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:31 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZA112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 08/10] arm64: dts: ti: k3-am62a7-sk: Reserve main_timer2 for C7x DSP
Date: Mon, 10 Feb 2025 16:15:28 -0600
Message-ID: <20250210221530.1234009-9-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_221542_368920_2E545CDA 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Hari Nagalla <hnagalla@ti.com>

C7x DSP uses main_timer2, so mark it as reserved in linux DT.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- No change
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index ac67c51caa211..11390a8742453 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -679,6 +679,11 @@ &main_uart1 {
 	status = "reserved";
 };
 
+/* main_timer2 is used by C7x DSP */
+&main_timer2 {
+	status = "reserved";
+};
+
 &usbss0 {
 	status = "okay";
 	ti,vbus-divider;
-- 
2.48.0


