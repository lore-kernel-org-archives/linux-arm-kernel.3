Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36526C71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xa0q8z6Nlabn5VSzOfD+ouJeFgB8kBuoS3yqSJh6dg=; b=jEUjLqr3egWOdISoe1TlbxYCRe
	jHHxiX0LrfA5vwm2wT6DCIT9naYwj4tKKWnyVkrXnsWQeqUfcY21dZMJ7WZB9f0hW7414oHZiSH9p
	req/xdsWp3VtXtAU9ZG3lxB+UklfvQbx5a8bYeR87lkfCShrz3FxGi74WLDzw7PiFJm3KjzX7mZWJ
	N4335Yc+IpHwxFiQzhqRY0igjU2paPHQZJ8r4b/p7JMOesrM6YMoIXWbxaimRL6xX8JQK3dCgoylu
	mVlH5ehyhITyYJovx22pH1SX0ZzmG4BtDc+WpD1M+GVO+U4l0zBbtonVnnER/CmmaFmndrCRbnQv7
	JBuYJ18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP55C-00000007ygI-0Y4L;
	Tue, 10 Jun 2025 19:56:30 +0000
Received: from smtp-bc08.mail.infomaniak.ch ([2001:1600:4:17::bc08])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1kB-00000007S56-0VlG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:22:38 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bGvFz3nwxzflV;
	Tue, 10 Jun 2025 18:22:31 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bGvFy5CTWz14h;
	Tue, 10 Jun 2025 18:22:30 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Tue, 10 Jun 2025 18:22:17 +0200
Subject: [PATCH v2 2/3] arm64: dts: rockchip: px30: add label to first port
 of ISP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-ringneck-haikou-video-demo-cam-v2-2-de1bf87e0732@cherry.de>
References: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
In-Reply-To: <20250610-ringneck-haikou-video-demo-cam-v2-0-de1bf87e0732@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_092235_303354_7885ACCB 
X-CRM114-Status: GOOD (  11.92  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

This will make it slightly easier for Device Trees (and Overlays) to
link the ISP controller to a video input such as a CSI camera while also
bringing it closer to what's been done already for the DSI controller.

Suggested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 8220c875415f52bb2098af5c0647cae8fe5c9aed..0cad83c5d5fe64dc8539e0fd0640e02058e1955c 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1269,7 +1269,7 @@ ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			port@0 {
+			isp_in: port@0 {
 				reg = <0>;
 			};
 		};

-- 
2.49.0


