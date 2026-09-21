Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C9DC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kWMUlyFZDu5I4TJse0Xdw6ZZGOr5Zeuzgrz0NVyny6s=; b=u12qlw5Ad9EFGRas/s459Sktw8
	C8PibzqXhbwGS50lwhcLudviXDqehrnWjhWPVMa1ZmQfMjXJGea/lrBRtEctwEzxb+Acq7avvVii3
	qXzoEKsQO9lhkbUoFaHY4oIA/sXCyKYQrlvBQLW+fyVMJtyRjqZiNNkFvKkIabtC/p7z6J+QJz96B
	dAyfzpvMakEpSWqTbLxb7qZwfQCZ29fZQyauylqJQYISJAyWAj1+3rgnuDQ9pylfV/gmuSQLzUjSW
	PtER23FujXwPXDClC85kYisQ6bSFVS6tcdEyuAKIO/Yb/1EYd3lqE6AvT5ykfm7zpoE+vjsNfRHFg
	e33Xe/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nPe-00000003fQ4-3j5E;
	Mon, 21 Sep 2026 23:27:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nPe-00000003fPp-0Xoz;
	Mon, 21 Sep 2026 23:27:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 905A960210;
	Mon, 21 Sep 2026 23:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D8E1F00893;
	Mon, 21 Sep 2026 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033225;
	bh=kWMUlyFZDu5I4TJse0Xdw6ZZGOr5Zeuzgrz0NVyny6s=;
	h=From:To:Cc:Subject:Date;
	b=QF0U6e5UMUQmn70x5QvQwDdf8QBnhhnrccAiyGBGj5QAYMyTzrg6V0jQeNHoNyQ6Z
	 /bXYrD792nkvXIl88wePsep83P8ZXr216J4E33UNQ5VdK3V5U2QuiiW1cxVco8BLyd
	 JaRAOR+NghpC6IJ+9LwH0hFwuMrsw8+HXxYOepQeOncXGJZGlsvHRHZ0OGfZSyjGyc
	 5xUKvnbd8vYjmWhaTH+1YJ2Nsvzz0y+MH3MCLweRPJ+pIEwPAN6PxDkUeiYWAC+5xF
	 jslkhZmh7H7fK2olUFhWuvfQgdGjrbdBClGLdmcbJHNx0sPcls5nJgacVpMhJEkD3u
	 f9z/Gh5nzvazw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gene Chen <gene_chen@richtek.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: Allow MT6360 interrupt flags
Date: Mon, 21 Sep 2026 18:27:00 -0500
Message-ID: <20260921232701.3133291-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

MT6360 interrupt controllers use either one interrupt cell or two
cells, with the optional second cell carrying trigger flags. Allow both
forms.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
index fb65abf30d57..828ed7f558f6 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
@@ -33,9 +33,10 @@ properties:
   interrupt-controller: true
 
   "#interrupt-cells":
-    const: 1
+    enum: [1, 2]
     description:
-      The first cell is the IRQ number.
+      The first cell is the IRQ number. The optional second cell is the IRQ
+      trigger type.
 
   regulators:
     $ref: /schemas/regulator/mt6360-regulator.yaml#
-- 
2.53.0


