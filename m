Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2759ED3F080
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 15:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SSf7OSoSkFISB26vx0stP0q2opk88sKXgsIZt4pSwHI=; b=GminBYEaBUUhaVU0zJCdr3hXcI
	8Qmth/7MFqv2blgqrSRbQcwt5E1KHd2BIrUN3WNv0B9PtW+wZ+neNi2RcmQJo1TflUulpoLP/cqp9
	ATBgIxZ1NCqOg+sGkhwIjl+//rhlYpOWR3MANXoT+ZsBZz2OhNmP/yL8Kw7mfRatRo+XApfrFWqjd
	ThxhFT/lyYgoWMhhCGAwiLSLsqU1UK/6AubN1uqEGbkZor/Yg1ZX/Eh0qRzNHtxcqpbbaDayZUoik
	4JT29ozrXd4LQ88CAl6hfJfEc9JMhOdI4KdId9Dsq+a+7eYk0EgvqwwDzmAF/+kPA06y8pctfQSZb
	Ffw73Zzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7VP-0000000GHvQ-3ieu;
	Wed, 28 Jan 2026 15:30:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl7VN-0000000GHuG-0hgG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 15:30:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18E8C438E3;
	Wed, 28 Jan 2026 15:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEEDC4CEF1;
	Wed, 28 Jan 2026 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769614252;
	bh=J991PkmjZ7cA51EaGuqYRzLfi0O3QuM9Zcdo95J/bZs=;
	h=From:To:Cc:Subject:Date:From;
	b=Ey0Cgf/BeMmcHmj9Po1fk/yF9Z/LBh3tzQRGuNTcualGu6dgs18PGcZT73ljIOQwN
	 rdc/+4WGYKPAV9tbIwjeb8CmxBxJfrUS9SDW+ffmc1NoJBgrXEPj+XiZ/c6xaw850m
	 YC96uVsb6/HqeAIjUe9AX/wv78r5RaNCHHAgP5qrQzW7D8o7xT4OVvONxmGcrc7cSm
	 Ykg7R+STzZgnSSZBkSdcYr6TQZMN8+pNEKGEggAYbQz3WGbHIV9ZuV2Jlbc/21HeGA
	 RsuFwGbkJRTs0c7LyJQusnjcDXiqHZrQE/nnu3Lf3zKTjMNiGfBYlACA6+l2oJtvTP
	 ppQsiycLvJEsQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca@lucaweiss.eu>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v6.20
Date: Wed, 28 Jan 2026 09:30:50 -0600
Message-ID: <20260128153050.2092039-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_073053_245444_C05A20CF 
X-CRM114-Status: GOOD (  11.96  )
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


The following changes since commit fc12767c19d49663b13ba2def6e4674df041c8a2:

  dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Glymur Platforms (2026-01-17 15:35:17 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.20-2

for you to fetch changes up to 78c13dac18cf0e6f6cbc6ea85d4f967e6cca9562:

  arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions (2026-01-21 13:15:50 -0600)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree updates for v6.20

Enable ADSP FastRPC and add missing GPU memory regions on Agatti.
Also add the missing GPU regions on SM6115.

Describe the application subsystem watchdog on Hamoa and enable this in
the EL2 configurations.

Add the camera control interface (CCI) I2C controller on MSM8953, and
describe the camera regulators and the camera EEPROM on Fairphone FP3.

Specify clock frequency for the i2c4 bus on OnePlus 6, to silence the
warnings about missing frequency definition.

Add FastRPC and associated heap memory, as well as Coresight, on SM8750

Switch a variety of platforms to use the generic RPMPD_ constants,
instead of target-specific duplicated, to allow us to drop these from
the header files.

Drop the invalid opp-shared on the QUP OPP table for Talos.

----------------------------------------------------------------
Abel Vesa (3):
      dt-bindings: watchdog: Document X1E80100 compatible
      arm64: dts: qcom: hamoa: Add the APSS watchdog
      arm64: dts: qcom: x1-el2: Enable the APSS watchdog

Alexey Klimov (2):
      arm64: dts: qcom: sm8750: add memory node for adsp fastrpc
      arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes

David Heidelberg (1):
      arm64: dts: qcom: oneplus-enchilada: Specify i2c4 clock frequency

Dmitry Baryshkov (2):
      arm64: dts: qcom: agatti: enable FastRPC on the ADSP
      arm64: dts: qcom: switch to RPMPD_* indices

Jie Gan (1):
      arm64: qcom: dts: sm8750: add coresight nodes

Konrad Dybcio (2):
      arm64: dts: qcom: agatti: Add CX_MEM/DBGC GPU regions
      arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions

Luca Weiss (5):
      arm64: dts: qcom: msm8953: Re-sort tlmm pinctrl states
      arm64: dts: qcom: msm8953: Add CCI nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add camera fixed regulators
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable CCI and add EEPROM
      arm64: dts: qcom: sm6350: Add clocks for aggre1 & aggre2 NoC

Viken Dadhaniya (1):
      arm64: dts: qcom: talos: Drop opp-shared from QUP OPP table

 .../devicetree/bindings/watchdog/qcom-wdt.yaml     |    1 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   49 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |    8 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  516 +++----
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   16 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   57 +
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |    2 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    2 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    3 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 1431 +++++++++++++++++---
 arch/arm64/boot/dts/qcom/talos.dtsi                |    1 -
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    4 +
 19 files changed, 1694 insertions(+), 466 deletions(-)

