Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119E4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8Zh8ypkR+J0IaKNJxzzlPYCPVRTl41mdQZpe5rZ0RY=; b=qE4dL0R3NXQcthmYUnJIuzUM8C
	qioR4OsXCI9z4bLHxz5Rg6FPd8UiAiEFpPjhs2b2oYi1lgZXN5XMMvIVDkRkFSniixznr4UWalXJ8
	kbK3kENKLNbWTowv7PirT2+6G9HaayLtcoc1j5xY+kdmgrn9kL0x4rUvCxHH63WTwG+XW29OoZZCZ
	Jc5/9uz/+urKMqFsDkTmVxm0oj8XM918GP6wTqctco0PLxKDToLzsjMd5cJQrXuFXT7QJkCrGFYg0
	hfqsMtM189IZaGJWBSNLXg0xWutcfDvQBpvAdtI7DFLOvRF1lSbcMuGxA3eSjnvB4YxmIrKUhyLK5
	2CVUp1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA89E-0000000Dqad-4ANZ;
	Fri, 25 Sep 2026 15:47:40 +0000
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA89C-0000000DqYX-25zK;
	Fri, 25 Sep 2026 15:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1790351256; x=1790610456;
	bh=o8Zh8ypkR+J0IaKNJxzzlPYCPVRTl41mdQZpe5rZ0RY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iZ89KGIjCJWXaHpaBI0zozH+neowocRAwKmnu47Nn5SH8Vg3F3TjgmhtZz50dSZsv
	 F98On0zzVUYVD4EN3/b5GWnNOWZAMveJPLclB3KwiFuATTUO2dvLQyRNUZmhsuf6h/
	 w99boc8s1q31UdQYr7cZLO7+abSeyuVeFVo1vgl9ITtFBOM8WdGsGy5GPtQyyAIP2d
	 kfQyWuyOELm0pBN3LAtrc5vhZ1z+3n6mY4jXKLMSCBCLgeMp+PxUrqmTiIPnEeHO+G
	 ZpHgg4w8EcMxNSIg6c0HyxcbtHVsgV59gL+Lrh720VVzPDhsgE16Y5CV+EioC9/Aya
	 MCOXJmx0LQEbA==
Date: Fri, 25 Sep 2026 15:47:30 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v9 4/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl: Document MT6765 pin controller
Message-ID: <20260925-mt6735-pinctrl-v9-v9-4-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 3185e857cc74507ae0ff4b9cdae055562fce3cca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_084738_697760_918F8422 
X-CRM114-Status: UNSURE (   6.35  )
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

The MT6765 pin controller has had a driver for a while, but DT
bindings were never documented for it.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  | 36 ++++++++++++++++++=
++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctr=
l.yaml
index 4df6971030416..94117008ebf9f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yam=
l
@@ -18,6 +18,7 @@ description:
 properties:
   compatible:
     enum:
+      - mediatek,mt6765-pinctrl
       - mediatek,mt6779-pinctrl
       - mediatek,mt6795-pinctrl
       - mediatek,mt6797-pinctrl
@@ -61,6 +62,41 @@ required:
=20
 allOf:
   - $ref: pinctrl.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt6765-pinctrl
+    then:
+      properties:
+        reg:
+          minItems: 9
+          maxItems: 9
+
+        reg-names:
+          items:
+            - const: iocfg0
+            - const: iocfg1
+            - const: iocfg2
+            - const: iocfg3
+            - const: iocfg4
+            - const: iocfg5
+            - const: iocfg6
+            - const: iocfg7
+            - const: eint
+
+        interrupts:
+          items:
+            - description: EINT interrupt
+
+      patternProperties:
+        '-pins$':
+          patternProperties:
+            '^pins':
+              properties:
+                drive-strength:
+                  enum: [1, 2, 4, 16]
+
   - if:
       properties:
         compatible:

--=20
2.55.0



