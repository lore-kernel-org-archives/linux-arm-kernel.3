Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1B2CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kDvkcTKzTZOXFLnBmUyBCCmi6iLUXgPwNdCSS8+KcoM=; b=UexesqetG3qeBywb5foV6guueR
	hHwVRY7iAUTGDbGyvgqQJ/dXuOS4zrDkvliepwCO+Gch748HCl9jWyi8Mtnrjxi0S9wKXTKxDhEuS
	XefLDFVcNKD2ewPniMXnuBAoms8CYAhE4AW12bQzqlqU75bl9mQhcixSkW2Uy2lC9u4+NVBZZGX79
	r0gg4opNlLGtrdrHiPyb1aas4Wb9gkhtxjKUwlZZ0AzW/xQliir6//5daOovvAeUFQjLRRjZJho5A
	fl7aG+4vl4q0ExXNaYviodiNxJ5acDS1SqrStAZbsjkaDKttr2QnFXZhWcFdY8iGspE400wmQucST
	eeQeXMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpBO-00000005Xd3-0Ubw;
	Thu, 11 Sep 2025 21:50:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpBM-00000005Xcg-1q3z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 21:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6274600BB;
	Thu, 11 Sep 2025 21:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D919C4CEF0;
	Thu, 11 Sep 2025 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757627419;
	bh=glxC6FwjQ8JowbY1TETO4EMaJ5BNVOWlNBc74WQK45Y=;
	h=From:To:Cc:Subject:Date:From;
	b=XWFvVGZa7KfyHd1L/fK35DZOQarnm6Zde3N5nm+oF9PC0RuMIM4U3NmoeJcT8m4i5
	 AFnJDd96IROPso4j9qaDwXaeMat4pwMBGhJxmKf6txgMLFOFNz/TTyb2icN68SxnIE
	 9UbHbHiM5jeZFgfNcT8e4AFvOSGDMAItqMRhrTQ2/cXljvpwyigduPLpSARVqxwgku
	 7b3v1VRLiG6aiuwpU2LIcOW0s3YDDQh9I0aIteyPA58smVwTElXQUXqTiNWSsm+M/U
	 j/OLVdn0mYpKvNc5hvtjwfXNUAxQuiXQx4lAwCAS2BlQ8rnxxDsag5mzcrfqh/rABT
	 GLIRhuClqFS1g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Jens Reidel <adrian@mainlining.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.18
Date: Thu, 11 Sep 2025 16:50:14 -0500
Message-ID: <20250911215017.3020481-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.18

for you to fetch changes up to 3cc9a8cadaf66e1a53e5fee48f8bcdb0a3fd5075:

  firmware: qcom: tzmem: disable sc7180 platform (2025-09-11 16:38:33 -0500)

----------------------------------------------------------------
Qualcomm driver updates for v6.18

Allowlist the uefisec application, to provide UEFI variable access on
Dell Inspiron 7441 and Latitude 7455, the Hamoa EVK, and the Lenovo
Thinkbook 16.

Disable tzmem on the SC7180 platform, as this causes problems with
rmtfs.

Clean up unused, lingering, parameters in the MDT loader API.

Unconditinally clear TCS trigger bit, to avoid false completion IRQs in
the RPMh/RSC driver. Fix endianess issue in SMEM driver.

Add pd-mapper support for SM8750.

----------------------------------------------------------------
Barnabás Czémán (1):
      dt-bindings: firmware: qcom,scm: Add MSM8937

Jens Glathe (1):
      firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16

Jens Reidel (1):
      soc: qcom: smem: Fix endian-unaware access of num_entries

Kathiravan Thirumoorthy (1):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible

Krzysztof Kozlowski (1):
      soc: qcom: icc-bwmon: Fix handling dev_pm_opp_find_bw_*() errors

Luca Weiss (1):
      dt-bindings: soc: qcom,rpmh-rsc: Remove double colon from description

Mukesh Ojha (4):
      firmware: qcom: scm: preserve assign_mem() error return value
      soc: qcom: mdt_loader: Remove unused parameter
      soc: qcom: mdt_loader: Remove pas id parameter
      soc: qcom: mdt_loader: Remove unused parameter

Nikita Travkin (1):
      firmware: qcom: tzmem: disable sc7180 platform

Prasad Kumpatla (1):
      soc: qcom: pd-mapper: Add SM8750 compatible

Qianfeng Rong (1):
      soc: qcom: use devm_kcalloc() for array space allocation

Sneh Mankad (1):
      soc: qcom: rpmh-rsc: Unconditionally clear _TRIGGER bit for TCS

Val Packett (1):
      firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455

Wolfram Sang (1):
      soc: remove unneeded 'fast_io' parameter in regmap_config

Yijie Yang (1):
      firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK

 .../devicetree/bindings/firmware/qcom,scm.yaml       |  3 +++
 .../devicetree/bindings/soc/qcom/qcom,rpmh-rsc.yaml  |  2 +-
 .../devicetree/bindings/sram/qcom,imem.yaml          |  1 +
 drivers/firmware/qcom/qcom_scm.c                     |  6 +++++-
 drivers/firmware/qcom/qcom_tzmem.c                   |  1 +
 drivers/media/platform/qcom/venus/firmware.c         |  4 ++--
 drivers/net/wireless/ath/ath12k/ahb.c                |  2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c                  |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                   |  7 +++----
 drivers/remoteproc/qcom_q6v5_wcss.c                  |  2 +-
 drivers/soc/qcom/icc-bwmon.c                         |  3 +++
 drivers/soc/qcom/llcc-qcom.c                         |  1 -
 drivers/soc/qcom/mdt_loader.c                        | 20 +++++++++-----------
 drivers/soc/qcom/qcom_pd_mapper.c                    |  1 +
 drivers/soc/qcom/ramp_controller.c                   |  1 -
 drivers/soc/qcom/rpm_master_stats.c                  |  2 +-
 drivers/soc/qcom/rpmh-rsc.c                          |  7 ++-----
 drivers/soc/qcom/smem.c                              |  2 +-
 include/linux/soc/qcom/mdt_loader.h                  |  7 +++----
 19 files changed, 39 insertions(+), 35 deletions(-)

