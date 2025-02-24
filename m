Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88695C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZM8dPTsCDKK8ML4+7mISE8lMMELY3op8KDQ6VRvfF8=; b=PxwDfT1xZA7O96Gr/dFfd4h65X
	eoQ73Iaya1XWx1iveAnQvYMS2CCgYKjchjc0nr1E7o8/HlCjphX4a5pt5qAm3CmKDrX4zJgSk/d4M
	6RStyoyU7zFrxVA3+KtKyQ31e+SEAw06gcsLMQpskT2gtfycHNLx50Khvx6ki7PoBGRWpL0chc7n5
	kocFdDoiHkpTuwAu7bX+8P0OpkfjX3QmbHSTCMdzoLX94l+yatTbFaGu1E3t2IUJ6Xu5vgUd6CtYA
	aJKSD+SNF0hQBz5MAe/fkXAehiIo91Waala8Jpz8oJf3nKmhZQxlbqqkv4As0wMqyviaw44bKMJAv
	ZVAmWIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTbI-0000000Ce5E-022R;
	Mon, 24 Feb 2025 08:14:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTYR-0000000CdWt-3bot
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:11:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 37F5261178
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 08:11:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BC1C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740384665;
	bh=wpaTUIwidiE3GZ8YUXT7uXhOSdSbxhbvnoqkGr7J4/M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MgFqjvSnEXfT2dN4JbrW/VYqYgG0nWOsQqlUPQ9awS2RrhQZZkwg2OtAbIQLfcY7P
	 tmsnful6TtvtS4w6HHnFxFlDrugVAC3GoSEtUbRJonDvXS2eElxEb5eqcI6VYxVsCj
	 3sSUMT+fkiS1zfZhpJIrexfUdY7cl6RnZ0p3HD3ZgaDgklHkiUtE1fM4kpOxe6cPv3
	 yyCBCIvdRTFbTEbCeJXshwAP6fr2U177a81O0o6wUp76E+U0eybAZ3PAjr0JuX6UGo
	 03moZsKieEmNVnbMZ/Q+aH69KZK4RC9v1/OH3RdWLpiqERS7ufPP9WkuKKnEaGWrZS
	 QbcQLVyKeM8xw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a6bso42401831fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 00:11:05 -0800 (PST)
X-Gm-Message-State: AOJu0YyJDuDM6z5inWphNPCaqmh0H/aX4FzLb9byGM5NaWhy5rhA0x4A
	XRMTBcsw8zEV3/VZwl+ZwPhi8BT4G3gn7hZJCSTkDEuuUVx11Tfov7g55ajVQe15MbhqZMutB0J
	KdnILyK6Xt2z5R/2Hybf3QH/I/4Y=
X-Google-Smtp-Source: AGHT+IGWAdvh8Uk5kDUolWyUpntZPHToLER0sCEfBzrsbMTUct8qTsWzLwAR4xPwH4meMXT3mHvjOWDudLYqwdHehTo=
X-Received: by 2002:a05:6512:2211:b0:545:58e:e543 with SMTP id
 2adb3069b0e04-54838ee9334mr4265598e87.21.1740384663815; Mon, 24 Feb 2025
 00:11:03 -0800 (PST)
MIME-Version: 1.0
References: <20250224062111.66528-1-kpark3469@gmail.com>
In-Reply-To: <20250224062111.66528-1-kpark3469@gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 24 Feb 2025 09:10:52 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG5uTUH3--A3OtPQcMqj4hiNrONL6tUKkmwqmjkOYMuyQ@mail.gmail.com>
X-Gm-Features: AWEUYZml3zcWsZttkBGhQ352lKORrZnbm7B76-btGrHm4knlWfWj1Hj1AfPuHtk
Message-ID: <CAMj1kXG5uTUH3--A3OtPQcMqj4hiNrONL6tUKkmwqmjkOYMuyQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
To: keun-o.park@katim.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 24 Feb 2025 at 07:21, Keun-O Park <kpark3469@gmail.com> wrote:
>
> From: Keuno Park <keun-o.park@katim.com>
>
> On systems using 4KB pages and having 39 VA_BITS, linear_region_size
> gets 256GiB space. It was observed that some SoCs such as Qualcomm
> QCM8550 returns 40bits of PA range from MMFR0_EL1. This leads range
> value to have minus as the variable range is s64, so that all the
> calculations for randomizing linear address space are skpped.
> As a result of this, the kernel's linear region is not randomized.
> For this case, this patch sets the range by calculating memblock
> DRAM range to randomize the linear region of kernel.
>
> Change-Id: Ib29e45f44928937881d514fb87b4cac828b5a3f5
> Fixes: 97d6786e0669 ("arm64: mm: account for hotplug memory when randomizing the linear region")
> Signed-off-by: Keuno Park <keun-o.park@katim.com>
> ---
>  arch/arm64/mm/init.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9c0b8d9558fc..2ee657e2d60f 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -290,6 +290,11 @@ void __init arm64_memblock_init(void)
>                 s64 range = linear_region_size -
>                             BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
>
> +               if (range < 0) {
> +                       range = linear_region_size -
> +                               (memblock_end_of_DRAM() - memblock_start_of_DRAM());
> +               }
> +

Please explain how this ensures that hotplug memory still works as expected.

