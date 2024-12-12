Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F83E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=; b=rgcpG6pk/yRgf6aKABjUT1tU+Z
	AovJ2Z3PyznXODWJWfAw1x7D195ZXfPxXoAqDRrzxg61l5hcoaHojPNrl73XTUiXaMwZ9rZD7yWLx
	zQo3FXzVhQu9Ie4lRn2TYvIJ4WjW6N7GjgRvuctOty8yePJ0V0ANfVRENp19xVVe5ZF1hQ0POHLVx
	sUt93wFW412H1GGHcGx6svBrgNvIzxuUXkCwu+f61ieVwnEj5z7FYgVAk7wcuhEvb6/LdSrMjrUuA
	vvYK6IiCGfY9Ry9YUCCU6t3uAsbgc5qaB9Xm6rJHshl41IwpSgJsGRGn/EG/phigPUPzyxXvxwu0s
	EBikViUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpbH-00000001m5F-1nn7;
	Thu, 12 Dec 2024 20:15:55 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpXZ-00000001lPm-17yo;
	Thu, 12 Dec 2024 20:12:06 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9ec267b879so86243366b.2;
        Thu, 12 Dec 2024 12:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734034324; x=1734639124; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=GSoBkCILe6IhSXn+dxyy4N1n8CG0WuLKYKCnMT/TNXzMxtg0CUJ4a2esF0BFOE+fOa
         dy0ZO3/tyha+ppVjlhFF3+VcwZgYB65bz0Ba7f34atHkU0tK9YasTZy/1cbcd1eHCxTi
         NxUcvS+Ns0fMx9Yr0+VzLOTKEol1+5h2YwrkqeObWufdE+BFMvGgKZ2tor2LcIoZtjeW
         0C0bz1DMv8OtFhRgBywHgMdTjePwTCtrmHr2ymdhJepfhnv+1/n67J/tLxGpzPIZwfWz
         JtMDjyT6BuwF85vVteeLaW3ycI97nsaVagWrncbwf09HmcWpxeLazYypGZ94aWmQ7Arm
         B/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734034324; x=1734639124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccEjllC2XhoGMyYqcFrLm7vpFIY0Cm+U6Sao32tSe/w=;
        b=aZ82um8WfmCYNsye3wj2tqdAriJNEJ/BVsTA3ZpNc5Zo4pV5ET3W/+3IVpla4s2HG0
         Z9VSQEAO7KnK55NzcYwNyTPHTgAvPRQhQw08D+GLo5BTWTAPKb3J10nY7pZXYfhpO+Wt
         NbUqh1uezGij7W9yzGnmaRoEp8GkxXVE8fvPYKieozZgGFPB01NbthtpoT9kfmqm1BA6
         y7qmIgwkqGVJQj1C5DFz7Km3hU+JgKe87JkpdSISgsVQHuWkhKL3PIIkFzgSzKaI/VOY
         rMaGWHTBoPP/gOWMt0zSFVo/CTFU1HUU8CKrRANwGZEVgm4DgEWxPD4tD+E9W8avrKkn
         37Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUhs/tDIWVXBmXNKogrkRXpHz4cQ6jyKnhw5t2BR3oo1fMmg+GxEZz8GA1y9Rj1rSjfa1Owsm3igSSpYKotTwA=@lists.infradead.org, AJvYcCVj7HGK2TG2JP7BJkY+Thxiz8L2v8cGaRTEbqd9rqPlBzg5OaFdB+k7H46ZRu4GUcDXSpyr5ADeHbxZKFhXAiey@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm3dR7Df3C8MbnpOuChz58Zk3eGCd4xuo3TRxpVe/oaq9YMM3Y
	fYll8Zmo3ZXIuR4zTgEECFT2J8V3JDUFjniLcEisOd0ref1iMWquj5UsPsuDS+rIj1uIweAOW9w
	KjNZhW2VvdNd/3foHFAkMkXNSgTE=
X-Gm-Gg: ASbGnct/0+ZOyrBJsD/x5T5WWtHBMVKiRLh2YkSJoDhjq0wzNqGksByxNikIeIgqHfG
	bY8sJMs1ka6RN1wOSfwzwdYbG/5212Q8pCB6rI7Ne
