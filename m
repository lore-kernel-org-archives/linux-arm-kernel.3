Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B6DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiKU6reIrnI6SCKZDx6HjIur86vJTQOeiaKBcGcpB+g=; b=Olw/LeYuktgeo36OzJMsrfqQVV
	L8AeEVVHV9/dW5Y3vRLI6dOjsXvEzbBVAljViUKV4a8JCZ90WSQNtJJdN6ELT4OqgU5CHaiA8gxxu
	FuFYeHdtfbKx+OOAXtu82bLGsFKLKoPcegNstJY4xJCW5AoFdEhtjWXOocm2v5muaO02jWIj/tpJS
	/bn3haPa/OgEqIA67sDtEXO8+XkVxuHMne956H0aRL8RK1Tm1bGgPDQ5cqF24EaBm+J4RSafNKqF2
	bWkNKUEjaw6ao8HQb5RIrmZi4Lmp3inudIPYh7cV3rNUmwwCzYJcsSK2FqUGFytdE23xytU8den+m
	csXbm7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwNb-00000008SQB-0cV7;
	Mon, 19 May 2025 09:01:51 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwJr-00000008S21-3ECs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 08:58:01 +0000
X-QQ-mid: esmtpsz19t1747644985t3448e8f9
X-QQ-Originating-IP: KewNoiMQncWF6172/GixGn+r8xA+9YghBeeHMdJoq/U=
Received: from localhost.localdomain ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 May 2025 16:56:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1955181229310767366
EX-QQ-RecipientCnt: 17
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
Date: Mon, 19 May 2025 16:56:13 +0800
Message-Id: <20250519085614.2245892-3-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519085614.2245892-1-i@chainsx.cn>
References: <20250519085614.2245892-1-i@chainsx.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: N3l5ASPewLWqsmztmqC0zrnAU/l8hYwnDNMeGscg6+cVcXUuP2G5kTpR
	dq8TXZ8rQ0IMXRepwOK6hrPNWwDa1YusvsLt7eE0CX5UyRi8bEwdV2qfMosjG49yytAyuyz
	VJWrUxAQ54/AwvKRfi7flBDnxagj3sGy1HdXz980HDbxC5bVmSorMz+tUIwDR/yQfazYwor
	xH2B+Gmn98l9Ts11gQXjpBKiiAEFuNtKfUADZbrHzshEMNzelr5Xq49agO7bkRu9nmny5Nx
	B8DwYHhArMFoLOLr4dZ9AhcVSuNgFwhtrwL90RLF+DrMb4nUxfQomlYkR70iDqvIjqsplY4
	4HMHwYE7lVBVHm6/swYPvNu6R3ydGbYLp6cINlSMwZc9SyHi/MpWpFkcGXDDH+ky1zEihZe
	cypz0lvdLPhTCUJc2Bi+o9Yw1Wotu4++r7qgytSeicunJuY9a8B9r8w05411rsjWQjab360
	el4a3HVGuw3aoCiV/ivbNHUtN2ZG/h+zQ6gbbhUdAxu13tFTuGHsrwSZyKL7Go3NT6ifKGV
	RhdzWuRs6zSC3HXqKfA4YcfEDKKVdlhoXLwAGlyVsgL9nDNcPMKwm+p6TSDuuWAsq1Y9ccg
	MxiwHwzqkWOzAQ3vgf7tJL0O4ydeFTfgX82/AruSCfnKQZMrev1W9NUNYiq8hULzrPwBZfb
	f0pFBQfcYbfMPyXD+MqLP6+d8J1Wp/y9EOQNgzl04sfWB3E3uUpS27+iBFs0zdfif8xbbah
	hax4EgxqdoIPLbA/GrsDWG2qET75EAdY+Gw8ANJ/HH3oEzInnxbeDm+lvMZILUB1i2SWbpN
	3aQpz5JHPA2/kI0F3sG1ZxFaLoUBHBuo2TYwsKpYkCC3id+Oph5VqbWX0dbsz9jfbvgQEA4
	UQas9sfwF4t4gEuSCU0AORnVxjPkCzRbevmTx3uaJ9frwf2c9MmXRXpXIjS7LQeCCsAnJc2
	uhOTlfl4PzM2lGQrbEGzYWFGG3OtX5RC97zyjV4S79ssNgg/fw+gNVbCtin0G8P0qCWSMb6
	8k/NQ9cjvEXgYGH9ahXudmZdYj+eV0GcAsF0N9YA==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_015800_307834_4F9B42FF 
X-CRM114-Status: UNSURE (   8.24  )
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

This patch adds device tree binding support for
Sakura Pi RK3308B, with compatibility for the
Rockchip RK3308 SoC.

Link: https://docs.sakurapi.org/article/sakurapi-rk3308b/introduce

Signed-off-by: Hsun Lai <i@chainsx.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..c64adc0d0 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Sakura Pi RK3308B
+        items:
+          - const: sakurapi,rk3308-sakurapi-rk3308b
+          - const: rockchip,rk3308
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro
-- 
2.34.1


