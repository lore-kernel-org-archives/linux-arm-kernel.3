Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A4DC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08Z68xkx47+Cab9Wsv9Dl1iA6fUQYYq/k1v3FyBchXU=; b=Oc7BHcOheavB/XcZmvBWMf7T1J
	u0g+cJJ7Pev4m1mTS7tT58zqzz91L7EMv6QoxHoOx0vwVobcCZ4H1tGNQjgpe2uliSG2r3C8HNsqH
	XU4bYVucHyl05j5s9v0xLMRfW1Sx4rXVISRhXujNaVr0keU+X99f234SnBJQAOpyst2lpn1kZkGZj
	vmEiACgXJOyFAW9K3q6BkufjbvBBvNWN7/9pVa8EeZRkb5UpnNB153FXlnz7u20uP0mM3hLDrTb5m
	UzHJDKmZqjaWHwxb12iTONkeJA1A4Mn6cXz38zySDbTi2pfJeCoZv/+wptwdqMLqwScWnCx4HnQRv
	rum+ErjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUisR-0000000B8US-2fTh;
	Thu, 26 Jun 2025 09:26:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiMo-0000000B39y-3ZMv;
	Thu, 26 Jun 2025 08:53:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 493AD49F39;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25268C4CEFD;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928038;
	bh=ztVkrHzbAl+RXpVAVDHbVLbQtF9O1PCrZdEojFxodpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oi3wiuXqNbZ5dz/LL9XYJwSSRrqbAokMbuTXMOsFVQYCLdifxWBTr9rDpd4unikfg
	 To0ilKpQT8IejPT+mC4onfJNSspcd7utbVpecyTsBTe84mKJ44EGGABwwHA9wwZlah
	 dXzC6ldG5epk0aH6ers206Ptg2me2Sx+RUmo0NfhlxFSX1XLwKCxZLPxUap+fa035H
	 sSG4e9zv9P4AC8BzUaEYJvrsIJ0YOd3qwUXq/saAX5rNlw7UCN9928qDOeTMtJsaXi
	 EiBBYvb1mq8jBC/G63yKTu1d8lqNIz78WmwEF4RUVjTOP5mnA0C4UwIYLdO90JUCT7
	 gsO+bBJJTN/ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECC1C7115B;
	Thu, 26 Jun 2025 08:53:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Thu, 26 Jun 2025 11:53:58 +0300
Subject: [PATCH v2 05/11] dt-bindings: vendor-prefixes: add JTY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-mt6572-v2-5-f7f842196986@proton.me>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
In-Reply-To: <20250626-mt6572-v2-0-f7f842196986@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928035; l=891;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=f6I5lpvscqwzHCTgXJqDcC9IxNIHsBHQxvSbgtRH4Jo=;
 b=PzPH4fvxc+Q680V4FruDOeASw2yE6Gfs++tzHWhA5D0HUa9Fo+1x/5ZtV+xtxvPHxGczWHBDy
 k+eKBMV+tAeAnSxtVe18b10bLGpGMxEwUp73Hi1cg/cZjLlRd/hzP7i
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_015358_928675_3818DFA9 
X-CRM114-Status: UNSURE (   8.35  )
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

JTY produced low-cost Android tablets based on various
MediaTek MT65xx SoCs.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae217643bf7a63a471f74819d18238..517bd129288c96483ffe358127ce8e16f60d902b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -782,6 +782,8 @@ patternProperties:
     description: Jide Tech
   "^joz,.*":
     description: JOZ BV
+  "^jty,.*":
+    description: JTY
   "^kam,.*":
     description: Kamstrup A/S
   "^karo,.*":

-- 
2.50.0



