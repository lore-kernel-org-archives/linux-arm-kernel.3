Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A623C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 06:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/S2zWt0V7SNEie5B/mNPlnQw+HceAf3rcOc1FySA3I=; b=R5Uvs3xyehMw1mXFmTX5u4x6JI
	4v++e58NGivOIR2qz+pMalm3w6m+2lSQBLLOJfhErWdSm9GpcrR06/SMsau/v7oxFTzuDx4b4wzcY
	llF5HAgyAb+RUqAamb/Zu8Y4YODyJoicm9JCcfjrM0IDK69+DfqMtJEMq/BtN5ZRabJG5U6ENZTp0
	mIO/bFn6b0aGCDj1PFSQCO/Avjadzbejl4kYhbPP9yLLACJgA9/xUyvxqQKfAVKvVWbkwdIdxbzwC
	zEttMWTP3s6muVPRPBygxtFZ3J8niCOSRhQNwv1D/vdWyTOJBLt/tjDe/bnZEq+VEDD8EtMxGzrGu
	9y7g7veQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWUJR-000000047o2-1voo;
	Tue, 01 Jul 2025 06:17:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU8y-000000046Km-1BoB;
	Tue, 01 Jul 2025 06:07:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0FBFBA50DB1;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9512EC4CEED;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=NtHVQV9EcFCMDX7k9Ycx1Wl9rCSucK710Cd1fER6oPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qzbyfJ+5zOAXdWpYHaez1II0t5HJ93Gp2NRZ6NiDQPb/GItLmam6CXiUUvyz6XYQe
	 GRRakZBogsQUaeSZaBRA1sGpgsd5sQdItoLOEAoF1JFaC5IomazyPeB3Nj4bm2VyVf
	 E6GJxJshF0+SO4EYZwAWsAoVpN2x5c4j8HuyTFhLjzn4Sw0HQ7CuZN7q4OMHZX2qqc
	 C44XvX6UgxuM8JLsrmuETPXpcnXpXQ5lw+fjzlMIFK0IUpT5y5Ln4vfo6BHxYxv9Na
	 WKpkgdOKB/7JN6NrwST5ULg/J2lO4iacVqItOEFwFxUkE4IhVqTz0K5ux6tyElmr9q
	 hz+MXj4GrCvog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8524FC7EE30;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:06:55 +0300
Subject: [PATCH v3 01/11] dt-bindings: serial: mediatek,uart: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-1-8937cfa33f95@proton.me>
References: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
In-Reply-To: <20250701-mt6572-v3-0-8937cfa33f95@proton.me>
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
 Max Shevchenko <wctrl@proton.me>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=1028;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=DJTTfnpTHaaUzlVzY+8JNLh/4at1AR4THWvuXGzVm7Y=;
 b=jY7dQ+VmxolwWDt2wWLs6DJKybVtWuVif4gOjkoP62pOWKSamxbv9qGqC87ymozsEZWxGYIXV
 c93MdjqbOHeA5KjpONDv9xTXLgci0Mz4POuidVFWzznzKG+MdZJCU6E
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_230700_469044_3E10F6DD 
X-CRM114-Status: UNSURE (   9.22  )
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

Add a compatible string for serial on the MT6572 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 1b02f0b197ff46e3530372d1d9303210cca9c2d5..fe283494188dea64bdfdd34a781bf54c8cbc1f05 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - mediatek,mt2701-uart
               - mediatek,mt2712-uart
+              - mediatek,mt6572-uart
               - mediatek,mt6580-uart
               - mediatek,mt6582-uart
               - mediatek,mt6589-uart

-- 
2.50.0



