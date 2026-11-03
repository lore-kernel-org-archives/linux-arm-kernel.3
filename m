Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A9E606D814
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uGsw6S7K;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0H+64/ST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=; b=uGsw6S7Ky1TOdY
	esVvG9ZWqS7cMW1MIPiRcoIHDTUxaA5oYer2qooVSkVMIGpFNjziaENqkFxUgGa8xRQkKHibo/i3H
	vhJjytGksgIY0XsHWwYyckIMo6snqfTV340BjDqDUeeUjyrJdRe/84GtN+Ku5OD9bbVFVSkK614Jc
	UQHzw+pyb1hYP/umoQDMkeEtjjlelXBNs3hjuqyoUnshrLWPmco2iTeWSJrH7dPl9WBAAnKsczJi7
	/9z1qnb+17i1JTHe1IXs5VrVyWDhPDGYuFMtTXoxjcfO1tLT5lSMDDd8xBhm8fqPCLQanJq3y6kDd
	5zSD2KXWaLZXDHudbASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWe-00000002Xlb-2Aks;
	Tue, 03 Nov 2026 13:26:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWc-00000002Xi9-1Z02
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:26:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso33261215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712364; x=1794317164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
        b=0H+64/STZMyoOxz84zKkkVJxRYuruKeSi6NE2OOJ1o6g0YiGihdPGCUtAtFw7crc5O
         yeiqVzt0yh70jwt7+5FHEnlTZ1asRXWLtXNAb4wy0g6F8C278F5yQwA5OuHkqExQdsci
         OOChMFhW8fj1DfE3vk0EmZxbhrCUt59lWJwkD6ijh9RLzDZi1LmkIQAX2gER/XIJL5F2
         vkP1mvwI27EuRITnuwnhNuRAlXXnCLMS5oJ6LogpPxrzlY2clnMiEQOEeBA/08jPQFo0
         OGi6UCORLDWFqdDxDi6sy8uNKjN2SlpJSGTCsFkHjPb//XN6uqx8DgLlKJf8ZPW8atq3
         cRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712364; x=1794317164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
        b=URr3/yW3p0vzM3Sb584jsrdSJ2AGeVmaGq9mSHSjEWdRbTiJnAwx2RUrP34lrtO1Kq
         cmREiaMYA/KKfA0+6AL3fGjFsGICQWDrB0ch4h3EfYhFEZoAqJg+dKuu2wF1ovkvvkwd
         1No5TNaJb/Up3boJjIapJg7azaBkSx6LMCNdqad1qFhRIOJ3NGMVv2GIsrWpt4diOpAI
         XlQS0aDHjkkk9Y+0MfhVIfdNwaRkiZbSqdpa1nzdV65CNQnpprNjJYBmha8At+kxv+Jh
         5YKNYQD1Ok6XXYfb8rS1vG7WxOD6ABNOZkXwjtYYii+KiUPf/1m5tF2pmXltAIJssZvI
         c2hA==
X-Forwarded-Encrypted: i=1; AKwUvBxWUKwO/+o7D9dcOsr+uxdtZsb7Fx0JSbnGF+wv/Bb25pMmXVI7t8TSXS8hj6TrO5ZbL9orI9vpeBbap5HIxD2D@lists.infradead.org
X-Gm-Message-State: APuU4Z9tha8cZ9Qu+zdvqJIcYQkovbPRTbLtB9QlKqHS4tipud8wA45E
	KZIpzn7QGKuLWjqRG0nDgNNwy0DW+VPWw3TnmcSqTAfkW3wTtD9Nyrvg
X-Gm-Gg: AYBFou0stPiV+E3h1xLQ5ZVKMlwyezLbC4mEpPgoLWpZRbA3X6w7Pa4WEvdVi1yKH3I
	CnHhcAGNWladxd/dWZkuWA3rZZ0Lg7oUFFFvKtjVfcy4NYaeJteZfk8cMXLEYUl1bOHHtGDpE7O
	QzF/JBXuODqYAveXJOJLaJ585fLjO/vItJeRqW1Zon4K+zqxA1IYvp5CbHF/qXgoKtZr8PbIJm+
	MIEmmQO5osftPbEKmz4RBxo9xpnjxB9S/Ls8KBJLcIb4VUBiE5vKn6+fTMbxUi+7VE9wtJY/vyX
	zPHqYXkcrFjN3VSYxc2KlcxVrJIzK5luQX8YWkpEUW7Si7YMNXUDiXioHBdpNbAirRg60bFSYCi
	wRB3ubbWOD4xmulI6bScEp1q86ySNZQTVBmTNqHWEEMRU5VRB5v+Ep4ZqKN84mo708xYNly0a6p
	IToaVYN1fFAitaSRdY/ktma8w1lOGLbuhCzA3Kc1qd1jqAfxPRpLTcKDDq/PQxiu5EJu80DsAwX
	AEDdw1YQ0+SA4F4NQrCQVW/Nc9SW6ubmGFGZV4zVsMEwU4jwVOOaY1GJwhvwbkQMv52FhLg1xhl
	0FCP/VEwh8TNmlnkXuSARmDB5AEI0GJv/trSYqpR065JTNR8+lnctYy2m2ouyu6J57Rzd+amRwq
	hVw==
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr289609215e9.23.1793712364145;
        Tue, 03 Nov 2026 05:26:04 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:03 -0800 (PST)
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
Subject: [PATCH 3/5] ASoC: rockchip_pdm: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:35 +0100
Message-ID: <20261103132537.3717496-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052606_447421_F5F00E7D 
X-CRM114-Status: GOOD (  12.64  )
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

rockchip_pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_pdm.c:(.text+0xef4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_PDM unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 0f8ef6868356..e0ded1fa4da5 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -25,6 +25,7 @@ config SND_SOC_ROCKCHIP_I2S_TDM
 
 config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select RATIONAL
 	help
-- 
2.43.0


