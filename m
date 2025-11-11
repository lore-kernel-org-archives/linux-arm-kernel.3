Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC0FCD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2KymYORFR0at2+9F4Hxp1un97KFrWhKXE3xpCieK6k=; b=HUISusGdvOgeuazOQtf2n544Fj
	Ze5v8+HFeSDceBiqVBvOaysK8m6YXFLjW7Fb44/aATAHHcXCXhpSEBrsolPGXOci5D0o+hmmcxHvZ
	qyrHWVvBVGdPtD4s8tGEkRW8+6Fonh7YNGTRFohtzww2uYj6lGW0L0oxUiw1vXIDYcldG3IDxNJST
	L3sapxGL03X3NeZfvLs+tjqu8u50sdCxE6HQ9ejRYrsLSPUpGy+PG68dROToY2pgg2Gc8l2MInNWJ
	OImq0dR1fRBrW+iLYkRAwYqSHaTh7ar8zpA2N2nE/Pb4M6jNddHNj+hPh6wcGMfe2s75gDPDyLcD4
	UGl+rOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6T-00000006t3L-1DLz;
	Tue, 11 Nov 2025 09:55:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6O-00000006szt-3oyP;
	Tue, 11 Nov 2025 09:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854950;
	bh=cNvYZKW6YhJW2L+1gEw0wViDTebbKD9GOujXv4uoegE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mL7f1npslPZL/j0dab3kbRT6ydLvM9o8W3qMV96Ar0bw9k1SSm8iDW+omfSKh0P5x
	 YXR+xDlwW8WIns3GkxNKeaDSE+7MDapmfeT4B2V0OUxJjdAYka9dSaShH1v9j3mdYG
	 STZnnlNy6uTVkUjjX19c1/Ie+xPtRFEaM8Z59jZVWohoPLOSuKyxyaVR86LAs724Y1
	 23o/RaLyGdettwF0O08Y5skLw0YUiFUXl7YDkDsmjtVw/kXEwM2vw3PK1UzOsMkyMu
	 07xUQqFBaREi/2eGfAyC8+5VsT8QxX2NSg+szXdGszl2DwW8RK5V4aL8PcWHSNMeqB
	 RhsKilbLfJSxw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 541BA17E13B9;
	Tue, 11 Nov 2025 10:55:50 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,4/5] MediaTek driver updates for v6.19
Date: Tue, 11 Nov 2025 10:55:39 +0100
Message-ID: <20251111095542.13958-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015553_105004_751DBD0F 
X-CRM114-Status: UNSURE (   7.46  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.19

for you to fetch changes up to 4459d667a3d7001d1c1703dc79c87db1808cdde2:

  dt-bindings: soc: mediatek: pwrap: Add compatible for MT8189 SoC (2025-10-30 10:25:05 +0100)

----------------------------------------------------------------
MediaTek soc driver updates

This adds socinfo entries for MT8189 Kompanio 540, an extra entry
for a variant of MT8391 (AV/AZA) Genio 720 SoC, and support for
the PMIC Wrapper (by adding a compatible string) in MT8189.

----------------------------------------------------------------
Louis-Alexis Eyraud (2):
      soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA Genio 720
      dt-bindings: soc: mediatek: pwrap: Add compatible for MT8189 SoC

Sirius Wang (1):
      soc: mediatek: mtk-socinfo: Add extra entry for MT8189

 Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
 drivers/soc/mediatek/mtk-socinfo.c                                 | 3 +++
 2 files changed, 4 insertions(+)


