Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9524BCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmLAuu1dz6ogdVEDsfDy7WMXAGwx2zeUtPl8MqWKjew=; b=Jzikda9wNeheTKxfBVYkTVncKa
	mgiAb5bK2LPOeo+HmjaQdGgJ2Q+xUjcwVaZv6zoEB1GSy/PiHf3PeYFQs/AxLYsl7rqbOUT5pGpHv
	FP93lPmYDfMdAfJssjlbREluZebYiFBJDlvpDuJWeEKWo9FS+cgOH1p4vYfIqnajWcfqP52sDiago
	+W9BV959qTJIFN+gFlIJCxGbChGZPUbadCMc0fuB8VNONyjT54sWsBIH6OXaI7FYACCnAxHqAbmRZ
	5PovBTjBK0vGDfH8IDa5dUchLKMav4W04LwZX/FIXehtu0K1FSbBLBsmKPdhiYdA6yvUT8K/aynTm
	VDZ6gAkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURN9-0000000DMhi-0aWK;
	Tue, 02 Jun 2026 15:49:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURN7-0000000DMhC-0kFF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CmLAuu1dz6ogdVEDsfDy7WMXAGwx2zeUtPl8MqWKjew=; b=WrLns3aTSv1A8CkS/ZsErx+m2T
	btyk4KwUw0bTBCE3txgNbpurvS8Rx5Zvv7uaw3V22TgDMjvpUQzKzpXcBt2yuubLv4wWdX1eaVwWb
	o2BAzHi7Aa+xXUZQ6+y1YYiH23GFrhcn8sa6uX3f5e9quGJCWZt68UVqJtuozvQku5X0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wURMp-005iUd-91; Tue, 02 Jun 2026 17:49:23 +0200
Date: Tue, 2 Jun 2026 17:49:23 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com, ninad@linux.ibm.com,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] soc: aspeed: add host-side PCIe BMC device driver
Message-ID: <ecc3bd49-829f-49b8-b3b1-4f16363ea5b9@lunn.ch>
References: <cover.1780409151.git.gregoire.layet@9elements.com>
 <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8e1396af1b6db38bab13383c6ba303e8427aefc.1780409151.git.gregoire.layet@9elements.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_084941_219583_CA26A1DC 
X-CRM114-Status: GOOD (  14.83  )
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

> +static int aspeed_pci_bmc_device_setup_vuart(struct pci_dev *pdev)
> +{
> +	struct aspeed_pci_bmc_dev *pci_bmc_dev = pci_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +	u16 vuart_ioport;
> +	int ret, i;
> +
> +	for (i = 0; i < VUART_MAX_PARMS; i++) {
> +		/* Assign the line to non-exist device */
> +		pci_bmc_dev->uart_line[i] = -ENOENT;
> +		vuart_ioport = 0x3F8 - (i * 0x100);
> +		pci_bmc_dev->uart[i].port.flags =
> +			UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ;
> +		pci_bmc_dev->uart[i].port.uartclk = 115200 * 16;
> +		pci_bmc_dev->uart[i].port.irq = pci_irq_vector(
> +			pdev, pci_bmc_dev->msi_idx_table[VUART0_MSI + i]);
> +		pci_bmc_dev->uart[i].port.dev = dev;
> +		pci_bmc_dev->uart[i].port.iotype = UPIO_MEM32;
> +		pci_bmc_dev->uart[i].port.iobase = 0;

How virtual is this? Is this directly accessing the hardware via
shared memory? Or is there software on the BMC which traps these
reads/writes and responds?

But first we need to decide if this is the correct architecture. The
alternative is rpmsg or virtio. There is already tty/rpmsg_tty.c. A
gpio driver over rpmsg is on the way. I2C has been discussed. There
are plenty of virtio drivers, console, i2c, spi, gpio. virtio has
higher performance, but also requires more memory. rpmsg is more
suited to slower devices where memory is tight.

Either of these seem like a better way to expose resources of the BMC
to the host.

       Andrew

