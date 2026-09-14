Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7E0C88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gouepB2S1UKhjoN3f6FNb8XqGI2dj4sD+QoeWJWGFUw=; b=l37w4v8Z/glC1p6BV/utPGwU28
	VrDcFYHtaxuyZ6mLD7qFq2lIO+r4QpXyyZfd5qbltfDTBO8cH0vDNyH5/Xqut9F7oi6bYex3NP7Zj
	+o3vR1Zm+bPfbcltcYaTX+aWU1nIi8Gp8deyhDImBptptSxffMV9Va7EZnDPqpgJ3oSlxGA0KNtgF
	ZGU9t0BhSX/3HWIW7ziWeKyS5UKl2pTHiP28UUe7TBK1H0QVOszJIZIEWcj8zBkePrk+r0fyk0wej
	urpby0m437o6VBUpAdB899DFkeQxp2Ly0ZwFfU9+VcPSypMNKN4vaDMoEYMHh3P42l3Dy2h9420Ba
	3qUM0Egw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695X-00000004Ezz-1f5R;
	Mon, 14 Sep 2026 15:59:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695U-00000004Exh-30gN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:59:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0964D1CC4;
	Mon, 14 Sep 2026 08:59:14 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AEAAD3F882;
	Mon, 14 Sep 2026 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401557; bh=h2aAZZsYUgxinX2Xk8rSiefl4BFGCyLAec+iN/0udkQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OP0z2aBPV6Fo0AMlIEctr20+Lmgjx5E89iORauFkkKUnbgPCBg1qJm80ov+A1RF33
	 baRqQhiBr+RLGJid052pp+yn3KAAAKgaQlcZSUcyo382aimRPl9wHPgAIX57eVLKQ1
	 Fcz7um37e/LfSsfh7mMMwf8n1oq5aSkR9j+sPPbc=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: fvp: Add additional PCIe memory region
Date: Mon, 14 Sep 2026 17:58:53 +0200
Message-ID: <20260914155854.123341-4-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_085920_798652_8C6966F4 
X-CRM114-Status: GOOD (  10.50  )
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

Add an additional PCIe memory region to fvp revc.
Similarly to what is done in the edk2-platforms
repository in ACPI, only advertise 4GB instead
of the 256GB possible.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index c84796438a83..d184a073c3a2 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -373,7 +373,8 @@ pci: pci@40000000 {
 		device_type = "pci";
 		bus-range = <0x0 0xff>;
 		reg = <0x0 0x40000000 0x0 0x10000000>;
-		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000>;
+		ranges = <0x2000000 0x0 0x50000000 0x0 0x50000000 0x0 0x10000000
+				0x3000000 0x40 0x00000000 0x40 0x00000000 0x1 0x00000000>;
 		interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 0 2 &gic 0 0 GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
 				<0 0 0 3 &gic 0 0 GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0


