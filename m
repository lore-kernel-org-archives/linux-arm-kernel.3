Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90591C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdjfJuwG39xJ8UKBBZ3B2DmqMr8Iaea2RjCzPLpqpn8=; b=gPkK+cIvbGub/VzsqN8Oo9/4OD
	5FHBo4IxMIj9ZA66M+FWWbbJdWeiCaFzpDEtsbdc4YHux201KSJzGQOjYmxeS2L8R+INwOfhiIq8C
	mMoQqgdnm5fufp9dN+5qX0pGQPW5juf1JGywFqAU3WQJ2aqQAH7POPwZnwNdjk8MV40uY2oVIyAqS
	7ovGkIyFMlo1gn8BPBQqL9pJ8XSkeFwGiJos4wr+yKhuNUtvQDiPjE4Urc3YPrsj5Sk9vQm0PiNeE
	bvYGJnO+zq4i3p1/O8Z0A2QvFcvSfrMZZN9IRE/DdeZbDs+S/X+TPJr3z3u5Vg339GffsQj34QHvJ
	2s60tcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xrg-0000000546C-46Wl;
	Tue, 22 Sep 2026 10:36:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xrf-0000000544i-2uUz;
	Tue, 22 Sep 2026 10:36:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0016960DFF;
	Tue, 22 Sep 2026 10:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA7D4C2BCFB;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790073402;
	bh=dDQekg1LQlY6rPoeTkrWeGq/YZnkxUkZ48YS2x0iegc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iOBPMOzRtTyRPfojvnBiE1w9TXJLQrrlHasnxGlUnzJi8vn0btL1oqHASMoExQJek
	 bmuil3fJVLZ/pZdnnc70aBDduGLiTTZPG3TIkcWA47PkbfDY9Qca1+1/5o0CeW0sYK
	 2CRhHvoJhbOeyGe2nDfc3vUymWbj+UgqIJJF6DOb9vDgq78E6v16fnL+URPFZQVAJz
	 AlIMC4BYvUwNZO4d3sepbnrOODCQDqpPYsD+6ccMElz0obEoU/6XP8oE9jymhztUCE
	 IqdqwOaUDPYxn8klqh5L38fjMO7QWvJ9ToFPFrzFDHMFnqNdwUIqx41RC0BDvv2Lh4
	 iWlfy20mcfOvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A682C982FF;
	Tue, 22 Sep 2026 10:36:42 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 22 Sep 2026 13:36:40 +0300
Subject: [PATCH v2 1/3] dt-bindings: usb: mtu3: add mt6595
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
In-Reply-To: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073400; l=868;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=0Wzms1rnoBQB2Z9NCd6dczMgNHErrKSjaFIHZnHiWu8=;
 b=u+zdx4TMBsgbMFqD4aogBqgvtNP2oLM0oap1dKWP/exd0ovNr63e4qRznv6SGBHlXhr73Y/qr
 e9yj169YIX8DiJ5Itz5VHLQjjySdfwzg22yP/gNw9Rt9Vhx5seUMy8D
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..4538df164a16 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2712-mtu3
+          - mediatek,mt6595-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8186-mtu3

-- 
2.55.0



