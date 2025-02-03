Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F1EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdYSrp7Ifw9Djz6sdTXRJ3gQa8DUAzacW2HnJguzAfk=; b=rACAHxUlfxRIN4gPnlmkeXCuUW
	qpP+a3lV3Vwvezc89san4rP0Kwb3z6HqrZ4XCAjxgdW930/n6GDeH+nvwMSb9W7dqu1JYXkh7Nzig
	34ZBL9KiO0FZkyU3r9zLdcBN60vlyV6+2rEYMFNmjW2DlVmKqOwM8+EpvA7HwF+e1sMuRkLxapyeg
	Ud484uMJ9BBI58lilMME7kzIa0AxvGYKV4xecpoUW/xAQ8Hqzx9ry9VCyT29NnvqzTLar0imwvUSB
	9XWlv+jjeyfUZvvMhmxaXbJ/qwcjv4GQjztGvdhRy4/NJN+SWYc/K8vv7Vqu6tE1ehYVbitK4u+Fj
	W1WL7VUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesa3-0000000Exqr-0qNv;
	Mon, 03 Feb 2025 09:17:23 +0000
Received: from out-176.mta0.migadu.com ([91.218.175.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesYi-0000000Exdk-0zun
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:16:01 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738574157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdYSrp7Ifw9Djz6sdTXRJ3gQa8DUAzacW2HnJguzAfk=;
	b=peRwc725+ZmRWNy7SYQ3ZOXQJPF5KwBLb6LFIQ4vY9Ok0YZ5/Vy/flKJqtq4xv9hVPn5mH
	7p1qE2k3oMjoa6+Uq9zO1P2jZdrsZbMyn5pvrJnzxAxWfqauNhFfdsMnGCHbvjVvUe+mSG
	kOT+cRg5S0y54Pi9LFf3tyybk9NmmQMgbrXXVxUimy5qAwRllOWsqqcUVuwcBVsdkRTTfb
	uJwLpdRJIrzAK7jPxcx31lU8lq3w5xD1+Obdk52V466qNx577INMpPQnrZ/5WmzFnBIyIp
	niFeT2LFqLG3Dy5rgLduEpQnLw50d1Yy0Cz/eiou8g6lTVL7jubCdhHe87B3ow==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Mon,  3 Feb 2025 09:14:52 +0000
Message-ID: <20250203091453.15751-2-funderscore@postmarketos.org>
In-Reply-To: <20250203091453.15751-1-funderscore@postmarketos.org>
References: <20250203091453.15751-1-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_011600_417056_812F9E88 
X-CRM114-Status: UNSURE (   7.17  )
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

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..3403362e0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -73,6 +73,13 @@ properties:
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXL S805Y SoC
+        items:
+          - enum:
+              - xiaomi,aquaman
+          - const: amlogic,s805y
+          - const: amlogic,meson-gxl
+
       - description: Boards with the Amlogic Meson GXL S905W SoC
         items:
           - enum:
-- 
2.47.1


