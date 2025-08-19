Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B734CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucHYTVhz7q4FgVSUF6V632qc0gQcaoOoK4b47z9Ox3Y=; b=V37mJFFiTVpPhTUKXETOQd1f+R
	3xoJkQimtyPUYRf6wQhDkMtVnobFc+FHBifo/9GwOH01JmgLUBayLUCVnC+nCAu2thvzcPJ8FP8sV
	B+skrA/7cIjDD095JBg9k3H9x61tEJ026MSrM8b3EYZj7Noj1ri7Nh2SEbekNMikGmoaZ0XQDqXwa
	hwQy2iepFn/BaXVbPufNR/bDGOIb1drbX38f7Z3gnSDaGGWeVnM8JiD0kCOo5aj+2acr5OIyMd4Ny
	pqgpS3cRIUdwhpSb1d9NlwCHKlEvf/SGtnTlBcH1tHXfX9z+r/EH2XsenTcPYE8qZbmpQ/EW3jcgW
	74R4hGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSPS-0000000BTdW-0n6q;
	Tue, 19 Aug 2025 19:54:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQ8E-0000000B6dk-3URH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 17:28:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E7B9152B;
	Tue, 19 Aug 2025 10:28:13 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 994F53F738;
	Tue, 19 Aug 2025 10:28:19 -0700 (PDT)
Date: Tue, 19 Aug 2025 18:28:17 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] firmware: imx: sm-misc: Dump syslog info
Message-ID: <aKS0MUXlQvMTfV4d@pluto>
References: <20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com>
 <20250710-sm-misc-api-v1-v2-6-c3e953e34be6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sm-misc-api-v1-v2-6-c3e953e34be6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_102822_910756_483EE1D0 
X-CRM114-Status: GOOD (  14.09  )
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

On Thu, Jul 10, 2025 at 04:33:31PM +0800, Peng Fan wrote:
> Add sysfs interface to read System Manager syslog info
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/imx/sm-misc.c | 178 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
> 
> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
> index fc3ee12c2be878e0285183e3381c9514a63d5142..10aab5b127f65ecc57db9ab6c0c2c2b84d1dd864 100644
> --- a/drivers/firmware/imx/sm-misc.c
> +++ b/drivers/firmware/imx/sm-misc.c
> @@ -3,6 +3,7 @@
>   * Copyright 2024 NXP
>   */
>  

Hi,

I have not so much to say about this: you expose one value per-sysfs
entry as prescribe BUT this also means a lot of messages to exchage to
retrieve a whole new fresh log each time a single sysfs entry is
queried...a bit ugly but I wouldn't now how to handle this differently
with the current log command format indeed...

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

