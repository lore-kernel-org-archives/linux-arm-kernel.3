Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E72C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9RRy3R2yj+oaDdoueZGj4W8D+VQRo8mLrErLkrXN0Q=; b=J6JD7tG2eI26WXqoM0SaYNRBVo
	MTamJkDf9R8Z1nj4uVsLQbJx/SIgx8dOycL9/NJeGcbZIkCGoLXDf1+XX5zSbR82Lfr3OfgSOMuwN
	pC5LS28s1yDceeVR+SwRdEffkbuxUIFDv7uaSeu/9tfUcvQLrB/orYPJF1O45m5AIvOG90xQnkfvu
	9dra9pEDy7VmOv2xgB0q3stdk+/CNl/D1UKKrfEoGaDoakTpzUucwyYDSWmtzqG/hm4igkDNLrvD4
	j37rJo+dOrGxe0vCi+SLn3fg5AHbEd7OSBJ+1uhRwxnqbzMvNOw7fp/nXOVbMUGn2xVnUwtwZnxii
	gBgfSYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0wI-00000000qjX-0u2E;
	Wed, 30 Jul 2025 07:09:26 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0rO-00000000qFt-06xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:04:24 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250730070417euoutp019db8a4f7a6f0ada69f697570f44d0008~W9YVVBkhf1789217892euoutp01o
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 07:04:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250730070417euoutp019db8a4f7a6f0ada69f697570f44d0008~W9YVVBkhf1789217892euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753859057;
	bh=s9RRy3R2yj+oaDdoueZGj4W8D+VQRo8mLrErLkrXN0Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=l2A9Wd3JFOIU7/v/VQ/3ZHRa7ExkpwOzQvaxRfB4pYqBRvC0KYU4n0nJpBCyRS39M
	 0fS54Gb06hVVOr7dzZSV86xZWz0O8Cm3CPHqXIMG/ciLZHwr9YHWVY6Td3vf0hAU6R
	 4/a2gxCxgu9mSR788YbhQBq1UNzL6adJp2d+tbMY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a~W9YVMkP7Y0123601236eucas1p2L;
	Wed, 30 Jul 2025 07:04:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250730070417eusmtip166d12f714da9471398e06bfe6c5012b4~W9YUpSzBS0768707687eusmtip1e;
	Wed, 30 Jul 2025 07:04:17 +0000 (GMT)
Message-ID: <205d3356-5ebe-4e73-b888-6765e5a673ea@samsung.com>
Date: Wed, 30 Jul 2025 09:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: s5p-mfc: Always pass NULL to
 s5p_mfc_cmd_host2risc_v6()
To: Nathan Chancellor <nathan@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a
X-EPHeader: CA
X-CMS-RootMailID: 20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a
References: <20250715-media-s5p-mfc-fix-uninit-const-pointer-v1-1-4d52b58cafe9@kernel.org>
	<CGME20250730070417eucas1p2f8c3a230581c16a0552c4f9f6231456a@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_000422_677151_B7149778 
X-CRM114-Status: GOOD (  25.94  )
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

On 16.07.2025 00:13, Nathan Chancellor wrote:
> A new warning in clang [1] points out a few places in s5p_mfc_cmd_v6.c
> where an uninitialized variable is passed as a const pointer:
>
>    drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:45:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>       45 |                                         &h2r_args);
>          |                                          ^~~~~~~~
>    drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:133:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>      133 |                                         &h2r_args);
>          |                                          ^~~~~~~~
>    drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c:148:7: error: variable 'h2r_args' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>      148 |                                         &h2r_args);
>          |                                          ^~~~~~~~
>
> The args parameter in s5p_mfc_cmd_host2risc_v6() is never actually used,
> so just pass NULL to it in the places where h2r_args is currently
> passed, clearing up the warning and not changing the functionality of
> the code.
>
> Cc: stable@vger.kernel.org
> Fixes: f96f3cfa0bb8 ("[media] s5p-mfc: Update MFC v4l2 driver to support MFC6.x")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2103
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  From what I can tell, it seems like ->cmd_host2risc() is only ever
> called from v6 code, which always passes NULL? It seems like it should
> be possible to just drop .cmd_host2risc on the v5 side, then update
> .cmd_host2risc to only take two parameters? If so, I can send a follow
> up as a clean up, so that this can go back relatively conflict free.
> ---
>   .../platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c      | 22 +++++-----------------
>   1 file changed, 5 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> index 47bc3014b5d8..735471c50dbb 100644
> --- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> +++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc_cmd_v6.c
> @@ -31,7 +31,6 @@ static int s5p_mfc_cmd_host2risc_v6(struct s5p_mfc_dev *dev, int cmd,
>   
>   static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
>   {
> -	struct s5p_mfc_cmd_args h2r_args;
>   	const struct s5p_mfc_buf_size_v6 *buf_size = dev->variant->buf_size->priv;
>   	int ret;
>   
> @@ -41,33 +40,23 @@ static int s5p_mfc_sys_init_cmd_v6(struct s5p_mfc_dev *dev)
>   
>   	mfc_write(dev, dev->ctx_buf.dma, S5P_FIMV_CONTEXT_MEM_ADDR_V6);
>   	mfc_write(dev, buf_size->dev_ctx, S5P_FIMV_CONTEXT_MEM_SIZE_V6);
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SYS_INIT_V6, NULL);
>   }
>   
>   static int s5p_mfc_sleep_cmd_v6(struct s5p_mfc_dev *dev)
>   {
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6,
> -			&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_SLEEP_V6, NULL);
>   }
>   
>   static int s5p_mfc_wakeup_cmd_v6(struct s5p_mfc_dev *dev)
>   {
> -	struct s5p_mfc_cmd_args h2r_args;
> -
> -	memset(&h2r_args, 0, sizeof(struct s5p_mfc_cmd_args));
> -	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6,
> -					&h2r_args);
> +	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_WAKEUP_V6, NULL);
>   }
>   
>   /* Open a new instance and get its number */
>   static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   {
>   	struct s5p_mfc_dev *dev = ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
>   	int codec_type;
>   
>   	mfc_debug(2, "Requested codec mode: %d\n", ctx->codec_mode);
> @@ -130,14 +119,13 @@ static int s5p_mfc_open_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   	mfc_write(dev, 0, S5P_FIMV_D_CRC_CTRL_V6); /* no crc */
>   
>   	return s5p_mfc_cmd_host2risc_v6(dev, S5P_FIMV_H2R_CMD_OPEN_INSTANCE_V6,
> -					&h2r_args);
> +					NULL);
>   }
>   
>   /* Close instance */
>   static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   {
>   	struct s5p_mfc_dev *dev = ctx->dev;
> -	struct s5p_mfc_cmd_args h2r_args;
>   	int ret = 0;
>   
>   	dev->curr_ctx = ctx->num;
> @@ -145,7 +133,7 @@ static int s5p_mfc_close_inst_cmd_v6(struct s5p_mfc_ctx *ctx)
>   		mfc_write(dev, ctx->inst_no, S5P_FIMV_INSTANCE_ID_V6);
>   		ret = s5p_mfc_cmd_host2risc_v6(dev,
>   					S5P_FIMV_H2R_CMD_CLOSE_INSTANCE_V6,
> -					&h2r_args);
> +					NULL);
>   	} else {
>   		ret = -EINVAL;
>   	}
>
> ---
> base-commit: 347e9f5043c89695b01e66b3ed111755afcf1911
> change-id: 20250715-media-s5p-mfc-fix-uninit-const-pointer-cbf944ae4b4b
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


