Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5248606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L9ByFCTt;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7IOfJvX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hSCaaw++8I656zFNy7LQRd8ABGr7mMB4uT74hb/cMaA=; b=L9ByFCTttZvmDI4S8HIs8VInqE
	5EJyflXM2wJvekTN8kH4O4vzvBpG5epRcZMdS0Y9ErbbMD2tostHbMTaVR5T9klg6+XLypCrKaZFl
	yWZo1Et+ftNP8B9zMUve6Esc6nECXeUL7aHgcY7iblzpWTTbTymCM1GJ4O4kI2yiG2QB8EWfpnXtJ
	2H9kyCmplkDTEP2gvr108V0goD9aqV3cM2OP0nA4gqq84U9tHf1fJlSPfRJiMt/WzGALN/EIqCCEw
	ry/99AUQ8F0sliVXgBWsdBTiyv1mi3G+F/zn6GZThhKUxe2y/bsVYEJFUPMHmT4Z7svJuvghfg3vJ
	FEFgNPbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM57-00000003hJU-1DKF;
	Tue, 03 Nov 2026 21:30:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOM56-00000003hJE-0AhU;
	Tue, 03 Nov 2026 21:30:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7834243C63;
	Tue,  3 Nov 2026 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5071F000C1;
	Tue,  3 Nov 2026 21:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793741411;
	bh=hSCaaw++8I656zFNy7LQRd8ABGr7mMB4uT74hb/cMaA=;
	h=From:To:Cc:Subject:Date;
	b=M7IOfJvX4tS+cjxfv8hnjjn4ahQi/zSlCAzZpqOgV5iftbC/NJ4KlHvuPE0DJA+c+
	 MTjlkr/LW9q203SjetCZ8ymojJw1xErc2I/C00BOgA97La+kkxFTeF/pstxISoVrDY
	 aiMQhaNQXI9SLKqHJ8lLe5yWcxRmSBCsZnkUb8ySJwl8bLUo6yWTpU92W4YFYsQE+r
	 R0lI9CalC2dBG5yOkxJhvOz4wNb6eXUweZz3xXJ9jut1Ny1P/GPSo+kop5W/WviWZM
	 VE1n9S//CUEqIrm3cKlGQm6MgvaJrMIYLGmyxxFH1VEQrILd7I5MDI/hDSx4Q+GcYB
	 oJ/WyJL+KuUnQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Ajay Kishore <akisho@codeaurora.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Andre Przywara <andre.przywara@arm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	James Tai <james.tai@realtek.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Paul Boddie <paul@boddie.org.uk>,
	Paul Cercueil <paul@crapouillou.net>,
	Qingliang Li <qingliang.li@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	"Ryder.Lee" <ryder.lee@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Samuel Holland <samuel@sholland.org>,
	Sean Wang <sean.wang@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Tzuyi Chang <tychang@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	zhouyanjie@wanyeetech.com
Subject: [PATCH 00/10] pinctrl: Fix out-of-bounds accesses, divide-by-zero, and error handling
Date: Tue,  3 Nov 2026 21:29:05 +0000
Message-ID: <20261103213002.1673560-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

Cc: Aaron Kling <webgeek1234@gmail.com>
Cc: Ajay Kishore <akisho@codeaurora.org>
Cc: "Andreas Färber" <afaerber@suse.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: James Tai <james.tai@realtek.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-realtek-soc@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Paul Boddie <paul@boddie.org.uk>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Cc: Rob Herring <robh@kernel.org>
Cc: "Ryder.Lee" <ryder.lee@mediatek.com>
Cc: Sam Shih <sam.shih@mediatek.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>
Cc: Tzuyi Chang <tychang@realtek.com>
Cc: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: zhouyanjie@wanyeetech.com

Lee Jones (10):
  pinctrl: sunxi: Fix out-of-bounds irq_bank index when first bank has
    no IRQs
  pinctrl: tegra186: Fix out-of-bounds register bank index for AON drive
    groups
  pinctrl: ingenic: Fix element type of x1600_sfc_funcs array
  pinctrl: mediatek: mt7981: Add missing entries to mt7981_ant_sel_funcs
  pinctrl: realtek: Prevent out-of-bounds access in
    rtd_pinctrl_find_config()
  pinctrl: realtek: Fix bit shift when configuring RTD_HIGH_VIL
  pinctrl: realtek: Initialise omitted offset fields to NA in config
    macros
  pinctrl: mediatek: Clean up partially initialised hw->eint on error
  pinctrl: mediatek: Prevent divide-by-zero for pins with fixed drive
    strength
  pinctrl: qcom: Check qcom_scm_io_readl() return value in
    msm_gpio_irq_set_type()

 drivers/pinctrl/mediatek/pinctrl-mt7981.c     |   2 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  24 ++++-
 drivers/pinctrl/pinctrl-ingenic.c             |   2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c            |  10 +-
 drivers/pinctrl/realtek/pinctrl-rtd.c         |   5 +-
 drivers/pinctrl/realtek/pinctrl-rtd.h         |   5 +
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c      |  11 +-
 drivers/pinctrl/tegra/pinctrl-tegra186.c      | 102 +++++++++---------
 8 files changed, 93 insertions(+), 68 deletions(-)

-- 
2.56.0.385.gac671c819a-goog


