Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B47AE77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xAcq3MYhlYzlaE5zpe0MUNMr6fTT8FUX1HCybHM+Sv8=; b=ug9mLrLsFPmFFIhh2V0jM3+Lz6
	FmdJ01GPUmLdvfsUR2rHjf+STLv1ZHrwPsuRbOAhUU13O6Thds8iU0hh+ULNnrm0jshvKdC9evJmu
	fsxQCVNsKao14AQPGPplkghHIrjlKZqsS5TqtZFHF6r5TVRHUV2dLAvPvw0Cw8lxcudNdjJxraTWH
	ax9XdKAyvyeNluOd7YgWcTrW4zexSoXEM36B9KuVFdBjeRlWGX4psAMmfnitzWs1tNuCqUGy+P9+G
	Omdfh/brqNmQPt/vCrRpuS7DuAVHXZ1C1R+kvS/9QclDkAJ+Blv53SBBX0sQGP7XnF0Py4XTan1kw
	m/1kckVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYd0-00000006n6Q-2aRP;
	Mon, 09 Dec 2024 07:56:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYbx-00000006myt-2iRx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 07:55:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50C68A40A5C;
	Mon,  9 Dec 2024 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED113C4CEDF;
	Mon,  9 Dec 2024 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733730920;
	bh=0t/Pxb0qevc4gl+uL0DpwiF40jJ+z0RltHyWs0l13JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol3X4T9xHkxl0hmXFzlnIo199RB6u+4z4O6GvHJ22rlidiWQxfhay4xtWBunAc+XA
	 qsfxg+mUdPwKIfV8IRwbifRYMLgZCEb+ul4SgaoXVg3b1FmWP2gPuf+NA8SOw6Gkmm
	 mNNURwL0zoDTDSbhHIuTB5SYHP+UgynJYnx8wrReIqWn7pGqb9zDLb2FtMpyFW20aE
	 o9W6sSePFMY6Kvjew67WB4pTUty1AtoyaITtF9IMnGopPndTXFq6G8p8bLHM4/lkQy
	 1TrOn5aKfKATTnGtZmMMdosj3AjHXh51v6rmuR04lWbA+Q+kCe3pARV6jtayC+b2wF
	 0RwYw6Ynf825A==
Date: Mon, 9 Dec 2024 08:55:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	peter.griffin@linaro.org
Subject: Re: [PATCH v3 2/3] mailbox: add samsung exynos driver
Message-ID: <c6y4nofsjpjsl7ycsxsfqoizu7qsyf5yzbeao6utu5u5avlwzl@jbl3oqhy7ehb>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-3-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205174137.190545-3-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235521_816458_C2FCA6A4 
X-CRM114-Status: GOOD (  19.57  )
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

On Thu, Dec 05, 2024 at 05:41:36PM +0000, Tudor Ambarus wrote:
> The samsung exynos mailbox controller has 16 flag bits for hardware


Here, subject and other text/descriptions:
s/samsung/Samsung/
s/exynos/Exynos/


> interrupt generation and a shared register for passing mailbox messages.
> When the controller is used by the ACPM protocol the shared register is
> ignored and the mailbox controller acts as a doorbell. The controller
> just raises the interrupt to APM after the ACPM protocol has written
> the message to SRAM.

...

> +static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct exynos_mbox *exynos_mbox = dev_get_drvdata(chan->mbox->dev);
> +	int index;
> +
> +	index = exynos_mbox_chan_index(chan);
> +	if (index < 0)
> +		return index;
> +
> +	writel_relaxed(BIT(index), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);

writel()

> +
> +	return 0;
> +}
> +
> +static const struct mbox_chan_ops exynos_mbox_chan_ops = {
> +	.send_data = exynos_mbox_send_data,
> +};
> +
> +static const struct of_device_id exynos_mbox_match[] = {
> +	{ .compatible = "google,gs101-acpm-mbox" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_mbox_match);
> +
> +static int exynos_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct exynos_mbox *exynos_mbox;
> +	struct mbox_controller *mbox;
> +	struct mbox_chan *chans;
> +	int i;
> +
> +	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
> +	if (!exynos_mbox)
> +		return -ENOMEM;
> +
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
> +			     GFP_KERNEL);
> +	if (!chans)
> +		return -ENOMEM;
> +
> +	exynos_mbox->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(exynos_mbox->regs))
> +		return PTR_ERR(exynos_mbox->regs);
> +
> +	exynos_mbox->pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(exynos_mbox->pclk))
> +		return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
> +				     "Failed to enable clock.\n");
> +
> +	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
> +	mbox->chans = chans;
> +	mbox->dev = dev;
> +	mbox->ops = &exynos_mbox_chan_ops;
> +
> +	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> +		chans[i].mbox = mbox;
> +
> +	exynos_mbox->dev = dev;
> +	exynos_mbox->mbox = mbox;
> +
> +	platform_set_drvdata(pdev, exynos_mbox);
> +
> +	/* Mask out all interrupts. We support just polling channels for now. */
> +	writel_relaxed(EXYNOS_MBOX_INTMR0_MASK,

writel()

> +		       exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
> +
> +	return devm_mbox_controller_register(dev, mbox);
> +}
> +
> +static struct platform_driver exynos_mbox_driver = {
> +	.probe	= exynos_mbox_probe,
> +	.driver	= {
> +		.name = "exynos-acpm-mbox",
> +		.of_match_table	= of_match_ptr(exynos_mbox_match),

Drop of_match_ptr() - unused symbol warnings.

Best regards,
Krzysztof


