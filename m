Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C427D78337
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIkRWnMoa4zJ5ihs/Y6qPJQo8vH0DLbKwdLGSTTtlI0=; b=4ize3VYOLe1ovv+cFf27XpV4xa
	Ve2EdIhl2oLWMbwUeuJ1NJa5tgHzsz5yBvz6Me3yiN9be7WAYusT4OdCfuAc5fkTYTlh5ZMDl3jHc
	MplTm9tur7bIQDZrgAonIND2HSBTAOz08FDYCR/Pu9fmPbA0j4mmhfR2ODaLF9uOpT4Jg+Qbvxdc0
	ZJIJeRkwm3IzzQqXZQVIj1OmJt66em5t7hKPwZaIXcU9XU39TiU8ulmAvkq16D/EAYiqoG1aznbNs
	2KxitCPS0JCUFgCfkV5OAgPtsIEK1apubS3+Lkgsm6+nmcEt0oa1YeSeyrUOs9m985zoJr4yEKzsx
	II5KBOpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9U3-00000006tIX-2dcm;
	Mon, 02 Dec 2024 16:41:15 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9JU-00000006r0T-2yWJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:30:23 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by albert.telenet-ops.be with cmsmtp
	id jsWE2D00d1yjZj406sWEyJ; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uE-Mt;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnS-Ke;
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
Subject: [PATCH 2/5] dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
Date: Mon,  2 Dec 2024 17:30:08 +0100
Message-Id: <1d2d2a6cbf31c817f574f6eed310a960e6175afe.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_083020_885781_8F5CDD52 
X-CRM114-Status: UNSURE (   9.21  )
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

Document the compatible value for the Renesas R-Car V4H ES3.0
(R8A779G3) SoC, as used on the Renesas White Hawk Single board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml          | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index dab6667970325dcd..0f3fa341fd87924b 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -366,11 +366,13 @@ properties:
           - const: renesas,white-hawk-cpu
           - const: renesas,r8a779g0
 
-      - description: R-Car V4H (R8A779G2)
+      - description: R-Car V4H (R8A779G[23])
         items:
           - enum:
-              - renesas,white-hawk-single # White Hawk Single board (RTP8A779G2ASKB0F10SA001)
-          - const: renesas,r8a779g2
+              - renesas,white-hawk-single # White Hawk Single board (RTP8A779G[23]ASKB0F10SA001)
+          - enum:
+              - renesas,r8a779g2
+              - renesas,r8a779g3
           - const: renesas,r8a779g0
 
       - description: R-Car V4M (R8A779H0)
-- 
2.34.1


