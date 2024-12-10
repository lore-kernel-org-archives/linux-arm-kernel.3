Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FEDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 03:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=; b=Se8k84dafU3OBzHG17a0dqSKT5
	IOmGGOUmbrEWqQKQaKmQoFMP+ImpLl/+qTc+ybHNpHIYWR79QUUktPUVHLXS/EI74sb47cEZIcif3
	VPsinfLsUYW+1CEQwVMgle3aKvdMxMIeWCYR7zX3XvNTR9FgCQEJE52KehsN2oShIDRVu/s0ki4hk
	h+UFk3wR7V8VuMk5bK6s9WErdjyODl69rnnLCuT77dd8YyF6EX17tFrpLm87zZUaTXrzFfGHbIi3i
	nfm55n9ZFbaxRNS4tLVW8fPvXt2PrL7MOWaiARS4sTtcoLJUYWl+Qyn5m10azC+7/d7keFFWanP7Y
	tcbSHmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqv9-0000000A6Yf-1xuj;
	Tue, 10 Dec 2024 03:28:23 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqu6-0000000A6O0-1BW5;
	Tue, 10 Dec 2024 03:27:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d3d14336f0so5584593a12.3;
        Mon, 09 Dec 2024 19:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733801236; x=1734406036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=QiBoNjmmXB+8Wgaet8gybyKTeGDem1sSdsrt7S92O8XaRnR6rSNEQJgGREyT3lDEXi
         xdxFI6YmeloZEZifSuSs0b15GGMBwdvnrYjbUDGXV1iVro7MO3m5HYR5xnZMV/Wm6toa
         om949/tdSJcb2NA2+5m+FDxcpjhY7CrOuWrSNeezQZv1AQ9jvuzVSpfrKV7Q4H/YiidX
         5aOImUJ7hasFyUE+oLpI3y/857MWM+tDAnvOVHFUhEyx3gmMBtonUZqL2ts0Vwg/ymVG
         hkGCRPsei8TmiTl8KmzP1i5BtkL9MHjNi6ul2oRt8Op4idX/iZeGV7255RCCio9AUXxV
         +zDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801236; x=1734406036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zw8KjUeVLCoeUttHvlAE11LYFS9kka7RYPFB87xdCOo=;
        b=GQCR2PW3mDxQ24qtKSXIf/0e/uzx9bvmu+FdzCHdryS2DSoylpDXsfOX4kzlvib1zN
         lVKI9vGWq2sV2nKDUNQUBNBlEokM18gT9BkHEZ48OQhTLnxlXaa5pLqtNIMAq/hiEN19
         mAWE0q8Eg7E7cJ3zQONkKSFDfAPT4ejmjWGOq/02TtDoVxefz7a1AKoWXLvskeZW/3Us
         pcKgdOOY45ZV+e+qXDHLXHSgl2ZoVbL12CtIXYyHh582iINsvEvxlwUbQvuwnm1yQeT1
         64Zptw9f0OpVdGQ18mhtGGZMUgogo36UpV7qXZjsBfmTNkxBPkAFnSoQHeVvBxUygyQu
         sH+g==
X-Forwarded-Encrypted: i=1; AJvYcCU4eeUmn+k/ILWvRmWZv0j3BgZHfpamG51L1lmoo4UcaDVfyS92trlNm79JkBSEwtEH5g1EbGV+UGd/c+M7UN0=@lists.infradead.org, AJvYcCUYacMT3je/nq2HFL0nfak3CStBP6Us/8cbhMjAhniWBTF+1DdGth65reAJxqrnEWeKj/7hZRnqiEHKCVuDa30C@lists.infradead.org
X-Gm-Message-State: AOJu0YzQxXonWJJMhfVIDYPgFPvenGqrk/eZDPwl7eSesMij7j9XP1AD
	524KimA7/DhywCXKY9d61H+guK4GZUwDXrHmLajEDSaWnUAPx0SSICQfMnXe66Dyw+XxfWKaMat
	Sdq0Jc1KoXEbtjBeIVrZbWo1vS6o=
