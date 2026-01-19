Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9692D29C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0Vpui6leoEhfMBnUWDnqlKqZUgbF/PusmCIMJXs/rM=; b=CGkxGzLA4fp1BN88Wu4Rb256wj
	RyMuFoe/biY+HEIZzMxHPfSH/+RJNOcBnPFTo9l8dxfzZ5scaDlOWd+/wRauXQ5cP8LwMTGaxDaPg
	hvUx0y/W/JzIxqoallD82kjy9njPsYSz4lYcXBCn5idOD5F0V2xtcp9BB85mBFFrYhR9iXfOXQsPS
	lyUSvGl2x7qwqJYmgw2ZVW9tah/QZBomPVDfWZ6ZtnzVPXclLWkcSngMkQv0FTxJ0Hr2P/szRcKRA
	g/bbsxQOIdkYzmgH43OqLtbHDrBt1GCQF63MIKCojsHvddekVN6zlncpKoKcuGF+nhmRg/1/nDCJz
	VwSLqqkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsZU-00000002Zr1-3h5M;
	Mon, 19 Jan 2026 16:57:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsZQ-00000002Zpb-0SEo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:57:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8495F497;
	Mon, 19 Jan 2026 08:57:31 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B1C73F632;
	Mon, 19 Jan 2026 08:57:36 -0800 (PST)
Date: Mon, 19 Jan 2026 16:57:33 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aW5ifVcxVf6uux3m@pluto>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_085740_293327_B63636AB 
X-CRM114-Status: GOOD (  22.74  )
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

On Sat, Jan 17, 2026 at 02:02:29AM +0100, Marek Vasut wrote:
> Implement new property arm,no-completion-irq, which sets all SCMI
> operation into poll mode. This is meant to work around uncooperative
> SCP implementations, which do not generate completion interrupts.
> This applies to mbox/shmem based implementations.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: arm-scmi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Drop no IRQ handling from SMC transport and update commit message
> V3: Rename property from arm,poll-transport to arm,no-completion-irq
> V4: No change
> ---
>  drivers/firmware/arm_scmi/common.h | 4 ++++
>  drivers/firmware/arm_scmi/driver.c | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
> index 7c35c95fddbaf..7c9617d080a02 100644
> --- a/drivers/firmware/arm_scmi/common.h
> +++ b/drivers/firmware/arm_scmi/common.h
> @@ -235,6 +235,9 @@ struct scmi_transport_ops {
>   *		      to have an execution latency lesser-equal to the threshold
>   *		      should be considered for atomic mode operation: such
>   *		      decision is finally left up to the SCMI drivers.
> + * @no_completion_irq: Flag to indicate that this transport has no completion
> + *		       interrupt and has to be polled. This is similar to the
> + *		       force_polling below, except this is set via DT property.
>   * @force_polling: Flag to force this whole transport to use SCMI core polling
>   *		   mechanism instead of completion interrupts even if available.
>   * @sync_cmds_completed_on_ret: Flag to indicate that the transport assures
> @@ -254,6 +257,7 @@ struct scmi_desc {
>  	int max_msg;
>  	int max_msg_size;
>  	unsigned int atomic_threshold;
> +	bool no_completion_irq;
>  	const bool force_polling;
>  	const bool sync_cmds_completed_on_ret;
>  	const bool atomic_enabled;
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 3e76a3204ba4f..f167194f7cf67 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2735,6 +2735,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>  	cinfo->is_p2a = !tx;
>  	cinfo->rx_timeout_ms = info->desc->max_rx_timeout_ms;
>  	cinfo->max_msg_size = info->desc->max_msg_size;
> +	cinfo->no_completion_irq = info->desc->no_completion_irq;
>  
>  	/* Create a unique name for this transport device */
>  	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> @@ -3150,6 +3151,9 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>  	if (ret && ret != -EINVAL)
>  		dev_err(dev, "Malformed arm,max-msg DT property.\n");
>  
> +	trans->desc.no_completion_irq = of_property_read_bool(dev->of_node,
> +							      "arm,no-completion-irq");
> +
>  	dev_info(dev,
>  		 "SCMI max-rx-timeout: %dms / max-msg-size: %dbytes / max-msg: %d\n",
>  		 trans->desc.max_rx_timeout_ms, trans->desc.max_msg_size,

LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

