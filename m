Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE7CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cllVqBWeUZFFE5PARRbxq8nSMDDye/AwcKTKDZm3VNE=; b=09de0czFcakL7KsB/unphbDdXB
	oDfXDaNmHr/VwWnqBiO/6Do2LtY1u4hjoYrC9IhUIUYiUK87gv+RvZWoBG0M57+R/wqQBsOGMBddh
	B+QkZrXG4T/wYID2hOc4tHRhAX3JumzyTE5vMZ9+RQSJcgC/2fOuEVnWI4NC7ynWjNTkBthswZ7cR
	yhCksDJwjklAd9rAZe5at0drcVTd8isyw33ujRJlbx7dDKfkYu/NVXUlB7uLEBIv07+2FudZRzXgg
	J7KHUcORLLohXyduBT/+2RMrWc3fJ2k9kSUwF06WO+BywKZxeZa/rNCO3nzpNqS1p2ZlsT0IM1pK8
	F4J4HJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gMW-0000000ARal-3uB0;
	Mon, 22 Sep 2025 13:13:48 +0000
Received: from mail-io1-xd63.google.com ([2607:f8b0:4864:20::d63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gMU-0000000ARZ0-1OdQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:13:47 +0000
Received: by mail-io1-xd63.google.com with SMTP id ca18e2360f4ac-8db958b5b83so9552239f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758546824; x=1759151624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cllVqBWeUZFFE5PARRbxq8nSMDDye/AwcKTKDZm3VNE=;
        b=ez17nPGJwg5ASMz8J+gNrfOhu4m1CzwbRnqOKQjdIVbl13VCJfNkNAKOMrTSotiG7R
         Tn3WmCT2Hq/EpqyI9aoBvPpBxFWJLgTqEWcQ/PNLIwYTiv/hXHmPJkIryxsrkRuw/oq0
         8SX56o7u+jgWEk79x+mWw2rrH5QaeNWfBt8xelbUrQ+7DrMIx0Dk08uxpD8oiQrLt/lK
         +1HAzviw2OQpJbrzVi0xcN3eCqN3DCkj5KwX37Up5lFaaYFDqa065AxYEmbmlaDVWvaz
         OPpVDla9lZ2KSNHWh1gvWGlfNwxAQPnN3uxUKF1gJxDbihxPxFT87i6jL2RFMrRzge9x
         D76w==
X-Gm-Message-State: AOJu0Yz0hEl4GGeNXTnUemka4q8/yB6qedEI1fXbhQi8xr0HBDIPjsCX
	R1dA/Lcxm0hCE3SQnbZxF87ZQXknzrzPrZnJgVBdSy5+O+kk7n/Eyu9IqIcojduPEzYPwk5RIMP
	cFnSrwnEMQj6VaqI/nSJWDPeYikNqz2N9eCyw7nYTzbCOO+E4He0kTz3wAzYj5LahKlIc6GTN2v
	aBuq2y0jA6yLsfbxA88U5FWLN919rep4ZcAGQvOh8qsC+3b9NHcBOjLKOFWc3o4F7oGPcXF0Chs
	IBiBsyQOpjs8AGEWWC+vj5D8LFx
X-Gm-Gg: ASbGnct51Kf67NChNq8p3LRNhyWV1S+noFXZNKnEpMUnECz5DuOKkUlSfjMPNYkM4in
	ATwYfULuX7Ddv+KaIjHm3AMoqMM6uvpAwFvsbucNQh9cG3PRYM/8CR51GvnWeVbK8TkMoP7V3lB
	3kTklbMLzTzRpZ0+hnl3Nr2zakLTC7PDqiIKSMzlcyxsimnBAJZzZQp8F3T+rPWt66OF2IDbHIB
	T1BoBfeL2waG4FzyFeoRR7D+yYKJG9ZqeT6UeGh0pmrXajnAhutjA9G+1yvvnW1g5rCBBYFQ901
	heydVde2MoYIgf/lRxvaseJMXyV5vIZMMCsnnMQD1mJqpUEeKR69HTHpu/kta8Oc+V4Hgq0qoL2
	+asHa2XATKVZkJ/U5+2t9EqmXxb69GI90LMdxeWTyNyyG/d8BDOm8Mf7ZzuMN+iy/85ZAsK9bYr
	/H
X-Google-Smtp-Source: AGHT+IF6NBuzh1Db4JCYPBer4gh0rnfkI0AvWmmly3Ijg2HpvXn9Drg6oBYN86bvXIStwsqOjN03YOJA7phx
X-Received: by 2002:a5e:9746:0:b0:887:4efb:2bc8 with SMTP id ca18e2360f4ac-8addf7d7fbamr1547608839f.14.1758546824453;
        Mon, 22 Sep 2025 06:13:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-119.dlp.protect.broadcom.com. [144.49.247.119])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-54403e5582esm574482173.35.2025.09.22.06.13.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Sep 2025 06:13:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-57a898f0932so1533824e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1758546822; x=1759151622; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cllVqBWeUZFFE5PARRbxq8nSMDDye/AwcKTKDZm3VNE=;
        b=XTRPvIiQnHtyAS6sBLiYX6f0ves7JP6MxhmZelJNYt68SCQMP5FUtJgtF1OFtOrIyn
         KSsvHheOam0J/23BYi2rHuAi2KkPG4k4lHsJTA/+u2TT2LSEuzNZLmIN1BlSZVb3zIgm
         rBT/Zn396jYJqw7Ps6TE6NTzZJ8xqaK4rNSD4=
X-Received: by 2002:a05:6512:638e:b0:579:ff59:a5a8 with SMTP id 2adb3069b0e04-579ff59a5c2mr3196440e87.37.1758546822388;
        Mon, 22 Sep 2025 06:13:42 -0700 (PDT)
X-Received: by 2002:a05:6512:638e:b0:579:ff59:a5a8 with SMTP id
 2adb3069b0e04-579ff59a5c2mr3196426e87.37.1758546821902; Mon, 22 Sep 2025
 06:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250920021024.847323-1-william.zhang@broadcom.com>
In-Reply-To: <20250920021024.847323-1-william.zhang@broadcom.com>
From: Kursad Oney <kursad.oney@broadcom.com>
Date: Mon, 22 Sep 2025 09:13:26 -0400
X-Gm-Features: AS18NWC52Kyz4JfaKcm9yf_fl8ruTBMuvkdeTwXMowcj5URJe47hbkczPk9a-z0
Message-ID: <CAMm8Nh0oGokMDFt8ghomX1_SA3sbfv_xJVUXd2V1XeBA0OR08g@mail.gmail.com>
Subject: Re: [PATCH] ARM: module: fix unwind section relocation out of range error
To: William Zhang <william.zhang@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, song@kernel.org, 
	linus.walleij@linaro.org, florian.fainelli@broadcom.com, ardb@kernel.org, 
	anand.gore@broadcom.com, 
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, Petr Pavlu <petr.pavlu@suse.com>, 
	Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_061346_403130_78DA7E24 
X-CRM114-Status: GOOD (  20.92  )
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

Hi William,


On Fri, Sep 19, 2025 at 10:10=E2=80=AFPM William Zhang
<william.zhang@broadcom.com> wrote:
>
> In an armv7 system that uses non-3G/1G split and with more than 512MB
> physical memory, driver load may fail with following error:
>    section 29 reloc 0 sym '': relocation 42 out of range (0xc2ab9be8 ->
> 0x7fad5998)
>
> This happens when relocation R_ARM_PREL31 from the unwind section
> .ARM.extab and .ARM.exidx are allocated from the VMALLOC space while
> .text section is from MODULES_VADDR space. It exceeds the +/-1GB
> relocation requirement of R_ARM_PREL31 hence triggers the error.
>
> The fix is to mark .ARM.extab and .ARM.exidx sections as executable so
> they can be allocated within .text section and always meet range
> requirement.

Not "within" .text, but "along with" or "in close proximity to".

>
> Co-developed-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

I think a Fixes tag might be appropriate?

>
> ---
>
>  arch/arm/kernel/module-plts.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-plts.=
c
> index 354ce16d83cb..5f5bf5e63bd6 100644
> --- a/arch/arm/kernel/module-plts.c
> +++ b/arch/arm/kernel/module-plts.c
> @@ -225,6 +225,18 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Sh=
dr *sechdrs,
>                         mod->arch.init.plt =3D s;
>                 else if (s->sh_type =3D=3D SHT_SYMTAB)
>                         syms =3D (Elf32_Sym *)s->sh_addr;
> +#if defined(CONFIG_ARM_UNWIND) && !defined(CONFIG_VMSPLIT_3G)
> +               else if (s->sh_type =3D=3D ELF_SECTION_UNWIND ||
> +                        (strncmp(".ARM.extab", secstrings + s->sh_name, =
10) =3D=3D 0)) {
> +                       /*
> +                        * To avoid the possible relocation out of range =
issue for
> +                        * R_ARM_PREL31, mark unwind section .ARM.extab a=
nd .ARM.exidx as
> +                        * executable so they will be allocated within .t=
ext section to meet
> +                        * +/-1GB range requirement of the R_ARM_PREL31 r=
elocation
> +                        */
> +                       s->sh_flags |=3D SHF_EXECINSTR;
> +               }
> +#endif
>         }
>
>         if (!mod->arch.core.plt || !mod->arch.init.plt) {
> --
> 2.43.7
>

