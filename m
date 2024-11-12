Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586E7D42B8E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkrj8zOIjjnZJy1atOsnMBuEroYwRdEEHSdVtp9No4U=; b=JhyGkxyNHvzfNfngTW0lU0IWil
	28b5kOj8HRQ6wDMi4uxQmLtA//wy+WBqO2ljVRnyvS/6iYnTLLA7VEkLe7Y2HuQvoxHfVqkBDnMZH
	KH9VyrazkcZLS2gqse1vAMcwvGVGp4qLva7JQuYM1NAiI3Y8S0XUBwVj54FRLAsmcATQxV7kOsR7o
	5hyz1IieVaN4xBh24JgLsp3w+kji/Jp2ELOSvXwl1qwmKlv/cKLDsXapCRtRkSbdE/ugLOqn7Gsoq
	APQXvTPCTMce5gfKA3Nq+g6kZHqLoXRpYObPvt6txiBMwcbcnHykLHAKShTxZM6TjvAD+v6clyS/j
	Njc8hK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsEI-00000003pER-1yV1;
	Tue, 12 Nov 2024 14:50:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs2N-00000003mbm-18FR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 14:38:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 453C15C5589;
	Tue, 12 Nov 2024 14:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0220C4CED5;
	Tue, 12 Nov 2024 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731422314;
	bh=bQHPCChlbA6zZpzQ0DUgpdk9N3mG6RMBiqNtq7IUJVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uSeaigY8WbxmaJTmya7XuZFX9a7Rw3gv9oZPpkqHTR7qaFr1YXXQc37dZfYgiJ2yl
	 xTgxngPCA7kazzxAWi9pzQ0Ymre3MrbGbcFIzVuJUA3LNGitq7a6ta6AJd6q0Fwiqw
	 iCA68OKa19ii4GYldqO3uH53Xgam7t0Tue7DkUmLBsRENXoJvQdsImFGyU9/9JKQPS
	 F6ZM2crG43RW0PavL2frvLzlyfTwkq69u8nrwDxpd0ipFK7p60SMmC4UTO7kZIQm/S
	 +i/mmay2D226seqYIa7uf5BIRxj1mKMfekDDVSpBcfJjXPzrwaPOnhn3D4ugbHRhyS
	 u6mbHKFnqpo0w==
Date: Tue, 12 Nov 2024 14:38:28 +0000
From: Lee Jones <lee@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH v2 3/4] mfd: at91-usart: make it selectable for
 ARCH_LAN969X
Message-ID: <20241112143828.GH8552@google.com>
References: <20241108135855.129116-1-robert.marko@sartura.hr>
 <20241108135855.129116-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108135855.129116-3-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063835_371772_04BC2A2E 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: luka.perkov@sartura.hr, jirislaby@kernel.org, sboyd@kernel.org, catalin.marinas@arm.com, mturquette@baylibre.com, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, will@kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 08 Nov 2024, Robert Marko wrote:

> LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---
> Changes in v2:
> * Pickup Acked-by from Nicolas
> 
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee@kernel.org>

> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ae23b317a64e..f280ba28d618 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>  config MFD_AT91_USART
>  	tristate "AT91 USART Driver"
>  	select MFD_CORE
> -	depends on ARCH_AT91 || COMPILE_TEST
> +	depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST
>  	help
>  	  Select this to get support for AT91 USART IP. This is a wrapper
>  	  over at91-usart-serial driver and usart-spi-driver. Only one function
> -- 
> 2.47.0
> 

-- 
Lee Jones [李琼斯]

