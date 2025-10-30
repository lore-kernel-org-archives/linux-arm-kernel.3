Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C21DCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VWayaQmqCnxcOTdYBQlHejZM4hZuBCXWYqv+/vQINBU=; b=JvhbxbZUGQxXoYNju0eMAuRieH
	7RsMj9w5wkPgILfJ4htx3IoDijESC6lZ2+y4eNollBZlE5TbiyYdj6lMwIUZQiGAgom9KJ46AeEvd
	0LHz+ynN9/AvwzuWkKxT9F6onCBOIJiWC5ZkeYc+OBllZioYiAn/yXJJFU2faMFCe8n9kadicuMUP
	V+tyY2Q8maLmSkIsgcoit8jJtOSBj/zCq3JMdNwm0oTe/UixIpGb72bqoqkassW0GzQ2LAuAwHa7M
	dHnVW2722px0GSZB6hsPoxapVHkGEqNcVjr6YT7xC4MmmafDEqJYvj4nrsSO+aWvJMBKM9/gtJ1lq
	Jirtgj2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPrW-00000003z1r-2Gmc;
	Thu, 30 Oct 2025 10:26:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPrM-00000003yyd-12CJ;
	Thu, 30 Oct 2025 10:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761819981;
	bh=JCjlJekAh4Wl54nl2fNdsos6xlZi3Ti+2PaJybspVHE=;
	h=From:Date:Subject:To:Cc:From;
	b=ff3p6CqXhg/E2ZGHMuLGnCLnmA6o/02JheqtBCBqkxrF4LfK+ezmX022fEN+Kimnw
	 3LG+2fcZRH/rly3oH4seH7AP4Vu8qJ+gQ4Eb6FoAIC5ED9tVrHkzrsvXlBfTlIZMD5
	 wUCCU6XuQ72bj19eLHe+Cbgiic2thbMMqFMTn76aHmLS4y6Xjci2hwhG0cjCbZSUtY
	 uLeHsAVmQA5/ZTT2IMdzcWgOn4pKYGxt+CSsklXvXiXQRMFuHHC+LD2tBMCH0rjElk
	 Y1K7lMv1iOerjiYC8TTkQaTDjiF8L3Wv1RClTemV1hWQ4Jz9K4D37u+ygTN2LBi33z
	 wgjy1BJT70eRw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFDC017E1324;
	Thu, 30 Oct 2025 11:26:20 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 30 Oct 2025 11:26:10 +0100
Subject: [PATCH] dt-bindings: nvmem: mediatek: efuse: Add compatible for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-mt8189-dt-bindings-efuse-v1-1-1148e474a9f5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEE9A2kC/yWNQQ6DIBBFr2Jm3UmAhipepXGhMNhZgC1gY2K8e
 0lZvp+8/07IlJgyjN0Jib6ceYsV5K0D+5rjSsiuMiihtBTKYCiDHAy6ggtHx3HNSH7PhFpK2wt
 vHr0WUPV3Is/H//o5NU702WuhtBGWuWp2C4HL2EU6CrbKXcB0XT8DKplWmwAAAA==
X-Change-ID: 20251029-mt8189-dt-bindings-efuse-511c70f96750
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761819980; l=1163;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=JCjlJekAh4Wl54nl2fNdsos6xlZi3Ti+2PaJybspVHE=;
 b=v5rnldqSZgYyHEVeUCdz6Z+hlMMe2Wac0DVshUTNWz0qfFdHi/XPksJZ40GguyKyR3S7YcmNm
 bSvbpvDu3KRAOcVWD1jst2/UdUR6KfYYjY7BWpZwm74z9ufwvOTdnbp
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032624_455047_E559537F 
X-CRM114-Status: UNSURE (   9.28  )
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

Add compatible string for the eFuse layout on MT8189 SoC, that is
compatible with MT8186.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index 4dc0d42df3e6c3bf066a7109bd72b577ff7220f1..577295fafb9b1fb91d175d085c0beb3918c35e4f 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -25,7 +25,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: mediatek,mt8188-efuse
+          - enum:
+              - mediatek,mt8188-efuse
+              - mediatek,mt8189-efuse
           - const: mediatek,mt8186-efuse
       - const: mediatek,mt8186-efuse
 

---
base-commit: d78b0fee454c25d292fb6343253eca06d7634fd9
change-id: 20251029-mt8189-dt-bindings-efuse-511c70f96750

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


