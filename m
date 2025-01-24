Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16460C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN6vWmJdY8efchHukX8IW3vX8SZ6Z58R0FToNYpz9BM=; b=g/DgyYNKpFWVobn2dpUQQ74SqB
	LMZEhFBODC5ddk5d2W+dADbGw5t9ZjVDIM9K24ikOFuPn0jdqFTQdIhHPqZZnpczz9YYTdGbbDXrF
	Jgn0vmhQUUw1N7uAQcJJxpxIxlGjyRk2x6ca1LHNina6HfBIFUcF/gRLqKtIT5nl983pHxQklrdmR
	soW76roBMUj4jrPiKDtQZ0A91iNKMHYKSikJ6GVS3PLDu4DOpOCR09t6SqHj+tNGgOmwaXfoh5fhD
	ICCKEdqx0EaqQ7L3RS0Itv3EMy3MjPWH6KtoURWw2X1jmN9qIW4H71rmV8FbvK0ftODCSNE0hupp7
	tfsX6JGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKFm-0000000Eoxo-1mN9;
	Fri, 24 Jan 2025 14:01:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKES-0000000Eotf-3LiV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 14:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EECAA41746
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 13:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9B0C4CEDD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737727223;
	bh=JegYTuVFanNTV5kQtIbQ++cKukNId9MttjXmNzCBLSQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aEo6YosQY4Cha0A5V8464+Xg9pt/8qDN2tnPxybvF7b8qrR9FGmq/La5r8OhQxdei
	 bfOc3HMLts9+uwd9BOa00Gcoj2svFw79UkBZ8/cgAPqaco1BpBymSL58KdHG1rcEHR
	 HQ7cMkDorzzS5E+9sayq1nF0yx8nasNY0Pz5/sncB4co3esBSkBmw8zhnQb4YE6q4G
	 x4d1YeDoRF7JkDhVFFuWcfXv2ilYXCL1lzBYhuRq0pTkThvVYJvLuFyG5G+FHksQ7n
	 xqtefE7NOMqkUX+GBwKHHhe5RZhDfisrR8HBZyexRBgXAe+6u4VAvveDmW4sGIeHOq
	 lnrmZlBsP1B9g==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30761be8fcfso21959391fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 06:00:23 -0800 (PST)
X-Gm-Message-State: AOJu0Yzpo8KdC5c5FMvrAg/DvgBqzKIs5kQKxUQbDXWZn9MhY2+coSJA
	JQ1SOq6N1OVlXoIyKW9AIInCyy7kmdRkAj39frbgVBz7wypPUSanHg9Q/7xBvKmq4i4w5noQFTL
	CIXSBChU7lvTl9BBNIVBipCe5l84=
X-Google-Smtp-Source: AGHT+IE7MP17cmmG9xs73WqEAc9AOVaFk26WIhIVMB2+1hLzP+zSqe/8BwGv6aLZ/G/T30G8EiDMT4MPYaFj9AWXV5g=
X-Received: by 2002:a2e:a905:0:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-3072cb7f716mr106933971fa.31.1737727221630; Fri, 24 Jan 2025
 06:00:21 -0800 (PST)
MIME-Version: 1.0
References: <20250124082030.764417-1-liuyuntao12@huawei.com>
In-Reply-To: <20250124082030.764417-1-liuyuntao12@huawei.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 24 Jan 2025 15:00:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH5agoCW0gONDZAodHQKANgrix=pE4e5YuHKgR=GwTRwA@mail.gmail.com>
X-Gm-Features: AWEUYZkEGffu0dFLlVXVibTHjAVn4av9OJY1lO8OJZbA_ZiKpCeuT5-pbceX2YM
Message-ID: <CAMj1kXH5agoCW0gONDZAodHQKANgrix=pE4e5YuHKgR=GwTRwA@mail.gmail.com>
Subject: Re: [PATCH -next] arm32/boot/compressed: Force hidden visibility for
 all symbol references
To: Yuntao Liu <liuyuntao12@huawei.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux@armlinux.org.uk, ruanjinjie@huawei.com, kees@kernel.org, 
	masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_060024_901583_F8870BF3 
X-CRM114-Status: GOOD (  15.53  )
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

On Fri, 24 Jan 2025 at 09:31, Yuntao Liu <liuyuntao12@huawei.com> wrote:
>
> Eliminate all GOT entries in the decompressor binary, by forcing hidden
> visibility for all symbol references, which informs the compiler that
> such references will be resolved at link time without the need for
> allocating GOT entries.
>
> Include linux/hidden.h in Makefile, like x86, for the
> hidden visibility attribute.
>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>

Doesn't this break appended DTB?

> ---
>  arch/arm/boot/compressed/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 945b5975fce2..d8a17760ad29 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -93,6 +93,9 @@ targets       := vmlinux vmlinux.lds piggy_data piggy.o \
>                  head.o $(OBJS)
>
>  KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
> +ifneq ($(CONFIG_LD_IS_LLD),y)
> +KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
> +endif
>

Why not for LLD?


>  ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
>              -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
> --
> 2.34.1
>

