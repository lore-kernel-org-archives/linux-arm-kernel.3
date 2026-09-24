Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D2EC98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jQqmfAaeVxFx63q/PNA8OllCs8RmMsnfvjf9ZIRHQUk=; b=g6TuwxSjkz/dOcMz/5tGofJ1nk
	PgDenjojkTVQYSWvt7b/+dGdInz/kqSpQwPvbSZG7BbEVed87cIjC9YP0F9WWXoGYm+sCTE1G0+ad
	dFdLJfwnCozPQEUl2eoTS0UB+Rjp2uB28BULdXhmDOXGsI0n4b6qMJqY+y5vzJEnJdobl5In+PCMt
	sEsK9wEzWTMvXEkg3MLTh1mM9RG06QkJIj+141zirQk0OkyL/LXvRMUewfWOyf88kvwWuhrGn74Bo
	4WRAL9cQ+v0e53fHw2qhkf/TT3rB+85Zk9Xq4xqPPGn0U1pENGyRthH9ZT7RoEbJD+1Sl/Lv8iIBc
	O0D96Ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eze-0000000ASew-0c7D;
	Thu, 24 Sep 2026 08:39:50 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezc-0000000ASe3-0UPG;
	Thu, 24 Sep 2026 08:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790239185;
	bh=cYUK43iCiJs1BaFfQJGKkrofjMlF4tYb1uCWfFvnQQ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E0NkFkTjKqABup8bv4dOW2l0ikzso12hKqPe8u4AbHjEccje5N8kD0maFXCI0fWxy
	 KQy9dduaDLs0yo3A+IU+wg/0axzr6qe76A+nynOw+sL5lLJxvpd+bZK6nyNTKHRIrU
	 EwHMtUH28pFuSCqGghf4azgybLK0cpVqpTMRhBlZUlyDwtOyw/8XsEpwIrROvHPmU/
	 lce9qoqT1MelxHSqGKRn7TzLzvJy8BQ6c3Xwe4sais7P8Rv6xI5oIfV4kjz2bZBkVH
	 vMzHw1t16F8Kv3D5oG5c6hm5jFYvdBPe4Ku+DPYnxSXMzMgZH6XAcBjLpdG03MIxkc
	 IuQjNAzdfw1tA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E308717E089A;
	Thu, 24 Sep 2026 10:39:44 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 24 Sep 2026 10:38:10 +0200
Subject: [PATCH v3 1/4] dt-bindings: serial: mediatek,uart: Add compatible
 for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-mediatek-genio-520-720-evk-v3-1-2ec5c80677d4@collabora.com>
References: <20260924-add-mediatek-genio-520-720-evk-v3-0-2ec5c80677d4@collabora.com>
In-Reply-To: <20260924-add-mediatek-genio-520-720-evk-v3-0-2ec5c80677d4@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790239184; l=1092;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=cYUK43iCiJs1BaFfQJGKkrofjMlF4tYb1uCWfFvnQQ0=;
 b=KiYuTMYZjTfU3jPelSHVM26FXdg1+kQzsEmORvAr1crEPpxvJNmNX9bR1bTGK09xy3XQrr+5J
 sQ28fMGgW09D4DSkQdcI5gsoE0Pr+Ewzkx3uAYZ9A9nZ/yqsjXl8IAd
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_013948_422737_1FE1CED0 
X-CRM114-Status: UNSURE (   9.39  )
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

Add a compatible string for the MT8189 SoC.
The UART IPs in this chip are fully compatible with the one found in
MT6577 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae0..3f0f4aea0a4c 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -47,6 +47,7 @@ properties:
               - mediatek,mt8183-uart
               - mediatek,mt8186-uart
               - mediatek,mt8188-uart
+              - mediatek,mt8189-uart
               - mediatek,mt8192-uart
               - mediatek,mt8195-uart
               - mediatek,mt8365-uart

-- 
2.55.0


