Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B386606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Je1lOmkp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XyzmRdyF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=y2THsAXtPgE/cPVAy9wB9JvP77O7f1H/H0wt8LIVsRw=; b=Je1lOmkp4yYtrBnc8o5qX5XX+f
	PHEDKQPQdX8rWM+oyJXQwB2jF0KrTjGcldXrTpbbofV3E+Rtm85v5oJndtPIbfGAkIpUwTrLQEkOA
	Wt3/eShyy8l2+3O0Akh/b5URWINTSVE2xKNGQIcOK2dHtSN+NMvHU8bv9uSGJdhVjG9xsOnmQ0TmN
	T0oooazbZOtAg0Jn7Mv+LpdHltPlNPmi7aE4balzwRvV7SpkXobyd+aiW1k0VgHGrn4F7yQ2AToGY
	+krvwbjX6BOTVLypZGH7YmErYdrnqUErVihAQEdmJ/xrms5wHhcE4Ub9nIcfE4UcnKpBAayFq6IJr
	SMiwlbZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyaI-00000009J5F-0s6O;
	Thu, 05 Nov 2026 14:36:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyaH-00000009J50-12jh;
	Thu, 05 Nov 2026 14:36:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0794F4375E;
	Thu,  5 Nov 2026 14:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92791F000C1;
	Thu,  5 Nov 2026 14:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793889416;
	bh=y2THsAXtPgE/cPVAy9wB9JvP77O7f1H/H0wt8LIVsRw=;
	h=From:To:Cc:Subject:Date;
	b=XyzmRdyFMi2XTIsVGrVSDuaNTzQbK2kiHE/q+TzhQp86/BEd8ZSpPqG4e7ctCADA/
	 rfxiKAZhD+9Wyi88UxzK7Mbac9oJZsDIf7CkuBi9ehqudCauJRs7B9Hg38nR2o34jw
	 FLTfaUpFyxt7x2aJGvUinvF82zVjZDQ79838Hv4DDNlgitwjO/6I62EmjKJyeBp6EG
	 hfuvyXIODZccqXJ6g/ecKihKnEEztaf+cEF70AJSZnB0TqSFrvpouMKSYdLbBSo2S5
	 z/0DUkWf7/P6dCGGw4cBTWWs85qH/kGgnFk4BezjkavUqV2PnBNJYIwjTjVvPS5eW4
	 qXtQT+ZV9Y45A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: power: Remove orphan mt6765-power.h include
Date: Thu,  5 Nov 2026 08:36:47 -0600
Message-ID: <20261105143647.2727937-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 22a77ae9bae2 ("dt-bindings: power: Convert mediatek,mt2701-scpsys
to DT schema") dropped support for MT6765, but missed removing the
include.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/dt-bindings/power/mt6765-power.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 include/dt-bindings/power/mt6765-power.h

diff --git a/include/dt-bindings/power/mt6765-power.h b/include/dt-bindings/power/mt6765-power.h
deleted file mode 100644
index d347b4ee9eed..000000000000
--- a/include/dt-bindings/power/mt6765-power.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _DT_BINDINGS_POWER_MT6765_POWER_H
-#define _DT_BINDINGS_POWER_MT6765_POWER_H
-
-#define MT6765_POWER_DOMAIN_CONN		0
-#define MT6765_POWER_DOMAIN_MM			1
-#define MT6765_POWER_DOMAIN_MFG_ASYNC		2
-#define MT6765_POWER_DOMAIN_ISP			3
-#define MT6765_POWER_DOMAIN_MFG			4
-#define MT6765_POWER_DOMAIN_MFG_CORE0		5
-#define MT6765_POWER_DOMAIN_CAM			6
-#define MT6765_POWER_DOMAIN_VCODEC		7
-
-#endif /* _DT_BINDINGS_POWER_MT6765_POWER_H */
-- 
2.53.0


