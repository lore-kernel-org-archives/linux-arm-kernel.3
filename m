Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F350CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RStObp8O+/IC+7JlVdvjDo5RIZxNBdmJc3V71lTJZUc=; b=oTApg6tr2A8q/WOiKiLFdEx1fW
	FSvzQLGuUfOcB20WI8nkN1/gjrSaz7yRPnRo3+VHeVEqCGAoKu3Nzae3GPNg+b3tM0p04oA54KWZ4
	a4GvZefhsd/5xeqA+xU3wEHdBptjxzG2xlvK6Hgbgpu2187gEkn1A5OmUi9Y9CBTE9oqejiNtkhAn
	rAuC354B0fqfrhRvQg28KXySlnnZmhgtpq1oNiixf6/AQESvWUJDiIHwT7OI2Walp1iRVW45oxcOf
	rm6oJ2p6wA/y93CgccUAJsejhfx5ZDJ2SGtUFFGaZ0c+0aNWbnNdVZ95z86N8vLLIYbphN2T63CCw
	yhZ9hjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt4S-00000002DIm-0UMm;
	Tue, 26 May 2026 14:47:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRt4Q-00000002DIW-3yRt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:47:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BF5260123;
	Tue, 26 May 2026 14:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F7A31F000E9;
	Tue, 26 May 2026 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806869;
	bh=RStObp8O+/IC+7JlVdvjDo5RIZxNBdmJc3V71lTJZUc=;
	h=From:To:Cc:Subject:Date;
	b=lh4vZZzgRdLKEiGvzMmwrV+jjPCQY5ljC12Qr86IUVky0d9FsMx0URhwt5ke5gPph
	 DXwTJU9dE9Ofc+QIKp4msqGRKMJ6OIYajJGKPbCdukBFBHzDbRirU7zCXwySaqMZQm
	 1NvshHT2KDVONdDvRrCpBq/Kc0zgT3bkOCITXqaqZOE1pJQkdVJY6r2Bla0fModpWe
	 SqTl2Be0Y82q+heiGUJv4fBpdYRwCcgUKY4CL81COE9cr/UD1ntVfsjE25qUXmGNz/
	 LfJKusLcTK3DU99she4AuWMujdW1eq69lbmu5ZXLBRVcA6Kmy9hciENmx8+tlu4I2/
	 VnYtEQ6TZCc8g==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.1
Date: Tue, 26 May 2026 09:47:48 -0500
Message-ID: <20260526144748.2776-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
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


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.1

for you to fetch changes up to 462a85f9f887a4fef36550bb76c7f7d7a0fa296c:

  soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found (2026-05-21 18:18:44 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v7.1

The Qualcomm ICE driver suffers from race conditions between probe() and
get() and will in certain cases return the wrong error code, which
results in storage drivers failing to probe. Fix these issues.

Also correct the DeviceTree binding, to ensure that relevant clocks are
described and voted for, to prevent the driver from accessing unclocked
hardware during boot.

----------------------------------------------------------------
Bjorn Andersson (2):
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-1-5ccf5d7e2846@oss.qualcomm.com' into drivers-fixes-for-7.1
      Merge branch '20260518-qcom-ice-fix-v7-0-2a595382185b@oss.qualcomm.com' into drivers-for-7.2

Harshal Dev (2):
      dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
      soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE

Manivannan Sadhasivam (6):
      soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
      soc: qcom: ice: Return -ENODEV if the ICE platform device is not found
      soc: qcom: ice: Return proper error codes from devm_of_qcom_ice_get() instead of NULL
      mmc: sdhci-msm: Remove NULL check from devm_of_qcom_ice_get()
      scsi: ufs: ufs-qcom: Remove NULL check from devm_of_qcom_ice_get()
      soc: qcom: ice: Fix the error code when 'qcom,ice' property is not found

 .../bindings/crypto/qcom,inline-crypto-engine.yaml | 35 +++++++++++-
 drivers/mmc/host/sdhci-msm.c                       | 10 ++--
 drivers/soc/qcom/ice.c                             | 66 +++++++++++++++++-----
 drivers/ufs/host/ufs-qcom.c                        | 10 ++--
 4 files changed, 95 insertions(+), 26 deletions(-)

