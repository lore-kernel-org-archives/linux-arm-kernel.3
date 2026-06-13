Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01342CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6UZ/wXVpbloPThuiI6a6VCqQTt9NkKS8tXH7uD9RIM=; b=saXoKMj1JmGHRwbg+fYvtU4voz
	bX2FpB1fv96Iv5jye5FlsDSB6ADPfkuGXhXdolGg972izdUZRTX5euW0tV3ggQo5ujcDmCQ8c8vUO
	A8nlneIkbCgBoYAnbNvM/0K7yc5QHVt749crvWsqV7qKQcqwWqRvWC2RQRGD9Uh31/bA/7Tl1ug+i
	3zxSnC91A9eHY4o5T8MB3mdLK4tHeJ6g5SSq1wXc8m6ZmTBXb9PMxr+YFu8PGfaI+Dw2slZVem/+f
	piUK3D5KBhlfbRpLsdrGzsW1KiTaP91nAXoieUwNmwaYCbwm5bGO8L9zwzablfuiZoz4O/VPPKoSx
	92etcxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKse-0000000C8SR-0TjH;
	Sat, 13 Jun 2026 09:42:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKsY-0000000C8PP-1Y6Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EBF0445B8;
	Sat, 13 Jun 2026 09:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6181EC2BCB9;
	Sat, 13 Jun 2026 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781343733;
	bh=VD3wegu1/KUmolrGMeczMtvZsTjBcVy9Lh73wJLBBpg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=exP8+YD0cA8lBIdBRwLwiDtCEtDnpjJgDfXHmfis2d9+mFPDh5Q+sECQjrkW6TX0T
	 pMc2Xu0NFKeDL8dZGosbGz+QiYawrUBntqayPvF+XDE0B2hVtaXYurGjhmLJeoQ/+C
	 ibJuHf8nU3BX6nfvdAZDTtH3br1c7iK2qnTAwEShMR1vaSwVdNSioDKlugdGELN8Si
	 UmzAqGSfu1qt7eblCtiTikeGXQuL1vO41oLkIq+RKLueUL8d+//e9aRvt69E61F1gH
	 B69Uu9nNk45njpS1d/tJX6SR0ocNJcla4PH+lZLVZhMTvp90pHI/kfczcwAcBUBGJP
	 FLtYtFjTIpbrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5030ACD98D2;
	Sat, 13 Jun 2026 09:42:13 +0000 (UTC)
From: Enzo Adriano via B4 Relay <devnull+enzo.adriano.code.gmail.com@kernel.org>
Date: Sat, 13 Jun 2026 05:42:14 -0400
Subject: [PATCH 2/4] dt-bindings: mmc: add Allwinner A733 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-a733-dts-v1-public-ready-v1-2-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781343732; l=895;
 i=enzo.adriano.code@gmail.com; s=a733-cubie-a7s;
 h=from:subject:message-id;
 bh=zVJKVu7EGuw8s8oGE8yMBHZdc3RPxLxGeUk2Y5HLBc4=;
 b=OwgC+JN5AxLkp2caqoaunDY4+/Rg7UispYVAhVzR01NX/xGu8rU+mT5ag15avNFEpQPgGL2xd
 w/SSVPmL2kfCkdwUaZJS/7zONdzg2abvndKPVpuP38+mOo01+0S893R
X-Developer-Key: i=enzo.adriano.code@gmail.com; a=ed25519;
 pk=5S3Wmdqa4XfCdeZF/HfeYqnQF8GN9JGt3SE1cxqSX8E=
X-Endpoint-Received: by B4 Relay for
 enzo.adriano.code@gmail.com/a733-cubie-a7s with auth_id=820
X-Original-From: Enzo Adriano <enzo.adriano.code@gmail.com>
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
Reply-To: enzo.adriano.code@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Enzo Adriano <enzo.adriano.code@gmail.com>

Document the A733 MMC controller compatible with the existing D1-style
fallback.

Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
index 9f3b1edacaa0..9e9590521210 100644
--- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
+++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
@@ -58,6 +58,9 @@ properties:
       - items:
           - const: allwinner,sun55i-a523-mmc
           - const: allwinner,sun20i-d1-mmc
+      - items:
+          - const: allwinner,sun60i-a733-mmc
+          - const: allwinner,sun20i-d1-mmc
 
   reg:
     maxItems: 1

-- 
2.53.0



