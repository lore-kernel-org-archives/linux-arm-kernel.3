Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA32CD3442
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qe8+erd3ATmRXcw/RE05XoQwx+r6eTzDQ+NZAClJ7ws=; b=0syyIZYPS0TKkrO1Bwy8kNPtdz
	/f/gBk9SJbXPYutltapOtgiTGGEilMdl1iJ1E0M8XnnTFXSTaQViT7zaU4KIoJsrqoVVG5Ir0bg7m
	zCr0VP4g/aXCu9rLvmAPkBObieeXAKcRMUp35jt3PBsKdruyR7nG/jK7Qx6d+zqwFUHMfUhm4ovqb
	imdY0FKQLS+MHJ0oJtOH9rCZe2E3AR0Fj88YA/lYicQ2LG8lgqozKorkpeCqFr6ZYv5r1g55fFkG2
	fxmT9DGhtDVXF6Hs2Pv300Yv/rj1t0WYT6gYhcEdleS9mKlAdkUQFv0GRouO+nQgI3I2XB5PjNekt
	R191UiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdtq-00000001Fqc-2zCp;
	Wed, 06 May 2026 15:10:58 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdto-00000001FnN-0Aum
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qe8+erd3ATmRXcw/RE05XoQwx+r6eTzDQ+NZAClJ7ws=; b=aupmFI8GCa+7MruzjqPKwv7Gfb
	g3fnFfM/30mzXt3+HIIUayEVMnvsvkTVnUQc+RFoLD1rsgoGoX8Yo/9VFBh0ix3tSE0W5GGYal61Q
	094lVI8BoxA6DFRv/7HgrwbdEWcPyjwd/wFeGlPwYUX0vTlo+GUUW3prR1AHzIQhBjmZwSQu3ssXm
	+XJz0T1Z/0nwXgUgbuAsUih8KjdWEZ2kqvZzdJzbYU5R81XRWf4CHb7Lkn3yyLH/3tVwoj+GO2w+g
	q2HWtix6JjBO7I5H4Hi8573B7HkGMzjOoi0kV26YNMxp+Vz1GGn9mWVLTl3N9gQvGXz1MBuxTRwRb
	eNXGdSiQ==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wKdti-00000003atJ-3FO5;
	Wed, 06 May 2026 17:10:50 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Wed, 06 May 2026 17:10:26 +0200
Subject: [PATCH v4 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and D1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-h616-t113s-hstimer-v4-1-591d425863d6@mmpsystems.pl>
References: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
In-Reply-To: <20260506-h616-t113s-hstimer-v4-0-591d425863d6@mmpsystems.pl>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Andre Przywara <andre.przywara@arm.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080247; l=1635;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=qh9sEc57bKsGot5lE2/m8eNigSmNqLcdmef/IL3Fdfc=;
 b=cPaaaYLo5ADrTcyLAT6CZyP+LM1sUg2xNixGvhiLKQyIIQNuR/nvMdpg41TJhY1tJnhYX5yOJ
 /lpcITM6KMCBl2DUeBuqVIpRh0yDBX+aW/u17cHbtrKETPqzsTDy9uS
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_081056_424909_E0A9A683 
X-CRM114-Status: UNSURE (   8.98  )
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

D1 is similar to existing sun5i, but with different register offsets.
H616 uses same offsets as D1.

Add allwinner,sun20i-d1-hstimer
Add allwinner,sun50i-h616-hstimer with fallback to
allwinner,sun20i-d1-hstimer
Extend schema condition for interrupts to cover D1 compatible variant.

Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml   | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
index f1853daec2f9..3e2725c56995 100644
--- a/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
+++ b/Documentation/devicetree/bindings/timer/allwinner,sun5i-a13-hstimer.yaml
@@ -15,9 +15,13 @@ properties:
     oneOf:
       - const: allwinner,sun5i-a13-hstimer
       - const: allwinner,sun7i-a20-hstimer
+      - const: allwinner,sun20i-d1-hstimer
       - items:
           - const: allwinner,sun6i-a31-hstimer
           - const: allwinner,sun7i-a20-hstimer
+      - items:
+          - const: allwinner,sun50i-h616-hstimer
+          - const: allwinner,sun20i-d1-hstimer
 
   reg:
     maxItems: 1
@@ -45,7 +49,10 @@ required:
 if:
   properties:
     compatible:
-      const: allwinner,sun5i-a13-hstimer
+      anyOf:
+        - const: allwinner,sun5i-a13-hstimer
+        - contains:
+            const: allwinner,sun20i-d1-hstimer
 
 then:
   properties:

-- 
2.43.0


