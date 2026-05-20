Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DABACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVK9lCG8t/9sfDORk8nI6RMdbwpsR4qFe6/O61rN3aw=; b=FILATURTX0//J1WwUlJOTZJaFy
	S8Qy3eAN0ql5QUfLdYjrWN4rpyuqHjhRN+H/Mffo948BQC2aNoGIZhrDiUFemQDAf6rz6dJiqYGJY
	WSkOBHIUxk52VKgXADKvLnS6tMD2XwzE9cuHjKgqF0xMjLTmhJhYmUzQTKcJr8nyKT/cQFLKB2voq
	2+OhVEIG91pI6n/fZPC7NhtOTSll/8acnDa7M1MsLTr/89sqQLlNbwWln1PP28V5dr+U8Yn26z4HE
	JLq8hzigDSHK1dwUCBvdeadSiL4a+VxM7j0c17cSYsstB2Kq8o6inJLQnco0ZGe3fYNXG7OPpcDs2
	pX12tujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcys-000000044s1-0iFc;
	Wed, 20 May 2026 09:12:46 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPcyp-000000044rT-3JU2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:12:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5a8738c178dso4394663e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268362; x=1779873162; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XVK9lCG8t/9sfDORk8nI6RMdbwpsR4qFe6/O61rN3aw=;
        b=N7JFIPky1t7iLHRtQ7t+KQt+HPmY6whNxdq+c4OPXzy51Sr3GQgB5Eryj30MCe5g1W
         85UA90Knl5kjbN/NpLgYK1wClIzljmt4auVPyVC5BbEcK8l5S6XbY5tzhTZfj4IfFemn
         P23eDnwj33hF6EQnW+iY3LavZfj8LBG2HRbZtaP1JQbOyNyCAjRaAVr6hLCaBa6P0XMz
         O/PC9cVSMeumPFKcJzYkC+RHxHJ4b/jm2KHNX57zIBJn2XCuKkv8llBdSdhtnPaYDwpB
         8GVRbGfyWdvtzvct4VlWxKogBiU4D6ZonY+kG0Xqp0IEIUERCFfwEp87QJAP268CZnwV
         6tog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268362; x=1779873162;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XVK9lCG8t/9sfDORk8nI6RMdbwpsR4qFe6/O61rN3aw=;
        b=mdb0PmgVRhhvW2so0bTFxZM/v/jNqH3fAR6IPmzcNrSiII3+KXIy9muVLLbKAYX7Nu
         bxzVxAU1JrnrudoJnQ3gYIj1kZKIkj7WVYGc9WVxImLZ5589vS8XQGzGMF4pkp0/ll2X
         ZT1yQQCuyE/OlRjhcKUIBivqyUtpFfslNNjsEpAnkUUmF72IknjJCECPk6CLX67nBHw7
         FwGCViMnz12Sbxy9HDT8dkJ4YHI2Dho/YA/ZETTBnrAE+rYO64WqwtgbmXKn4mdQ48dx
         cayEfBdkyDb+kSmu0xX3D1hHFX9ITIOZXcr0JLrsSKoZZk8sxGwxmIPYeTbPGivtzn5/
         MTDg==
X-Forwarded-Encrypted: i=1; AFNElJ8gb2kBEATv0C6rLyZGkdaaBwwxTpL7WNrsXxi6e3AHh57Mfqma6bzOq7dak5ym2w7Zr2rVHZdC2PgE86eYGb5X@lists.infradead.org
X-Gm-Message-State: AOJu0YyOQwyaqqFVvJs80Uxac5JiPfRT5H4vSAyxE00QMKdvxdQRpJ7t
	vZOmrxaDV3BIJZogQB1FOUG17zCFlrq0rCoyK7xzlyQ3cOVRpdtfiVJ+
X-Gm-Gg: Acq92OFgOKapcua2juvJ4Ehu3FSDsbNYIu1cThTmtbnqCO/9kKcjpw56KpWGip/E0ny
	ixYhlmqmtJouluD/Qojn38LKoEbFO7a1AaSxMtfwt6UP1g2apr1XO66hLoZbHoU0TChoq1QZsUH
	GEe/fB6JjI2Kg3rj6XGkX0b64AyDLXJXNu3TxVw1tvsfZuLJ6tDlFs5aNwQz9TQU7o5mN75iDQd
	P2aKW4qkoAStTu7wE+7aSlRmX/dF5HQCfVAuPsPQvPVJRkCNetMmeZgxbbzOceCG6mxzmpB6fNP
	Qi+uTPaEndwbYlqAU7aL38/RU4Yk+YzFLEbPLLDh2NFuLLyu2BuQQGwArNSxH/naCmGPrpavNgE
	iWYaA8lRFnZk8YMwe3lUDHAjjBF5lyLvdmDrwA4AoE/79DDIeEMahIcH8FKsXUAkqaAjST3SkuG
	+cLF+gEwUAIPizFWl4MUIsW5uESq93MForIDlkVCmO+4ojM+KZkZrXlA==
