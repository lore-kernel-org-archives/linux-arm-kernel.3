Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67002CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fsE05mtpeYSMrNkfhhJj/U9HCrnKHaKUVGJOMD/RT2o=; b=ShghN3LlxAARcaljsT7ftZ1y2B
	DpFtEQclu9Qp6QhR0ENWQQMlbal1aMvhjSz9JNFck4MIsUiuR6nj8oclKDzFKnDS1/Il872eSHwDd
	ee2E6SYeP3SCLg/NNEoqCEjENlBtqEScmIsvct1QMScqowFDYo7fGhYd1XKntplJ+GiQ3oazYnJaS
	NIgEiJNJWYJsG4/mVDgfMtkS8PFCKiQuFwoOqV7aMW9E1eO3121sOmv3H22BNDWk6GAOnPtYkBFQO
	vQVbJmSTOSMXlDQ1YlO0tjxCwAAbWoD2cd4Zy8LsTy/MoesWmyVxUkI55d8zAp65sLa32jvzL/djG
	io230Z3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6Bw-00000001MAR-23WR;
	Wed, 29 Oct 2025 13:26:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6Bt-00000001M8q-0rXJ;
	Wed, 29 Oct 2025 13:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761744373;
	bh=CKjKWDSuFg61Q3UumaNfQrY9nYh58Mn1xSRT4RFKlfA=;
	h=From:Date:Subject:To:Cc:From;
	b=TUPCO2I/RFRnEZZh/BwABQNzIDTNAUn3iwfxUR2lpw5jKamLKdHYzJScfCsCcY0WI
	 rN1VZGXNXPAfQ7AoYpAxFcXLO9Ss3nM8JNXwKwTOPIPYmFx6f/1wSod+wmw+xndtLs
	 PC2elcimt/evu+6MNZPGuUmBp/brN8efDNZW5M964naogHwbH5pdtVUQr7qjeT9Hmt
	 KJPF20zTzkhSS/OOM2oUOJMcLVYn6uf2GQZ+G2dYL4ylZyeLhMjSwP2HfQ3Lyc0vCs
	 v0bkzsUo3f4Pi3mXwnoXnCn/TT1sS9VYpulbofCtj4tEXi1O6irFpJbAhHk0icnPd6
	 tbofaAJGYvfiA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B47717E1315;
	Wed, 29 Oct 2025 14:26:13 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Oct 2025 14:25:57 +0100
Subject: [PATCH] dt-bindings: soc: mediatek: pwrap: Add compatible for
 MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
X-B4-Tracking: v=1; b=H4sIAOQVAmkC/zWNQQ7CIBBFr0Jm7SRANZZexXRBYayzgCKgNml6d
 4mNy/eT/94GhTJTgUFskOnNhZfYQJ0EuIeNMyH7xqClviipDYbaq96grzhx9BzngumTbcLOWXO
 dzt530kK7p0x3Xn/q23hwpuerFeoxwmQLoVtC4DqISGvFfwXGff8CmCRP3ZsAAAA=
X-Change-ID: 20251029-mt8189-dt-bindings-pwrap-3ca97b4dd30a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761744373; l=1112;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=CKjKWDSuFg61Q3UumaNfQrY9nYh58Mn1xSRT4RFKlfA=;
 b=PtEPwukhbAFkJ1aMh8EEF3ugB3jaEJ4wWeZDUZrrokc4K8A1lDjWI7mN8u+mjQOC4B7Yp0IOO
 kKwUOLl9c1qBKgycdo89Rk988sOGKJJ7Ikrs7b4OvBInzxKh2jnGWvl
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_062617_429733_6FEDB027 
X-CRM114-Status: UNSURE (   8.93  )
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

Add compatible string for the PWRAP block on MT8189 SoC, which is
compatible with the one used on MT8195.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 54c0cd64d3094648844fa7b9fff44649a72ec021..e7c4a3984c601f36858908c1d974e7d5f3587838 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -52,6 +52,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8188-pwrap
+              - mediatek,mt8189-pwrap
           - const: mediatek,mt8195-pwrap
           - const: syscon
 

---
base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
change-id: 20251029-mt8189-dt-bindings-pwrap-3ca97b4dd30a

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


