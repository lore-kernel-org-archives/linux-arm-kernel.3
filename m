Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A59DCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eR7tTyyqGKiLll6lxmnF9fbyjgtiuG6PiIQ2to9I1lg=; b=oo6NYGYwuzo2mX94yoCbTQFqlP
	tXhmBzBpynufPWPK+vOsEG5rckR0PAX5G5XhYbdXIzVjLZMfZi72IAMHN8EArL6b0NRyw4ksmiWPm
	ldq2FjedSDRSxXgEC/3Clzg5lAU8GRjg+UKsir1oFsvJUTrWao+GqYeTyrTmHEhQ/UBcqYscAh0Xk
	kQsNU4VE88Z8cypSpbJuOZW1VKYAHdLJnpUQTCtLlySUCmUVcZxQeXVe04Uue157KWltcIMBR5eE4
	42+Mg9HA+aSNJ3r8/hy7kD/9DFSNA5+KQbjSg4TBcV2zM7z+Mjd1msCDLM34FWAJhSBItL0yDicT/
	8/Omh3XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiSR-00000009jM5-19my;
	Sun, 31 May 2026 15:52:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiSO-00000009jKS-0Gnu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 15:52:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C3E0940BC1;
	Sun, 31 May 2026 15:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94DD1F00893;
	Sun, 31 May 2026 15:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780242727;
	bh=eR7tTyyqGKiLll6lxmnF9fbyjgtiuG6PiIQ2to9I1lg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=h7RlG9KI/qfwxt2MsBovFn4HsnPdEBEKVBXKizu1orQVjrTKARHZbjpD8kKgxlssj
	 wltUyYNcOlBeaT/p8R8eNPrfW3FzOTjAyA5ZW44rJqOoSqVtI9A2EmPSgW39EnhzlC
	 oewlM5ij6RXj4miHavwwDBWMRmyMVQe21ko0yV8+8Sr4D2OFrSBh0Z61g9ifiThWze
	 7Hdl2u6trUHg3TZXxiubT2kew7hUo5d49LGShYYVkLrwcFikOBYmBnDPwHcoQ+enVg
	 VM5gGJ0TodGV5zk8t3B2uBzIFVoCeHTX7FQIdxG/qf3uqK8FVoCfOsh2dg9hsZQXWk
	 Nd4CAFthuAUzw==
Date: Sun, 31 May 2026 16:51:55 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Arnd Bergmann
 <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Greg Ungerer <gerg@uclinux.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v4 04/11] m68k: defconfig: update stmark2 defconfig
Message-ID: <20260531165155.13e586cd@jic23-huawei>
In-Reply-To: <20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
References: <20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com>
	<20260531-wip-stmark2-dac-v4-4-7e65ab4215dd@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_085208_127729_15D773D4 
X-CRM114-Status: GOOD (  13.82  )
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

On Sun, 31 May 2026 17:25:57 +0200
Angelo Dureghello <adureghello@baylibre.com> wrote:

> From: Angelo Dureghello <adureghello@baylibre.com>
> 
> Update stmark2 defconfig enabling MCF5441X DACs.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
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

Sashiko makes the reasonable point that this symbol doesn't exist yet.
We don't care that much as they make different paths anyway but generally
I'd make sure defconfig updates are after the symbols are added.

https://sashiko.dev/#/patchset/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd%40baylibre.com
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT2_FS_POSIX_ACL=y
> 


