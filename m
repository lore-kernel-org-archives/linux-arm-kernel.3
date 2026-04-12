Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2B4E937F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 17:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjj+Tsb0xXnnHPadf6GmIj5i83tpRS2f8ILsVHb2fJc=; b=DOJ42PXqKBosSI6x7VJ48INlLe
	MsOm7f9EFK5FQ7FzUEzf22f1+KXXIukzPN9ECsSyebyC85SVTWH2ZCVw6wZk03gT+/gknmQ2e8xnp
	+lBaBN3gkBI7ThhE/ns0JriHR7ehHo7Ifunx4p93gxc8eJCZSdBwkw0XUi8pWn9QWgjoeBmOg5ya3
	ZnX2mciGjVkfnmROdq7bOQhk75AiQpTDccmoZC9q2QcSw7IMcnU61+e0xPIG7/iQhUKjCXqRBnrek
	HR6injydOyvF8CXJwX2bgKckFVhsjj1N1Rf9MKFi7kB3+FzA/EcSantjINjOea+9iabRdxhfFap0u
	3VZyaEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFk-0000000EVio-3aJM;
	Sun, 12 Apr 2026 17:05:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wByFi-0000000EVhY-0swd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 17:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C5996132D
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 17:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2182C19425;
	Sun, 12 Apr 2026 17:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776013541;
	bh=DtIrfIMocwcapZAI/AWz4r5V3avBcvVN6k54z3J7SWU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=o+kDmRpY28se8m1ww+4QJs9bc25MHtaT/esELG36kxTTlbpU2gWqVYuZHqzDaL9YJ
	 AZA4pk0SdA+8pL4SLH1hRyg3E/cSCRM01QJxgdivP6YePbeUD3vRCypVh9ETUVmoc2
	 IyvV6+2LTN5tWAJaR2pE/Bh0xg+cz84Y+AU8eYhrfEc7pVe3bzjBZdem48WtjPsO2S
	 T7AzUIZvgxCtekAn7b7soIlSZIOmTpd3xcpAJvBaMyc3VSlIhhdSU/gwGaqM9VT0gr
	 HdPVJxyaJd70ysnzmaghK9pHjzH2UKMhoy9pIjMue7unQYr/8DI2gBJM050LPfmixx
	 l+AEW5TGFcVLQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sun, 12 Apr 2026 18:04:41 +0100
Subject: [PATCH 5/5] arm64: dts: arm: fvp-base-revc: Add FF-A notification
 interrupt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-b4-ffa_ns_sgi_gicv3-v1-5-af61243eb405@kernel.org>
References: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
In-Reply-To: <20260412-b4-ffa_ns_sgi_gicv3-v1-0-af61243eb405@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.0
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

Add an arm,ffa firmware node describing the FF-A notification
interrupt on SGI 8.

Also mark SGI 8 as donated to the non-secure world in the GICv3
node so the interrupt specifier is accepted by the donated-SGI DT
support.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 68a69f17e93d..87189b32e38d 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -40,6 +40,11 @@ psci {
 		method = "smc";
 	};
 
+	ffa {
+		compatible = "arm,ffa";
+		interrupts = <GIC_SGI 8 IRQ_TYPE_EDGE_RISING>;
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -224,6 +229,7 @@ gic: interrupt-controller@2f000000 {
 		#interrupt-cells = <3>;
 		#address-cells = <2>;
 		#size-cells = <2>;
+		arm,secure-donated-ns-sgi-ranges = <8 1>;
 		ranges;
 		interrupt-controller;
 		reg = <0x0 0x2f000000 0 0x10000>,	// GICD

-- 
2.43.0


