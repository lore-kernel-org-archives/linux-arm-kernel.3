Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE7C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSiey7xGLFCEXLf3K0AzP6qmF6LTSqRzEPkMAEYHPvg=; b=ICJIdy31shrOb1FlYvPdVLuBf4
	YOkg6ebxprmnhvyGt0wPXv7JUe4X4hEYHOjCZPSlCtDwgJjIbOJbzQ932igmV77XpvQdpSYjpYUCc
	ZpqRDYdXBM8i0a0HneV0w2B6Ko7hSF0VKaqY1qEC0krwrhuuq+ZillQfTLgA0UGYeOCdbarqNTr7g
	wyGutPWUeHASv33bFQiaJ0teQLGy6KNYC6aGFZHnKJhxb/6qzA4tDFhHs97NZzpdeP6MFmuiZiXas
	pA3tjnFcggdz+NjXv6oy2BUGrGtEKBGE/YecgRTkH3HoY7nWt53dqZSJwX/X7h0mu+VuarNAyIagY
	+Azp7o0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRqo-0000000AlHW-0rTZ;
	Thu, 30 Jul 2026 14:35:10 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRqh-0000000AlCR-3M4j;
	Thu, 30 Jul 2026 14:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785422101; bh=ZSiey7xGLFCEXLf3K0AzP6qmF6LTSqRzEPkMAEYHPvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IZjcke9c+aKNC6lrjZYQJM7xvW9bHCC6YHhJ+0VluKfJiF5J3F+Dvgg4o3k/EJjNW
	 F96Iwj8e9jE+Xy6Pw8OoxxgApL5sFR739a1d5zMgyVFkHu/0tNjBtSCxCbI0DPyfs0
	 cwEtU7Bevd5P81slzaabcFIIFIhGQ5U1Os9QGxSI=
