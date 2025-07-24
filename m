Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CF0C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2cl65q9yf6So0AqEZnYGDOelg9vUrFjH+Jhcp5rU1uk=; b=VYKph8rR3Mfq5ENhgM+phe/UnP
	zV124uN1OsW0c6V5kTdsW54Kr5YT78nL2f2gNcG2cheVOljzytiLNSHGQzzLvTICJen740Z0/fp+4
	Uc2ZvEttq2EYDgLysnfskSqZAbEBoaxgodrxUvq3ZSLAj6QRxlQbO81sj0eZnS73wizvMCoWImY+3
	dYPcbLaoP79hZJBy9OAeFfDMrPABbcYpk2Ub1QKVWYyyqD/zfimQo0qUdEXmV9iq+EkIl1QIJXm7n
	psLZRaM25opxMCYFAjWVsFrpFWOrROrr+Qglq4x6g6ORm63mYGEdrao44XoCygpGXVwWhJ8Yit+Mb
	OsBtGpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesTm-000000075F5-24vG;
	Thu, 24 Jul 2025 09:43:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerTr-00000006t6q-3w0M;
	Thu, 24 Jul 2025 08:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346350;
	bh=UpI8W9Kvq+tlAPwkA1q2e9J/sYFjFWemYloJYK9MbHw=;
	h=From:To:Cc:Subject:Date:From;
	b=XcbR6SGGbV4KWfCGLnSjJiqjso3xW6s4zKFOBJLJYJys0FgUk9O0GeNN1IK9ArYwO
	 n27vGLPgYIJ5Qrt/s1MdbQK44wLaOIJtVbGVIOXvX4aeedd5Y6A1bIrW1dy64WOQnW
	 yOhzmaGt+qkEMf/JfjnjwD/snGiDCl2HraVglvCOvx0V1GcHLTD5Migzu8wjZgJTlK
	 SAcBjEpHZPlg+z8GEb6TDHGX+1pVcNOyLURiWyfBMwJjoPGFEP9Bby6DLzlFpDGFuJ
	 cBl2YOhbdpNkq3d4MPoDLfiYOuRPo69UPi3d8nYNh+q34G49dmkj0E+wo2gnngHSuO
	 qifcyID/BWowg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8F8117E1062;
	Thu, 24 Jul 2025 10:39:09 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/3] dt-bindings: clock: mt7622: Add AFE_MRGIF clock
Date: Thu, 24 Jul 2025 10:39:05 +0200
Message-ID: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013912_117961_1FB6E843 
X-CRM114-Status: GOOD (  10.64  )
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

Add the missing AFE Merge Interface clock to MT7622 to make use of
it in the audio subsystem.

While at it, also remove the useless CLK_AUDIO_NR_CLK definition.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/dt-bindings/clock/mt7622-clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt7622-clk.h b/include/dt-bindings/clock/mt7622-clk.h
index c12e7eab0788..a173eb132892 100644
--- a/include/dt-bindings/clock/mt7622-clk.h
+++ b/include/dt-bindings/clock/mt7622-clk.h
@@ -228,7 +228,7 @@
 #define CLK_AUDIO_MEM_ASRC4		44
 #define CLK_AUDIO_MEM_ASRC5		45
 #define CLK_AUDIO_AFE_CONN		46
-#define CLK_AUDIO_NR_CLK		47
+#define CLK_AUDIO_AFE_MRGIF		47
 
 /* SSUSBSYS */
 
-- 
2.50.1


