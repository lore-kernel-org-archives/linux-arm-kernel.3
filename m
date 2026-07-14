Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E285C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGch6f3TrRxCJ2L8VAnZ+qJbCI7ObrChKRXt/xXVCPs=; b=AJZ4/v911gwX762Keyash9saWA
	rAeOTpfqc3KDHAkb1fLf4gBkzL9DP68lTFVtJK3VroQnmolUHb6YOBS+OSQP5cuUEtmVUKIC7jeCQ
	3g98IUrFagejxaLxy8EfM9waGYDDON8JF2O4EER/0twxrT5Z9d0CLi0URWYLhSuMap4SErgu13UKm
	zeT9WkVsDBWxe/spo78z1SoIwR9++mrDRZCI92+WMwDEXD5nPsYEcdRp6jznDn8weDE+GyXp/IcTl
	IgqvhP4vkD0b7AT8mrNPQPh7xAN+3gorD+JNbQbTmyPmNkOEQyjBETvZ2lwC2XrQKuYkhKOOBGWw4
	BXM4exrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcVS-0000000Byxi-3CBt;
	Tue, 14 Jul 2026 12:45:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcVQ-0000000Bywo-3jso;
	Tue, 14 Jul 2026 12:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18BBE601ED;
	Tue, 14 Jul 2026 12:45:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8739C2BCB9;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784033099;
	bh=1ZHNBJO5qrM8bD3uBDopzZ00me/02rhRwmoXbHpPB+o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CCU0w3Rz29cVqbt3JYg5z9+vauK6q0C7NZrt7aUrZlD9seiZzdUld3CpUHi96hp2a
	 3ymYZykF8K2vqoXQjAYF8ykQeEZ4naNLo0Syd2HHuPrV+tN8BxPtjJfFHh2QHj6QCY
	 YRRONyCrXyHiruzkxJjZYqnHt/TOx7HKK+q2RP6zPtamKaIUCwtoMK7MWwKWueJ7Ro
	 emXTlTYH8/tcjVUt9cf6GqGDckkNRQbVMmm0hR439kwpWrirTz7z1ekJk50CIhri7Y
	 Df8+2WV53LZ9tF6Hqskl8qghoHqN7bI+BDrclETHJNa2w8JCr34BUWriGqVZ3nAap8
	 BomyR6sBISMrQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9161EC44501;
	Tue, 14 Jul 2026 12:44:59 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 14 Jul 2026 15:42:03 +0300
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-6572-pwrap-v1-1-d8e5a39cf7ef@protonmail.com>
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
In-Reply-To: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784033096; l=838;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=DGlethcwjr6H16kkYv8rGeF6UvLfthLp0VHfVhWr1Mk=;
 b=9Fb6Cp26hr6jilvkzub6M4v2q/4lL0YwTW5VtR7PmuZCGmc+q1MJnxFs08qNCpGQwIAYC57nS
 2QYhDhvFYkrB0aFN8eHW4BpqKibUhfROxJ2zy+39XcBccKeVg304Jh9
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

Add a compatible string for the mt6572 SoC.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index e7c4a3984c60..a3cf11153fba 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap

-- 
2.54.0



