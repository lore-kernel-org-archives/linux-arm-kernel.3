Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CB0CEACCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 21:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY1UjNXsGvOoIk4pnpJlYhtQYGWMnV7zZL4cG77pwUw=; b=UUCKrcZ5zO+Y0LoJl3pUWxTWkx
	4rrVmqBGyHI+8F3QrKUn6LvsBL1cssr1QL/tebzUwdWYM6tQiZH1vcCYNCACyklgTWHIwr6+826oC
	ld5h7ATzJtcakIlLAELZS6tVBwDjois4BsvLxhUsIqp95Vz6S083g21PYsC4CYkfRWCIgK9dH5FO1
	62z2627g+CPP/1dhf1FFb4LRZfJp0fPdekbPKMW0ZnQN2u5imiLEO/TXESRCkA1c9VaSvSZLVgjGV
	SjFUco1PgwwGMp1qjpUVFzJ4SsrBFnTmfASODKTmPFV/REOIHhyIRwBbRABzNl+ggqrlYv38zcqEl
	skOny76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1Xq-0000000D8lV-2FgZ;
	Fri, 14 Nov 2025 21:41:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1Xo-0000000D8kS-00aJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 21:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D4B144278
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 21:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEC9C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 21:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763156483;
	bh=870jrKcu3+KExQtVbENYeTTMwFI1maOpGdGAxr2Wqk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NC0xxulKy/jVNsKu2R/tGkPcaCYwklP3aCdr0YuDrqo9Xf1BMj70GHOVB/x7T13fc
	 qU1A3v1x9XrtQ0c8xSf8OADRSL5K+1urQOAVJ8cNeEFWEmjZVWuhBOkeHgTHS3ngF7
	 jPwhSztkgPhTT/qVJgpNxF1JOAD+uqtvQkTUQ+E26SxQOdFQXdCiDx3XnXXJNK8RU/
	 2Vw7bEWpXeohGB1XY4JvKXTth4xCsIuPQfdwZXqrSkdwpOdlWL6WCEqN90Ff14rvTh
	 zDzv9J/aQx+5IXxQlDqcehvahGXpC3GL/kFgcD/f9Vd4lnSaNFQaxQOOYp0INu0SqM
	 Y1o9ShchqWI9w==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a33f49018so20883541fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 13:41:23 -0800 (PST)
X-Gm-Message-State: AOJu0YwSpRyDQ4tQkgQ4ltvRoaYY/YyjquCW4OmVWV9eeO2Z019Nm/gP
	c7HRv7nBkRW5UF6P2T3zDn4/qs3qkZLMlopJlrjf30ykHEOCCElujPfdTUdEKpxtjObpKglhVkm
	0+4P+w5gkTjrOVAnKmNe88PCyIWuuPHY=
X-Google-Smtp-Source: AGHT+IFe29zqo8gCkaVXCnGx37R00NX2gqT1LHiMtVBd28KTVWuGUdLf+hz9jkToQkMKok2Ij0Qi5JeaMuvCOyDXR+c=
X-Received: by 2002:a2e:8a98:0:b0:379:348:80da with SMTP id
 38308e7fff4ca-37babb5eed2mr11178121fa.8.1763156481579; Fri, 14 Nov 2025
 13:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20251114085058.2195900-1-sumit.garg@kernel.org> <20251114085058.2195900-2-sumit.garg@kernel.org>
In-Reply-To: <20251114085058.2195900-2-sumit.garg@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 22:41:10 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEsJMp8O-BckAoizDQRyirbZN+jYjYF9GGga4kd30em=A@mail.gmail.com>
X-Gm-Features: AWmQ_bn_38f2aWCNi1v3PYjks773oxLFEOd0gS6-DSalAed6w3PWFNsA8Tlp6A8
Message-ID: <CAMj1kXEsJMp8O-BckAoizDQRyirbZN+jYjYF9GGga4kd30em=A@mail.gmail.com>
Subject: Re: [PATCH 1/2] efi/reboot: Add support for EFI_RESET_PLATFORM_SPECIFIC
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com, 
	leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_134124_344730_4D1B4F9B 
X-CRM114-Status: GOOD (  26.53  )
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

