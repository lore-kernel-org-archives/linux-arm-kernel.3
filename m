Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FB9CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy/GnU/KaL5dtlm+MTrRXHciNdcaUAPUo37ESivV3qg=; b=CuWVD1Q1xGlWR/J80Hy+PwI68r
	657iI1Uax3SvqSBn9il1Vq+oZlsawU1bvplmDZSUaAvl5q9E+3V64XJ5BzT531eMYvHiI7r2yQ6kX
	0pDWQGzywxJxI9LrrsScFtpClgKfPvH2gDSQbMJE8uojyhAi/nP9gb4DfdGiZ35zM+0ohTLNN40HJ
	N81nBSni8PHqT2s23kiNBkgl7ybxNVYUo2zU4wpNCe7CUrMf/xJLpvamA8ovKJhvW5RbwFCRanXTH
	TvcgsCANnwo2hYaT0zNJlUmy23Ka4d6AA5nBaRdcMm7HhE7oG0APtb8X23Jhn9aaFYMT/36pHbYgM
	eRbArQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHrV-0000000HHWJ-1qWl;
	Thu, 15 Oct 2026 09:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHrT-0000000HHVz-3CFX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:34:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3277640614;
	Thu, 15 Oct 2026 09:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E21E41F000C4;
	Thu, 15 Oct 2026 09:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056895;
	bh=Fy/GnU/KaL5dtlm+MTrRXHciNdcaUAPUo37ESivV3qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jvoquCoOEPkwG47cdNIbtkxUeJTArwA9Bb6uYEOcQRCLGNpVwhQUKGQKEzv1t5H2n
	 x+WBcuO7vvYnPof4hIVP2m61Ir9sCKURBtRgWT2W25TztKKrGHoR9CmG4cJ2K343Hx
	 iiFdTZ88MePng6R1G8PxHQLFUITWWTd8711l9i53zsXG1QSn9XVQnq73RVnN1Et03C
	 4VGwBsHwVaUkhDH1DG62xX8d8FE/XwOMXhHvDS4+TYODZaaVuKaEmHUNEUr9XTOUHG
	 dUtIy2TzMLAdMa5JPWOssyN8B4BDdIWR/DBNK599DFEFPSVCjTWN2FNmVaynXDT7rL
	 dTdbpdLtUqxow==
Date: Thu, 15 Oct 2026 11:34:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Mark Brown <broonie@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v2 20/24] spi: zx: Add ZTE ZX family SPI flash controller
 driver
