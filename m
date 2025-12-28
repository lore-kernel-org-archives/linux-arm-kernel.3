Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70772E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 07:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wMpsIKtKlBBHkIflbaKqArf2l+TBlvDYa2sfvLCjcQ=; b=MchR4zEMUOGxRS4YFBn1lMgO5r
	KZ5rehfUTlCzLjoRF18os9/5ZgFLEcHs88o+LPXpENJdBjUZ/AImFPRbtcgo3g46tWgu2vwX3GSTg
	9V91Y8mg2D1T1E5vRha0OUe1da3RnvF0Pl3M9K7R08goE3aFUqAPMxBTJgWhQRlivUTeMMc3+iWXm
	LJyAocnUZuAyBJURiO/i0TI0lbnVRS1Ki5+3ORr5kKLXsiD3KjL/hBwYweONJ8ACYbOpNzmkePCHe
	Gw8lFSI3t8vakVpdf1z0EZr21xmAIL5+0uwNzbQWBFNsTuKYvfMRzcF2Hejo6KDVBBJo4LMMF8dOt
	foj3b6VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZkvL-00000002ZID-42y8;
	Sun, 28 Dec 2025 07:10:44 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZkvK-00000002ZI1-0eRE;
	Sun, 28 Dec 2025 07:10:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: pxa: drop unused Kconfig symbol
Date: Sat, 27 Dec 2025 23:10:41 -0800
Message-ID: <20251228071041.2246718-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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

Drop a bogus dangling Kconfig symbol for select SND_SOC_AC97_BUS_NEW.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216748
Fixes: 1c8bc7b3de5e ("ASoC: pxa: switch to new ac97 bus support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>

 sound/soc/pxa/Kconfig |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20251219.orig/sound/soc/pxa/Kconfig
+++ linux-next-20251219/sound/soc/pxa/Kconfig
@@ -18,7 +18,6 @@ config SND_PXA2XX_SOC_AC97
 	select AC97_BUS_NEW
 	select SND_PXA2XX_LIB
 	select SND_PXA2XX_LIB_AC97
-	select SND_SOC_AC97_BUS_NEW
 
 config SND_PXA2XX_SOC_I2S
 	select SND_PXA2XX_LIB

