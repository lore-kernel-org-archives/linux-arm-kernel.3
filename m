Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2230D74961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 04:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmeylMQuOayChRfW0IDabRowok9NC3hm9gjKzsrLg44=; b=KSYcO/ANSgOWwDrADLJ0/kS5sF
	lvz0PHfzkww0JyzwW4kyeYF/hCZ8xeV9vlQ6i/8prWIG9zHRiVlR2F2NdUogzNUJXYJfZ6k2h1jk7
	/xttNnkcBL5SUZ/wmiaOpiirR/Sj90P4U9MlAfSTHPD6FdZQ2P9Gt0yaCzyEG9g8D1hOGlu2yYLrX
	/EjPQKy4gK+6AUWmwiXr/6CCKZuSHBox+ngJHOOV+4vopzty5CXRQ4npmar+T0yzH0AdjjGk1G7GJ
	NSdzWYx/tsenw0Q8hOw43WnhQrrwIwss8ODGEOHvPARXxRmRaUnRB1d4kWz4dVR7Epxmq0OL1eoq4
	wGGbgwgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t60gi-0000000GiSc-1cz9;
	Wed, 30 Oct 2024 04:52:08 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t60f4-0000000GiCJ-3cRl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 04:50:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49U4oLXR059213;
	Tue, 29 Oct 2024 23:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730263821;
	bh=YmeylMQuOayChRfW0IDabRowok9NC3hm9gjKzsrLg44=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iKKFJFPKNgg+ClxApux7NwKL2cElGwNjvGliBMUhs98FRnCEXGes1SfXe2lrEuo03
	 QL5Yn+tnZOCPTdnpTwwYxD6/RtJnooE9WaJBJUR1itZZ9Z1o1vpe67kjPuwcA0PYjr
	 vZE0+BnULwDQilzi90P3hRxr6pb8yRCwKK4r89gw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4oLEH084473;
	Tue, 29 Oct 2024 23:50:21 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 23:50:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 23:50:20 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49U4oG3q002974;
	Tue, 29 Oct 2024 23:50:17 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
        Wadim Egorov
	<w.egorov@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <d.schultz@phytec.de>, <nm@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: ti: k3-am62-phycore-som: Add M4F remoteproc nodes
Date: Wed, 30 Oct 2024 10:20:13 +0530
Message-ID: <173021674669.3859929.16997677774746918158.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240911124251.702590-1-w.egorov@phytec.de>
References: <20240911124251.702590-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_215027_010943_19CD1DC4 
X-CRM114-Status: GOOD (  15.05  )
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

Hi Wadim Egorov,

On Wed, 11 Sep 2024 14:42:49 +0200, Wadim Egorov wrote:
> The AM62x SoCs of the TI K3 family have a Cortex M4F core in the MCU
> domain. This core can be used by non safety applications as a remote
> processor. When used as a remote processor with virtio/rpmessage IPC,
> two carveout reserved memory nodes are needed. The first region is used
> as a DMA pool for the rproc device, and the second region will furnish
> the static carveout regions for the firmware memory.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/3] arm64: dts: ti: k3-am62-phycore-som: Add M4F remoteproc nodes
      commit: 703545f04465134e41654dd32c583af424c0ba54
[2/3] arm64: dts: ti: k3-am64-phycore-som: Add M4F remoteproc nodes
      commit: a13f11477e5bf249e67b9a147a6ec88667ab459a
[3/3] arm: arm64: dts: ti: k3-am642-phyboard-electra-rdk: Enable trickle charger
      commit: 62898d47a6265b5e37a7e253067230f05c0a3165

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


