Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9744DCC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzqDuiIFu2S405waqYA4O1T2NcoOaihFIck2pbiUyMo=; b=yPZXg+Zn01V6s3ftq565sX19Ed
	uQVCC06RLQs6cv3bC1cLXjNnX8h+4POi6zINlLI+KwrXKxVKcegQvDSJyPS+lAjJU7gmNlCZMlY6I
	EkK3bHCiI/73z3LwFqOXaKmzOgEAj9LFlNMk0vCwvDIIT+uvCP1f4GzIP0LwAjL7OmQcdS0q+VON7
	KgjZBmCh8Eipu8Q1Z3yVz/UcnTrxp6U/CuzrwRvv8kjJ4fTsTW8V6ofs+VsmYOV8RYpZtPhd102r8
	aSV5TsMTPaKBmDKLAEm3bgHICa74+laSDW4xeuWQcXcA2rJTmBBB18FrTHDBvbyy9RKvYJ+LIEgEy
	Jnzi2Pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI4J-0000000HKTb-19R0;
	Thu, 15 Oct 2026 09:48:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHI4I-0000000HKT0-0EBg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:48:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E42B60120;
	Thu, 15 Oct 2026 09:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C57E1F000C4;
	Thu, 15 Oct 2026 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057689;
	bh=nzqDuiIFu2S405waqYA4O1T2NcoOaihFIck2pbiUyMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAvUlNtMlT7ShAsCpXkw1h3NuT8sOlfSo0pg+pUxd48ioSImegukmLrZvFvuYryC5
	 JTsgf2EGmX43fw3WRVyWvPxZtjoP4y3mJrkelHrcLuivwVBcsknVtm62m/FSpF8Stz
	 6lXuMf2KWuVRS3KBAwF9IO9NSjlSZftomllR8Ka8vIHOAULMgD/6N8zPX+8jCNq9T1
	 oEF4qXVNBHEbfZI9OzVtZRoZg6pHgopBHKcs+VrKSbTEGVnZNmzudlaxoWUaWstlJe
	 GgQ2yfZoDDJOrJOfSZgNFwj8mISeHuVbPr5ewuAQ/GGbWMdVhJ2EGnsVPwLexKHl5P
	 m7iX9iaIyRukg==
Date: Thu, 15 Oct 2026 11:48:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ben Levinsky <ben.levinsky@amd.com>
Cc: jassisinghbrar@gmail.com, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	michal.simek@amd.com, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
Subject: Re: [PATCH 4/6] mailbox: Add AMD PL Mailbox soft IP controller
Message-ID: <20261015-aromatic-ibex-of-opposition-dafb43@quoll>
References: <20261014213426.2957480-1-ben.levinsky@amd.com>
 <20261014213426.2957480-5-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014213426.2957480-5-ben.levinsky@amd.com>
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

On Wed, Oct 14, 2026 at 02:34:24PM -0700, Ben Levinsky wrote:
> Add a mailbox-framework controller for the AMD programmable-logic
> Mailbox soft IP. Expose separate transmit and receive FIFO channels.
> 
> Enable the interface clock only while a channel is started, before any
> register access, and disable it last when the channel shuts down. Keep
> provider probe free of register accesses and leave the IRQ disabled until
> a client starts the receive channel. Initialize each FIFO when its channel
> starts, use receive-threshold interrupts for incoming words, and poll the
> send-threshold status for transmit completion. Stop that polling from
> accessing registers once the transmit channel begins to shut down.
> 
> Carry mailbox payloads in struct zynqmp_ipi_message, limited to the FIFO
> depth given by the device tree. The FIFO transfers 32-bit words and the
> hardware conveys neither a byte count nor the FIFO occupancy, so a
> transmit length that is not a multiple of four is zero-padded to a whole
> word.
> 
> On a receive-threshold interrupt, read up to one FIFO depth of words and
> deliver them as one message, then acknowledge the interrupt. The event
> latches only when the FIFO goes from empty to nonempty, so a word that
> arrives between the drain and the acknowledge, or words left by the
> bounded drain, raise no new event. If the FIFO is nonempty after the
> acknowledge, toggle the threshold to latch a new event for them.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
> ---
>  MAINTAINERS                      |   7 +
>  drivers/mailbox/Kconfig          |  10 +
>  drivers/mailbox/Makefile         |   1 +
>  drivers/mailbox/amd-pl-mailbox.c | 369 +++++++++++++++++++++++++++++++
>  4 files changed, 387 insertions(+)
>  create mode 100644 drivers/mailbox/amd-pl-mailbox.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f53047aa8d3c..4e28e0c311c0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1287,6 +1287,13 @@ S:	Supported
>  T:	git https://gitlab.freedesktop.org/agd5f/linux.git
>  F:	drivers/gpu/drm/amd/pm/
>  
> +AMD PROGRAMMABLE LOGIC MAILBOX DRIVER
> +M:	Ben Levinsky <ben.levinsky@amd.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mailbox/amd,zynqmp-pl-mbox-2.1.yaml
> +F:	drivers/mailbox/amd-pl-mailbox.c
> +
>  AMD PSTATE DRIVER
>  M:	Huang Rui <ray.huang@amd.com>
>  M:	Mario Limonciello <mario.limonciello@amd.com>
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index ab869769e278..3c3f262c903c 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -8,6 +8,16 @@ menuconfig MAILBOX
>  
>  if MAILBOX
>  
> +config AMD_PL_MAILBOX
> +	tristate "AMD PL Mailbox soft IP controller"

Missing depends on Zynq/Xilinx.

> +	depends on HAS_IOMEM
> +	depends on OF
> +	help
> +	  Mailbox controller for the AMD Programmable Logic Mailbox soft IP.
> +	  The controller exposes transmit and receive FIFO channels to mailbox
> +	  clients. It supports interrupt-driven receive notification and
> +	  polling-based transmit completion through the common mailbox framework.

...

> +	mb->controller.dev = dev;
> +	mb->controller.ops = &amd_pl_mbox_ops;
> +	mb->controller.chans = mb->chans;
> +	mb->controller.num_chans = AMD_PL_MBOX_NUM_CHANS;
> +	mb->controller.txdone_poll = true;
> +	mb->controller.txpoll_period = 1;
> +	mb->controller.of_xlate = amd_pl_mbox_xlate;
> +
> +	ret = devm_request_irq(dev, mb->irq, amd_pl_mbox_irq,
> +			       IRQF_NO_AUTOEN,
> +			       dev_name(dev), mb);
> +	if (ret)
> +		return ret;
> +
> +	return devm_mbox_controller_register(dev, &mb->controller);
> +}
> +
> +static const struct of_device_id amd_pl_mbox_of_match[] = {
> +	{ .compatible = "amd,zynqmp-pl-mbox-2.1" },
> +	{ .compatible = "amd,versal-pl-mbox-2.1" },
> +	{ .compatible = "amd,versal-net-pl-mbox-2.1" },
> +	{ .compatible = "amd,versal2-pl-mbox-2.1" },

So all of them are compatible? Then why do you need all this?

Best regards,
Krzysztof


