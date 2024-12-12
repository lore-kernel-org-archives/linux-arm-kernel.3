Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DECE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=; b=JyKgpvFu95awApkCkiW50Q3+vj
	pFSa5RZAWJPApEKpd7+INaNrneGWPl++S7nMAACbT95XS2FW74l6n0DOoGkAaBUY0rlxL3hnjXZP8
	PVwOSnuCgvPv35CCiklquX6WCQ0d4pIzTHxzIQVJI2SFdPt7ktH3M7+hDteeP4yDhWJ19LSFhNMze
	KZ2ZLrhtFeeiUyiG+C5BTRbvXy60rUz0/ANswsqKwyvgWEbYITM8T5jZnFR2DZDVftxlMDXFD67Nv
	eIjxfqubiGUw6aQcZTcS+2UaWsRo/WjepP3TNwQ9cd/UfUbv2rgUGUZ/eoPwwicBeMwocV3WNJ5Bm
	6iq5e82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpaE-00000001lu6-0Q20;
	Thu, 12 Dec 2024 20:14:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpUS-00000001kmB-2Q0q;
	Thu, 12 Dec 2024 20:08:53 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa66ead88b3so185780966b.0;
        Thu, 12 Dec 2024 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034127; x=1734638927; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=Stz6Acp68seXJZldlsgODOmquadyq6yyAhwanUDouqcR5kmytSyctegwsk4iKjCUFg
         Rp9vgNRPCq058QQAeClu/A7eTN8IyOa+MurnP3KHfItykSNQJlUEA+nuYzO1IvWTdc7X
         iesGOrLGx4rtkZWJNowebhDR3OLrRke5ste5sl8AYnkDdHRVYwP+pCrHxtDr3QwCUMF4
         Nzw/LLiWB13BVL5raJwZY6jxHG1rmtDu/Ul61b8r1opMM/M2t34JXpUfSYzSCCIYbhWz
         WWXRrN7vFK4Jn2bbyvW2kJeUJX0JMftAw+8zfCtCfmCwxwTUDKheFGMjrhFcfsvlaM0d
         xHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034127; x=1734638927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zN4Ym/UunmzCYsNSflmoKoSUjG0g5+VHwXB/fYxaNqo=;
        b=qwykOclAt/dv3h2ZpNhEfRzyF/sstBgUXkwwKtWOQ1sm/aTDvZ55LJ/dr78+1YVfAD
         XaHo//X4q31KEnE4LSxkAMUni8qBmaMOsLSauYtOctvG7RIrEEsg+7eOtRnOrry2saUs
         Y8Quch2YqkDY75CIpvgG1oLlLjHDvvBkpxFvsm938vl8/3nsW3qpGzd7/f0Sh3ifrbvf
         db9qoMn+UB2rH0tAoos01HPcS9umAFhMriI4Bn7bFl77WmOmkYCVBWq3LblIZ6hN6Sjk
         pReZ7hkLCOyylPYifL3PLfIJNxqP7SS9poLug5npsYjKF0suY+B4PRbJqZEVETisCud4
         Gagg==
X-Forwarded-Encrypted: i=1; AJvYcCUzJdRF6t2MwGaigLett9lJNbySfwzvbvxCqnmPGp9x0ETDZO1Gq41kY/aCg/yytCNJ3mowcjiV4M7wUtLT0/k=@lists.infradead.org, AJvYcCWKnTxT56IX6Bn2Sw9EN9XkEPOiAALZ9tusSYJTOCugA3ZD0YlM+8ldTp9DCozUWoF0J4eYNhXRIeQgJoNmWIdY@lists.infradead.org
X-Gm-Message-State: AOJu0Yym7KLB3LV7wokXusRke6Vzbt25KihPWOdOpplIZt3JHDOm6ruG
	dho0BOZWD11COeaVJLPjugcOhqviC04oPgjCraudO+xep4nwFQIiZtwsy6QbMXbGchPnbWIy/DW
	t0yNX1BX6i17SPeO/k5qxHujhEN4=
