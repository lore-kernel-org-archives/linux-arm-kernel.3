Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L7/smDjt;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0k2e/9D6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=; b=L7/smDjt6tocveTTIEm57STfmU
	dJwz4XeA63dWJtTs665W+0IbXvm+EEcuCGTb1Xllc2QO0ozUCBNphNJOQuk/9lOO9DW/+2O1kEo0y
	Xsw5JaVVTn9jTu/V6PTXWgjNBhBzRDA5Kx6bXE50064sty4GOPgIuoDyxzO8g6GXyhKeDjzLoasWH
	6erJl4GYiMLG49AQAMgRJEa33NiAJwOjQyDhb/vOhU15V00ewuKfKcfphxQ6m9C51yrgF2/UnijOj
	eFF16V3HA3055fnRcTwwzOOH1w8S1HFaWXn1SRYQvt/cBjl2QRC492D84Op5pxPe9yhWj1aONyjKf
	V8fMHw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObQa-00000005WM1-0dAE;
	Wed, 04 Nov 2026 13:53:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObQW-00000005WLV-3mkf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 13:53:22 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so654717f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 05:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800399; x=1794405199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=0k2e/9D6a+3OSZ4wP8wNdTr0/XBLC/p7wRlHG710BarDoUjGJDRyaZW37xjPPNCsCK
         1X7A1U3A61QHAY/39poUWbYeAbTS6LDWWdUR5FMO7/sNsYPYbsh9xhN8Qdm8DMR4LCXN
         E5TsfqdYiXIVnKTpJLboqJzRb9KT7Ua1u0F1hTtr0Otrq3NbKwUZU/oM3lidzLux3NKv
         UT/EMtInsXfzHykWw4lEuft7csO8cincU7qyu1+wJR5GLAmC6vmtQvESs6q9RluaeqSd
         AsiXtexUlYkOC56E6r6emKKU7zc/W9SGk58nbdKlv8Zm1Q7CKPvOy8NnvZzvJY/WQhSw
         CIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800399; x=1794405199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NTI3wQWhg6Ur7+7Hw2oDzx3iUnpb32rYoJcf5DJsM=;
        b=r+rqrbX8TOiWe2buTQ5Vycx5GWUxDCFwC1ViDetAE87xNpQg1osr1MOfq41S3eZrAU
         jUhijGlG6lIpOH4hnHy/BeHGRuaxINMEkKUeE6e67/zLWMLmi/VGvcR2F6uG54AkWEha
         YG73hCOeA/EaLhnsVoz6JcgejRiM8mjxjTXIJz9dhwNx254xsCoOMpQrA73lTmjHnGR2
         fZXPmtgBVl09bJuCq0aoiNEWq4kFINon+Z9sJaSC1SBPYz9Jqv2hVYbs1TzbKiZJKrLi
         V7BduVgBbzr3qxoaA5H8bkTexGupPXPh79YWWw53R/Obl9oW4u2W153qnV+t8OU7GJ4l
         reWg==
X-Forwarded-Encrypted: i=1; AKwUvBzGVMLbNKQTY7fst03GSpK3XSFSSMrXVIIhjIOe400FuweYLlP2muTh61dG9OvfBlfYYevYnjeToD2dO5ivAKCw@lists.infradead.org
X-Gm-Message-State: APuU4Z/9glWiFvpX/Q8NXZeuz7zy3/ZRhmQfdYmxYE4HnJ9mbBYSahjj
	tGZmGLu76IsKjealPotDuSbmjOlhYeg+W8ziVJhs2/2laHG5qSWBVySL
X-Gm-Gg: AYBFou2vAZKAvLg64qLjY58lh14dQkJV801/ygvd6W+WkeVWzQiLJ1lq0eS/YqDY+Q6
	fyh1RrmO/x/0WAnaiTaknXCvKX9UwhUZMDRbH9EHq9DAmC4OefOFuBkSL6rlom6streQG7o3p5j
	NQKiF6frW95NI/FZpA0TY9cauZduTM4cn+4mE+hkJeFCXbzso7mftwaLy/JGstuZba6S12kv37w
	t0t3EZyS+0hMCdg1Tappxj7xoZBNeKw9lugwtS43e2+hMtiLTmJpe79jmvqZ/OTxbMxfPq87GZ6
	+Na0j57ME6g5JTVOATKOdnVXZU15Pu73DerHLaeA5GAuNqsTkHNcYYxHrmqhlt9ANntPIl55E9t
	J+SG3CJ6JrrOsG2x+Jti5jZ1dPgOmJz+Xx76JoOsifytYPp3C5bwj3R6AunQ4KO95ebPkBcIcrB
	th6+665xRePDWV3wS0x5iR63yw4Yuqt0oMrpzsPpS+2JS5Ii04tu6Tx7hmo2l8mZWqEQsZDunZT
	idwHFwvtXnj6ECMvazdxgKrEfffacA9Pi9tts2hHVLSMY0iiU3uWPBENieFfR79QD6T1EWzzkW7
	yrNaTng2dLVeagbTXt+DEerrYDZg/9o+4ptKZSDyJKnTlmfvCOovOlgqOln0/z66q/xsojhoA6T
	+6p8gnqH8nguh84+Div823V44
X-Received: by 2002:a05:6000:4914:b0:48c:69b3:610f with SMTP id ffacd0b85a97d-48e6e5008b4mr34049088f8f.26.1793800398437;
        Wed, 04 Nov 2026 05:53:18 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm4160971f8f.15.2026.11.04.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:53:17 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: select REGMAP_MMIO
Date: Wed,  4 Nov 2026 14:53:00 +0100
Message-ID: <20261104135300.3723057-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_055320_982465_5BC407E8 
X-CRM114-Status: GOOD (  13.27  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sun50i-dmic calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  sun50i-dmic.c:(.text+0x142bce): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_SUN50I_DMIC
unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SUN50I_DMIC=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 9fc2c8ed923d ("ASoC: sunxi: Add Allwinner H6 Digital MIC driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 sound/soc/sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
index 205f422d9ded..c8a626396e9a 100644
--- a/sound/soc/sunxi/Kconfig
+++ b/sound/soc/sunxi/Kconfig
@@ -58,6 +58,7 @@ config SND_SUN4I_SPDIF
 
 config SND_SUN50I_DMIC
 	tristate "Allwinner H6 DMIC Support"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M to add support for the DMIC audio block in the Allwinner
-- 
2.43.0


