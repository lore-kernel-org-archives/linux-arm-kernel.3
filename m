Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516C4C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RPbD/JeYF3yIl4iKPtSEaMHSyvunbW8sXw1CEjpKfk=; b=sDYDbc5Gs65Q9zMm66XLFgoH5A
	/WTePWQIhw9h1jwBZ9Ekcop2W1NlWteQAc/68UQ4vmBUS5t/C8mzTLixxittwFtygn5LAQJWoZ8XL
	UdIyGiuKg9p2fEZqhYLgA6Jzy9ex/DxapdXKzV7tyCL3uX1T1jtHJiU1X+3w4xRctFKcJOG4L6AO2
	Kevv+S7l4C33MyjOMKIEAyE74j7YBGrGTsJk3Sh+lgpRQmmlDtxvCwjhv9ZRQt/K9hqzLj3bKqOl7
	TGuSVGSc/tIt/UA6Lol3vC9oHaAR1pMERmxDcRb4THCQnVVtaAAsQsz76onx2QcezS5ZO4llx2iRr
	XmRxCZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMCJ-00000009sTG-2QeN;
	Thu, 30 Jul 2026 08:32:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMCG-00000009sSC-31L6;
	Thu, 30 Jul 2026 08:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785400373;
	bh=VL0n7nQUDCiDkQdds0YBEGiAKC+RIRLDCXpvqYPJpNI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EUQ+iJdSJgtcwIfTdL2vHfhy4wuK1MhtaxrGZVwolMhKOPhYYk288Sp7Use/D6Qge
	 QP+9QgWRjExn47K3VWpntcXuvtAdCgq8EhqZDYtt6iXGYZ15nsxGWNttjt6SiRBtWx
	 hj9RGymv6rCF7ZwpO+6T7Mca4Enkbd2d7qZVf+ZHshAcoCYthuA1+RMz05DhQ02H5t
	 Ur9+uOoNFz9qwDnvGyd9SYnIGfSyhZoNCzmypUqrwJ0J8982W5oclKY0TYv46kEvdB
	 hbg8gZlXKgP041QyDkalIPsegVE/oCvh1uSkFZZsYJsWREegzqmXryhnjirNlCvuon
	 pEp+IWRV5iW1A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F3F6817E0667;
	Thu, 30 Jul 2026 10:32:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/3] MediaTek ARM32 Device Tree updates for v7.3
Date: Thu, 30 Jul 2026 10:32:45 +0200
Message-ID: <20260730083249.13867-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
References: <20260730083249.13867-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_013256_910991_63F11ECA 
X-CRM114-Status: UNSURE (   8.53  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts32-for-v7.3

for you to fetch changes up to 6326a6811b1af6674e3eef128df6a3825de26872:

  ARM: dts: mediatek: mt6323: add AUXADC support (2026-07-28 10:56:55 +0200)

----------------------------------------------------------------
MediaTek ARM32 DeviceTree updates

This fixes a minor indentation issue in the MT8127 devicetree
and adds support for the Auxiliary ADC found in the MT6323 PMIC.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: mediatek: mt8127: Correct indentation

Roman Vivchar (1):
      ARM: dts: mediatek: mt6323: add AUXADC support

 arch/arm/boot/dts/mediatek/mt6323.dtsi | 5 +++++
 arch/arm/boot/dts/mediatek/mt8127.dtsi | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)


