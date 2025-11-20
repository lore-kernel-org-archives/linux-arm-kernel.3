Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E29CF885E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HlnT48z/A0Zow9Hm71TYjARJnafrPhAC7M18jt6NuK0=; b=Z6KSbnMzW7nybjYBS4Q4sElulz
	Ia9rmTka/XALnQ3ITJLocbNF/zhyxc8pHzqpnNiZObWs2qFNqotVvGclEwH9kGjkvQKNtBr0kVR8L
	I7LlD8WPeqm990kUtQ6XZq1eH/PQnAl/lkPgKzxu2QIGiCzudD7Qr9mHXBnFsf2C8c9EOwjJMvQlP
	R029KFX8qXCMR/aNNp2u/qtlc1t8ARPKVYO9z4Vk6Rksb683M/Bq1pGkA0NT6sk8EMkkBb///WKhG
	Dxy5rRAazGfaqgWVX4iCsemS6JQwSnfbb0rE8/PRmM9qTy5d9Tg7KYtvSXtZZbY9PQKH5xKTxa739
	TFqUYyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4y0-00000006lHk-3HtU;
	Thu, 20 Nov 2025 13:44:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4xx-00000006lHM-3kA4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:44:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E0E040309;
	Thu, 20 Nov 2025 13:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FCAC4CEF1;
	Thu, 20 Nov 2025 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763646293;
	bh=geE8CGqh+oZM/uYkoic6MrUOnhgB0yIjv8DKrEbMBp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqHNktJUoFFpvwMD5ypnB6ijVfrJSZRG0d5kxIdfF14wDssA+jJlLHn6oQqrb+7n2
	 LfFI+vtFdHb3f3bYoizKWazZdOz8XYJW+mtFKn/F3murhyVwfdPQRMproP7wrrz0/t
	 DAmDwyWmrb9MzCTapfML81ZvLGpTzk9Vef+qp+PMDa3iaQJLXD9dmUaitkRqwe669k
	 SStu1IVKEMASfrsHyZ5waPYaNAr13shnRbVokCg10J8MStDSQ14lrLqyBxMWTcg1tR
	 LAHJ04MNWggQjdV8bUBSHBEinOkXh5ZfIB859lZETdyj16rdLXSVaIvSlkRzjwIP61
	 bqtCBn+cjVs6A==
Date: Thu, 20 Nov 2025 13:44:45 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Message-ID: <20251120134445.GC661940@google.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_054453_970408_5220B385 
X-CRM114-Status: GOOD (  15.81  )
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

On Wed, 12 Nov 2025, James Calligeros wrote:

> When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
> out with 'case label does not reduce to an integer constant'. Introduce
> a new __SMC_KEY macro that can be used instead.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  include/linux/mfd/macsmc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
> index 6b13f01a8592..f6f80c33b5cf 100644
> --- a/include/linux/mfd/macsmc.h
> +++ b/include/linux/mfd/macsmc.h
> @@ -41,6 +41,7 @@ typedef u32 smc_key;
>   */
>  #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
>  #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
> +#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))

Are we expecting users/consumers to be able to tell the difference
between SMC_KEY and __SMC_KEY (assuming that _SMC_KEY is just an
internal)?

I have not tested this and it is just off the top of my head, but does
this work:

#define _SMC_KEY(s) __SMC_KEY((s)[0], (s)[1], (s)[2], (s)[3])

-- 
Lee Jones [李琼斯]

