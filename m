Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0487DEFCE21
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RqJYCbHb9tmA2CyGhe4U3B50CK2krWqMwQh8KBjtgo=; b=HMX9Nokx/DdWi5b4G5U6KYaHrB
	h6olm3vEeDnk/Weu8CtJsU6eINs1XhrI8FuPqaBLjyeU7ToP6nT3Bn6AKv6BpJPMdPLyQrIIqdSyN
	FT/HNqH5X5fldITwJn/nfmTC+cwDiACQGtl7o4JdZAt5Fjuy+jwM83k6PFwwgjtQ9up6/p5RqlcAu
	AQCgQHwIdRlFOwYB1CMTUH18br38jjjdB7DqffMJvACX6O98xGo8b1UU3TZyFan0sg4aStsB0dC0P
	5SbZCIW05PpN/lS3zJwW+82qaZsAH60GpDhR+hVKC26H/IJr26/lGpAnMEI5IiHqK5RBhpQ8L2bLT
	aI7gMbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpkj-000000008hw-2t9z;
	Wed, 04 Mar 2026 17:11:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpkh-000000008hT-0XI1;
	Wed, 04 Mar 2026 17:11:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4915C40993;
	Wed,  4 Mar 2026 17:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD879C4CEF7;
	Wed,  4 Mar 2026 17:11:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <marc.zyngier@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
Date: Wed,  4 Mar 2026 18:10:57 +0100
Message-ID: <cover.1772643434.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_091115_209722_8354C73E 
X-CRM114-Status: GOOD (  17.58  )
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

	Hi all,

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
series drop all such masks where they are still present.

This has been compile-tested only.  But note that all such masks were
removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
systems")).

A related question:
The GICv3 DT bindings also support only edge-triggered and
level-triggered PPI interrupts, without specifying polarity.
Apparently, even the common gic_configure_irq() just ignores the
polarity, also on pre-GICv3, so specifying IRQ_TYPE_LEVEL_LOW or
IRQ_TYPE_LEVEL_HIGH doesn't matter at all?
Actual SoC hardware docs (e.g. R-Car Gen4) does document that some
PPI interrupts are active-high, while others are active-low.

Thanks for your comments!

Geert Uytterhoeven (7):
  arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts
  arm64: tegra: Drop CPU masks from GICv3 PPI interrupts
  arm64: dts: qcom: Drop CPU masks from GICv3 PPI interrupts

 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi       | 10 +++++-----
 arch/arm64/boot/dts/exynos/google/gs101.dtsi      |  8 ++++----
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi    | 15 +++++----------
 arch/arm64/boot/dts/freescale/imx8mm.dtsi         | 11 +++++------
 arch/arm64/boot/dts/freescale/imx8mn.dtsi         | 11 +++++------
 arch/arm64/boot/dts/freescale/imx8mp.dtsi         | 11 +++++------
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi        |  3 +--
 .../arm64/boot/dts/freescale/imx91_93_common.dtsi | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx94.dtsi          | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx95.dtsi          | 10 +++++-----
 arch/arm64/boot/dts/freescale/imx952.dtsi         | 10 +++++-----
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi    |  8 ++++----
 arch/arm64/boot/dts/nvidia/tegra234.dtsi          | 10 +++++-----
 arch/arm64/boot/dts/qcom/agatti.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/lemans.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/monaco.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/qdu1000.dtsi             | 10 +++++-----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi            |  8 ++++----
 arch/arm64/boot/dts/qcom/sdm630.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sdx75.dtsi               |  8 ++++----
 arch/arm64/boot/dts/qcom/sm4450.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6115.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6125.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6350.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm6375.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8250.dtsi              | 12 ++++--------
 arch/arm64/boot/dts/qcom/sm8350.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/sm8550.dtsi              |  8 ++++----
 arch/arm64/boot/dts/qcom/talos.dtsi               |  8 ++++----
 30 files changed, 128 insertions(+), 141 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

