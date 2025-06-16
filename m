Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94063C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rGsukSbk2s9k9Lzhx35MhMMWH7afszt5jZR31b4doy8=; b=W802htADNhmzqUL3C9HVbn9rTV
	DU5SEs2Tp6Jg29xwBmrOfRdVi1iDGtLXokPbkMRTcIB/tukec+h8Ea2VVG04iSOms/M1jRVyNevkE
	qe0y892CKx0THS0AJroUJx5mfmoZnfzutdEHQpSWQYcZpw/Wkl8gmHjvHHXNHHIdmKv0E8D8S3LB9
	GoFnXw8Kb+CZIiLl51s3g/gP1cyJU3WXp10lsepA7LfBtk9KEGxLtmAZvGOfYNQxhg6iYCDgZf7ju
	dTvw40/sqLcL9TrEMYT+72e1hpS/K89OExpH47x+KijBWwTnb/3zqQBtg+mnRR3XZj56qY7jkOLxQ
	4cTzKbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8GX-00000004Em4-3wA8;
	Mon, 16 Jun 2025 11:44:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR79q-00000004563-0rRU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9158B43E82;
	Mon, 16 Jun 2025 10:33:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D19C4CEEA;
	Mon, 16 Jun 2025 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750070021;
	bh=ufd4BryHTluBiYyQKtFjlL0I0zEHkeAF1c8bUuRe3m4=;
	h=From:To:Cc:Subject:Date:From;
	b=CZTFwGXiFT/z73efaMumqXar2SrI4awgM1WNw7X45RhRInIDZHv+kQwrzRP81+DZ1
	 dWFV1X5VvGr65Cxr2V1rRRDiJxP1Ux77jKlvGD3t7/vBt0C16cSnCq5xQCsq2g6BPL
	 nNCJ9Alion89eTsRcrP3GjR16YzeEwS/CdJwHO7g8KOh4l2XYfTSO1OS9YAmFqxNMY
	 jzF4UyVeTLUjqRStqa1mFb7yJdSBXSHtiFMjaBLPGw4YGyoakUyIIAAYS8NsDUPj2y
	 AMK7vge7AZR2ZPrD0c5CAQtp5deZ+QfKRKm2bU45KzN3gcIRj8eqqKTJX5zoweAoYt
	 uRdA0v3rSBOmQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uR79l-000000008VV-3Bl9;
	Mon, 16 Jun 2025 12:33:38 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH] arm64: defconfig: fix renamed Qualcomm EUSB2 PHY symbol
Date: Mon, 16 Jun 2025 12:32:52 +0200
Message-ID: <20250616103252.32642-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_033342_260151_F75901AC 
X-CRM114-Status: UNSURE (   9.84  )
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

The Qualcomm Synopsis EUSB2 PHY driver was recently renamed along with
its Kconfig symbol but the defconfig was never updated (which breaks USB
on a number of Qualcomm platforms).

Fixes: 8d3b5f637546 ("phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory")
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8c54aaea7866..6b5958fb46bc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1573,6 +1573,7 @@ CONFIG_RESET_QCOM_AOSS=y
 CONFIG_RESET_QCOM_PDC=m
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_TI_SCI=y
+CONFIG_PHY_SNPS_EUSB2=m
 CONFIG_PHY_XGENE=y
 CONFIG_PHY_CAN_TRANSCEIVER=m
 CONFIG_PHY_NXP_PTN3222=m
@@ -1597,7 +1598,6 @@ CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
 CONFIG_PHY_QCOM_QUSB2=m
-CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
 CONFIG_PHY_QCOM_USB_HS=m
-- 
2.49.0


