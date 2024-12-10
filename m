Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47DDE77182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/c4szv2hbJGkO3LPAuOYMXLi58zyh4ZiQjA5EfGs3Q=; b=GF+oiZgJcwyN1srg5QBncrriyM
	RlkaGr/2GmcBDqOUP/Dm1p99yPQwJZqzhiWKG7kwec9LfzFHe48tGQmRLQVpRN6J55NlKJj6I+OfP
	vMkDf+0bmlMSkSsqsbKu/SaTjzpnySIlJMV4o+vqOSMZOhHhjiKX6+q3Z2S5NVnmTMyvN0RJKnScd
	APi1nxyw12bSER11UVyo2PlxByjdu6R4rvOmzeKs2VqlWZc8ksMQrOMW6UEZuoquSqt/+MWqEOtJB
	MBpAzTnCb4LYW1dnskVwyf45XHnypq/RmRmBit3eREatw26FACD9vrx6OHpNbZDzeAIUaiR7OWhrA
	vmRnkQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7Pv-0000000ClIA-0MRs;
	Tue, 10 Dec 2024 21:05:15 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7KZ-0000000Ck8R-3HmC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 20:59:46 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BAKxWpO093332;
	Tue, 10 Dec 2024 14:59:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733864372;
	bh=3/c4szv2hbJGkO3LPAuOYMXLi58zyh4ZiQjA5EfGs3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=RlqrFQxIKO6yRheKH84SmHqlxDEzXbBuKhh4pOj9bp5V/yLEt0m8QPFe/4YXL2pCn
	 f7F9TJbvdAtQSRU+xRtfnSl/yZDSxv1CT3RvliDpfvJXT9YJXsnXRNki8/TrtYRDoB
	 EcNy429PCKNyNT1BBUHay1KTBzTaDuFkf1/o5VwQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAKxWIU043829;
	Tue, 10 Dec 2024 14:59:32 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Dec 2024 14:59:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Dec 2024 14:59:31 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BAKxVq9042179;
	Tue, 10 Dec 2024 14:59:31 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Tue, 10 Dec 2024 14:59:25 -0600
Subject: [PATCH 2/2] arm64: dts: ti: k3-am62a: remove duplicate GICR reg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241210-am62-gic-fixup-v1-2-758b4d5b4a0a@ti.com>
References: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
In-Reply-To: <20241210-am62-gic-fixup-v1-0-758b4d5b4a0a@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Bin Liu <b-liu@ti.com>,
        Bryan Brattlof
	<bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=bb@ti.com;
 h=from:subject:message-id; bh=b36A/MI7Uhq9p9qgB4xCpkTfp69Q7QXfrz3GkeZCAeQ=;
 b=owNCWmg5MUFZJlNZBhFKfAAAan////d/n/8239uN7f3/d7YfeZ2+e7fx7N7l/9tPtpbY1++wA
 RsYGKDQDQAaADQAADTQaBtQ0aAAAAAA0AAAA9RoDQyNqA9T1BoPRqPU/TVEAANNPUANAAANNMRo
 Gj0hoAHqAAGg9T1NDTTQBpoA9TymEGgDR6gNBp6QeSNAhoYjTEyNDRiGmgaA0GjENAMgADQBkNN
 DIGCDRgTTQ0MmgyMTQGgaGjRphACBXBbsKDPmwQgMJ1REyS4QZiaCFSG3sS7X27o0bIQkOA1Inz
 ayxv59QQB5GTxhSdCPl/wyYq40F8Gk5UXyeIagtWP1s5w5IcswBRJLwwVfgu54ivDCEgPubLVPa
 2M7MrdnbcBhkakIGJOUOPvG/3aAUjjEyDK0A4BTcWZ6lVUO2cV8jXXuAyga07zXZw4WZFZ54r40
 WFqLGJ99voTLRioUVQsJkqTD9l6PGEIbwufwlGK6ZxWnNT9UuG9qbAodFAJgEFq9XnQKCC39IQq
 bcnY3aXuk1piy0xkqidPfHgIcKhwK05eJf5/YZ+2Xm06DV7MB0y4qfLbxntST9LGR8xZQgrEr7M
 RsnuLBhz0CL66kynLlhWG4uclIRgCjfwIbrZ2haan/EQbqLX5oQ3isF2alVIBeUw5DskgSSpoR8
 g4LmT/i7kinChIAwilPgA==
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_125943_913251_52F117B9 
X-CRM114-Status: UNSURE (   8.71  )
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

The GIC Redistributor control range is mapped twice. Remove the extra
entry from the reg range.

Reported-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
index a93e2cd7b8c74..a1daba7b1fad5 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
@@ -18,7 +18,6 @@ gic500: interrupt-controller@1800000 {
 		compatible = "arm,gic-v3";
 		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
 		      <0x00 0x01880000 0x00 0xc0000>,	/* GICR */
-		      <0x00 0x01880000 0x00 0xc0000>,   /* GICR */
 		      <0x01 0x00000000 0x00 0x2000>,    /* GICC */
 		      <0x01 0x00010000 0x00 0x1000>,    /* GICH */
 		      <0x01 0x00020000 0x00 0x2000>;    /* GICV */

-- 
2.47.1


