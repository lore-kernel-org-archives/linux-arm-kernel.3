Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C999BD6EBFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aspTb+RCvvhCA9qbPnw2Q73M8tb+WaJ8RsI6eVXHo/A=; b=QZNCWBGPQUlG7BDKDCxXtZ6xa1
	8jm4mY4fCoHrsR6yawPnX5qFSUe+Zg/gj5VFJo3nEzzwO728OGxopoMztnix23Cd3ZMwSRDhIN+XI
	GE+wDRKPHf8Al2UW2WpZTCwLHn15aHGJ9k/1a2ZtEXTiOA+O7FtdKMehgfpBmgjKi6bkHw08GBr6k
	hideIODQcWT2haSjQ+epMzmSwET2GSjIeo2QBe0wDeYcgut1yxrE7xaXsp1vhzbDSSQ0EHPeUsYpO
	N8gbXxK8vlgN7G72sUGY9jf+98wX8LRKrUCBo7kwtF6FPfitcwrO5r7H1vlTPTe4ck73ZXvNwGaau
	jkChPgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyPJ-0000000HS9H-0TQA;
	Fri, 29 Nov 2024 10:39:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGyOJ-0000000HRwy-365x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 10:38:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48F7112FC;
	Fri, 29 Nov 2024 02:38:54 -0800 (PST)
Received: from bogus (unknown [10.57.89.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7A2E3F5A1;
	Fri, 29 Nov 2024 02:38:20 -0800 (PST)
Date: Fri, 29 Nov 2024 10:38:09 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Peng Fan <peng.fan@nxp.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: fix i.MX build dependency
Message-ID: <20241129103809.vhsugby2q3fbe5fn@bogus>
References: <20241115230555.2435004-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115230555.2435004-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_023827_818207_4B471FD8 
X-CRM114-Status: GOOD (  26.33  )
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

On Sat, Nov 16, 2024 at 12:05:18AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added SCMI vendor driver references functions in the
> protocol driver but needs a Kconfig dependency to ensure it can link,
> essentially the Kconfig dependency needs to be reversed to match the
> link time dependency:
>
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_write':
> fsl_mqs.c:(.text+0x1aa): undefined reference to `scmi_imx_misc_ctrl_set'
> arm-linux-gnueabi-ld: sound/soc/fsl/fsl_mqs.o: in function `fsl_mqs_sm_read':
> fsl_mqs.c:(.text+0x1ee): undefined reference to `scmi_imx_misc_ctrl_get'
>
> This however only works after changing the dependency in the SND_SOC_FSL_MQS
> driver as well, which uses 'select IMX_SCMI_MISC_DRV' to turn on a
> driver it depends on. This is generally a bad idea, so the best solution
> is to change that into a dependency.
>
> To allow the ASoC driver to keep building with the SCMI support, this
> needs to be an optional dependency that enforces the link-time
> dependency if IMX_SCMI_MISC_DRV is a loadable module but not
> depend on it if that is disabled.
>
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> Fixes: 101c9023594a ("ASoC: fsl_mqs: Support accessing registers by scmi interface")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm not sure this is the version we want to go with in the end, without
> having read the code in detail, but the version in linux-next is clearly
> wrong in multiple ways and this is the best I could come up with so far.
>
> If we can agree on this approach, it needs to go through the ASoC tree
> as that contains the 101c9023594a commit at the moment.

Sorry for the late response, was away for a while. I am fine with the
change, but bit confused as Mark Brown has acked the change instead by
which I assume he is not taking it through his tree.

I can can take it at -rc1 or if Mark B is happy to pull it, here is my ack.

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

--
Regards,
Sudeep

