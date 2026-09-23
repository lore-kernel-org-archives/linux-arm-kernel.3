Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFE0C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Mi6tTWblKn2aT/Dm6TmzN7NJEcl25QS4qkHWGwdEtI=; b=H6hWFfLnM15nePVPfI/i9qYYSo
	fyT8tb7aBqPXpiU67bOU9LKJqO2CYYHFWFBU3Hu9VTZ9I9gzJ2Tr/fIXVJjJnnAzAkUSqaiMGG2Ja
	eghZb/bHOx60YeP0JMieRJQgLXI8lVK227KJCPuk5INMqM9zE0CPOLZ9qJPxhOxrzkcBbui4V9gdW
	xuiXR9N20i67dJ87PZHVtWMuz+xqwryJb+9RJiCaG5esZ4lnEKEbCd0VxE1mkoEY8n8VHI23UvhoZ
	L+K2KpO7dkS9XM2AsYeIPaRXStytxxXOiK080K09D2O9L8kSYUA16CkdzmE/RbJq/K9bJCkigWRzW
	TbnOdmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Llg-00000008CdA-3kKz;
	Wed, 23 Sep 2026 12:08:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Llf-00000008Cct-0cnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:08:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1DB643AEE;
	Wed, 23 Sep 2026 12:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEDC1F000FF;
	Wed, 23 Sep 2026 12:08:03 +0000 (UTC)
Message-ID: <a0dfd7f0-2949-4be1-bf1b-5a891256e5eb@linux-m68k.org>
Date: Wed, 23 Sep 2026 22:08:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] m68k: defconfig: update stmark2 defconfig
To: Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260701-wip-stmark2-dac-v7-0-ff8fdcc8010a@baylibre.com>
 <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260701-wip-stmark2-dac-v7-2-ff8fdcc8010a@baylibre.com>
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

Hi Angelo,

On 2/7/26 00:17, Angelo Dureghello wrote:
> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Update stmark2 defconfig enabling MCF5441X DACs.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>

Thanks, I have applied this to the m68knommu git tree, for-next branch.

Regards
Greg



> ---
> Changes for v5:
> - move this patch after new Kconfig symbols are added
> ---
>  arch/m68k/configs/stmark2_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
> index b3fb95f73a95..3941113bc60b 100644
> --- a/arch/m68k/configs/stmark2_defconfig
> +++ b/arch/m68k/configs/stmark2_defconfig
> @@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
>  CONFIG_MCF_EDMA=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
> +CONFIG_IIO=y
> +CONFIG_MCF54415_DAC=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT2_FS_POSIX_ACL=y
> 


