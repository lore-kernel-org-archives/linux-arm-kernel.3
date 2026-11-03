Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AADA606EEA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H3BfpgR6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MM26Ib2t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=; b=H3BfpgR6zQLJUX
	aVWWdlO43TriOdMHiPSnBYAIu58M9qYLETY0TZNQrgJju0s51NyGp9+k4/gzUJHaAtixsgQhcUxPV
	QSUWVnpGxilijHN3LL8/7C0csOowr/shhUYYIMtS4N/HgJKkK6VJjFSKvhOksrzNBMLHafnS7is29
	u2Q7QkNPFWWoyoWYDy3PUSl4MCTXGupj3h5A+gwCe8Chdd0Lh4wt9R/viG79yk6+vWI8/0h73/YM6
	T1id1HmGds8Vus94d3tOg9o4koJBg3Fs9WQhZx8ASpn2ohuLDMxy9uiV6o9xKJ1WEIn/4w2WJqGyp
	BjcdHSQCx42sMErHMpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWd-00000002XjQ-0Kzr;
	Tue, 03 Nov 2026 13:26:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEWa-00000002Xi1-3ZaN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:26:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2426829f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 05:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712361; x=1794317161; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
        b=MM26Ib2tlSB2fnBKGlMgKuAqGKsuwuYIUo9hBxuF4QPrgg/ZKsHcT2y4BVDGutgVzw
         Xe4QkZBbrtBI3UBrNIPzebRSFpFU89uIQ/1QB2hPBJ9BEB2yA2OvKQ+4AWiJ32QjP8Tz
         qEqN0KeGwWAaW0ofpb9TxtAp2pwYq16v1lhkPKa6QO79pGAcqUCQj+d1fHwfyn0Ynf2s
         yxTxshMYat88gzasrpHmrN+xqg10XNU4ZpprwP05NbUkW0Ss0iHAZVoqayxgIVX6NJVh
         ZGeP4qy02Y7oQb/kxzC+LyF6detLJu17WOk/tvVB8arZnZpm73MJoc5InGAXvusBXCtG
         wOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712361; x=1794317161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iyxcrfJd2R6utTsQVGbm2c3rEERhlQ+yqDUDF6loNwA=;
        b=lleykE3PNPVaVRyvfXVrL9nJSiT4fTGWM9hLt4Y/jjlKuE/2eKz3tOPWGrZvgwC3xw
         8q265+IvAvSF5aFgcrIQk/7PFvy04HbEqsqWJbPhUiXuqGRVoLWvB7C5jx0ki4udtZ5a
         9frSoTV7pa8MwePXzVYWWlQcVmng09TlVFY0vMS0ElO5xh/BPF8gpln/3UxOgtIiQN79
         xTd1AasZvMYvR7pIH5g9OkzzMjWqslamxelQpqrdEMoEGIduprI7MVrGPqkXKWL1Tn3R
         yLJEiySIRdiEUaTsbtT26cIhEbPJqNw37s7PqcC4Ju6tpZeyNnSizW0wXObUx+Ci15oZ
         PdtA==
X-Forwarded-Encrypted: i=1; AKwUvBwX7TeiER3rMohJpYRIBSl/T2vn+l9txfmvSut97IfVIY+jF7lCLODX9GguFuE2SmMNJhHuTdd4kiXmnfh0qBP4@lists.infradead.org
X-Gm-Message-State: APuU4Z8oCbjbBGK4Hrc4vkoMhB2cMmiMrX5gLS1/IuRdmYsqlntzVcs2
	d1tMasYxhorK2l7C+b0pTyjB4G6z4QwU217ySPfRSVPfac6wBvI9hI/l
X-Gm-Gg: AYBFou0v5Bue6ZDkDQIQy124DxS0Ecoh8yEhZNSpI14nPm8yOH25g9QM2bdiF6bbzc/
	qfREibY7JmAly2xmoyRbNP5F6RCT/xBlTyL5X/9Mb9QQIsM939YpTTdb21SYUvO10mxZHOaLZMQ
	Ng08xYMBClh+Dn/6xtAdneHMlho8ZDtWgchG02SE0Bbd4nctij5Oda0po4yW8c7pbklzRk4VrV1
	tAWy7U4QvaLjb50WO3keNAallB1q/iEYft9ieVXdpWWFaHWwvns7XcDqH0e3lZpS46iAp2iZCaR
	q/POn4n6Flq4TF7b5Ax2U0LwXQSSChN/P4o2cxCB+nBb3pEk4yOLWcmWk2kjfp2soAMbW5W42Rw
	i2UD9UQOhm2k7wzbqE2XA4PpSLDePzaQMxDp2cA9v4ydfwtlUMoL5luzBSqyTSjRZw5+3ehqot7
	F431J8h/tYBkGdhPqT8Y4B/jXitBwCIABf96adRvfst25Eq4v6pVrUHkFVe9GfexXJhB/c/6Uba
	73GmycIuXwpK/cm3y4h7egzWzfBbjU6w2SpUEg3bYzUpLhP6QgtM63w+x6h7omzXgX53D8oWcLB
	JHoSMrKDvNpznMj1BxskMD0Gc5gLh9HHDK6GGOhUuIjjNMU2KPQW3f7jXfR4qSTL1u5km53udXJ
	OPF0=
X-Received: by 2002:a05:600c:46d2:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4ac187a6a38mr302145995e9.19.1793712361435;
        Tue, 03 Nov 2026 05:26:01 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:00 -0800 (PST)
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
Subject: [PATCH 1/5] ASoC: rockchip_i2s: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:33 +0100
Message-ID: <20261103132537.3717496-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_052604_916247_9FE4737B 
X-CRM114-Status: GOOD (  13.43  )
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

rockchip_i2s calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_i2s.c:(.text+0x418): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_I2S unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_I2S=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 4495c89fcf26 ("ASoC: add driver for Rockchip RK3xxx I2S controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 391ce2225fde..d7ec1fbe17a5 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -5,6 +5,7 @@ menu "Rockchip"
 
 config SND_SOC_ROCKCHIP_I2S
 	tristate "Rockchip I2S Device Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for I2S driver for
-- 
2.43.0


