Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2176CC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5IUBekPAZ/2NT0M17tr2Jg2W82UzrBIpWtB1EfZbzQ=; b=cJaaf6hN9k5RoPr4JcymB+RzN/
	G/bxwCShKZI2tRuwByqHCHtLaDgBgRZ6liNTqWyqLKjzYuSiXCYzS5XQ2BXzLMceR+zSGgulO2TPe
	VyaIshWtYdMPy/cCELK7AI0IZJBTImE2T1qYuGWwvoSj260RymC7416Z5IzzLZX4jx8dzIU9UzQe7
	k92utsKlppyYjB4gpnS/OQ/NmQzsN5DhNGZHHT4GyPw27MV0bGUZVFlBpyS23x79JbiDvv6Xh0Yki
	n51OvwWgsDQ4s3eDKjaeIzUWQmhozFoVkJyWIwHZBrFgMc74qVdGPP2MMYm8mdOen1MZ7Mgvlh/q9
	ayi4oDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b0l-0000000DsN1-0d1z;
	Thu, 10 Sep 2026 09:24:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4b0j-0000000DsMQ-0jcq;
	Thu, 10 Sep 2026 09:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789032239;
	bh=lO8k/xsn9vJJ5dce2sGr/gdsViGjIJvXorKknr/5sps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Az8d1rhUo17uOQhc71dhaEE2/xhUuVqKZFU2jsJXGj6zzmdUu0vv5IfPqtIn2uXEa
	 PuGN14rcs/Nho2CLKqI5UbCVOuag1aft5jwFM4oyKSwR0wUTKdECpDJozQXuG80A5C
	 GYzozCqc6/FLZj+45aO1o11ddToNbIJYL0FjwQpnCDILwBC6AbKidD5yG3bO4Bvkwt
	 hqGPytp8V5855AXO6bPOF65il6//9ZX1/Qk3C8Qe6sPbdweJj3DZZkBocnDcNfFG2w
	 l84/tKQpDr0qRjxKgVZz8WVoV7HSjdjzppuyAYJ8mnZDyTeBEIrZ+aHZzc6Bpc2nsp
	 Wcp3VTZyTFu1Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CFFA517E0CA6;
	Thu, 10 Sep 2026 11:23:58 +0200 (CEST)
Message-ID: <0c117dbc-facc-4465-a5e0-8fbb822d86a7@collabora.com>
Date: Thu, 10 Sep 2026 11:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: reset: Fix device registration kernel-doc
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260910033000.15926-1-kmehltretter@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260910033000.15926-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_022401_366454_5414C415 
X-CRM114-Status: GOOD (  16.44  )
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

On 9/10/26 05:30, Karl Mehltretter wrote:
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
> ---
>   drivers/clk/mediatek/reset.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 562ffd290a22..b09cdcab0c4b 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -60,11 +60,11 @@ struct mtk_clk_rst_data {
>   };
>   
>   /**
> - * mtk_register_reset_controller - Register mediatek clock reset controller with device
> - * @np: Pointer to device.
> + * mtk_register_reset_controller_with_dev - Register a MediaTek reset controller
> + * @dev: Device used to manage the reset controller resources.
>    * @desc: Constant pointer to description of clock reset.
>    *
> - * Return: 0 on success and errorno otherwise.
> + * Return: 0 on success, negative errno otherwise.
>    */
>   int mtk_register_reset_controller_with_dev(struct device *dev,
>   					   const struct mtk_clk_rst_desc *desc);
> 
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713

Hey, thanks for the patch!
It's almost perfect - just change the first line with:

* mtk_register_reset_controller_with_dev() - Register a MediaTek reset controller

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

