Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B1FC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 15:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9CIQFXWYmHnbG2olip8/ZEkH+fpGsI4/iC0LU8BgT8=; b=Eevvc/Nb6bZ9ThcSrBk0SrB9u8
	jVcqlrEtkpkfOutBMuPtsG6f906ySyWUgOqbLyhj3RfVuRB2aUpIXkUjiVl09y4yjr4ksAojMtwd+
	Iwr6VES/c3B47rLzZ2aDtdxB2UcVXSrvM9ls7qNn02Vp6lfgn5u8Knpz/Zc1AGCzbAxrtCMwFpyI5
	zzehCahasJ5A23PWav4DB/ljXJX6Oq2EEAQU0NQln/iytv6YyGYQwrpFPCWNLrMANxIYtfIEzPCyB
	PmcI+r4m83gdr9keu/OzYxCc8IAA+YeqX6lHOZ8lQSD6fp5RI9SurYtGjJEn5zE9/ziIvCx/kqlAO
	WhdkPEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAQ5-0000000FSbM-2eQp;
	Sun, 23 Aug 2026 15:47:37 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyAQ2-0000000FSaJ-2A7f;
	Sun, 23 Aug 2026 15:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787500043; bh=w9CIQFXWYmHnbG2olip8/ZEkH+fpGsI4/iC0LU8BgT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=srn+GyZPEnMK4kg4bSMoFXogNGO9du+8flrEMmhAqlBq3I0KgSXMHHizr66oxav+W
	 Pl4DDBE+ifSb17x8BC5sd3JMsh7aL5dXx2c24omnTXaC8GzpouFvjItwOr3ZPyU1S4
	 ZHxMpb93dR6Acy9k4EU8XFYIni0Jy3NCI7utlT4A=
Received: from ubuntu2204.localdomain ([2409:8d20:2b:671:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id BD29E410; Sun, 23 Aug 2026 23:47:18 +0800
X-QQ-mid: xmsmtpt1787500040tw6cbvwgm
Message-ID: <tencent_E56643A62E2161842C400BD1D30FBB698B05@qq.com>
X-QQ-XMAILINFO: N9Ft9za/J3VVfWHLwHdJtJlKBggkypGRGIJ4KXQ5Ej/xgIbPkSKUuOBGM5Fk/Q
	 bqI8M0QO5ccrZWcxSY1OFArbWv0NLfkmBJcZdQT9xl8zFWecZ7IMJCldFkeXWNnUanJ/xdk8Yatq
	 fwXiWHquHrXvr2NblcMAkoipWG8zv4nL89WEc1xS0aPrUk7ihFqgtuqkqeiQifnpa9W76GsJ4x6Y
	 v7MQkZ1MSGn07jP6ylzfXdPsC7JSn0KmudabG2bml3So4RLjvIEC8J5IcY3Lj2uj+VI+pIy48E87
	 0SDeeGxi1rGSx3nP7UmeC76vzGfP2kh7yWlzNxWRvuIWEB+Rpi9e0PEz1vu3C4rakFy41AvWFQ2M
	 cEbDY0MzBqQNJ2ro1uE9BXPgNCreoo2EmyJO0xRPv7RgODg2+AwWl2pjtJiEatoFQNQiF492A08g
	 rAStHvh/E2LFKTbtKDntm51HQqUaaV9RRwqPP0GBauO60ExCi8fybA6lVt1+Sy0UIxJ/A8SsdwP8
	 YlP4LpRI0rKC8hXCQp3qyTaeQWIQk34+wJgm9GbhLK0zPh0lUkbuPTrrACCko4cslRCV7o6PgPQp
	 GNEaU7onqTI00vQWQ8RuvKPR4TqEXpkvDkHgJqWH8mQbY90mWtDeUk1OirSQPJH2x07rCNPcLLTF
	 x56F4po+nBac+gxukWF6e1Y+t/wDCfgH7kowPIGRqi50SfSWOM7JJt8Y4D7+6qh/YJN8ecS4vFGr
	 hdNu4Aq1Elf95tyQVnso6z8sMdZy9M0w9dpnBlbXHtIeBqjWTwGJ43p6ZDtwSKNF5zbkJ59Z1Vsj
	 uCFtrUhS1Ay4KG3TUWLXAzAFnP2urDYFUydpzh9XuRxodlKtAjD1xADKbfjeiZFkHMZ4wHthS8Bi
	 J2ie/k/itnGiSbFBkKY//zW07QV/Kwdw+QCnML61ZL3YP60HS513Lrq1n1c1sYaUajGUr01JEaoX
	 Z3qmF9PcD2OSuqauvhl3G1hKUirNZTERNHl/8QWecmcFyMTkEJVAd8GdeW3CaKCvwcahJTYm3prI
	 kiCSJtm+Pb2TM9RMJ0sWWReR17W8Jn8q3b+xiT9f0oFXH8rTsPING7dKB4k6gJtgLBrTfpIXovdv
	 L2mGIzl5LNlg6BnIlPO+HRMnlz+Gm/x814fCth1aSfbERkNb9d0yq+U1z6ssTqngetjqd5hIzOrt
	 +PUz0=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Cunhao Lu <1579567540@qq.com>
Date: Sun, 23 Aug 2026 23:46:53 +0800
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add LubanCat 5IO board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260823-add-lubancat-5io-v1-1-e6b7894e8c60@qq.com>
References: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
In-Reply-To: <20260823-add-lubancat-5io-v1-0-e6b7894e8c60@qq.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Cunhao Lu <1579567540@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_084734_953323_1E4A4523 
X-CRM114-Status: UNSURE (   7.83  )
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

The EmbedFire LubanCat 5IO is a carrier board for the LubanCat 5 BTB
core board based on the Rockchip RK3588 SoC. Add devicetree binding
documentation for it.

Signed-off-by: Cunhao Lu <1579567540@qq.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a799bb843f74..81744fbee98a 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -216,6 +216,13 @@ properties:
           - const: embedfire,lubancat-4
           - const: rockchip,rk3588s
 
+      - description: EmbedFire LubanCat 5IO
+        items:
+          - enum:
+              - embedfire,lubancat-5io
+          - const: embedfire,lubancat-5-btb
+          - const: rockchip,rk3588
+
       - description: Engicam PX30.Core C.TOUCH 2.0
         items:
           - const: engicam,px30-core-ctouch2

-- 
2.34.1


