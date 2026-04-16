Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E0AF8A16F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+bXRscAJJ4o6nY6E/B4Hc6ULGAbCSTE5Fn/VbrlVovE=; b=Ji5kGCzAeyZPPjL82ij5d3KXj0
	vbZUWF6KSWfUIi9/bnWeNVPW66dk7B982LpwrxIVH5k4fy+RmmfKb28bFs/JntiqYNjK1/23DkCZO
	27SiUYO1oVNfxFTf4RUqPl4AUrYwO7IcLWarH3jYYpDKetqUIV5E4LvkJ4DvFKsBLuasV8aYupKlq
	Kw+mErc/+r6WSd9gWExt0E2EfSqqmoA0Qudu7GqhKu9X4WcHJmhNFoEFh0McxueszKrHckV+hQLeE
	V6hefOTXdR3UJNP2SEOHURh3Xh6jWsvf61Cq7FReedQwhO77r10kR/bPDwAgmG4X2n6Vq9jUu1Ncg
	I7P1REIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMbu-00000002URF-2jVI;
	Thu, 16 Apr 2026 13:18:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMbs-00000002UQv-0zDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 13:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4808F41B11
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 13:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6384C2BCAF;
	Thu, 16 Apr 2026 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776345499;
	bh=v2KfXvmyoYN0U8cDqXs3PNwqipn6UcHYXc0jmP5Hn7o=;
	h=From:To:Cc:Subject:Date:From;
	b=PHVocQXhRNsqLT7YGQNw3ajVv1Llnz03oiIhn0EiUKuk5XLmAMbk5xqNmflj+BnI+
	 WAixTVjjAXbjTnaAEdatFvRRVwIltR/jE7owPnoFQaoDqdcg6lYwNZUGB8YDwQAnLa
	 KxNrpZwhqwWP96aLBx/13ve0bO1E+FY1h9LS2QzjUrkd42U0T/JWXRR1Sm0ZFEPjSn
	 2ZAMt6W9sYKu4fREvXh5+IfDmZEZg7LR6hdhNy5tKArtMbgZT9UKXehutZAy+f2JPB
	 4IG6tZZ9an13fhmfAjv/x6cYtrI2/30bDnXcYL/XG4CdLBPrUp34VyLyrdvCNKg8Lg
	 dmH//b/BScw4g==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>
Subject: [PATCH] MAINTAINERS: Move Peter De Schrijver to CREDITS
Date: Thu, 16 Apr 2026 15:18:10 +0200
Message-ID: <20260416131810.3116408-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_061820_298292_A94D531A 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Thierry Reding <treding@nvidia.com>

Peter sadly passed away a while back. Paul did a much better job at
finding the right words to mourn this loss than I ever could, so I will
leave this link here:

  https://lore.kernel.org/lkml/alpine.DEB.2.21.999.2407240345480.11116@utopia.booyaka.com/T/#u

Co-developed-by: Paul Walmsley <pjw@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 CREDITS     | 6 ++++++
 MAINTAINERS | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 885fb05d8816..29fcfa679430 100644
--- a/CREDITS
+++ b/CREDITS
@@ -3645,7 +3645,13 @@ D: Macintosh IDE Driver
 
 N: Peter De Schrijver
 E: stud11@cc4.kuleuven.ac.be
+E: p2@mind.be
+E: peter.de-schrijver@nokia.com
+E: pdeschrijver@nvidia.com
+E: p2@psychaos.be
 D: Mitsumi CD-ROM driver patches March version
+D: OMAP power management
+D: NVIDIA Tegra clock and BPMP drivers, among many other things
 S: Molenbaan 29
 S: B2240 Zandhoven
 S: Belgium
diff --git a/MAINTAINERS b/MAINTAINERS
index ef978bfca514..ffe20d770249 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26145,7 +26145,6 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
 M:	Prashant Gaikwad <pgaikwad@nvidia.com>
 S:	Supported
 F:	drivers/clk/tegra/
-- 
2.52.0


