Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54209D7833A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCcZcsDUfSMN7h8CDWrrVIMBRDhDiBJ6Fi5L2DdvJHI=; b=iZwfmgcPlsRYEWnkChBq7K9ZTH
	dLvPzmjPkPFUDI6O5ZTq6XozA0b1FNGuQEEHZ/anbG66jhWmeZELNkmC+OjQVOtbnWe8CUYe6pvNw
	X//dS+p9UXjtKkOij8WcICBwcT5xiS4bVNBo0qxBL0C9ZQkCkdqHpzTPPbuUEf8ETxDKjTyerzyYk
	63T8Xz9NpPnTmgVFrTqJimT6EQZtdcjMSeemnMUXhi9UZ6iWPjyN1ZQ3d9yRo842hQssuY1CTRyIV
	5IWodXjZ3WrskIsvrM3AdxT2nE/0Ug19e5olT3XMnqA3/QhK4qqg28XHPoSeewD9yHMgGq2dTdRt6
	wh+5cZQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9Vy-00000006teF-3mmg;
	Mon, 02 Dec 2024 16:43:14 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9JV-00000006r1I-27Hg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:30:23 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by laurent.telenet-ops.be with cmsmtp
	id jsWE2D00j1yjZj401sWEem; Mon, 02 Dec 2024 17:30:16 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uA-Ls;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnO-JV;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/5] dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
Date: Mon,  2 Dec 2024 17:30:07 +0100
Message-Id: <d553ef4b1f969f72e384f274d42ac7a62fe45fd4.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083021_706913_012A8392 
X-CRM114-Status: UNSURE (   8.67  )
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

Move the R8A779G0-only White Hawk board stack section up, just below the
R8A779G0-only White Hawk CPU section, to improve sort order.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index b7acb65bdecd2a38..dab6667970325dcd 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -360,6 +360,12 @@ properties:
               - renesas,white-hawk-cpu # White Hawk CPU board (RTP8A779G0ASKB0FC0SA000)
           - const: renesas,r8a779g0
 
+      - items:
+          - enum:
+              - renesas,white-hawk-breakout # White Hawk BreakOut board (RTP8A779G0ASKB0SB0SA000)
+          - const: renesas,white-hawk-cpu
+          - const: renesas,r8a779g0
+
       - description: R-Car V4H (R8A779G2)
         items:
           - enum:
@@ -367,12 +373,6 @@ properties:
           - const: renesas,r8a779g2
           - const: renesas,r8a779g0
 
-      - items:
-          - enum:
-              - renesas,white-hawk-breakout # White Hawk BreakOut board (RTP8A779G0ASKB0SB0SA000)
-          - const: renesas,white-hawk-cpu
-          - const: renesas,r8a779g0
-
       - description: R-Car V4M (R8A779H0)
         items:
           - enum:
-- 
2.34.1