Message-ID: <20261015-large-mayfly-of-blizzard-bffef6@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-21-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-21-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:21:00AM +0100, Navid Ghahremani wrote:
> +static int zx_qspi_probe(struct platform_device *pdev)
> +{
> +	struct dma_slave_config dma_cfg = {0};
> +	struct device *dev = &pdev->dev;
> +	struct spi_controller *ctrl;
> +	struct zx_qspi *qspi;
> +	struct resource *res;
> +	int irq, ret;
> +	u32 reg;
> +
> +	dev_info(dev, "ZX QSPI Controller driver initializing\n");

Drop such messages from all your code.

> +
> +	ctrl = devm_spi_alloc_host(dev, sizeof(*qspi));
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	qspi = spi_controller_get_devdata(ctrl);
> +	qspi->ctrl = ctrl;
> +	platform_set_drvdata(pdev, qspi);
> +
> +	init_completion(&qspi->dma_completion);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	qspi->phys_base = res->start;
> +	qspi->io_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(qspi->io_base))
> +		return PTR_ERR(qspi->io_base);
> +
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq > 0) {
> +		ret = devm_request_irq(dev, irq, zx_qspi_irq, 0, MODULE_NAME, qspi);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to request irq\n");
> +	}
> +
> +	qspi->pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(qspi->pclk))
> +		return PTR_ERR(qspi->pclk);
> +
> +	qspi->wclk = devm_clk_get_enabled(dev, "wclk");
> +	if (IS_ERR(qspi->wclk))
> +		return PTR_ERR(qspi->wclk);
> +
> +	qspi->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(qspi->rstc))
> +		return PTR_ERR(qspi->rstc);
> +	if (qspi->rstc) {
> +		reset_control_assert(qspi->rstc);
> +		udelay(10);
> +		reset_control_deassert(qspi->rstc);
> +	}
> +
> +	dma_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	dma_cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +	dma_cfg.src_addr = qspi->phys_base + ZX_QSPI_DATA_REG;
> +	dma_cfg.dst_addr = qspi->phys_base + ZX_QSPI_DATA_REG;
> +	/* FIFO_THRES has an impact on the burst size. Don't make them too small. */
> +	dma_cfg.src_maxburst = ZX_QSPI_FIFO_SIZE / 2;
> +	dma_cfg.dst_maxburst = ZX_QSPI_FIFO_SIZE / 2;
> +
> +	dma_cfg.direction = DMA_DEV_TO_MEM;
> +	qspi->ctrl->dma_rx = devm_dma_request_chan(dev, "rx");
> +	if (IS_ERR(qspi->ctrl->dma_rx)) {
> +		dev_info(dev, "Cannot get RX DMA, using PIO\n");
> +		qspi->ctrl->dma_rx = NULL;
> +	} else {
> +		if (dmaengine_slave_config(qspi->ctrl->dma_rx, &dma_cfg)) {
> +			dev_info(dev, "Cannot configure RX DMA, using PIO\n");
> +			dma_release_channel(qspi->ctrl->dma_rx);
> +			qspi->ctrl->dma_rx = NULL;
> +		}
> +	}
> +
> +	dma_cfg.direction = DMA_MEM_TO_DEV;
> +	qspi->ctrl->dma_tx = devm_dma_request_chan(dev, "tx");
> +	if (IS_ERR(qspi->ctrl->dma_tx)) {
> +		dev_info(dev, "Cannot get TX DMA, using PIO\n");
> +		qspi->ctrl->dma_tx = NULL;
> +	} else {
> +		if (dmaengine_slave_config(qspi->ctrl->dma_tx, &dma_cfg)) {
> +			dev_info(dev, "Cannot configure TX DMA, using PIO\n");
> +			dma_release_channel(qspi->ctrl->dma_tx);
> +			qspi->ctrl->dma_tx = NULL;
> +		}
> +	}
> +
> +	ctrl->mode_bits = SPI_RX_QUAD | SPI_RX_DUAL | SPI_TX_QUAD;
> +	ctrl->bus_num = -1;
> +	ctrl->mem_ops = &zx_qspi_mem_ops;
> +	ctrl->mem_caps = &zx_qspi_mem_caps;
> +	ctrl->setup = zx_qspi_setup;
> +	ctrl->min_speed_hz = clk_round_rate(qspi->wclk, 1);
> +	ctrl->max_speed_hz = 50000000;
> +	ctrl->use_gpio_descriptors = true;
> +	ctrl->num_chipselect = 1;
> +	ctrl->dev.of_node = dev->of_node;
> +	ctrl->dma_alignment = 4;
> +
> +	writel_relaxed(ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
> +	ret = readl_relaxed_poll_timeout_atomic(qspi->io_base + ZX_QSPI_EN_REG,
> +						reg, reg & ZX_QSPI_EN_BACK, 1,
> +						1000);

Why do you need atomic looping in probe function? This cannot sleep?

> +	if (ret) {
> +		dev_err(dev, "SPI controller failed to start: en_reg=%x\n", reg);
> +		return ret;
> +	}
> +
> +	writel_relaxed(ZX_QSPI_SCLK_PAUSE_EN, qspi->io_base + ZX_QSPI_CTRL0_REG);
> +	writel_relaxed(0, qspi->io_base + ZX_QSPI_INT_EN_REG);
> +
> +	/* Ensure proper data sampling point */
> +	reg = readl_relaxed(qspi->io_base + ZX_QSPI_TIMING_REG);
> +	if (!FIELD_GET(GENMASK(17, 16), reg)) {
> +		reg |= FIELD_PREP(GENMASK(17, 16), 1);
> +		writel_relaxed(reg, qspi->io_base + ZX_QSPI_TIMING_REG);
> +	}
> +
> +	reg = readl_relaxed(qspi->io_base + ZX_QSPI_SW_REG) >> 16;
> +	if (reg != ZX_QSPI_FIFO_SIZE)
> +		dev_info(dev, "Got unexpected fifo size %u\n", reg);
> +
> +	ret = devm_spi_register_controller(dev, ctrl);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static void zx_qspi_remove(struct platform_device *pdev)
> +{
> +	struct zx_qspi *qspi = platform_get_drvdata(pdev);
> +
> +	writel_relaxed(~ZX_QSPI_EN, qspi->io_base + ZX_QSPI_EN_REG);
> +}
> +
> +static const struct of_device_id zx_qspi_match[] = {
> +	{ .compatible = "zte,zx29-qspi" },
> +	{ .compatible = "zte,zx279128s-spifc" },

So devices are compatible? Then express it and drop redundant entry.

Best regards,
Krzysztof


