Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ECDC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XEMzF1QeZYTiCscv7ScZ+QiH5Q6Y5lvUM85dzP9qq7U=; b=fVxBAZb6kjxE6ubxz5UKeA2xHq
	pdpt6bTzSsTrDlAuliJWhG26O8A4+SoYCBWylTxvPtsVGGm1ZL6Ev/cdDm7VtrKq9Og0D7/l7TdsP
	siUZNFjnsdO6EEqaMm8gRuKqQSgFqzhlL+xK69FFwwsNJC/fY658DCM9jDh226y09N7Z6ew+GE47b
	5JpP1SVowrFoOB3tH+ji8V+GgqwhX042nixpbM2ML7ddOwpiukGvwe4gWWj9e4OiRWMrPeJObQq3S
	TaxoO9a/kUp+0B9Z/AKYIvdc+WxY4gfO9lPzJEm6LhPecud4M7IGWwGTIwjt8es3aMYrKn/88Lu0V
	EbkrQEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeGx-0000000G5ip-0WtW;
	Fri, 20 Jun 2025 16:07:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSduF-0000000G1RK-1Gka;
	Fri, 20 Jun 2025 15:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE52F5C0F2D;
	Fri, 20 Jun 2025 15:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1B81C4CEF8;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750434233;
	bh=//PkLi9LdDjqJt/DZwax1qBAWo9WVdYtWxQpcLyBWFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Awf61NZzabibO2UxGbcD2FGXDrmyxNubicR22c0vAS24alvP4qu7T9g3rPtb1g+u2
	 Zwa2jE5/MoU1xoDSRPBMdwoKpJttgSnajeSoukbfc66KgccsFsWj1vmz9V+st7i+kh
	 ZN/Mt7Ps3Lf6EFW7VSiBIRo+sqlDykLOfC2RKF5xcr78B5vezjJhRomQDokE6nbksi
	 hX44ww3+PlVlFkM4D46eLZg7DlQDsjlYE4JEPBLvOi66f73MYHebht0YDz3OI2ReRM
	 2IaG1gU0Fc9cIcH1qf/hKf3D2LJbMg2w/h+7NWcOQf46pFRY5E3mFMc8Zx2qS9ob9v
	 0e756yZ27y1pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92ACC7115C;
	Fri, 20 Jun 2025 15:43:53 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Fri, 20 Jun 2025 18:40:45 +0300
Subject: [PATCH 06/11] dt-bindings: arm: mediatek: add boards based on the
 MT6572 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-mt6572-v1-6-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
In-Reply-To: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750434231; l=912;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=lqjHr0IWB35a+PzYE/4juId1C200yBp5ifX7vZ1Nro8=;
 b=qu0EtiEcIQbUl7GN4XSsS2ncetX4//ZSpmm+Nh9zwFaCPypCSoFS3TYMOib/n3rcoKGpiz/Le
 IBQDy3VDZmBA48DbaASHmJPlDQvBqq8W8jD2zOVZkmdE9uOFq9rfFv7
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_084355_437213_8B2E9C75 
X-CRM114-Status: UNSURE (   8.60  )
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
Reply-To: wctrl@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Shevchenko <wctrl@proton.me>

Add entries for the JTY D101 tablet and the Lenovo A369i smartphone.

Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d93976556a03768595961961bcc33..d5cb133b8a75fb5325f201f10c83bbe434a1da89 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -27,6 +27,11 @@ properties:
           - enum:
               - mediatek,mt2712-evb
           - const: mediatek,mt2712
+      - items:
+          - enum:
+              - jty,d101
+              - lenovo,a369i
+          - const: mediatek,mt6572
       - items:
           - enum:
               - mediatek,mt6580-evbp1

-- 
2.50.0