Received: from ubuntu2204.localdomain ([2409:8d20:22b:54c:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 8B38245A; Thu, 30 Jul 2026 22:34:51 +0800
X-QQ-mid: xmsmtpt1785422097tsikosmrp
Message-ID: <tencent_95532630016C2421000111DBAFADA99A8605@qq.com>
X-QQ-XMAILINFO: MXzpxT/vcbSg88+gFP0Z8wnxUeFNP5vkb4oIxGLwSqZhZ37RWf//tFEVz9LthG
	 oLnGv2gys2zgc9fgj67ivO/dMkXT7LTE17WVqnBnw45tSnA2vVh4oJ/JdBMOr04Dy92gtWjQEIVn
	 vpHva+sW60y9oHMlyN5kcGCM0+eh4ihvZUHbVS29xM74mXHOAp5Owb4FcOH8dEeyevQL/HT44Ct1
	 gyInz6omixDuAQb+6AoedGVWBvIZqt4tM9YBO2M+gj0hmTNl8ZoKfK5hkmtxRsIQrI7ykig6MuS3
	 AUBYT37ri13yH7ltIgvlopSVTG2WnkkyYpF+pz1MHjhEmbrdW6KPFOYhr/rnGtZmlnuHdZ5Ukl+B
	 bjufg6LRZ7cGZ6pCpogowPRN1hORj6xch+98XXdATdsK+SKw8D5PKcLNIXb/ku2extfLYSKlrW9I
	 VBRTSvw7spVv19DzkrYFuqLAfxazH+6ruwurnYpHminmELHYZNYc1kr/bVY7EFGKB4RtR62vwNkM
	 qDIJzRhHJ5zLR8RweDCQdB9piPFW7RjRD/PiRlgfqcULvWDMkUrterBHg0CuWiYcsidNXw4NXtx/
	 EvVBh6xG/0DWDi9aB5v+lbQEfxeU03DnGF30E7mOG9ViL+E3dN3UO7lZQOSxtY9ai6FlA9t58bSW
	 aVVZkGh048hUJnAq6zNuRC+OLqagMpvJ/U4IbfgmvHoDbBNQvwqnXKLkQha1NZfwviZUjRF4F12B
	 s75uscR4CGzEQRXQ+mXNEeH6qac7KulBEcX66nyMnhbXaM88kEV2JKqWIzrylWFU9Y3j4M31//uT
	 l+j4VvcKxP5nYVLzOgsYei2D6pl38Mxt/a97fkVwa/dLontGQMq29l3IWuOR9ouwjC/ejDbSoPfn
	 fkFdxwvzGio7ChZtvpp8LHDGb8bSz/dL6r7P63S6CGR1lbNZ3knA9jPuFnSrAYrQ0mGajcojXVwM
	 amsIYsgiZW/6lbYyAQgYpbMXwqJYYlrXf5gAscsW2MoSvIeWvQf7a3gVwLPt2lcAnPMS3ul/mjVI
	 JEpPqacRlSFgg2Agc0hyEjMq1z63rW8mev2DDpVbCHm8j83s9nfFIlK+FtBwoCB9N0cpEUAKgGMl
	 cnQPOsbObbuwCJbFmpxxGIMGinoJWhSzmavQXcAix18hMnqZSiL3AWPyaAp9JodTpnq0+mNgLaRq
	 0EHX6Sh+udPFKFVBne3B6s77SkCnktP47LT6v9pXSFJPabTw==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Cunhao Lu <1579567540@qq.com>
Date: Thu, 30 Jul 2026 22:34:04 +0800
Subject: [PATCH v6 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260730-master-v6-3-dfb63e234775@qq.com>
References: <20260730-master-v6-0-dfb63e234775@qq.com>
In-Reply-To: <20260730-master-v6-0-dfb63e234775@qq.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de, 
 Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Cunhao Lu <1579567540@qq.com>, linux-can@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_073504_157987_4EA07940 
X-CRM114-Status: UNSURE (   7.85  )
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

Describe the three CAN-FD controllers integrated in RK3588 in the base
SoC .dtsi.

Add CAN0, CAN1 and CAN2 nodes with their register ranges, interrupts,
clocks and resets, and keep them disabled by default so board DTS files
can enable them as needed.

Co-developed-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Jaguar
Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
v5 -> v6:
- Collect Quentin's Tested-by tag
v4 -> v5:
- Collect Quentin's Reviewed-by tag
v2 -> v3:
- Use Co-developed-by for Heiko's RK3588 contributions and add his
  Signed-off-by
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index fc1fdbfd3162..b340973775c5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -2648,6 +2648,45 @@ dmac1: dma-controller@fea30000 {
 		#dma-cells = <1>;
 	};
 
+	can0: can@fea50000 {
+		compatible = "rockchip,rk3588-canfd";
+		reg = <0x0 0xfea50000 0x0 0x1000>;
+		interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru CLK_CAN0>, <&cru PCLK_CAN0>;
+		clock-names = "baud", "pclk";
+		resets = <&cru SRST_CAN0>, <&cru SRST_P_CAN0>;
+		reset-names = "core", "apb";
+		pinctrl-names = "default";
+		pinctrl-0 = <&can0m0_pins>;
+		status = "disabled";
+	};
+
+	can1: can@fea60000 {
+		compatible = "rockchip,rk3588-canfd";
+		reg = <0x0 0xfea60000 0x0 0x1000>;
+		interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru CLK_CAN1>, <&cru PCLK_CAN1>;
+		clock-names = "baud", "pclk";
+		resets = <&cru SRST_CAN1>, <&cru SRST_P_CAN1>;
+		reset-names = "core", "apb";
+		pinctrl-names = "default";
+		pinctrl-0 = <&can1m0_pins>;
+		status = "disabled";
+	};
+
+	can2: can@fea70000 {
+		compatible = "rockchip,rk3588-canfd";
+		reg = <0x0 0xfea70000 0x0 0x1000>;
+		interrupts = <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru CLK_CAN2>, <&cru PCLK_CAN2>;
+		clock-names = "baud", "pclk";
+		resets = <&cru SRST_CAN2>, <&cru SRST_P_CAN2>;
+		reset-names = "core", "apb";
+		pinctrl-names = "default";
+		pinctrl-0 = <&can2m0_pins>;
+		status = "disabled";
+	};
+
 	i2c1: i2c@fea90000 {
 		compatible = "rockchip,rk3588-i2c", "rockchip,rk3399-i2c";
 		reg = <0x0 0xfea90000 0x0 0x1000>;

-- 
2.34.1


