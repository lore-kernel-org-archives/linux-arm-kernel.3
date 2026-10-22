Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 11:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eA6wHI+O;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E2N7awLF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=; b=eA6wHI+O4mmY/p
	PF2WUDWPS23uBKLv8/p8dWhklKVdMCEhF2lkdOjKlS8iBB0lUWx28J4spa++p03cheZUrclrZGgN0
	2c6RAUzloYDHD2uvrpDMRYIPR7QJ0+D7AdOfQBsaCDx9u/5Dhx8pYX2OOjGVYpfV+JSevgF/YXi1A
	UKaFynvwziyLErVyXk7ROuluL6PjYiz2hged+Omz0ge0ZU7dwPI6Q7HSQCtJzQqD1b1ekCpGOOGIy
	4cUdpKWdWpUPA6Vn8putvDHjFkjeszK2DXM9kQPvdqnNuUYNw1ASfRYERMAEgr/1iDZ0SJp9kNTcr
	NF3M6nod0ddZd/a0QqCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqdQ-0000000DzAt-13EI;
	Thu, 22 Oct 2026 11:07:00 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqdG-0000000Dz5v-2sS7;
	Thu, 22 Oct 2026 11:06:52 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D1EAC2022E2;
	Thu, 22 Oct 2026 13:06:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=E2N7awLFcKu4B8otw+enfizF5Ug5lcIvsBcc+E2wXr4vl90Y5ZygYg4caYkZiI+7GR7J4U
	B5sAriPUG8qajzVhG0ElbTcAf2sGnmjzCH9MmND4SIPmNErxL2tqg6l5MEYswsnhCAlQCz
	0uAr1mlRxcPSA01U7V3dNATqZITJCLPdtnMlVnCSJJUpb8X3IIdb9MqLYQbHJF6VrGYp/Z
	aM6wbLYSxDn9SMoldIPN8et2Uzu9b7giki98NULcHoc138rnIO/y+DcvzBE3pXPzVUH/X0
	cFIRxkGdOESmSaBfCzIWbfkjeakwqVkwxHIi3sRT5U/9dDuq0J9fii9qh0xDWA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792667208; a=rsa-sha256;
	cv=none;
	b=ffTXFWXvfWyMT2QdASyOkvTJA1s+SkCaw8N5S4e3R+nkXZYw4pvopvd48wCRg+Zt4OgO75
	eVXW81jsCZQFElGmDFsoLIkRPu5y5b1SREwuBkNlWvW7DPf7qwKa6qfD1iqXCFfMCfU1IJ
	XTOUCvMMO/Vu+9BxBAEmGNkpJYoEiUMfYM7i4MfrgNcNvOplradT+PNtVpYSmpBuS7nPi3
	QIrMGQ7ODdCGqxcSwC0w383AHw6Vl09vdY0I09bau+qtycwcCH6LvRfmUMHupXX3Cvo2ZI
	abcupkMTRSMg7hWq8g4HnY1k+JmgeRKO4X2kD7SP2k0l8i+/sWBORNgg2Hs0QQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=JhmMd2OdSRLsmBdTaZJaOxn5+J8i7lRsLiQ/YGQr8EpU+uTBTDTZeesV+YpTXpcAd68qiS
	QUS0mgwMMH2cXVGkrTWpOsI/6dokxyQ7z0DLmYkmCjJqqMDRh7KIgM24fb8508G36hqwII
	0pBAIXQqflMghVumK2qziDPApZkudGahssYfQ5Jin+A4S7Dh42IvbsUipvf3mJve1mFOkq
	tyycRH325bgIHDNeIUlaAXnqn0hR0BsPn7E87kb3yeS9FzWizjrTvB8d7R8Z9beA1aD4AU
	OH5thIxmqP2P0Ug6p/S6eq0ZSduf4f4mAGihxBfmwAVZqrhTCuvtUx3fO4JA3w==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 22 Oct 2026 13:06:42 +0200
Subject: [PATCH v7 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-rockchip-jpegdec-v7-4-3fd7dd55f408@pengutronix.de>
References: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
In-Reply-To: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792667206; l=2421;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=XKKZeAn83nsSxMgXM9Bvv6Y9OauycMDu579tqOq4OqA=;
 b=qzCukFzVLEWQqLtyrYPgpvpHc8rV3w7plRIzGdpGDIKsfzLPME3FqFKimPrTKWIlUiC2IiQgW
 zzqFY3VUp1qBCn+RP3pVd8224ZV8oOrGDQR4vz/HynbJQjp06QCEbwI
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_040650_941184_4765DBE3 
X-CRM114-Status: GOOD (  12.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK356x.

The decoder is the same block as on the RK3588, here at 0xfded0000 with
its MMU at 0xfded0480 and the same 0x400 register window.  Only the
integration differs: ACLK_JDEC and HCLK_JDEC instead of the JPEG decoder
clocks, SRST_A_JDEC and SRST_H_JDEC for the AXI and AHB resets, and the
RGA power domain rather than VDPU.

No rate is assigned to the AXI clock here.  Unlike on the RK3588 it is a
gate off aclk_rga_pre, shared with the RGA, the IEP and the EBC, so a
rate set for the decoder would move those too.  Its mux tops out at
300 MHz, which is also the default rate of the downstream driver.  The
downstream device tree assigns no rate to it either, and the vepu node
on the same clock tree already leaves it alone.

The domain needs nothing else, it already lists qos_jpeg_dec.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd392..e6c7ae908a99f 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -619,6 +619,28 @@ rga: rga@fdeb0000 {
 		power-domains = <&power RK3568_PD_RGA>;
 	};
 
+	jpegd: video-codec@fded0000 {
+		compatible = "rockchip,rk3568-jpegd";
+		reg = <0x0 0xfded0000 0x0 0x400>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "axi", "ahb";
+		resets = <&cru SRST_A_JDEC>, <&cru SRST_H_JDEC>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3568_PD_RGA>;
+	};
+
+	jpegd_mmu: iommu@fded0480 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfded0480 0x0 0x40>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RGA>;
+		#iommu-cells = <0>;
+	};
+
 	vepu: video-codec@fdee0000 {
 		compatible = "rockchip,rk3568-vepu";
 		reg = <0x0 0xfdee0000 0x0 0x800>;

-- 
2.47.3


