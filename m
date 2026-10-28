Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A35606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 08:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eD8R8WD8;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PSBniF0w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QYUY+SzuyzidMIs5wvcWQ+wJedzQHVpapr2RX4nAS3g=; b=eD8R8WD8/MgJ479jZd4VMTN/tA
	OlngqnQSklg0bqwZlVNpKNP7mkJafeDGihFESOJCpCYUiw+a2ehpczC5fbtbNmJOcjYS6JPZWZ1M0
	z+PQDXwznDZKUiv5rDrlFOahkDTCNw2q5LOtv1dh2/VrZaxc0etTTrQKe8e5klxkTj/S/DTmsRMev
	BnWn7zPN9usm8S01qb5qfZ6NiLMinpbXv2sfkevN0xMY6o+3PJs5owsmwshiOVA2CepPwkhUxWULM
	ruhIWQqr8jS73XcRAQt2hO1BwBSdizHKPttTOqi1gF3V5i0J3f5xnfwupA2xD/iMQUo5TvxZh+dLR
	giq3Xf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLydy-00000006VWO-1PHm;
	Wed, 28 Oct 2026 08:04:22 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLydw-00000006VVy-2kbe;
	Wed, 28 Oct 2026 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793174661; x=1824710661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GlCrv/Z8ykZTWKLkjrgizpbqqqsL18IOZ9JsGj4pQww=;
  b=PSBniF0wd7ppMixld2UUoEB73b1yiGoF8vRXQw+G1YSVuOdfGa10kRy1
   PP038b2/20WyHj8Za8s3lOK6A5CKledqp9kljtVsDUOiHC+eGA3zA2vlM
   MT+/FAI3eBlmS2C57vmTMY/nyWjYUaQySkZWV1rFyvAhDua/Nh3xd3GdY
   sWwjrfJ8DDi7yQFTihVA+9UVxHpxbl2/Ir0XbFIFvaF+ALvnRLsnNW4NV
   s/AYwI6IkDwqYskbzcKE+gmmy5RrHX+JztLgLKfgdsnx3gKVSDAKY0OQJ
   fttgekcrMV59ncuafHN6jde7skpkm3TP+u/EPoo8Z96VcipDy/1yMDhB8
   Q==;
X-CSE-ConnectionGUID: sLTNwIDxTmaAlDuyi7swfg==
X-CSE-MsgGUID: s3VSi+43SgW3p+AG5zAHOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1780743"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1780743"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:04:20 -0700
X-CSE-ConnectionGUID: 3U2XXT5qQFSCkgAuKxEChg==
X-CSE-MsgGUID: XN/qcR2yR4S9jibXAKAjrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4852263"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.117])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 01:04:11 -0700
Date: Wed, 28 Oct 2026 10:04:08 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	=?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org,
	Frank Li <Frank.li@oss.nxp.com>
Subject: Re: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
Message-ID: <auGseGw39K115Zfi@ashevche-desk.local>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
 <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_010420_746338_F6FC4D51 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 12:22:26PM -0600, James Hilliard wrote:
> Several virt-dma drivers implement device_synchronize with a wrapper that
> only converts the DMA channel and calls vchan_synchronize(). Provide
> vchan_dma_synchronize() with the DMAengine callback signature so these
> drivers can assign it directly.
> 
> Document the requirement to stop the channel and prevent new callbacks
> before synchronization, and the context in which the callback wait may
> run. Replace the equivalent wrappers in the existing drivers with the
> shared helper, preserving their callback-wait and descriptor-cleanup
> behavior.

...

>  drivers/dma/hsu/hsu.c                          |  9 +--------
>  drivers/dma/idma64.c                           |  9 +--------

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com> # hsu, idma64, virt-dma

-- 
With Best Regards,
Andy Shevchenko



