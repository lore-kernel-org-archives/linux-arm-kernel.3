Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C687BC8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyIbbp2/MCI6xzIi/BM69y0rEl8NqZyBK+6ZPo+WKzs=; b=NMC6fzhtf8qFujjuFuowLSFqtA
	9PYDFanUoPMrESf9K+c5HRn99jiWFB6r2eLMeFAb+0A9CEdm8pP/0cFYqtfo8sQkAxGn2Uj9WbPYV
	T/PY7OYrv8eYgQr+119uwwSSBdISwFp8QsUN19GaY4PSZBs/OQ72B9Iw8hp/9iQlzAC8nmlf47GeA
	1CsUcBe3ipajQXKO2q/yZT+qI1UUFNum1bW0fQgSeBN6AUf6cPTrnJRuTulNG7+G8JU9eDZ/5LxNI
	tFWXNr1QvjrRpX8SyM/AUd6YIosBKXkE9GhbAzEINFxHok86Pr5zQ6Cqn1iHrY5eFciueOXwbN8iI
	xmRLE/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVIR-00000004G3d-2tMj;
	Tue, 01 Jul 2025 07:20:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWU8y-000000046Kp-1jxE;
	Tue, 01 Jul 2025 06:07:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 284FC46390;
	Tue,  1 Jul 2025 06:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0FF4C4CEFC;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751350018;
	bh=5Pav8V9VB0A2Evtx5YnrsDuOOf1sUe6+PqhJkZFypT4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZVh8fn3T4zW6iHuT8wRYnefd9cyhL7yiljwZDUoJv0xsJ+4Q0cvkb2xcM9K3mgoEw
	 YlkT3HP7nlPpIK0qf6oLJl6sMZgtSpmmJd+mlc8MHU6DoE3UNEp/MFmDIiFV0zVt/9
	 AVSP8EVfpOEFtpn42rK6UP/y8Ty0a+mF7ipxyWqE3jwuVUQEfN4/WczpoIImig9YI6
	 9sFkSdfIWXRlnM73XyYNcrc3Won3W4yJteQYZR+Dl2qIGF7Ehr7JN9v+FDrZ7KIRak
	 ibFwQOkSOu3C9Bhle0nnzso7l+dDsr5g7Q3ij7/BWbQG1KuU3yPjydnpTvyiIDulyX
	 ZOWo5DE8jUmig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D62C7EE30;
	Tue,  1 Jul 2025 06:06:58 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Tue, 01 Jul 2025 09:07:00 +0300
Subject: [PATCH v3 06/11] dt-bindings: arm: mediatek: add boards based on
 the MT6572 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-mt6572-v3-6-8937cfa33f95@proton.me>
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
 Max Shevchenko <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751350015; l=1042;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=aasPAy4R2Eyq141uUK+jisQoQdVg2nuqlXN6Ma5cC9E=;
 b=fZeS3RZRC3LKqShMbyogasQH0ojFa++T6EM2RautMix1AyZiphvIcq1+Yvo4Jzz42x7uZeH9h
 8Tq65Nc76eSDGFAMAh62Gn1En1ctyXy9CsTxPjhmctYHB76qjRvVkVO
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_230700_510586_F67B7026 
X-CRM114-Status: UNSURE (   9.45  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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



