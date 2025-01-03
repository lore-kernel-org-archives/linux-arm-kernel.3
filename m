Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818E8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8hnr3P1w6tJpgUo3b5IOw2wa90vqGlEyqREv5vyiagM=; b=IDnc+vhk3XnWdkmKelfZN6BiTO
	zvkg6Jr21JNh5pHQ68j6kg/lGDUvAgHrzagkz50Hi7b27aC5ht87ohKQhiFBQQgf/6/FV2YIlobTC
	YIwp3aNGNKQPFaQVJmnAVsUac2b4swHuYIb39xoEO4g9kUZLyBmmA0eNRGGr5Q/ldjqYckRzHY5qv
	2LfjxfWqeo0NYF0hQRwdPW3VKffO1k2yyf4mX9GoKEbBorFYqZS6NwVoakhLX8jtHQqw/whXCQJZB
	4zqhZ94BSKIDh0r+LEqCMrvPTIe9FsNGvX+MstEMNeBu2laujpsm82WW6FAWZJ/6BidO7nEpXYNAE
	FmkOR3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXmA-0000000BxkA-45Uo;
	Fri, 03 Jan 2025 02:51:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTXkz-0000000BxXL-3zra
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A8CD5A40144;
	Fri,  3 Jan 2025 02:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FD5C4CED0;
	Fri,  3 Jan 2025 02:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735872588;
	bh=Ka1T8Z+8lX/trH3ErYbgl/v6NF3bsDw/cx4eBxax2oU=;
	h=From:To:Cc:Subject:Date:From;
	b=scbIK8eTminIMtmXYnHqG7NFNMBX5oc7gyzYwhzoq++7XIc5VgtaPjnwXxMQtmeUT
	 Tl8Pvyv5UmmcEKcLRTi/Dj4UFHwqVgLg5+frHoNTS0mrKZu74rYl4VHxietpZja7sG
	 9L3oxVMkRRASC3a1HRyqEntF4vEcKqGwwe/12X0H56QZSuVG2W1MLDd/hwW/RYWh22
	 MJbc9EZ1agBpYjtmhpDD84MV4WUgKJSXNVP1bpPsyoJqsdh3Hr3iauNZTCm0U7ebFr
	 Nxl7M8sVbwUCapYlrcA7O8P/FGlHZK2vQVH4Cuax6qTCPX9INcjiOA5lxoKMFFe2n1
	 sOpjIj6VisUlw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.13
Date: Thu,  2 Jan 2025 20:49:44 -0600
Message-ID: <20250103024945.4649-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_184950_064085_FCA3A766 
X-CRM114-Status: UNSURE (   7.53  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.13

for you to fetch changes up to 8a6442ec3437083348f32a6159b9a67bf66417bc:

  arm64: dts: qcom: sa8775p: fix the secure device bootup issue (2024-12-25 22:05:40 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.13

Revert the enablement of OTG support on primary and secondary USB Type-C
controllers of X1 Elite, for now, as this broke support for USB hotplug.

Disable the TPDM DCC device on SA8775P, as this is inaccessible per
current firmware configuration. Also correct the PCIe "addr_space"
region to enable larger BAR sizes.

Also fix the address space of PCIe6a found in X1 Elite.

----------------------------------------------------------------
Jie Gan (1):
      arm64: dts: qcom: sa8775p: fix the secure device bootup issue

Johan Hovold (3):
      Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
      Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
      Revert "arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers"

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions

Qiang Yu (1):
      arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a

 arch/arm64/boot/dts/qcom/sa8775p.dtsi                      |  5 +++--
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                     |  8 +-------
 4 files changed, 24 insertions(+), 9 deletions(-)

