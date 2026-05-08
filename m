Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D59CCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cQZNmvowIFlL59gjPKwq3S8Lubw9QFautuveU52+dKw=; b=jWIjOIxo2wcqRNh70P8DlLRJQ6
	MtOdAoXKnQrT4Heb/FP9tueXx9CrSBr0cCuv1PzIIHzGLgcLYzygnhsmoWvghK+IkAlqFqDc5pIY7
	g5LeLnYQoCZm58rPUs1YF2lwcAmFwGelN4poSUjWQkqaJqdOg2WPKEgvyKQG/5k4KIMhCkxkXaLAc
	GOb7mydqHqsj9l/5LUPIFXGjSffXufBOvcIEBFzEKvahDPpe1Ihc6TBRPFqGGWQuxbuQYb7qUUl//
	0RlPaS0dTYff68WFHmX7yjNjrNV4YPUceUHT7LuIFAy8sLeap7BeneUSZEsgNlo/F56or62rQrBDE
	Bm4NearA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXE-00000007Djr-38jG;
	Fri, 08 May 2026 18:02:48 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPXD-00000007DjV-18d1;
	Fri, 08 May 2026 18:02:47 +0000
Message-ID: <6f5a4345-abc6-4439-801f-f3b98e2701b3@infradead.org>
Date: Fri, 8 May 2026 11:02:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] soc: ti: knav_qmss_acc: Fix kernel-doc Return: tag
To: Nishanth Menon <nm@ti.com>, Justin Stitt <justinstitt@google.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-8-nm@ti.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260508153211.3688277-8-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 5/8/26 8:32 AM, Nishanth Menon wrote:
> Fix knav_init_acc_range() use of 'Return ...' instead of 'Return:'
> kernel-doc comment, which produces a warning with W=2:
> 
>   knav_qmss_acc.c:473: No description found for return value of
>   'knav_init_acc_range'
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Cc: Randy Dunlap <rdunlap@infradead.org>
> 
>  drivers/soc/ti/knav_qmss_acc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/ti/knav_qmss_acc.c b/drivers/soc/ti/knav_qmss_acc.c
> index 269b4e75ae40..1f8b5acdd462 100644
> --- a/drivers/soc/ti/knav_qmss_acc.c
> +++ b/drivers/soc/ti/knav_qmss_acc.c
> @@ -466,7 +466,7 @@ static const struct knav_range_ops knav_acc_range_ops = {
>   * @node:		device node
>   * @range:		qmms range information
>   *
> - * Return 0 on success or error
> + * Return: 0 on success, errno otherwise.
>   */
>  int knav_init_acc_range(struct knav_device *kdev,
>  			struct device_node *node,

-- 
~Randy

