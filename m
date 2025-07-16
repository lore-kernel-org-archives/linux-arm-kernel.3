Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F067AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlN3eEFIQzOKOsOyW8Y0cVB2k48ZrdzYn9uzbtfo0l8=; b=yqbmnpykDGkH+ZQAcn9OfwZHFQ
	T7jolH7ErcxCZTcGxWMB5UOTZEslFuvEX2Ws2SDBWMoQmAKKg6HpY0wFeLALl0yjpC1DSAIArXUvW
	YYRxX6hkLBTovtpxNx/6++yX/mcKCfRZu7spdfgTPbZDs6lWmWP6UAqdxQIChRyIzG+zKQcjbOBq6
	KVzJaWblRf6jisS1SERTHbT/GGEsk6iXQMK8TG2IKzJ7fWXbZHJ6CbHvo5LfjoRQYo5inYoBFRUC5
	ntlJwlbb+xsMUigCFDQy1bbdUcyd/FzYDsvJeAswJj2jg5EI+tSl2d7qMVtXNTXkQR2H44kuMrGG8
	PJ+pswdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3B1-00000007uhX-3dBc;
	Wed, 16 Jul 2025 14:32:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc32j-00000007tRJ-2kEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 14:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DCC61A5745F;
	Wed, 16 Jul 2025 14:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D3BC4CEE7;
	Wed, 16 Jul 2025 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752675812;
	bh=e5zCNgF4CRlQ6UG+BnF+U5KFmnlBVcJj1XukETvxuWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gMsGVNVJUzfW4rt6liw1e8wbE5wbrvAWvHVCKBH+M6qYfGU2Ve3XnKB0n+4dZ9BKK
	 gqruRHqvERx6D/iVbkdUZYI6Ph8gLLRMcDteRsWVXOTGkSsGrmRkHa6DWmi4pRAFCb
	 erqn7MsW6V+em/Sxs6E6KHtVaX+QwsKbBp5WAPtA49nD/hw+JN3fuH8AsRY1faqTGD
	 VLxYjkAWy63ltTmLGSz9pfjpizl0KwM67C70KRnJUP4A8Ylu6MsVv5WawyNtBBG52U
	 HULPB/AX3Fmk3NsV3PcLGSOEi60GYNJFsFu3NMAJKxh+vM/Ao8aA5z1tCJaxLT6sAI
	 WEE5uKUV+IXpw==
Message-ID: <c453aadb-afd7-473c-bb39-cab1930c8baa@kernel.org>
Date: Wed, 16 Jul 2025 16:23:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] Revert "media: platform: ti: Remove unused
 vpdma_update_dma_addr"
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux@armlinux.org.uk, ardb@kernel.org, ebiggers@kernel.org,
 geert+renesas@glider.be, claudiu.beznea@tuxon.dev, bparrot@ti.com,
 andre.draszik@linaro.org, kuninori.morimoto.gx@renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, heikki.krogerus@linux.intel.com,
 kory.maincent@bootlin.com, florian.fainelli@broadcom.com, lumag@kernel.org,
 dale@farnsworth.org, sbellary@baylibre.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dagriego@biglakesoftware.com,
 u-kumar1@ti.com
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-3-y-abhilashchandra@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250716111912.235157-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_072333_825275_41A5F723 
X-CRM114-Status: GOOD (  17.60  )
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

On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
> This reverts commit 9314891df119442a6ec1518b3d872c330e2bf1a1.
> 
> We're adding support for TI VIP driver, so this is no longer unused.
> 
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  drivers/media/platform/ti/vpe/vpdma.c | 32 +++++++++++++++++++++++++++
>  drivers/media/platform/ti/vpe/vpdma.h |  3 +++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
> index bb8a8bd7980c..da90d7f03f82 100644
> --- a/drivers/media/platform/ti/vpe/vpdma.c
> +++ b/drivers/media/platform/ti/vpe/vpdma.c
> @@ -552,6 +552,38 @@ EXPORT_SYMBOL(vpdma_submit_descs);
>  
>  static void dump_dtd(struct vpdma_dtd *dtd);
>  


Please add kerneldoc.

> +void vpdma_update_dma_addr(struct vpdma_data *vpdma,
> +	struct vpdma_desc_list *list, dma_addr_t dma_addr,
> +	void *write_dtd, int drop, int idx)
> +{
> +	struct vpdma_dtd *dtd = list->buf.addr;
> +	dma_addr_t write_desc_addr;
> +	int offset;
> +
> +	dtd += idx;
> +	vpdma_unmap_desc_buf(vpdma, &list->buf);
> +
> +	dtd->start_addr = dma_addr;
> +
> +	/* Calculate write address from the offset of write_dtd from start
> +	 * of the list->buf
> +	 */
> +	offset = (void *)write_dtd - list->buf.addr;
> +	write_desc_addr = list->buf.dma_addr + offset;
> +
> +	if (drop)
> +		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
> +							   1, 1, 0);
> +	else
> +		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
> +							   1, 0, 0);
> +
> +	vpdma_map_desc_buf(vpdma, &list->buf);
> +
> +	dump_dtd(dtd);
> +}
> +EXPORT_SYMBOL(vpdma_update_dma_addr);


This has to be GPL

> +
>  void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
>  			u32 width, u32 height)

Best regards,
Krzysztof