X-Google-Smtp-Source: AGHT+IF7qx5Z1/fQb+D9Nv/8CkFXoKyEEzLktdUfd+sTUwFi+n5jfhaKRcSctFjQDfGrQzxwJV8DWyyLGWYjEOqOZ4M=
X-Received: by 2002:a17:906:7304:b0:aa6:94c0:f755 with SMTP id
 a640c23a62f3a-aab778c1eaemr4266066b.1.1734034323514; Thu, 12 Dec 2024
 12:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com> <20241211232754.1583023-17-kaleshsingh@google.com>
In-Reply-To: <20241211232754.1583023-17-kaleshsingh@google.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 12 Dec 2024 12:11:51 -0800
Message-ID: <CAHbLzko2Z0-QReXo54H=sd1asXsPKEHf9N4Nmv0=Ry7SM=XX+g@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 16/16] mm: Respect mmap hint before THP
 alignment if allocation is possible
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
X-CRM114-CacheID: sfid-20241212_121205_305304_BAA19039 
X-CRM114-Status: GOOD (  26.97  )
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

On Wed, Dec 11, 2024 at 3:31=E2=80=AFPM Kalesh Singh <kaleshsingh@google.co=
m> wrote:
>
> Commit 249608ee4713 ("mm: respect mmap hint address when aligning for THP=
")
> fallsback to PAGE_SIZE alignment instead of THP alignment
> for anonymous mapping as long as a hint address is provided by the user
> -- even if we weren't able to allocate the unmapped area at the hint
> address in the end.
>
> This was done to address the immediate regression in anonymous mappings
> where the hint address were being ignored in some cases; due to commit
> efa7df3e3bb5 ("mm: align larger anonymous mappings on THP boundaries").
>
> It was later pointed out that this issue also existed for file-backed
> mappings from file systems that use thp_get_unmapped_area() for their
> .get_unmapped_area() file operation.
>
> The same fix was not applied for file-backed mappings since it would
> mean any mmap requests that provide a hint address would be only
> PAGE_SIZE-aligned regardless of whether allocation was successful at
> the hint address or not.
>
> Instead, use arch_mmap_hint() to first attempt allocation at the hint
> address and fallback to THP alignment if there isn't sufficient VA space
> to satisfy the allocation at the hint address.
>
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Yang Shi <shy828301@gmail.com>

> ---
>  mm/huge_memory.c | 17 ++++++++++-------
>  mm/mmap.c        |  1 -
>  2 files changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 2da5520bfe24..426761a30aff 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1097,6 +1097,16 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         loff_t off_align =3D round_up(off, size);
>         unsigned long len_pad, ret, off_sub;
>
> +       /*
> +        * If allocation at the address hint succeeds; respect the hint a=
nd
> +        * don't try to align to THP boundary;
> +        *
> +        * Or if an the requested extent is invalid return the error imme=
diately.
> +        */
> +       addr =3D arch_mmap_hint(filp, addr, len, off, flags);
> +       if (addr)
> +               return addr;
> +
>         if (!IS_ENABLED(CONFIG_64BIT) || in_compat_syscall())
>                 return 0;
>
> @@ -1117,13 +1127,6 @@ static unsigned long __thp_get_unmapped_area(struc=
t file *filp,
>         if (IS_ERR_VALUE(ret))
>                 return 0;
>
> -       /*
> -        * Do not try to align to THP boundary if allocation at the addre=
ss
> -        * hint succeeds.
> -        */
> -       if (ret =3D=3D addr)
> -               return addr;
> -
>         off_sub =3D (off - ret) & (size - 1);
>
>         if (test_bit(MMF_TOPDOWN, &current->mm->flags) && !off_sub)
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 76dd6acdf051..3286fdff26f2 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -814,7 +814,6 @@ __get_unmapped_area(struct file *file, unsigned long =
addr, unsigned long len,
>         if (get_area) {
>                 addr =3D get_area(file, addr, len, pgoff, flags);
>         } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !file
> -                  && !addr /* no hint */
>                    && IS_ALIGNED(len, PMD_SIZE)) {
>                 /* Ensures that larger anonymous mappings are THP aligned=
. */
>                 addr =3D thp_get_unmapped_area_vmflags(file, addr, len,
> --
> 2.47.0.338.g60cca15819-goog
>
>

