Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6294E106F31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RQV5YgPwjVWKQKtPAfMfDAcJfJwQuNLBuqyUqk5nGbA=; b=oXm82STjuSJ8iG2sUjFV128gHY
	WlPQ6PnUP4cKupEk2XNc8ZdyfuTa2Fcgw5LOc+US2/5BOjDKBKbAlQR7zzmzty3H8eMZ2pXLp5Nuc
	sXk8OxafjbgUp8S2pz3F+txMKlf+rT0vz3OesasbW6/F2lBWfH+AFH799qRmmcT04B980Km8cWSiX
	i0mcbDSrMf3tBdc82FqGZ9HrgO1w+7XogF0bQy0IGqJmpSD/eHeqgW+h33T11vWc3T2VpNFbDqgjp
	Lm6/SuxHZx3g2Y/XchPga/VWbTUBQdZXb+QuYqyEnG8ynHz4pJm7vnPpQhD+wpVpwDKpedotCJmeY
	9OlnsIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hyB-00000005GfN-1wjf;
	Thu, 26 Mar 2026 10:29:43 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hy7-00000005Gei-2z6f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:29:41 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Mar
 2026 18:29:31 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 26 Mar 2026 18:29:31 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Thu, 26 Mar 2026 18:29:22 +0800
Subject: [PATCH] ARM: dts: aspeed: g6: Add PWM/Tach controller node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260326-g6-dtsi-v1-1-348e7a0661c2@aspeedtech.com>
X-B4-Tracking: v=1; b=H4sIAIEKxWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3XQz3ZSS4kxdy9RU4xRLI4OkZINkJaDqgqLUtMwKsEnRsbW1ABG
 wlgRZAAAA
X-Change-ID: 20260326-g6-dtsi-9ee3d920bc0c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774520971; l=1258;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=VdlCgfKxytsoAxz1ceuN+oZF1N/0ydu9279KC7M2B6Q=;
 b=6LQIfCPgwe2WTbwtFBzk67e1rmbGs8rZ2uOnqh+PSZ9DXZv9Rn4tKkJdjKheF3/+gY9bieilX
 qUclh29h+NiAF6R789GZKqv2U8efedQl54cShepZyIWqe9JFI5NhGEb
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_032939_758716_A8104E48 
X-CRM114-Status: UNSURE (   6.93  )
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

Introduce a device tree node for the AST2600 PWM/Tach controller.
Describe register range, clock, reset, and cell configuration.
Set status to "disabled" by default.

Prepares for enabling PWM and tachometer support on platforms
utilizing this SoC.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 189bc3bbb47c..818d486b94ac 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -102,6 +102,15 @@ ahbc: bus@1e600000 {
 			reg = <0x1e600000 0x100>;
 		};
 
+		pwm_tach: pwm-tach-controller@1e610000 {
+			compatible = "aspeed,ast2600-pwm-tach";
+			reg = <0x1e610000 0x100>;
+			clocks = <&syscon ASPEED_CLK_AHB>;
+			resets = <&syscon ASPEED_RESET_PWM>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		fmc: spi@1e620000 {
 			reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
 			#address-cells = <1>;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260326-g6-dtsi-9ee3d920bc0c

Best regards,
-- 
Billy Tsai <billy_tsai@aspeedtech.com>


