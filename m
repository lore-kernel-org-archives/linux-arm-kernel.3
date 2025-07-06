Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9831C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqRwK6eVJuv/TSeqdmJd8lswDvxhO2GpnXoxuOM04qc=; b=3OG6hcBI7Cj2hlTquprB/svlpP
	/0duilem1hC6pjJMmGzxP83vFoEJBUrvpimlWjOTpOXk0BbW6QYjc9wFJy02oPu/g+C+8EJ1EaHN1
	De+xUp7tyjHtRrOon4WZHLPivbxm2CEO5UMovsiNf5hfIjq3qqqVPePWg4MspbEB8ZTKMPTyCH9Xm
	ACrgvUxGNq6JwDwJF6BrcfWUiQ6qmWgwH9rmlGA+28kHTJq6P/kbKjMc7tOEApzjO9l90EYLtu+qJ
	0anjOlwKNnAL7yUCnAmxL0zLIbmxE8eTbMWQiTS1yuXUOjIKGy60wDqdUMsXL4+o2yK1gmuLgeSus
	2WJZhg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVDa-00000000jyX-2rpe;
	Sun, 06 Jul 2025 19:40:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYUOO-00000000fGM-0s4B
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 18:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CA4B5C57BA;
	Sun,  6 Jul 2025 18:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D1B8C19424;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751827630;
	bh=LN8cjqpOaDyXpoTx+s5nUNQjpmBh4i1aA8aGRGhdhXI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sl8F1XFtbV8pFkHo74C59Qcmll87xLeRbijKhVGuzfTXwSHTT4zT4G/rfYzR5sO5z
	 2nk6RN/zvMnKyt9Yo94q+dnHQEZoQwaNaphOeCCXVoNcHPizwnkMoReZW02Axxme2i
	 6GugLwdVfxFupMHcYN8vH5p7K6iE5JTL910bMguPKHFiL2IkhS5Va++Z2R6bxHh/LJ
	 73wPhG0f/gtIy06sPVC+8und3UZ9sS6iOvosfjK8Tjwqn9xdwhOrdHizz55mnCvygl
	 Ve5J2CBZrAehSyRn2L1Rv4Mwx1FRZ1rzqHL4/jeqhaLy5weZApovAdWPidZXYiz2vV
	 fZ11Pvm0h9e3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B6BC83F0C;
	Sun,  6 Jul 2025 18:47:10 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Sun, 06 Jul 2025 14:47:06 -0400
Subject: [PATCH 10/11] ARM: dts: lpc18xx: add #address-cell and #szie-cell
 for spi flash controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-lpc18xxx_dts-v1-10-7ae8cdfe8d7d@nxp.com>
References: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
In-Reply-To: <20250706-lpc18xxx_dts-v1-0-7ae8cdfe8d7d@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, vz@mleia.com, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751827628; l=1223;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=WCpBHug6OhCx+F6FwrsLIok14DKpKGEdTCJ2N0cYh2o=;
 b=OJ8NeXc+Sqhu96qL4Qg1+6+w1CRKspkU6ekemGGOFTsHZJWrnMsc2VVMLiLLFD9RhIBJO5ANF
 uSNdZPA0Gv6DTsKnqjNyxLoTmXMYnhG7xuWJ9r0IOSAaXekfJ+jDZLR
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_114712_336275_7CBD35E8 
X-CRM114-Status: UNSURE (   9.75  )
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
Reply-To: Frank.Li@nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Frank Li <Frank.Li@nxp.com>

Add #address-cells and #szie-cells for spi flash controller to fix below
CHECK_DTB warning:
arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi:103.23-112.5: Warning (spi_bus_bridge): /soc/spi@40003000: incorrect #address-cells for SPI bus
  also defined at arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts:452.8-479.3
arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi:103.23-112.5: Warning (spi_bus_bridge): /soc/spi@40003000: incorrect #size-cells for SPI bus
  also defined at arch/arm/boot/dts/nxp/lpc/lpc4350-hitex-eval.dts:452.8-479.3

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
index 0be2486f07173c47bdc9d298a11ac9347f81cf02..d212ca252b06dc97a0cdbe5ecff42780b51a02dd 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc18xx.dtsi
@@ -107,6 +107,8 @@ spifi: spi@40003000 {
 			interrupts = <30>;
 			clocks = <&ccu1 CLK_SPIFI>, <&ccu1 CLK_CPU_SPIFI>;
 			clock-names = "spifi", "reg";
+			#address-cells = <1>;
+			#size-cells = <0>;
 			resets = <&rgu 53>;
 			status = "disabled";
 		};

-- 
2.34.1



