Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5948BD7237F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qc2s5frO8kQf1I2AmabvtDyNquMPLCME0XB8JozIRj4=; b=JvLMi+kF7wQO2Sl4Hv2at26wbX
	nfh3/Lio04qlqDcxAB4BX6UGEKER0DfojfmLNf8A94sTpQOGB2n3mWSQiX/4y8ERhr6cEkA21NFGa
	j4hp8qRtn4iRJnfJ8nZJaKr+zGSNHHtCmyUVW3r/7jSZFW4M69K7fPOADsl3BzRkoinK970nBQpKH
	U0hr0opj/tyqeWH1yyyJrQ56Id+5VUIvC3kR51PFVCdclRGkK8JuKJLkAI8NkkN88xlyGJ3Bt61zJ
	yaiFUQuVie+CtB5rO4vvCVzn7D/LRvPqS7dhmXtMitYSBspybq5CiM5jEYv+GuxGZDAcKTnNlPxn5
	sNTNuhLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGDJ-00000008twi-2XVG;
	Fri, 23 Jan 2026 12:24:33 +0000
Received: from mail-m3279.qiye.163.com ([220.197.32.79])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGDE-00000008tub-3svZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:24:31 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 31c0b4afe;
	Fri, 23 Jan 2026 20:24:21 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v2 0/3] Remove deprecated mshc alias support from dw_mmc
Date: Fri, 23 Jan 2026 20:24:06 +0800
Message-Id: <1769171049-74327-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
X-HM-Tid: 0a9bead008a509cckunm9fc1f74e1df6b1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUxIHlZKTBhPTUhDTENMQkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=NMob3UpE4J1KX2QFHZ+L1/e+9a55dSOV0cU+fh394sPhZW9imyBfLNpJ4Kz7s5sfg4EYDPScpYsHcR1WrM78deL06zgdBxI7chbED/4j1J4tAF7mxV+vbSgBWRETmTnmDeh1aDbEgs93Rx5m1IrQ13G8CjniBrysW71HGjLm5DY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qc2s5frO8kQf1I2AmabvtDyNquMPLCME0XB8JozIRj4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_042429_626354_6BFD75BE 
X-CRM114-Status: GOOD (  11.07  )
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


The support for the mshc alias has long been deprecated[1], as the mmc core
already provides standard alias support for obtaining the controller ID[2].
With mshc aliases removed from the last Rk3036 plaform[3], the only remaining
users are the HiSilicon hi3660-hikey960 and hi3670-hikey970 boards. This patch
series removes support for mshc from the dwmmc driver and updates the DTS files
for the hi3660-hikey960 and hi3670-hikey970 to use the standard mmc alias instead.
Considering that the hikey960 and hikey970 are open development boards, users are
expected to use newer kernels, and the need to adapt old DTBs to new kernels is
relatively low. Therefore, backward compatibility of DTBs is likely not a major
concern here.

[1] https://lore.kernel.org/linux-rockchip/20211124184603.3897245-1-john@metanate.com/
[2] Documentation/devicetree/bindings/mmc/mmc-controller.yaml
[3] https://lore.kernel.org/linux-rockchip/c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com/


Changes in v2:
- Fix a warning(lkp)
- reorder patch sequence

Shawn Lin (3):
  arm64: dts: hisilicon: hikey960/970: Convert to use standard mmc alias
  mmc: dw_mmc-k3: Remove mshc alias support
  mmc: dw_mmc: Remove mshc alias support

 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts |  4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts |  4 ++--
 drivers/mmc/host/dw_mmc-k3.c                      | 23 ++++++++---------------
 drivers/mmc/host/dw_mmc.c                         |  9 +++------
 4 files changed, 15 insertions(+), 25 deletions(-)

-- 
2.7.4


