Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90291606D81D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I/2YLyiD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vs5WhDMH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=; b=I/2YLyiDMuzS1x
	V5zPKzWtlSoSRyDCsWKpiMTGUcCbfA3OxL54paV6UfAGaJ+uIsQTH01jva9xtRDXSAUbxwsWxq2nf
	60kPqYjFwRkdp8oMMuSCCiWKdx1sMHAzVzSFYIp4ljTKT+PzBgERP1h76vG1iVag2kcy1Tt1Nhx+b
	WBEtjFMCDvHuHpUz9Ha67Ek+y/V/C/cxIuoBiz5UrEcpp9YYqbLNGWTR1B7we7HpeRoIJ3eO3vuMI
	Cy255sKN3i5r6urK3g0l1/8bfnjeSR/upTAx6R48tk4CxFAxQCgeeUlC5CxqbYos0+W8C+9/gvJ7J
	+HfvD2FwWmZ04OfgXDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWk-00000002XpG-33tt;
	Tue, 03 Nov 2026 13:26:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWd-00000002XjE-43gx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:26:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so4418375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712366; x=1794317166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
        b=vs5WhDMHHkY4qjk0819P4DPMX2CSfKNOUlGtxz4w3Odu6Pz3PdR+0Ib6011ZqXMcpQ
         dVhPgKrk/d7IDouzdrxsi7D2CyVwNYuJMGLrx1pXR1fOFilMILpCibNn7tfQKDTiIrKm
         Q8y8uuQaQxe7SCZu9bU5jQQIuXlYuQluG1Ow/Tky5cvcmnuy8eIYvy5WXBy9e1336lEp
         kzf+Gn5TlTICez3zxKPmrKFNkd13HS4sj4COyos3vP1aEuW9f8Lo4B9jegWYy0HefFJh
         GYvxIkX/+O1D2TMZESg00gkM0K0ekuoVQrFu4AcjCTAu9Oy9rRcYAFrIyoSsSPR/qAJA
         qZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712366; x=1794317166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
        b=zzUspgHVzrmRGRUzW93iWstrfbxgAWR64cFJMJaworAw816rZJBtCYUMwCGr5r8kfe
         Hqfqj7h3thv3fCBq1Q7fFIsV1u9VL8k638hZEbOrW+OJpO4fvS9n4BwV/aoVJUZNuWsc
         Bi7s/tCVIKpXtZusRHIYaLCbtzf30gMnYo2CZ9WJvgKZ7+tRWfOPXQ3SO3mjZJ/017tQ
         k3d5asThctRZRKfOTpUalGZNn4X9mY6JGjhBQmlPUpFUXy/ASzM/FKNAtvbNR3wghsIB
         mkHDkzh3Bn7uW8pYwjMeIloo07mkaCfh/PJgMuJn1Zooh6qHXhav7z9AYpppy6lNF5cN
         VrWQ==
X-Forwarded-Encrypted: i=1; AKwUvByqw+XjXHYTBbe0+UYjioVdV8nf5sgloGi5mld6YDPSbkoBT1fVo+QgxX1Obi4QJx7bLRY7hWZGvj3DO+RdWUCO@lists.infradead.org
X-Gm-Message-State: APuU4Z8OuB6n92/CQPFQqEpF61fp+HzXH752PjaHhdgeo/J8IcN9Sme2
	3AZLXm+4SO5yQUhDhhy0Psb4I0YQjBRCIXx7P51Yb6TIKcU2rntbyBf1
X-Gm-Gg: AYBFou2QUdGqv17OiRax9cUamzoclagO+Xt46ty7LPqlAqCS+SVk0nGfNRnzfTPxhS7
	eXfqM4Wi8OGHq2SZ9wB2ETwRauxGBdh70N0uoC8YaOTpXHtrevpV/MVDihXIdBflUKAL2W8POnx
	uBqR9rqZHs/poqHwRb5xGUHhW0Zbhgi5UhxDkYJNWCU8v+Eu1/KJiTpUSn1lrisQSR2bVDwriF3
	CX9OB+TQvafpOEPEy9OzDzMQdgWW7/YoMFpyl07A3LdzAqY2RJ15TbVz1W6Zs42IZo3EVuGM/wY
	TZmvZXApqfKGryhs2X1ZjZgpKQRto5beNObTy9liBw0akxQR3Vn8LEGMp1NE+pjORr0N5Go5x5G
	iIj49XA5KfcKTFPj8wVgdOmb1eCEAVAx6xo6I4p7xpoWSkPkG6hO9rFMhK+ggVt+APTFFvmXZFq
	K6ywMdzgEq4g4kDf21AllT9JAkOMz0Z4Cg5Hab82nLIef9Q3npDtcwR90fjUR4IdprFiUtgVX99
	B+CYd+z4moSW6a7KUQ9EOaqfz8hEUdie2bV9vyV9c/E9BDvYa4WHyi669X4caZbWak7n1qRuQS4
	MdnAMkthqnz0poPskIiwjVRD0QIV1oeN+x1cLRYoEKZqbvwQZWVwit4oB8OnnbEj5ohMKxWcrCe
	DOw==
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr301749905e9.16.1793712366192;
        Tue, 03 Nov 2026 05:26:06 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:05 -0800 (PST)
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
Subject: [PATCH 5/5] ASoC: rockchip_spdif: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:37 +0100
Message-ID: <20261103132537.3717496-6-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052608_064176_CDF7C70A 
X-CRM114-Status: GOOD (  12.33  )
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

rockchip_spdif calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_spdif.c:(.text+0xf67): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_SPDIF unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_SPDIF=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: f874b80e1571 ("ASoC: rockchip: Add rockchip SPDIF transceiver driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index aba9a518d3b2..0e5110125c14 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -45,6 +45,7 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
-- 
2.43.0


