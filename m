Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134051062892
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 12:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqxkXud4nPLZFgU2JPqkjGIpiym+4V7JY0lp4ybhl8k=; b=VfDe1KcH8Oy3aDeZqgnoQFrtv2
	ydgWwuhzHXwtMhcCf1u8DHxiKFJTgrIsMFZ+RS6TSOFTgIoIOLkhCJmDg+z6H2YFWm5Fq3bTgf0tl
	JS1yyvqqFtV9EyMnXbKaPWtXU70HYZ0UdqFNecMXhjCkKmU0aA9iycsE1a/wFGxxvaxSdO6/lWNiQ
	TLkZPZodeCyXGz0HTjJHwwB9nbJGYOhEukgGXI1K5p6pSkq/Uvvjv/TU5HJ7VZ35s5cNMa7/8x1yN
	oDWpwdmPgL196MdMrtqEO5VRVnt9QbwWq42yb+O3A5wAP0D/RXVAcQtKKHvKR1bahnhKEOIJHaVRq
	5dXEfPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Iyh-0000000BaNa-2AAt;
	Wed, 11 Mar 2026 12:47:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Iyg-0000000BaNR-1ObY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 12:47:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47091600B0;
	Wed, 11 Mar 2026 12:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0034C4CEF7;
	Wed, 11 Mar 2026 12:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773233272;
	bh=PIiavc9jPdYxa+h6JEjPhU/eVDBwYycw0YXQ9LHcE4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/Gewi9Tau8wfkkFOAxix27ZpFQU6BOOnPQwRA2QBXxtu08of/6K/Hee40ybDSg2H
	 rHSBbQwDoQDljstn+yCnRsz6+oYuBFWP7d8EUpek2VkdmE6eh2xukmG+EZgPKKfyDc
	 C49twpv93A2ltBONobj+i53xr6qXoVApMdOVxirviTlUTSHqfKZ+r+XCt95C3TfRoc
	 TIrJHx+jQ6id+pCWZvmN7zUad74wGDi21rGCk8WPPFzQ0ZMrqJDK0yI+VzladSWZ+L
	 Z7nF3kK84978nzhHJvIqoTGhaNbUmoTvaKbRfFYYsUFIHXTypD1v8qTJUL8SEmehDN
	 u77oB8O5P7p2g==
Date: Wed, 11 Mar 2026 18:17:38 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Udit Tiwari <quic_utiwari@quicinc.com>, 
	Daniel Perez-Zoghbi <dperezzo@quicinc.com>, Md Sadre Alam <mdalam@qti.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v12 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
Message-ID: <5bj7xmtgag5yfocitg3x7jpkom4icxma25dsz55wj4uhagqxiv@a7edsmzrxcv5>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
 <20260310-qcom-qce-cmd-descr-v12-3-398f37f26ef0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-3-398f37f26ef0@oss.qualcomm.com>
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

On Tue, Mar 10, 2026 at 04:44:17PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In preparation for supporting the pipe locking feature flag, extend the
> amount of information we can carry in device match data: create a
> separate structure and make the register information one of its fields.
> This way, in subsequent patches, it will be just a matter of adding a
> new field to the device data.
> 

Nit: s/patches/commits

> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
>  drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> index c8601bac555edf1bb4384fd39cb3449ec6e86334..8f6d03f6c673b57ed13aeca6c8331c71596d077b 100644
> --- a/drivers/dma/qcom/bam_dma.c
> +++ b/drivers/dma/qcom/bam_dma.c
> @@ -113,6 +113,10 @@ struct reg_offset_data {
>  	unsigned int pipe_mult, evnt_mult, ee_mult;
>  };
>  
> +struct bam_device_data {
> +	const struct reg_offset_data *reg_info;
> +};
> +
>  static const struct reg_offset_data bam_v1_3_reg_info[] = {
>  	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
>  	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
> @@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
>  	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
>  };
>  
> +static const struct bam_device_data bam_v1_3_data = {
> +	.reg_info = bam_v1_3_reg_info,
> +};
> +
>  static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
>  	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
> @@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
>  	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
>  };
>  
> +static const struct bam_device_data bam_v1_4_data = {
> +	.reg_info = bam_v1_4_reg_info,
> +};
> +
>  static const struct reg_offset_data bam_v1_7_reg_info[] = {
>  	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
>  	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
> @@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
>  	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
>  };
>  
> +static const struct bam_device_data bam_v1_7_data = {
> +	.reg_info = bam_v1_7_reg_info,
> +};
> +
>  /* BAM CTRL */
>  #define BAM_SW_RST			BIT(0)
>  #define BAM_EN				BIT(1)
> @@ -393,7 +409,7 @@ struct bam_device {
>  	bool powered_remotely;
>  	u32 active_channels;
>  
> -	const struct reg_offset_data *layout;
> +	const struct bam_device_data *dev_data;
>  
>  	struct clk *bamclk;
>  	int irq;
> @@ -411,7 +427,7 @@ struct bam_device {
>  static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
>  		enum bam_reg reg)
>  {
> -	const struct reg_offset_data r = bdev->layout[reg];
> +	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
>  
>  	return bdev->regs + r.base_offset +
>  		r.pipe_mult * pipe +
> @@ -1205,9 +1221,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
>  }
>  
>  static const struct of_device_id bam_of_match[] = {
> -	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
> -	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
> -	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
> +	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
> +	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
> +	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
>  	{}
>  };
>  
> @@ -1231,7 +1247,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> -	bdev->layout = match->data;
> +	bdev->dev_data = match->data;
>  
>  	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(bdev->regs))
> 
> -- 
> 2.47.3
> 

-- 
மணிவண்ணன் சதாசிவம்

