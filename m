Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615EFC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 11:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JrZ3boJDSRsFcEY9SP7PzAP8ILPuXZ8FA9GHEVOgsY=; b=osZifS/D0HT8dG1Kht4QazwtBH
	4Eeva81r23Fj6SRnAFZql0r+RTbMf7bTZXJ8tFufpp1BZYvNl/NfRfr4eZN64WtOmfxjVOqhYpYMT
	ZN8NltSf8+t0KgIdeRuWaf6Me3clVY2W1pS5VzaYgCVOenwVAgfa+VXApoVQD+njnsLtIS+VnbRbZ
	1yuDjeCTL0It/tyO7O98yn3vhkrJuzGcZbFz0mVs9GccAGrAsScN8/s4RLT0EC411TF9ySGx8Rgoz
	AqCoSk3t1w26GdwsuDpy3ryFP6I/1Lpgtt577s6jy+FCW9WtnHOCamAnSthCDKR2ef5z0cOuvJXVX
	uOx9VFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvri-00000008Aia-0RjO;
	Wed, 02 Jul 2025 11:43:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv3p-000000080Xp-07VF;
	Wed, 02 Jul 2025 10:51:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 19F2845D2F;
	Wed,  2 Jul 2025 10:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E7EA9C4CEF0;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751453488;
	bh=+2XzKppmwhQYzDFY8gVFCwStqrtJMEoTwOQNBbMYX/U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fG7QNvW/hpPcBygZdsXHywQgu2PN4mjiSzQJsc/eBww186il93wr7o4rJoOf5nbQI
	 tNWrNMSbkTiFScstek/0H/IcN45b4FF79+5MDAs1ezUfs5LdGVTVuj95cLtWb11K/L
	 ZFBCRP9kwml9+ryaQpzF8/OHQZzapN9gXSBbj89tCM7YDxT6fLmBrNpYOpFICAAu1/
	 vhW5fvjdW+ETDXIUIws6AXf8niHqIC4XkLqLH8eAuqjc6F4bPvtLHlRbm+gukilFgl
	 H4QF1Iif5b4WRwhCRLit5nCQYML639Bikeuz0GEpk2F0J/4XiHVzi2YC8AXkjACrV/
	 HOgAFvZXh3z8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86A0C83F04;
	Wed,  2 Jul 2025 10:51:27 +0000 (UTC)
From: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
Date: Wed, 02 Jul 2025 13:50:39 +0300
Subject: [PATCH v4 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-mt6572-v4-2-bde75b7ed445@proton.me>
References: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
In-Reply-To: <20250702-mt6572-v4-0-bde75b7ed445@proton.me>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751453439; l=1128;
 i=wctrl@proton.me; s=20250603; h=from:subject:message-id;
 bh=ctmiRMyUECT6RxIRfZlrUhBmOSzsSLv8C2rWtsE6Z0w=;
 b=U2rD1Db76tUh0loLEQuBHItVbuPV3gX9NmgbpztFUtZbhmIJHx2Xo80+cYkvgOU9Lp3qT+uNS
 dcf8/MbMbEZDUkNmElIDDTcV1+ejOdqjS9ixQ8XP5dD06oG5nEogOfb
X-Developer-Key: i=wctrl@proton.me; a=ed25519;
 pk=JXUx3mL/OrnRvbK57HXgugBjEBKq4QgDKJqp7BALm74=
X-Endpoint-Received: by B4 Relay for wctrl@proton.me/20250603 with
 auth_id=421
X-Original-From: Max Shevchenko <wctrl@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_035129_105992_98E75FC8 
X-CRM114-Status: UNSURE (   9.17  )
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

Add a compatible string for sysirq on the MT6572 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Max Shevchenko <wctrl@proton.me>
---
 .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
index 123d24b05556c67374fbb87abe5e16c65031d2ed..30d76692ca87b507900076cd2f7d2e7ed2605b33 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml
@@ -21,6 +21,7 @@ properties:
           - enum:
               - mediatek,mt2701-sysirq
               - mediatek,mt2712-sysirq
+              - mediatek,mt6572-sysirq
               - mediatek,mt6580-sysirq
               - mediatek,mt6582-sysirq
               - mediatek,mt6589-sysirq

-- 
2.50.0



