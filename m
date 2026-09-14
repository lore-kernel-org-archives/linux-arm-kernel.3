Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFC9C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LrJiEVM95oznn+hJH8/9LEjNBqxWrIAa6YUnSAT8k8=; b=guy9N8xswRcLnriXYwTrJRNOoH
	wB3iuxbpsxVQ4ztd5ojGKM44Gh3FC8hUpOQMArJMenoBEygi4NqJ4x6cw5h+KWn6beTBjJ0rgr54A
	FaPYqnxITyjfQrrL4raEBHJ9DevEnYJCRO+6bXR2Ac760qRbC9fxkp5diYEuW8xmeyX08kdGdy9pO
	uBMBvGQhTjOU2tBVqiOAdDtL2D6iRxDR7kIrEhHaxfHH4PstZIbV9O+A8x1JFL/6zotUVrhs3dO24
	Sioassl69XRdChQo8JRNSZxK1szWdzMEUY/aD8GBPDCTU0kyqXXAZ/kOvmY3mRApADhN05LDIoVYD
	EeYWa90g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65HN-00000003Op8-2pgf;
	Mon, 14 Sep 2026 11:55:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65H9-00000003Oes-0ZC1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 92A7E601DB;
	Mon, 14 Sep 2026 11:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3DA1F00893;
	Mon, 14 Sep 2026 11:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386906;
	bh=7LrJiEVM95oznn+hJH8/9LEjNBqxWrIAa6YUnSAT8k8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EsUttVaT5bY5g2WEOBUok/G9cDulYiQRo8RrbBiDnAG7/mYzFOAKAc9TsMmB31Jz4
	 Iw+vllOxFNXSsWbbTY0uAhKJkxxUbpoX3mCJ9sPOpWdhmf/ZPOAfDOMScZX35JxZU4
	 6yzNlcZa/zSt22g8hqbsKPKAL96e23UDBhtjRra4Phi6YdPbuFehbhPaKR8uVKSntW
	 o29/JdVk461L+rWI8bVqz9ObHMgRZ7JRy3W0DeUgj9VVNwVJioCZuAUURhQgNJqXCy
	 3Vm+/Z7AMYiOcl6CgqLPTgxF++icQGhm7Z70gSUUJD4O0a26GVCTCiBPYX0SrlyspU
	 JUJFeGZMF/yNQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:35 +0200
Subject: [PATCH v2 07/20] ARM: dts: ux500: Rename power domains node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-7-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

This matches the naming used in the binding document
Documentation/devicetree/bindings/power/power-domain.yaml
It's most logical to call it a power controller.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 25a20fafc6b9..11fcae1904e2 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -343,7 +343,7 @@ pmu {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		pm_domains: pm_domains0 {
+		pm_domains: power-controller {
 			compatible = "stericsson,ux500-pm-domains";
 			#power-domain-cells = <1>;
 		};

-- 
2.55.0