On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>
> UEFI specification provides support for EfiResetPlatformSpecific reset
> type as follows:
>
> "
> ResetSystem:
>
> Calling this interface with ResetType of EfiResetPlatformSpecific
> causes a system-wide reset. The exact type of the reset is defined
> by the EFI_GUID that follows the Null-terminated Unicode string passed
> into ResetData. If the platform does not recognize the EFI_GUID in
> ResetData the platform must pick a supported reset type to perform.
> The platform may optionally log the parameters from any non-normal
> reset that occurs.
> "
>
> Lets use the ResetData to pass the platform specific reboot command
> issued and leave it's interpretation to UEFI implementation following
> the specification.
>
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/firmware/efi/reboot.c | 25 +++++++++++++++----------
>  include/linux/efi.h           |  5 +++--
>  2 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/firmware/efi/reboot.c b/drivers/firmware/efi/reboot.c
> index ceae84c19d22..23a2fc68e9c9 100644
> --- a/drivers/firmware/efi/reboot.c
> +++ b/drivers/firmware/efi/reboot.c
> @@ -10,7 +10,7 @@ static struct sys_off_handler *efi_sys_off_handler;
>
>  int efi_reboot_quirk_mode = -1;
>
> -void efi_reboot(enum reboot_mode reboot_mode, const char *__unused)
> +void efi_reboot(enum reboot_mode reboot_mode, const char *data)
>  {
>         const char *str[] = { "cold", "warm", "shutdown", "platform" };
>         int efi_mode, cap_reset_mode;
> @@ -18,14 +18,18 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *__unused)
>         if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
>                 return;
>
> -       switch (reboot_mode) {
> -       case REBOOT_WARM:
> -       case REBOOT_SOFT:
> -               efi_mode = EFI_RESET_WARM;
> -               break;
> -       default:
> -               efi_mode = EFI_RESET_COLD;
> -               break;
> +       if (data) {
> +               efi_mode = EFI_RESET_PLATFORM_SPECIFIC;
> +       } else {
> +               switch (reboot_mode) {
> +               case REBOOT_WARM:
> +               case REBOOT_SOFT:
> +                       efi_mode = EFI_RESET_WARM;
> +                       break;
> +               default:
> +                       efi_mode = EFI_RESET_COLD;
> +                       break;
> +               }
>         }
>
>         /*
> @@ -43,7 +47,8 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *__unused)
>                 efi_mode = cap_reset_mode;
>         }
>
> -       efi.reset_system(efi_mode, EFI_SUCCESS, 0, NULL);
> +       efi.reset_system(efi_mode, EFI_SUCCESS, sizeof(data),

You cannot use sizeof() here - it will return the size of a pointer to
const char.


> +                        (efi_char16_t *)data);
>  }
>
>  bool __weak efi_poweroff_required(void)
> diff --git a/include/linux/efi.h b/include/linux/efi.h
> index a98cc39e7aaa..5324db1518b6 100644
> --- a/include/linux/efi.h
> +++ b/include/linux/efi.h
> @@ -256,6 +256,7 @@ typedef union efi_boot_services efi_boot_services_t;
>  #define EFI_RESET_COLD 0
>  #define EFI_RESET_WARM 1
>  #define EFI_RESET_SHUTDOWN 2
> +#define EFI_RESET_PLATFORM_SPECIFIC 3
>
>  /*
>   * EFI Runtime Services table
> @@ -874,7 +875,7 @@ static inline bool efi_enabled(int feature)
>  {
>         return test_bit(feature, &efi.flags) != 0;
>  }
> -extern void efi_reboot(enum reboot_mode reboot_mode, const char *__unused);
> +extern void efi_reboot(enum reboot_mode reboot_mode, const char *data);
>
>  bool __pure __efi_soft_reserve_enabled(void);
>
> @@ -895,7 +896,7 @@ static inline bool efi_enabled(int feature)
>         return false;
>  }
>  static inline void
> -efi_reboot(enum reboot_mode reboot_mode, const char *__unused) {}
> +efi_reboot(enum reboot_mode reboot_mode, const char *data) {}
>
>  static inline bool efi_soft_reserve_enabled(void)
>  {
> --
> 2.48.1
>

