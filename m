Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F215C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 10:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=siGN9S98cmnCTctOmyBaIkTesjbPVm0z1aN3AxPvTiY=; b=V98fQJ2fqz+G74h11CWd4+eeY5
	I66Ic5FBcu7xhzZA/DooU6Jgt/X1aJu7wpKmk6W6psFHLuVnTXUEWmdo9RFwiAcMUYA1+X0K9IHys
	pk3RbAwjc8YO476VpcxF33WHGFtHb3Hokb1DjwarHwWepbH6hAamgaHTiKNDobF/SIWsBC+mhZwni
	OYh6mBXqzZjb2wz2jMY3g4+yGIRYvwLE8vSC9limRl0WHzbTmlYFGJY/YJFZnm6Xscgv8jYeywcph
	4IQhgRs3UXXBH/L5S92yB2/lzNjmPdsHYsJLyTKexOPEeaikEc6G0pH2T4x2EH3Qic+v8Hw5LyYtW
	cYneOzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gSc-0000000Ag67-0ft7;
	Thu, 24 Sep 2026 10:13:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9gSb-0000000Ag5j-1OYp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 10:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 746B8601EF;
	Thu, 24 Sep 2026 10:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D5C1F000FF;
	Thu, 24 Sep 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790244828;
	bh=siGN9S98cmnCTctOmyBaIkTesjbPVm0z1aN3AxPvTiY=;
	h=From:To:Cc:Subject:Date;
	b=mkBYsCjZjlpGZ62/fqonnoEJMAqe99hqWMziY6y0JkrHljQ7vbq/3ohDov9pHQp+U
	 8MNDse1Bbgf63dNUbVL2O6dsQBGXi3du8DA3ToX2wAsGs8f7+QWDY2mi8jYcMr4n23
	 E2XvorQHod20GoliLIn0gFtumUpwtUn9XntqXIRqQ8Vf8GUwkrOT71Fk0T0VG2/2wG
	 9Woi0QvNQSRovZ9+v/cg83n5FC6UG1CJ86U+iw38p9Ci6fslpJk0n03Y5RdXF7mZX+
	 jzl4GKlr21jsslbHqGh2PN0WsnK62CBS53YBf+hesjE8PpPWgdwKz+ibxTNhPFIv2f
	 0pqvheHXp6h6g==
From: kaloz@kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linusw@kernel.org,
	arnd@arndb.de,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update my email address
Date: Thu, 24 Sep 2026 12:12:45 +0200
Message-ID: <20260924101245.5011-1-kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
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

From: Imre Kaloz <kaloz@kernel.org>

Switch my contact address to kaloz@kernel.org and update .mailmap.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 11750e582d09..88fc3f466aba 100644
--- a/.mailmap
+++ b/.mailmap
@@ -484,6 +484,7 @@ Juha Yrjola <juha.yrjola@nokia.com>
 Juha Yrjola <juha.yrjola@solidboot.com>
 Julien Thierry <julien.thierry.kdev@gmail.com> <julien.thierry@arm.com>
 Justin Iurman <justin.iurman@gmail.com> <justin.iurman@uliege.be>
+Imre Kaloz <kaloz@kernel.org> <kaloz@openwrt.org>
 Ira Weiny <iweiny@kernel.org> <ira.weiny@intel.com>
 Iskren Chernev <me@iskren.info> <iskren.chernev@gmail.com>
 Kalle Valo <kvalo@kernel.org> <kvalo@codeaurora.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..13609b3a1f03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3012,7 +3012,7 @@ F:	arch/arm/boot/dts/ti/omap/omap3-igep*
 
 ARM/INTEL IXP4XX ARM ARCHITECTURE
 M:	Linus Walleij <linusw@kernel.org>
-M:	Imre Kaloz <kaloz@openwrt.org>
+M:	Imre Kaloz <kaloz@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/intel-ixp4xx.yaml
-- 
2.47.3


