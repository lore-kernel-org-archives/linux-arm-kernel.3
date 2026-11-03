Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AC606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GIJYbQYS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STi6v5UO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=; b=GIJYbQYSXpPjOs
	rtJEb1tD5KDhAPismh2UL8E8xw2V0Npl/QBAcWpftptDFZ4+FYCbNoatfQ3I6H3MwWWWu1GkZj81a
	gLL9YA8tyuveUFsu9JfeOJ+xZnhFmrcElcvxbex3y/BUmdWbLaojuznaIDVtCm5C7UujmqkkJ6NsK
	eqYE+bLpzhdsi9OEQjCLiNY+P47I9Ue/NRWZ08q8fMdginGVWE2qElOpwKqLhmZpRC8TtpiP6DrbH
	DOHJV7bFcZ3FtvL3Lomb1oAtlLh0LAijXQ7I6ABnOsOZSrMfzk73c1oZ1EHeLajzTN+fV3B0hWQyT
	I7lMkovW8EGWR9BVBCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWe-00000002Xl3-1YWe;
	Tue, 03 Nov 2026 13:26:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWa-00000002Xi4-3zUd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:26:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso407196f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712363; x=1794317163; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
        b=STi6v5UOvFUk6208+MD0ToKtxgA2vHlIFkJtFXaBnY3aO6WzwLubXa/vEuI1cmPpkp
         7w7/p6DE4+WjTmzldsAVvMyhBSwRMdaZ0rHivEci9vXVcn9+HEcvqPEiTl/bDGBM2bKT
         lVKZlE3E9f2OvYRpFl5ieLXUuqVuG+WlX7e71TeInmKN/QJGPHY4z29cf9MKu2UKQ6M9
         Oy2sfP5YLRDe1YWhRcNCQ9nF4YfhJyVxBVpT2tFSfZcAFGTsxnNNGaANCNOTmr3RcwMm
         rh0LG7Ft1W8Z3miLivW0xmWPmxqMCPL2+FCk5ErFsIdQTVyuvQd9qZnrDyJpgdfFVT2d
         cIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712363; x=1794317163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
        b=q31HiHY2Z5ixaXxAIoOuFAJ4TP/hP6bNrLmN9PnwRbjL94aKBZynKrL2DaTrUtZjKN
         Y5KfDbiNJ++e8/Rr0TiSwEh0e4JeVqSpRJ8hvvlrGXzRqt496AwCcw4NywuHyuJe+Hm6
         66JFF3QZKv1xeWw2s+JMgFQf50DHZM9LKakR+SZqFp8rvcF7lkeS56+xy8QG3q/Z/n21
         4NVAhqKWkOjBJQCfj/o12o4mIe6Jw/8JQu7x3a4zGQ4ICSx56hCir7Ud9MHFDw8fVDkB
         h0coAwk3+TinmelZk5fAJORxVCKXwh8LjehWi1Mi8WRK+CJP6URxcWfNOCdZbRo7SkGv
         LZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHs4pmwr7CfD4baiogfOEUcOAj5ixj2cfBOYjeCn0OyFM/raIXotrYlBuBM9HmgzGveceOvBrdhK3W1Ft/4y+A@lists.infradead.org
X-Gm-Message-State: APuU4Z/C1EMxoc1CeAEncsKsLHKcohW0vON+V/mdYsUzGT5w1wkb5wSP
	hn60WUXqtosP6bThcA1MT5DmWhrKzvFlxky8ak5EkM21DN13JqgiBLu7
X-Gm-Gg: AYBFou3buH6TC6CYYN9Lo5DzNtM205GoAnosHqVv4cN2L6Sp7ywymk831OKhudoJJeR
	DvBgl8Of35VcjTV2Rhfv2Inz8lJDQxbjtyvCqroubmEZALWd75AkYSiezcAChnDOpgBjL9s/4v2
	HxrFRahMwGyY8+PSESSCuPAFT1YkD1Cc/kw0B1YxT6wzQfMh29ngZSlxl2Yrlk/Hf3yx125quRx
	EWQGiMTSttgcf0HsR6rOEq2aqDX3HUTukCDjEbS7bYAJ2ijexFT5SRXy56KxDr4kyQOJ2AaeKlO
	acN3cu95tGyMUydh98Zr9meS2Kl8GptzVUWF6ItDD4i+3AegZt0AXGzg5LvgAIGkcGNIVIbE8eN
	l/Ytmb4MUwZICgQEwrbOBgXypAz3Qgn1rPUKjIRSFqTbqGpP/1ryOZWGnybOEjfCHWTT7dQx+Oz
	tZexO+ffh1cpxuuJzOaG637GDjIZYF3XFW9GamTr2HzIRPLMZL1hQKA7tdMosgjDUWBgyrFEahs
	xd24a7zL3NyYRu+9D7Jh+6NIRuEgRigzB24VTmB9mjlC8kheHgPGjlFtg39JpynJ3PbYhLXYxd6
	+V86Yld5J50kbrI42r/M4r8kPwnvTqGu2B4Wm9G9x46dxQSeCOI+twXLwoQPoc8jrsufWMXunp+
	QQg==
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ac17567fe1mr309294265e9.12.1793712362853;
        Tue, 03 Nov 2026 05:26:02 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:01 -0800 (PST)
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
Subject: [PATCH 2/5] ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:34 +0100
Message-ID: <20261103132537.3717496-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052604_999343_1F6EBF02 
X-CRM114-Status: GOOD (  13.52  )
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

rockchip_i2s_tdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_i2s_tdm.c:1304:(.text+0x14b1b6): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_I2S_TDM unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index d7ec1fbe17a5..0f8ef6868356 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -14,6 +14,7 @@ config SND_SOC_ROCKCHIP_I2S
 
 config SND_SOC_ROCKCHIP_I2S_TDM
 	tristate "Rockchip I2S/TDM Device Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the I2S/TDM driver for
-- 
2.43.0