X-Received: by 2002:a05:6512:6c8:b0:5a8:72e2:dba8 with SMTP id 2adb3069b0e04-5aa0e6191e4mr7180894e87.3.1779268361357;
        Wed, 20 May 2026 02:12:41 -0700 (PDT)
Received: from pc636 (host-90-233-198-171.mobileonline.telia.com. [90.233.198.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7c2sm4711004e87.32.2026.05.20.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:12:40 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 20 May 2026 11:12:37 +0200
To: Barry Song <baohua@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org,
	Xueyuan.chen21@gmail.com, dev.jain@arm.com, rppt@kernel.org,
	david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
	ajd@linux.ibm.com, linux-kernel@vger.kernel.org,
	Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v2 6/7] mm/vmalloc: align vm_area so vmap() can batch
 mappings
Message-ID: <ag17BYxJVRUu8JhV@pc636>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-7-jiangwen6@xiaomi.com>
 <ag1jhrWivbasi8Jq@milan>
 <CAGsJ_4zjQDOXToau0xoWOTnoP9kODxRdzSeNX6n_b3wxguC4mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zjQDOXToau0xoWOTnoP9kODxRdzSeNX6n_b3wxguC4mw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021243_867211_B2CB79E3 
X-CRM114-Status: GOOD (  31.51  )
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

On Wed, May 20, 2026 at 03:55:02PM +0800, Barry Song wrote:
> On Wed, May 20, 2026 at 3:37 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> >
> > On Thu, May 14, 2026 at 05:41:07PM +0800, Wen Jiang wrote:
> > > From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> > >
> > > Try to align the vmap virtual address to PMD_SHIFT or a
> > > larger PTE mapping size hinted by the architecture, so
> > > contiguous pages can be batch-mapped when setting PMD or
> > > PTE entries.
> > >
> > > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > > Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> > > Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > > ---
> > >  mm/vmalloc.c | 31 ++++++++++++++++++++++++++++++-
> > >  1 file changed, 30 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > > index c30a7673e..b3389c8f1 100644
> > > --- a/mm/vmalloc.c
> > > +++ b/mm/vmalloc.c
> > > @@ -3591,6 +3591,35 @@ static int __vmap_huge(unsigned long addr, unsigned long end,
> > >       return err;
> > >  }
> > >
> > > +static struct vm_struct *get_aligned_vm_area(unsigned long size, unsigned long flags)
> > > +{
> > > +     unsigned int shift = (size >= PMD_SIZE) ? PMD_SHIFT :
> > > +                             arch_vmap_pte_supported_shift(size);
> > > +     struct vm_struct *vm_area = NULL;
> > > +
> > > +     /*
> > > +      * Try to allocate an aligned vm_area so contiguous pages can be
> > > +      * mapped in batches.
> > > +      */
> > > +     while (1) {
> > > +             unsigned long align = 1UL << shift;
> > > +
> > > +             vm_area = __get_vm_area_node(size, align, PAGE_SHIFT, flags,
> > > +                             VMALLOC_START, VMALLOC_END,
> > > +                             NUMA_NO_NODE, GFP_KERNEL,
> > > +                             __builtin_return_address(0));
> > > +             if (vm_area || shift <= PAGE_SHIFT)
> > > +                     goto out;
> > > +             if (shift == PMD_SHIFT)
> > > +                     shift = arch_vmap_pte_supported_shift(size);
> > > +             else if (shift > PAGE_SHIFT)
> > > +                     shift = PAGE_SHIFT;
> > > +     }
> > > +
> > > +out:
> > > +     return vm_area;
> > > +}
> > > +
> > IMO, we should get rid of this while(1) loop. It looks like you need to
> > handle just few cases. 3?
> 
Hello, Barry!

> 
> I don’t quite understand what you mean — are you suggesting
> calling __get_vm_area_node() three times? We try 2MB first,
> then 64KB, and finally 4KB. If 2MB succeeds, there is no
> reason to try 64KB. Likewise, if 64KB succeeds, there is no
> need to fall back to 4KB.
> 
I mean either to make three cases kind of open-coded:

...
if (size >= PMD_SIZE)
  alloc_vm_area_with_shift(PMD_SHIFT);
  if (vm_area)
    return vm_area;

shift = get_supported_shift(size)
if (shift > PAGE_SHIFT)
  alloc_vm_area_with_shift(shift);
    if (vm_area)
      return vm_area;

return alloc_vm_area_with_shift(PAGE_SHIFT)
...

or put everything into the: for (i = 0; i < 3; i++) - that way it will
finish in any case and for user it is obvious that we handle max 3 scenario.

> >
> >
> > shift min value is PAGE_SHIFT, could you please clarify when it can be less?
> 
> I guess this should be changed to "==" ?
> 
I assume shift can not be less than PAGE_SHIFT :)

--
Uladzislau Rezki

