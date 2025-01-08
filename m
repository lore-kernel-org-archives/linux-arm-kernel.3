Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC9E77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KT2tjX9XygehrPkf2HczMv0gnXRcahbcg4wPmSSPfgs=; b=SVAaCa8FiI1w9VcA4GKa6s+K7P
	RHUS2zqdi6dXCaOo4zfcw8/zEl+O9TDr1FKC+vL1xtM5ZPb4CNfSlzgkSk0xyxfPuSJIzc34FPqGQ
	FrtIzryPBBobSoZMT+z/Rv3gelwJbtyZrRqx/GZeuiruBkTncRqsf6omF/5jWwn35VJZuBqocomw4
	/VR1QFKTZwJTp8Wo4rh93YkReuDIZyr/mISKJDOWi6C5YTsViOSTVPEGPvCxV2yGyS18j7r/M1SkT
	LNZv/dDCJWoC/KIEsdfhd3J2tsCeQMFAGKJSlQG2mACuLMgapMLYJybNJ/GMNBgZUMmmfvWynpGO0
	P96gudVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT4i-00000007w94-2WDU;
	Wed, 08 Jan 2025 10:14:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSzO-00000007ul5-3PEA;
	Wed, 08 Jan 2025 10:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736330917;
	bh=XNjr7+7H8RUJt2sqVP/iNW1KTrzDKKV78lvp4eyy0HU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVyOKK8mQVXl/TXIcHhNxU7TONEN4o89LU7FehSU8zgoP/LxwpQ6Fquq2y1w27Q+3
	 yiOV/Yxuf9cLNw35tNhOxyHz7evCfgsd9CocxAXcUVE0+zcEfkswOvCaF/Xcndkqyq
	 7V68srxUSv6U7ZE866NeAAI0JUcc1HycAkNTlwngq2EIEDCVALd0ldQzHqz2rWy/5P
	 Bcf4AnpogZmKOhadrmW1Q3qyPJM8Jpn02pcmCBvBL7hlktv9CbUTmAmBwoi63WS5Nz
	 slffg9qk+9kJffF8ljkGlJPveZrIUBiEa95hbLqxLt+T4j+QC9AmuLNaRwd0SL4erR
	 HLSXr2v8bmwnw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 12AE117E1555;
	Wed,  8 Jan 2025 11:08:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.14
Date: Wed,  8 Jan 2025 11:08:24 +0100
Message-ID: <20250108100826.32458-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
References: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_020838_991113_47D5CB50 
X-CRM114-Status: UNSURE (   6.55  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-defconfig-for-v6.14

for you to fetch changes up to cab316255951188fb2847af04f2123c1ab85dadf:

  arm64: defconfig: Enable MediaTek DWMAC (2024-12-23 12:08:29 +0100)

----------------------------------------------------------------
MediaTek soc defcofnig updates for v6.14

This enables building modules for the integrated Ethernet
controllers (MediaTek STAR and MediaTek DWMAC Glue layer)
found on various MediaTek SoCs, and building modules for
enabling the sound card on MT8188 and DSP on MT8186.

----------------------------------------------------------------
Nícolas F. R. A. Prado (3):
      arm64: defconfig: Enable MediaTek STAR Ethernet MAC
      arm64: defconfig: Enable sound for MT8188
      arm64: defconfig: Enable MediaTek DWMAC

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

