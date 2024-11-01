Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB9AE6F06A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4E/EXRdtnxyHa1vd7IEyiN43huINSQfUE46jut0Lvhw=; b=NyCsHb3m8MZiIHrQxEvRuhL4lm
	N1Jemp9yIhTFKYg/EVDdKaLBZWTmtvhsDd+X/PcuWMrdPYoLlM7aFnzurWFuQ0iPr8h3mdqD5aK43
	CAKhkp1cvo4hhUISYTGSdaztZii81IqogM+C/RxXE+8WHRrevreuhy6VPcgoGfGO/dUeP4yo7lmVk
	dHiq9UkoXHkk8SI7vh58ryacRIgdIS6q5bJ4354xrXbcj5d7wL1iX9YjvqKjIaa4tOpwo/WhNFd+R
	AIZkNhaUCvi6lVGZkzBKiGw/rUEDEHPhA3onM3IXoK4nD46G35Nv4FyxxRq/TA4OlVw8EnQDaeodo
	WnJ5nCYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szJ-00000007Opf-24R1;
	Fri, 01 Nov 2024 14:50:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sh7-00000007Lt8-2Hho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47D0FA44226;
	Fri,  1 Nov 2024 14:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870BAC4CECD;
	Fri,  1 Nov 2024 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471528;
	bh=QkWKnBsAHTldTBGGifsX0KtIWA5PIk3Dk4/LyfzY414=;
	h=From:To:Cc:Subject:Date:From;
	b=HgIZvRn8R8dJPQqs23jKUno8Euzdg3MJUjF2PThFtuAyTIIReX4VRZ2L+gudQNc6b
	 PMJiO4ZKelQSI3JxbrvLmh6Ulp1qozlxu+jPXkgiOZxQUVE2DvkseVQxFh1FI/qUwL
	 0aKxpeyZ46Rbqvui9qquQe0uj8YHdERaLiAuLjQb9MQ3h4HQQUGR1scy/eUcv/MraO
	 lX695GGOfYco7FF/V5Z2JE2KfCHz7buYFDZOA+GuBkZt0EYAaEpwecdvCb72Ri+uiZ
	 F7nPsuSHfZU4Jzmf0A35aQpKoHK0SbWHHRx6c8q9HqE5TjhUQegj7/c8yIDqEJlF0D
	 6i+5vGT1Yn7Pw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
Date: Fri,  1 Nov 2024 09:32:05 -0500
Message-ID: <20241101143206.738617-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073209_745271_8E10D74F 
X-CRM114-Status: UNSURE (   7.37  )
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


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12-2

for you to fetch changes up to 54376fe116ef69c9e58794589c044abb2555169e:

  arm64: dts: qcom: x1e80100: fix PCIe5 interconnect (2024-10-24 12:36:36 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree fixes for v6.12

Bring a range of PCIe fixes across the X Elite platform, as well as
marking the NVMe power supply boot-on to avoid glitching the power
supply during boot.

The X Elite CRD audio configuration sees a spelling mistake corrected.

On SM8450 the PCIe 1 PIPE clock definition is corrected, to fix a
regression where this isn't able to acquire it's clocks.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Add Broadcast_AND region in LLCC block
      arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes description

Dmitry Baryshkov (1):
      arm64: dts: qcom: sm8450 fix PIPE clock specification for pcie1

Johan Hovold (10):
      arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
      arm64: dts: qcom: x1e80100: fix PCIe5 PHY clocks
      arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-vivobook-s15: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-microsoft-romulus: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100: fix PCIe4 interconnect
      arm64: dts: qcom: x1e80100: fix PCIe5 interconnect

Konrad Dybcio (1):
      arm64: dts: qcom: x1e80100: Fix up BAR spaces

Maya Matuszczyk (1):
      arm64: dts: qcom: x1e80100-crd Rename "Twitter" to "Tweeter"

 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  2 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |  2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  2 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 10 ++--
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  2 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  2 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  2 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 53 +++++++++++++---------
 8 files changed, 49 insertions(+), 26 deletions(-)

