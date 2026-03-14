Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238E110706F2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 18:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJgmVqDKyi3M0P5AVrJpUB/6e5CaH26d3M8p3nfhSGg=; b=R/Xqjfc6dLWgIoVy+3WbZE0x+S
	lYDXbts03JKS0Oxok/SkG2c+Caw4YTuBxjuIGmaZr15/pBm+DIpI+9enEMRiWy5CLRlup5b4hcvry
	xhijjHCP8NliZCJ3l9s5/Ir0j3Lv3p6RutFnJhgpt8SfpyRhjfock4nus6soku6C95J9fTIX2705o
	YaU2pSHymwK2i7CnOrvHkJoGEoQnOnknEBfIaUmb+0HAVTwyt8Wl0x37I7Hz8dCQ1wNxaF6kH+cTo
	fe6ugX9r5QiFdXTJPebLa+Jew6eYzyQiYAKGM79KL4hAiwWypZRP/Rk7rAMAL74rNoUbTzlK60EcJ
	FUdWQNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1TvR-000000024yG-1S6W;
	Sat, 14 Mar 2026 18:41:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1TvP-000000024xm-06Om;
	Sat, 14 Mar 2026 18:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=NJgmVqDKyi3M0P5AVrJpUB/6e5CaH26d3M8p3nfhSGg=; b=rqpLy3bfMnxLc4ptzdGEVOx4nS
	3cvmrPOIOQlYhskL7UMTdYondSwDoFwEUgSajZuUeouUBHVNI8qUIE6EtjeroAWaKaMJ4PZM2sQMt
	lih/cWVPxz+92Q55gURNigXMARCkU3EFGSin2A6JBlUW9Dux9Nue6jww7QtL2ZTkrah1njaRTsI1W
	kGwG1f3MZEwg1eeKgn9QSDPFIgniEP7WJRfOv/BpROMU6+NcGzoJhNmwrayYJBrtOe+2iDxrhL9AG
	lf7PgDE1Vz3NsHK1r+xPCCMr2/fQnq7rOFK2fRitltIUX26hc1T1kijIfQ1x0aeGGFTRNAe9IZs2J
	Xdz9442w==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver fixes for 7.0 #1
Date: Sat, 14 Mar 2026 19:41:19 +0100
Message-ID: <4719110.LvFx2qVVIh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_114123_092045_9AE7E455 
X-CRM114-Status: UNSURE (   5.45  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-drvfixes1

for you to fetch changes up to 24ed11ee5bacf9a9aca18fc6b47667c7f38d578b:

  soc: rockchip: grf: Add missing of_node_put() when returning (2026-02-22 23:27:20 +0100)

----------------------------------------------------------------
Fixing a missing of_node_put() call.

----------------------------------------------------------------
Shawn Lin (1):
      soc: rockchip: grf: Add missing of_node_put() when returning

 drivers/soc/rockchip/grf.c | 1 +
 1 file changed, 1 insertion(+)




