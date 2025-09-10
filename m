Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75404CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 17:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwVJO3dGsJ115rzI7K37pPonRUo+ntZir4J4hcoysHs=; b=reFddpDqlc/nUEIcjI8WUZF0md
	KDtiBSHz8Qqg+Y/KBgQa8Al8MQyTvRC37nVkgf168mAb2NqPkETWjNUQiB+0cgUWGmt6dCeEBvq7f
	7wOqjqdSVkGw73kB9bLQCltVcG1We+bckRGIueIbPtOjq50R8Kx6qqtdV19uTn1PcYw2HQchQ7AF7
	55N1sjrvDICd8lPMQgLKq68vEYt3mfW/8vP3HMoIrH1Bb3iptrM66+TkGqFKBXY6HFdeuraguRhA4
	TvLiH8IElqNLof6MRxGVZ9WuJyS6OfPnJXdjsgg2NpSlENVPnOHmHBnnoYU+A+kVvUDoaPVALF1Xl
	g2E4pbLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTW-0000000Fk3c-2Jq1;
	Wed, 10 Sep 2025 17:19:18 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwOTT-0000000Fk14-2NLv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 17:19:17 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id D4782C003AA1;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com D4782C003AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1757524753;
	bh=3JaGGkYPrj7W26R9HVw+X9h4UiLIja9300j/1qO4xYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PfuRpLAOnwsafeLxMg4m3s575vJ3s3c/1itfgDfAYYDicvh/K93IelECfXa9eKK2P
	 SOWZ+ho/vJSoZYN+jcBMJJx1dzpUBeaPSWpbhpx/Fz+0t6im7VLtVA1MgNTtOgicX5
	 rNihvjzINWXSxL1SUdrqhQ75WrFCD1ClDC1jL1V4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 8464518000847;
	Wed, 10 Sep 2025 10:19:13 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Taishi Shimizu <s.taishi14142@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/4] Broadcom devicetree changes for 6.18
Date: Wed, 10 Sep 2025 10:19:08 -0700
Message-ID: <20250910171910.666401-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910171910.666401-1-florian.fainelli@broadcom.com>
References: <20250910171910.666401-1-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_101915_702912_E556ED0E 
X-CRM114-Status: GOOD (  10.79  )
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

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree

for you to fetch changes up to 484199a02aca6c7ea99501eec2fc73cb808e209d:

  ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP (2025-09-03 13:47:46 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM SoC Device Tree changes for
6.18, please pull the following:

- Taishi-san adds support for the Buffalo WXR-1750DHP using a BCM4708
  SoC

----------------------------------------------------------------
Taishi Shimizu (2):
      dt-bindings: arm: bcm: Add support for Buffalo WXR-1750DHP
      ARM: dts: BCM5301X: Add support for Buffalo WXR-1750DHP

 .../devicetree/bindings/arm/bcm/brcm,bcm4708.yaml  |   1 +
 arch/arm/boot/dts/broadcom/Makefile                |   1 +
 .../dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts   | 138 +++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 arch/arm/boot/dts/broadcom/bcm4708-buffalo-wxr-1750dhp.dts