X-Gm-Gg: ASbGnctIGiMPLf/ADfMtGcPS1FQA1AsyisD0VdgvOe5AVs/Xs9ujVPlu1j7gowaIBk6
	7sshcFr0edNA3fM38ReD2pRG/e2xVnKARgvFN+NRe
X-Google-Smtp-Source: AGHT+IFBjZrg88OqeWBDO1jTyqFkrRhdvj/sM97FkFYUxtUn8pc+yCVr/hdiAj5KO+SOUnoKUqWUM88SK7LqY4tEHG8=
X-Received: by 2002:a17:907:3e9f:b0:aa6:64be:ff2d with SMTP id
 a640c23a62f3a-aab778c168emr3388966b.4.1734034126714; Thu, 12 Dec 2024
 12:08:46 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-2-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-2-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:08:35 -0800
Message-ID: <CAHbLzkovqMsjti1g_G4dFj2mb4hneBPtR2eGTxTZmC717455-A@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
To: Kalesh Singh <kaleshsingh@google.com>
Cc: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com, 
	linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
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
X-CRM114-CacheID: sfid-20241212_120852_616700_A3698FAA 
X-CRM114-Status: GOOD (  24.01  )
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

On Wed, Dec 11, 2024 at 3:28=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Consolidate the hint searches from both directions (topdown and
> bottomup) into generic_mmap_hint().
>
> No functional change is introduced.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> ---
>
> Changes in v2:
>   - MAP_FIXED case is also handled in arch_mmap_hint() since this is just=
 a
>     special case of the hint addr being "enforced", per Yang Shi.
>   - Consolidate error handling in arch_mmap_hint().

Reviewed-by: Yang Shi <shy828301@gmail.com>

>
>  include/linux/sched/mm.h |  4 +++
>  mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
>  2 files changed, 50 insertions(+), 30 deletions(-)
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
> index df9154b15ef9..382b4eac5406 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_ar=
ea_info *info)
>         return addr;
>  }
>
> +/*
> + * Look up unmapped area at the requested hint addr
> + *
> + * NOTE: MAP_FIXED is also handled here since it's a special case of
> + * enforcing the hint address.
> + *
> + * Returns:
> + *    ERR_VALUE: If the requested mapping is not valid
> + *    0: If there isn't a sufficiently large hole at the hint addr.
> + *    addr: If sufficient VA space is available at the hint address;
> + *          or MAP_FIXED was specified.
> + */
> +unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
> +                               unsigned long len, unsigned long pgoff,
> +                               unsigned long flags)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       struct vm_area_struct *vma, *prev;
> +       const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
> +
> +       /* requested length too big for entire address space */
> +       if (len > mmap_end - mmap_min_addr)
> +               return -ENOMEM;
> +
> +       if (flags & MAP_FIXED)
> +               return addr;
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
> +       /* Fallback to VA space search */
> +       return 0;
> +}
> +
>  /* Get an address range which is currently unmapped.
>   * For shmat() with addr=3D0.
>   *
> @@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsign=
ed long addr,
>                           unsigned long flags, vm_flags_t vm_flags)
>  {
>         struct mm_struct *mm =3D current->mm;
> -       struct vm_area_struct *vma, *prev;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> +       addr =3D generic_mmap_hint(filp, addr, len, pgoff, flags);
> +       if (addr)
>                 return addr;
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
> -
>         info.length =3D len;
>         info.low_limit =3D mm->mmap_base;
>         info.high_limit =3D mmap_end;
> @@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp=
, unsigned long addr,
>                                   unsigned long len, unsigned long pgoff,
>                                   unsigned long flags, vm_flags_t vm_flag=
s)
>  {
> -       struct vm_area_struct *vma, *prev;
>         struct mm_struct *mm =3D current->mm;
>         struct vm_unmapped_area_info info =3D {};
>         const unsigned long mmap_end =3D arch_get_mmap_end(addr, len, fla=
gs);
>
> -       /* requested length too big for entire address space */
> -       if (len > mmap_end - mmap_min_addr)
> -               return -ENOMEM;
> -
> -       if (flags & MAP_FIXED)
> -               return addr;
> -
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

