Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC97AE8FDBF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 00:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw+5y3R0kTSdqcDsv14REm8Tv5VCzNn3NuHMmsWRQpE=; b=odT2a3f1jeSFtqyEV/18uHk/pX
	q6nSJwHSms77co4aj3GabDgKCEJnQ8hEK0QmjLjC3eb4ArNLykCFZYGV3/NlWGmhQqt6GKJUgy/NB
	UrsdWMRav5g8QxAPway757HH5/kozYrPApx0oo7zpeDBDFVDlh4DHjQRmdKTxAfXzvJr793P3CCWD
	IAVOzY0PKazXPE50ePfSg2PB1kzE3Mew/j4sv2Nb6moZgM+P97J+zSOpttEU5lZEmuPVBNS8WBaD9
	SDtmx6uwts6i96hPwc+fneLWw2ouWb1VY4Ydr8z5V1GuCDUNmrYp00kh0utWN6Z7TlvcdcOKigBjv
	MfxRSsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHnp-00000001Zqe-3oy3;
	Sat, 27 Dec 2025 00:05:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZHno-00000001Zp1-2xWN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 00:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E51A600AA;
	Sat, 27 Dec 2025 00:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AF99C19422;
	Sat, 27 Dec 2025 00:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766793899;
	bh=HKva6i0n2QWHJAyCD3QBZ1o6GuE1HuDjwucDRSmRXWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J2rDRChb/esOSNHs48NkmFSH5kwN93/VjAR/SS3/8TIR+rlEH3cV5YFRh4nrUUl9I
	 FN7zHRezmtjbLCFjXsipSbOD5O59Ms9PIA6rhxK0fks7HpotuSDdea+9L8ITqU54KH
	 kzay47+ppYHk/Z6OZ8pxzto7e4a/DB3DwTBgqWmPGfAGIvcfdGqRy9WtnMnGhnXpck
	 hqXVEf0JV3PnWqSLaZIuVghGWka+qlXnPxTQ4FQpgkPuBLq67GS10nWGWygyj96z6U
	 DWYYqtBK8Qhp+iT3lZzpWrtgVK1y9GvV5OZiGIVfZHBt4x4Uew7zjsIHEM5fG+4Pxo
	 9Aa5LNhoy3CKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB39E8FDC1;
	Sat, 27 Dec 2025 00:04:58 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Sat, 27 Dec 2025 00:04:22 +0000
Subject: [PATCH v3 2/5] dt-bindings: usb: maxim,max33359: Add supply
 property for vbus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251227-max77759-charger-v3-2-54e664f5ca92@google.com>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
In-Reply-To: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766793897; l=1272;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=se1BBXMzMiGyHHxl8V9uYfi3fuGUD7ZAOyoCsNRuyYw=;
 b=j4AA0FrIGm1HEYo0CXoXtdTb+vvKwbAD9xxssJeiOwX2BQ6A57QbUZ8vr3jlJi3ZIqzmcJ1l8
 oA3oGt70JXjC2GzCIGeuSSqPgScZPh/qwtAEopAxDxslOJ2RXhmXvUA
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
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
Reply-To: amitsd@google.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Amit Sunil Dhamne <amitsd@google.com>

Add a regulator supply property for vbus. This notifies the regulator
provider to source vbus when Type-C operates in Source power mode,
while turn off sourcing vbus when operating in Sink mode or
disconnected.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 3de4dc40b791..e652a24902ea 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -32,6 +32,9 @@ properties:
     description:
       Properties for usb c connector.
 
+  vbus-supply:
+    description: Regulator to control sourcing Vbus.
+
 required:
   - compatible
   - reg
@@ -53,6 +56,7 @@ examples:
             reg = <0x25>;
             interrupt-parent = <&gpa8>;
             interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+            vbus-supply = <&chgin_otg_reg>;
 
             connector {
                 compatible = "usb-c-connector";

-- 
2.52.0.351.gbe84eed79e-goog



