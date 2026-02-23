Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F65EA4FB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+SyBQfbcSMDVoeqqTyU/EyVzyLdb5W3b0Ah6eCzDIbU=; b=YHGUkt7VskmGztDu3ePV8mRbXk
	gGFn9YhrWWOuj7+v1zTPSQPkUJpCXivWa6V3Y+8w2/FCU0G8DYmcj0XwCecKTKzm21siO593IUBAG
	JFvXUNUrYCNc5hWFPZru9ypke0IkcNAbIpE3koPazZkNlE2esTAoXBG1ffflBtUWO+Yd85zBpS9R2
	tbm278Be/e1jG2jzjUiiopTrR5THjiwc3QodLAxa3YHQHpy5FWbWkR3Wnz9EpqzUlNCjKosZpHP11
	8dMCpPUUhrfZfiyWsdxmNhjXT8inXGGWeGT6es/c/yuEUNDfqjX3ItqdmCflD+nHPqkaZxoCDmmrN
	KI9JdSdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuV03-00000000H5d-2vtg;
	Mon, 23 Feb 2026 12:25:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuV00-00000000H5F-49DO;
	Mon, 23 Feb 2026 12:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771849513;
	bh=hBnRS2Vgsup6aTou/EApEN4AdIi0x4IXbfdkCfQHpM4=;
	h=From:Date:Subject:To:Cc:From;
	b=Ju9VsvSiGjPvdaiWB9QKmuS5OuvLzUC9fzHF52Vzn8uG2wziMZCk6rYTSdfTZ0ba3
	 be3SafH0cvPssDuOdNTeZd9Hi387ItDcHJtqS0SEMcNZ3d1UT1WLeTS1q+zzf2eL0/
	 Unh1Nox00xUQwVlPWLvoojtKK91V/mXoF+SdcLcuUOAlo8k0V/rCBPW59VP05cX1EG
	 Y7ZylPW8Wzfxe18KLbSEgNsnpNNbNzbhWPZxqqMvIhOK1nYAhdxMNVevkRz18vPiHI
	 i99ecuAvPbiiKpyGuTuV5pIQJciW33dtQADzn3EJ9kepDh3AlRvIJeFCzf/RN1EpAa
	 hZnLLSYFJNMBA==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4A5217E04C4;
	Mon, 23 Feb 2026 13:25:12 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 23 Feb 2026 14:25:05 +0200
Subject: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxG4atI1gbGyExrryIuSubXhoKWDIgg3
 t2hy2/x3kkFbij0ak5y7FZsWyu6tiH9vNcFbLmaJEgKIj3vGcqOhTfPcPZvHx+JVQWaECKGJ9X
 255jt+H/H6bpuIKjICGcAAAA=
X-Change-ID: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_042517_213245_B6C801F4 
X-CRM114-Status: UNSURE (   8.90  )
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

When building device trees for the RK3576 based boards, DTC shows the
following complaint:

  rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"

Provide the register blocks in the expected address-based order.

Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 49ccdf12ef7e..45eb0d053a6f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
 
 		vdec: video-codec@27b00000 {
 			compatible = "rockchip,rk3576-vdec";
-			reg = <0x0 0x27b00100 0x0 0x500>,
-			      <0x0 0x27b00000 0x0 0x100>,
+			reg = <0x0 0x27b00000 0x0 0x100>,
+			      <0x0 0x27b00100 0x0 0x500>,
 			      <0x0 0x27b00600 0x0 0x100>;
-			reg-names = "function", "link", "cache";
+			reg-names = "link", "function", "cache";
 			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
 				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru CLK_RKVDEC_CORE>,

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98


