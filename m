Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE26082BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K83JIPnh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K+9FMg/b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=; b=K83JIPnhiVzu57
	9zxareJOzcS5bB1KkEzK2d/tTtzKccYNf1fOA7hVPlZymPNy5YXRyow0RlBbkOd6+Z0WWG+WFxNBl
	qkzm/wP+SecsOHOtAYcRNGLys1l5XZy+J1oIhmPe54C7ZgHsWczFbcQ9Bv84e3S/rol+PUX1Ndlsi
	/cd0ruNRNCQ75T09ZwI2NBwOiev5YOQ4YsPcM8xXLp8SCzbf09BC6Rp9UjcBicH9WpYSLUcys06XI
	8V6cCoeHgKyE76MVREc4M8uaKbomv2Izxc6AIWSrnSfZz6Sgsuxrohfo3oKm3KqH8IgVBT9p4Z4bB
	iXVF1nX8R7eWAp8ay0gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWf-00000002Xmk-2e2b;
	Tue, 03 Nov 2026 13:26:09 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWd-00000002Xim-0xO0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:26:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so33405295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712365; x=1794317165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
        b=K+9FMg/b8MOPKUap9pd1VBxiuHFHv2L/vrfkupsu4BahI77r/vZM9PW3+8oVzHHpZE
         Xj6z7HfhhFbtpn3mzSVrfz+PjefiJKIBbOfQoVVl2E2z1FEYJNBix8NMKRTz3trjc2q5
         gwiAQusL+ZT77rI+tYISpSCzPT9lNtJJiecuyiNZoUrl42pt8QXsEl0+1D5klvaDSKhb
         x8pxGKT/vhm0UB0CnxnLqdNJS1h5EBzDuIXa+iGrIaRBTn8x2pcB/qJ2uGdG0fD4APWn
         b2zwdzIlVI2YpV55dwnd98sHKgY6AIeZmUJwD5fOZU+4oZoa7GtsELfS6p2md3NYJ8wW
         GlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712365; x=1794317165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWdiIAND/WpEXE+eLFgWWAJDbOb9pLiOPCfwl+Ga1Lg=;
        b=kyogqW9ojgAZfzvEON7l8EUqA9KleEdKLKx1n9Hrwt16fibjgsQ3T/j15uhIyBLpNy
         H/aHPMJMM1eUq3mUGdTq+d3+GVNFN97l7OC2fB9JojyvbCvlo+gD0vyLlrzbuZC11G8G
         6lOUNWHM8ju/NS+dG38s0xMs1Ya/oqw2qp/IaFK6B0cJsKu1brtC0gudNAy5gBzR4dkr
         rL7zKyJpRhSU1ZnKXBa0tgDSUWObXJ9CJskPRUTwA0IGJzO3ncNYo5K8ocryC4HuzqhW
         ahtSQ+5p2XrJGNZuHDe6FxQB++pP9jAqgUoY1eQrgeiiyTD2Gw5mIdpCKcKaIShvhGA3
         VCqw==
X-Forwarded-Encrypted: i=1; AKwUvBx9LXUpTqn/Gq3dyqKJ9zqWwEnhOGWpbyaFZekbLTR6AID6frx5etzfoi1Y7DJ1f632U8ePPisC21jxVZnDYPRl@lists.infradead.org
X-Gm-Message-State: APuU4Z8DGwrMWS7YtEBjPBs+/2FUasSZ6Vkg8UOQ6ZrrcPyxfsWJve8Q
	OVvXoic80nhs1FqOV7LT0csQfOs8deQVT4eo4mbdrDFWMHaS8CE6wqF+
X-Gm-Gg: AYBFou06LjXGO9W3vRwaoH58WTvhCpjFH+wRH5yEgtXP6Nh6u2JNXWkhzIyNl/cl6bY
	/hJZAqHSaXZ+RD9zNftxF3faWzLzjx2wg6vRSMi7SzYuYlRNfYnzuIiyx2JbuuihmuLh7m3Jbar
	kmO1Gu7QfEQeXP1ZY+S4urSOq4h7CdA4twDSwdUpT9COZCIBCCgKofPQQXRlJQu8/hIcAmVVvqp
	H377kk3mrujOMVMiVUzGGJ8LBm4rKsdYDOFBBvtJLpd2oypFGvInDh0Bb7dGH0gFR5zmozA3tzo
	oU340X9jhgh1IxVvrZhd8Whf2F0Dja9pUQ4sHbdU7Q9XQ8I9i/WuohDhEzjYGESoqMQf5L3I+f3
	UvD3x2SGPwYsS++dQ+FB5QJfaz9lC1+QCdxkL4Os7pEFIzc8FAHwxXOMpMPB7TxmgZzvxZTbhrO
	6DyRq0JqpKnhOWWyxV4PMw/9Rew+kzLxi4tozbBZQG9kdFfgImu2Exyl+5RNxwafLg1RYwsMJnw
	gDUJrF2/KCtSzaskX+ADcUCBKiFbUj9gDJFT4ZRuD4NdCMFgNHPQqllAWxPcs6SEyZ/xw+7oL7s
	aNxA/+6EoWC8GGq1AbJjx54s0uaLhHnR325HiMtAQiIhydpUj/tpr2yLCc1v0NO+B2G9ug6xx0O
	35LUkgfZvV2OpXHOstK9M6Eg=
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr200645385e9.24.1793712365149;
        Tue, 03 Nov 2026 05:26:05 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:04 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 4/5] ASoC: rockchip_sai: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:36 +0100
Message-ID: <20261103132537.3717496-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052607_287297_9E7CAEE8 
X-CRM114-Status: GOOD (  13.21  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rockchip_sai calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_sai.c:1424:(.text+0x153060): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_SAI unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_SAI=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index e0ded1fa4da5..aba9a518d3b2 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -35,6 +35,7 @@ config SND_SOC_ROCKCHIP_PDM
 
 config SND_SOC_ROCKCHIP_SAI
 	tristate "Rockchip SAI Controller Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the Rockchip Serial Audio
-- 
2.43.0


