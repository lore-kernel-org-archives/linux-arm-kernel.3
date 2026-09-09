Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D0EC79FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcMFxiVz2lqIZ2Zs4wwq0LphW9NkjO8ysHuKadNkzJQ=; b=veupujdFYlnIeb+26xOpkTZu0F
	TjvKGafsT24pPqKJbW8KrXWC4+O3iXKPDOh2F3NFVFay3zruU9OFz6d0fAREgU04WsvVwlOZXdjKH
	c/u0cqg+hlAZeieBLBlh8f8GyWiZQsR7queoRWjKx1FQgF18FV+QUlkPTNzG7U+NwXU4QIuZsU/eG
	wSgRyuLIgOD4kNrGAwGJRx+eeCL5FtPvRXJRsW7Ed9H/03WXe0Ot30JV7eqUUjFymlpWqC414UMT4
	Q26GvRKs7IbtRy07xZmooTKhjHi2DT3gBBmwVltqgVFaFTF2q23qtuFfG2PDo4XbDDuoHC7eIszba
	/II7CA8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JN7-0000000BzIn-2xpI;
	Wed, 09 Sep 2026 14:33:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JN6-0000000BzHW-0WxP;
	Wed, 09 Sep 2026 14:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADCE643C39;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B167C2BCF4;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788964435;
	bh=P0YPesrumASY2chPhCTF+pggK8fjgG4J+tY6vpB+8us=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MIexx9cVy7xGow76/SZeKfZHD0bZaN92Lz8u260VU6kk5oGWWDNAQnZhgm6zCFj0U
	 KKcSy/HzsepwFMAPe2quls+aFTsqYUCvQ3pk2MPezEdIsc0Kn7ZFzXSR5yBPDtwlnn
	 4bDowvWTrzDLypaHuKE4Gbmb/yyLnrxNHXB9zk6n+fIM/ex56taQFs+1cd40pm3Qq0
	 R9rV8B2U/GrwkoxPaQibv0W2X8akOUWnaY+WDNMwtJIjDM/To3YS65QZ9+53YEuW7Z
	 3INbK1cFqr59EvzY2Mk7CT/lr/bGORH2oGtiPGaCGYZjxep6oOuHJNumFruWYtaDB/
	 Vtg1jVLXSrRWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65563C79FBF;
	Wed,  9 Sep 2026 14:33:55 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Date: Wed, 09 Sep 2026 22:33:23 +0800
Subject: [PATCH v3 2/5] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi
 R28S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-r28s-upstream-v3-2-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chukun Pan <amadeus@jmu.edu.cn>, jensen <jensenhuang@friendlyarm.com>, 
 Andrey Korshunov <razor1702@gmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=973;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=Al+UNS9q6dX1IoEkQ1GzieWtXOTRL+F7n2qKNKypKz8=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqyFeYE5T7cwyzTMcrwvk2Sezah6Lip800b/L6Kr+bnf3
 7nNLSPSUcrCIMbFICumyCK7qTpSaFX0zCIWqeMwc1iZQIYwcHEKwEROnWP4H6twYqnoMdddQmfv
 aKlp969MMC13FGA5qhoUGNr0ZcZeI4Z/ljdSjjY0PS35WK54XC3eoqmv7vEj5pd3DlyVENrkc30
 5DwA=
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: 安容 <HystericalDragons@proton.me>

The NanoPi R28S is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: 安容 <HystericalDragons@proton.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 81744fbee9..709e2cc44d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -347,6 +347,11 @@ properties:
               - friendlyarm,nanopi-r2s-plus
           - const: rockchip,rk3328
 
+      - description: FriendlyElec NanoPi R28S
+        items:
+          - const: friendlyarm,nanopi-r28s
+          - const: rockchip,rk3528
+
       - description: FriendlyElec NanoPi R3S
         items:
           - const: friendlyarm,nanopi-r3s

-- 
2.55.0



