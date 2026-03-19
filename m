Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BF3109022B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QB0PAHjXJtrNdDodBFe2YFA8Ial1S7MV3yYq3bW3Z6w=; b=n1N3V5waoThJsvI9dVvNSvLHkT
	YBIoPZtsrlrr0X1/QCVAR6j1LL37rV9xPr9ditMeSuZxdl3mESFD8/e5TaVNPfx4zqs1IiIXwk68z
	Mo4XJbLx5yYYRyK5RLwLcOlTRd6Y/gNPArVaDFhhryrU/Oskx4QPR5WpTyCEM0MtN6zWQGpXjTA0X
	+GTEEFbthNwfg6rlAjkGc/S4tUW+4UwBIVYbQjsSeZsPAU0b2j8bcH5P2m4sXhgp9Y4LDD8aN7PVR
	yULli1SBPosbKLl1FeqzssN4VOYQRlg05utDBJnIgKFtb6BvkW1/z564jLYqvC6yGX4LLDA+4zWic
	AkRzrLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Drn-0000000AisU-0EWe;
	Thu, 19 Mar 2026 13:56:51 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Drj-0000000Airm-3EXP;
	Thu, 19 Mar 2026 13:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773928592; bh=QB0PAHjXJtrNdDodBFe2YFA8Ial1S7MV3yYq3bW3Z6w=;
	h=From:To:Cc:Subject:Date;
	b=OZIuQDm3gsJ6HK/EUYVIO3wMK0ytRSedyWKrnCtPb5CkNhT/8KFr3ylTT5tWlUkXl
	 qv00O8rDSK5qCU5bFxew0+J2cFXVSLGdUfV7LERaH28xB8ocyDriFP/Ylg7DW9+3Gx
	 jwpExommlITWr96++S3IYVuTMjiDPa+MN7wICA98=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id E0D89E56; Thu, 19 Mar 2026 21:56:13 +0800
X-QQ-mid: xmsmtpt1773928573t778m5lcy
Message-ID: <tencent_78E7E3F6991FB4403D5ADC9E6A6BC3BF8307@qq.com>
X-QQ-XMAILINFO: MMwjR1C73eIsPYIJmh7X440ZtM80sQDjF5nMcIXzGUvGMjBhReA1DB52+T3lWR
	 QhpCcXdclI30GKKwQJYCZkIwo8dfwpB6L/QUmeYluB8iqtYfSXmy5XkrTAZOO5c5W8vYovS8++jB
	 h6bTkvZtZ2DRpX+jMd2ShguYw60HjMWVTNT+15ZKfuMd9IYwx/iB0Eeu07ijZqCHRKRhlS9WB8M5
	 CZypwXnrr28c0pHMeVSjHb6GRR9JnrCq6GxCP5lQ4icIouxeFfH0aqLzQdhuz5W3WoWGSM51FwSP
	 WwcduP74YJbH1IvUVHwoVAaQVteqItobujcROXy7j2FYQSB4ZuClaGLd56UYrZrtnRsoZ8ufu70x
	 c9zUoufIFbzfavZHZwwjJwyHW/3/r0vb+TJ1u1WsK3Jn8vhWZtI4dZe6U04n2+5uQYC/3h0c3tzb
	 9+sasxJdw658XllPyTPuYhRah0Dhsjwx01Ot4LOmvXhW4IwwOl7v0XUCG4hbdREOIie9Ju2pQYJd
	 XV35BUVCjfVFG+T7gwPyTjY3R7RLMeThYLLGb1C/5HVCua+50dj/2y5yUDgbpk6OePKGe1ccDtJx
	 zoU0CkUdWsEwN6T0QSe5DAasSRFn2RiORcYWIVhNFg3P10vKHvYT711441sMuF0PLSb/hhmMDg5X
	 1C+BWFJ4laxINeG2uujy4GiddwXv5p+AXeXpWSMQf/BMBulG4/aVVg/n6tv5IOxUr3zDoqXgAASw
	 8JKz/nLfH2yrbaNyvPPmOhgdUJ1Onabcq4/MEZN5gdwfvjMcxI4UhqukGn8Ji3jt9IHXYaeGgTGf
	 3NFa5xlrCxUjq9B/mtyBZAcnNFjmCH1gSkglRCL8RbnEkijTxRaE1XIwGptZ5bWL8ZT9ZqrigWnx
	 DVSluNe16zQrIzf1zRN1vqFmaflAX5Qn6oxcwpNTw/ugjl+69SKyEwagfNn4wB6OGdGq54R9Y33q
	 WuKUzotjj6mvYgbNstp1lfvTnKyetNJtt96t/wfgZQUHbozKEcziyWB7xAaLdrarA8zFHL/Lhbz4
	 ruqyz3Q5O0WmvmoRNSQIe9hkpUBWcinIxIOmO9Q3mnxFyKul1LlpDrX1txwJXKoOaDf8wD8I+QH/
	 +oekJ6I3/x1mxXq8/UXZ3XX1nN1iA5o7rvz9GOLZAo0lkPDLxcPJ+/5wCWMX5JLivRCi6X
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: linux-rockchip@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix RK3562 EVB2 model name
Date: Thu, 19 Mar 2026 13:55:00 +0000
X-OQ-MSGID: <20260319135500.69993-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_065648_349440_F2218D1E 
X-CRM114-Status: UNSURE (   9.96  )
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

The model name should be "Rockchip RK3562 EVB2 V10 Board".

Fixes: ceb6ef1ea900 ("arm64: dts: rockchip: Add RK3562 evb2 devicetree")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
Reference:
https://github.com/rockchip-linux/kernel/blob/develop-6.6/arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10.dtsi#L16

 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts b/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
index 6a84db154a7d..387062eea520 100644
--- a/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
@@ -13,7 +13,7 @@
 #include "rk3562.dtsi"
 
 / {
-	model = "Rockchip RK3562 EVB V20 Board";
+	model = "Rockchip RK3562 EVB2 V10 Board";
 	compatible = "rockchip,rk3562-evb2-v10", "rockchip,rk3562";
 
 	chosen: chosen {
-- 
2.43.0