X-Gm-Gg: ASbGncvKEtixW7Tf1VCAdn1bfNbV0FygS86OXScZTbWDw8aehLHL7CDbD/PPCm4RuZZ
	b/yq5ZE35ucmMpdEjSmwviR04tYSkaLLRJNxiiQ==
X-Google-Smtp-Source: AGHT+IHf2Fi/42HQsEiQo6WzNdGmDcvEV4I1TbpQP4oAJiq1u3pQn+R3NnSbM/I4gmKvXuY9eOlF5eGp3h/ZPgrcEvo=
X-Received: by 2002:a05:6402:278f:b0:5d0:fc80:c4d1 with SMTP id
 4fb4d7f45d1cf-5d41852f140mr3377986a12.14.1733801235781; Mon, 09 Dec 2024
 19:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com> <20241210024119.2488608-2-kaleshsingh@google.com>
In-Reply-To: <20241210024119.2488608-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Mon, 9 Dec 2024 19:27:04 -0800
Message-ID: <CAHbLzkpCRGF+-WXkHVEutkEGHSWydmpb1CwkvHZRTH-f773J-w@mail.gmail.com>
Subject: Re: [PATCH mm-unstable 01/17] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_192718_326206_52F06EBD 
X-CRM114-Status: GOOD (  17.34  )
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

On Mon, Dec 9, 2024 at 6:41=E2=80=AFPM Kalesh Singh <kaleshsingh@google.com=
> wrote:
>
> Consolidate the hint searches from both direcitons (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>  include/linux/sched/mm.h |  4 ++++
>  mm/mmap.c                | 45 ++++++++++++++++++++++++----------------
>  2 files changed, 31 insertions(+), 18 deletions(-)
>
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 928a626725e6..edeec19d1708 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm=
_struct *mm,
>                                            unsigned long flags,
>                                            vm_flags_t vm_flags);
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags);
> +
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>                           unsigned long len, unsigned long pgoff,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index df9154b15ef9..e97eb8bf4889 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,27 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       if (!addr)
> +               return 0;
> +
> +       addr =3D PAGE_ALIGN(addr);
> +       vma =3D find_vma_prev(mm, addr, &prev);
> +       if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &&
> +           (!vma || addr + len <=3D vm_start_gap(vma)) &&
> +           (!prev || addr >=3D vm_end_gap(prev)))
> +               return addr;
> +
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,7 +658,6 @@ generic_get_unmapped_area(struct file *filp, unsigned=
 long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> @@ -647,14 +667,9 @@ generic_get_unmapped_area(struct file *filp, unsigne=
d long addr,
>         if (flags & MAP_FIXED)
>                 return addr;

It seems you also can move the MAP_FIXED case into generic_mmap_hint(), rig=
ht?

>
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                   (!vma || addr + len <=3D vm_start_gap(vma)) &&
> -                   (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
> @@ -685,7 +700,6 @@ generic_get_unmapped_area_topdown(struct file *filp, =
unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> @@ -698,14 +712,9 @@ generic_get_unmapped_area_topdown(struct file *filp,=
 unsigned long addr,
>                 return addr;
>
>         /* requesting a specific address */
> -       if (addr) {
> -               addr =3D PAGE_ALIGN(addr);
> -               vma =3D find_vma_prev(mm, addr, &prev);
> -               if (mmap_end - len >=3D addr && addr >=3D mmap_min_addr &=
&
> -                               (!vma || addr + len <=3D vm_start_gap(vma=
)) &&
> -                               (!prev || addr >=3D vm_end_gap(prev)))
> -                       return addr;
> -       }
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
> +               return addr;
>
>         info.flags =3D VM_UNMAPPED_AREA_TOPDOWN;
>         info.length =3D len;
> --
> 2.47.0.338.g60cca15819-goog
>
>

