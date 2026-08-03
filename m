Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBE9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VN/XifTmcyL8U+YnV4Id202dxfpcYpR2oDuyUfOryfs=; b=ArUQBzNtUQfrhILOpovKes7r4o
	N9d2zChzs0i9OtXbGfp2bkLZA0kfTtHWQkarGx7hpxyn0n0rfyJZ1HcZZFl1d9x3mvVEhmABSnJlO
	AUUwuV50BxKXOGWA4lsRgFItTtDlsxA0SisgYmOS5D7E9LtuHgIjqcuCW8ksjD8IoImCfwM2gIXkS
	GpW1PtbJtLW1f+rcrk/9A3TSMXCoi/cXnShz++ZQhf5mdc2rnRJXWrndVZsNhQUj1GnAWxL1QxnR7
	Re0JD+AldHWwbv92/0QW79dcZk3lqVDc4J7aqLiut3ayRbBxRLB/wuQWPNXWlMcLZorqdOjQdQb0X
	eEWf/kyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrU6-0000000GzcY-1ZXT;
	Mon, 03 Aug 2026 12:09:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrU4-0000000GzbC-1do1;
	Mon, 03 Aug 2026 12:09:33 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN/XifTmcyL8U+YnV4Id202dxfpcYpR2oDuyUfOryfs=;
	b=Tkn3j+VC66jGW25t5Eds1Z696iRBn9ejAh8Y1TQrMkMukRW/hosrjtEQAi/P88MBartGKd
	usYUoT6kU3IPflC2BHrYcIcaWmkeaPp/Twh8xE7TmtjjEsIZ3WjIb/6Ue8j1zXjEG7uP5K
	XlTj+E4IHp16R9BYVNtGzOswN+b60fMNMjD2+D2K66meImfkc+trYcDBKJNSEN3EzZ9Gp/
	GRrW14XjT6EVFnUGGOQEnhZJfEH41YyvW1HUuAOQUdATN4RJAvKjDoCw4QtVLQFkaA20Zu
	Ebbe8swHJf8nsr/foVb5ywo5Ofsa7+trjjmgRZ7R+vZCJ6FGF26DHt2LJkzckg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785758969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VN/XifTmcyL8U+YnV4Id202dxfpcYpR2oDuyUfOryfs=;
	b=4zRGa/VCiFiuFdqpvv4oeEOvnpzuDQv7YAZhpUsocbeRZwtnThpwy04ReqWchTxu0iT3Xr
	IkkbsOrvpD67jvCQ==
Date: Mon, 03 Aug 2026 14:09:24 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: bcm2835: Add Raspberry Pi 5 d0
 Stepping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-bcm2712-d-stepping-compatible-v2-1-803017e4ba7a@linutronix.de>
References: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
In-Reply-To: <20260803-bcm2712-d-stepping-compatible-v2-0-803017e4ba7a@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785758968; l=923;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=XG8BGoZ5rDHN9sieMM8ydUYdrNf3LVxIyfwS7rX9x54=;
 b=Axi8nMAvk33K60m23y5OxmVYGDO0qmKaehAY4lvSNQzmcqeO7Yaxiqi1xMcY9TR6GnObZ3+WM
 FS6qiac2SNlCBEYoGMtiqwNZOiHR6yyPgqreDEqE36zQRShUdiDq9TR
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_050932_580256_FC5D648E 
X-CRM114-Status: UNSURE (   6.91  )
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

Add the Raspberry Pi 5 d0 Stepping to the schema.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
index 2729a542c4f3..32e1b01676d6 100644
--- a/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/bcm2835.yaml
@@ -29,6 +29,12 @@ properties:
               - raspberrypi,5-model-b
           - const: brcm,bcm2712
 
+      - description: BCM2712 based Boards d0 stepping
+        items:
+          - const: raspberrypi,5-model-b-d0
+          - const: raspberrypi,5-model-b
+          - const: brcm,bcm2712
+
       - description: BCM2835 based Boards
         items:
           - enum:

-- 
2.47.3


