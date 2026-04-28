Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55558FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qe8+erd3ATmRXcw/RE05XoQwx+r6eTzDQ+NZAClJ7ws=; b=zR/KjG+7bCFI6HCoB/oRvWHiz1
	F/cwQVyxaxk6ya/yZSLKlNQ+A+Ent3z+7pV8yKZ9FHo+5dNN3ejVzRnlq/OaNKGN7CMgYAK6dLGJu
	T+xSR30pgf+pbtXogXnZyBU6mronHV4flJ55rkGiLnvdH271qpv36mN8sAIkZEbuXfgUKuLh8i1YZ
	9XmVMp5vUmM44X6O/J/1yTBq/4vtLPChQb/OpPu/edt9jF99gVcp1atixLC8g+YviiFuBWROk89yl
	rE+uNbtLzLZYZOyKm6WUjfKrcN3EpBEVbNm7f82o9XsJ7LWPP5O125pnN+5RSnfx/ZKabOYU2BkW/
	f5ANHraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlJW-00000001wEd-3RjO;
	Tue, 28 Apr 2026 16:29:34 +0000
Received: from s106b.cyber-folks.pl ([195.78.66.88])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlJS-00000001wBW-3NKg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:29:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qe8+erd3ATmRXcw/RE05XoQwx+r6eTzDQ+NZAClJ7ws=; b=x8GowFnrAjfX8ib/qwlXmO6cnM
	wwzYEean0JaCy0vYjT6nXjrGzDQelBRPnVfAZkWUjte2g4BWVtYKsp06Z8PfcJsHP9VFWd/u9ZeUI
	1R2cst1qfcASPkDEwxpHMu7f8aj2psVx546rdPO0hqWCHvAf8X3f+DzLXonr2L9B0aJPt2sre8mlG
	IYAaeo0Y15C4gomD9fZj9J04u6NiJ5yULl6n8VG7rrmuU+PH+MVhi7zO+YghmxieQuoEme5WTqjB8
	tJeUn9MojQPlK5xnlbmoK18Xg2q+Tfn+0NK146Oz6uOAkUn7iuVNLzNTf70drDmHHt9JfSfztEnk1
	/3URn4kA==;
Received: from user-188-33-36-99.play-internet.pl ([188.33.36.99] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1wHlJQ-0000000Ay6i-1iSc;
	Tue, 28 Apr 2026 18:29:28 +0200
From: Michal Piekos <michal.piekos@mmpsystems.pl>
Date: Tue, 28 Apr 2026 18:26:58 +0200
Subject: [PATCH v3 1/4] dt-bindings: timer: allwinner,sun5i-a13-hstimer:
 add H616 and D1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-h616-t113s-hstimer-v3-1-7e02178a93ee@mmpsystems.pl>
References: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
In-Reply-To: <20260428-h616-t113s-hstimer-v3-0-7e02178a93ee@mmpsystems.pl>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777393718; l=1635;
 i=michal.piekos@mmpsystems.pl; s=20260301; h=from:subject:message-id;
 bh=qh9sEc57bKsGot5lE2/m8eNigSmNqLcdmef/IL3Fdfc=;
 b=qZpLCw+wrAJsF4G8/+1yRLu0Hy+1pGSqIursXJzKh2gfawBEHa96O7LKTtjNdtJ3/lkXgakcC
 ggXYALl7/QBClz8aezK217dHYM0oQZH0QAzwDhORe1NZCfFzvo7j7tA
X-Developer-Key: i=michal.piekos@mmpsystems.pl; a=ed25519;
 pk=Aixyx03If7ZDamiKKN0lsa+0mtA+WjIuIf2ZQVYNBqg=
X-Authenticated-Id: michal.piekos@mmpsystems.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_092931_020602_6118B264 
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


