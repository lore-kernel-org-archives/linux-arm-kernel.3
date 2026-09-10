Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82902C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLiTrkBEtyzQyZ+38aToH0yy/G9IJIyyAE5EniGunF4=; b=r36fUM+9v93sgOVji4ayEw4KwE
	+ezpml9G0xrY6ZrLWfS663lH68hBYTuz+HcCQD5NKxQBlHC3o0Tt8jvONkf9XLxl365jrcsEphTZq
	CpjWYvxiHNkOjmZyii+rxTACZQ1oABNk3yu+bM0ceq5pBuU3La7aq12szzE1h2Y7gOpyVekEnxxNq
	lVyZ4UJPPon7lqusxQ/mjas05kWSoknEIpy1CK58k6HW6j4k07fqDyk/nCtBPjEttwqwf1v+V9oO2
	Tz7y6ZruTOIL55Bihk+Bc4RSN6Ax+FRNKCvMm2ndSc94vdRNBNUGfbEopXpFpubfqllGO5hB5UEYz
	JkoTMddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aWZ-0000000Dnsn-0Cx6;
	Thu, 10 Sep 2026 08:52:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4aWY-0000000Dnsd-1NKw;
	Thu, 10 Sep 2026 08:52:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B867C400A8;
	Thu, 10 Sep 2026 08:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E4081F000FF;
	Thu, 10 Sep 2026 08:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030369;
	bh=tLiTrkBEtyzQyZ+38aToH0yy/G9IJIyyAE5EniGunF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PqgNvKtaZx1jLV0SiljzoiZoUlzyRmiENK+lVU7ul3+izJaEGjhIx5jqtdaFCfiWp
	 Fo0LhGZKY5YFfQ5aqwyV5MWtHsuywAnOxHaoRdaYrmBOpkd3Aq4auX90K+1NMi6tcf
	 d72lq157Razf0KfaLWqiUOT4NndYfwP1dW1QvollBP+wkpna6miya3lEfvWkanyNHg
	 LCTw/rmscstPJg0KN+4PAu1xHxh1co42SWkD0yBm2gG6lq9ppY0ofJu3mR/VMXiytt
	 jA4WlEJV2kBR1v6hns+U0s2kDzCO9J8h+62tuU8gUjLFFD54ftheBI3ZGnXZmI651q
	 SV2ZKKoK+UhPA==
From: matthias.bgg@kernel.org
To: kmehltretter@gmail.com
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthis.bgg@gmail.com>
Subject: Re: clk: mediatek: reset: Fix device registration kernel-doc
Date: Thu, 10 Sep 2026 10:52:27 +0200
Message-ID: <20260910085227.45992-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> The comment for mtk_register_reset_controller_with_dev() names the
> older helper and documents np rather than dev. The new helper takes
> a struct device and obtains its device node internally.
> 
> Use the actual function and parameter names and clarify that failures
> return negative error codes.
> 
> Fixes: 761bc64003e3 ("clk: mediatek: reset: Add new register reset function with device")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Matthias Brugger <matthis.bgg@gmail.com>

> ---
>  drivers/clk/mediatek/reset.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>  };
>  
>  /**
> - * mtk_register_reset_controller - Register mediatek clock reset controller with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
> + * @dev: Device used to manage the reset controller resources.
>   * @desc: Constant pointer to description of clock reset.
>   *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>   */
>  int mtk_register_reset_controller_with_dev(struct device *dev,
>  					   const struct mtk_clk_rst_desc *desc);
> 

