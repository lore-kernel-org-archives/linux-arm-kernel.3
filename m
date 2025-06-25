Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D793DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fj0STZsYtbu1kQ3gPY9FIOxyqjDAl+wTNEIVZVCZURk=; b=rrH4bW+JhLZXHsubeUtM1Tjzoy
	c7xjssHM4Wic3MRbXD7MdxnYUPzr6pDxqdnp4DZcqj/yHJvty1iowZN7XUSY/Y5cKpTCRaH+z+8td
	G5bqQp4eVZbl7g8uv1KBdBwz1l6zg3m9QnALBxmKFGdV5ufz5py5HkGAwjxDmV0CiJQkM/wvJMOJ/
	JPam3E6jC9XutrKiR0XVMTJjIUafix0N0/6iyfwtitqC9SXJf6givTWfG3fMqa0QyJDagswjf7uHM
	KLzca6P1iEqc6qrzH/HakIqGnBIl55fDspSAP5Xfed1FYZvM38wnnk7d5nDsS87h2+uiDhjDjeYZH
	+rU5Dzpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUR0d-00000008wk5-1JPh;
	Wed, 25 Jun 2025 14:21:55 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNoy-00000008OYt-1dVy;
	Wed, 25 Jun 2025 10:57:41 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso1913269137.3;
        Wed, 25 Jun 2025 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750849059; x=1751453859; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fj0STZsYtbu1kQ3gPY9FIOxyqjDAl+wTNEIVZVCZURk=;
        b=hIHOtk7gi779r41tjCaKERWaJ6HNj6I7SMwITiie38I9Wc4etRoYfhVjVqlj4c/yzc
         fXdOWabur2umMvSpBM3WYPr0cHpavqr6+TNRb8l8WBtCOXWpPXuBJEOoiX298bSn93HL
         q0978tBghH9KfS33OsV/HhHAzLBiyCKXJYOBUWbMWx9oSpKVH0EkLxzOx5VAnaHOmszZ
         ni3HnyvosUdxqwEUi/N7gvo6//zfuBDHkcj7zw3P4AN+rbU4C5ThXkRpnCexV0YNc2Tz
         yok0xPxK87kpyh8m7Nepphmekj7PlfCO6DkfDKZrRpaXns8DLln+2NY4mXYI1XPRVPR1
         4c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849059; x=1751453859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fj0STZsYtbu1kQ3gPY9FIOxyqjDAl+wTNEIVZVCZURk=;
        b=KIXuS5mdfyqFaWzCQsDNPsamzuDd848ZAU+6OVGtG9Ryr1CQSMtOEn8HWsKzK8HoXA
         jo8O2LLHM8aMUDbH1X/KSSJmrCDJm3gk9Kxlk3aXu6D3IvhiEQIWQ7Y5itoacAC9xUfM
         zAi4I3tTSFVytcqyQDT22xQgs8i7QRkCpDmG60oaZK9E33RqhDbuAABOdWYTHxZTDeL7
         JynpQgpdu9Cg2ejogtwyJ+vfc8c1xurUVW+IoaREVdHjnfSDamQ+s3OsJ998aib+y0He
         MMHA8orxu4ZhjpfnkPt3+yaGKUanXM9CCQ68U5z8PefkZwocXXtP638QR6GRSZ1DjNKv
         IlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoX4dFGkdTSb6zudOUtgg1R3+4ueSUktBElXqTRnEYzFcMVDHie7Li13sgWes4T/q7HMVo59SNtXsiwyI68b9Q@lists.infradead.org, AJvYcCX+QQPVDrMAuVS2SfGsJ4BSgG7XL+Ggo8GawDpOLvDOstDZJbhQfTTvyVNbIm1OZh4yMaYDNuTj2QwwTAA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVFlYquxJl0uH4TsZZD/NtxNEMjdqblpqO9sEMcJW72Qg7LqAG
	1v7imB7M0cG8WH/u75TZXX5EJepT4b4P8xrORrjb7h9lOVD0H+DW0LBHl8gd1nYPk2gJP3XCtaH
	IC4Ji2huqiLIX7fnLBumUb0CZ8nY9U4s=
X-Gm-Gg: ASbGncuy3PVVIPMFTx6VdIt5lf88BX/LJyNNuy7LVYRzdHxbDFYA+WcQ5m8WiUYltvb
	Y1coe9UdlYXffi+Y9y1ejeirgEoOvrPYul+DcWcxxP42eb5aVlsFGJRsR1SOdrr1lBDkMrXNaJ6
	PYddmr6xVvtEYP026KuWsCprJGNqGkV/mv9PWY8iwAZx4=
X-Google-Smtp-Source: AGHT+IHxYZQQdKiWNAVrM7n23h4q54LeHy4Ec4zMJQOJpG9fbtf7HmW4k7rR6lcFnPnH4b5aUcO70ihcOUZ137GEwrE=
X-Received: by 2002:a05:6102:919:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4ecc6a6eea2mr1102553137.5.1750849059136; Wed, 25 Jun 2025
 03:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
In-Reply-To: <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:57:27 +1200
X-Gm-Features: Ac12FXzTXMGVnpcik-Ihc93WyWfYdygYrAzrCh0xDLBYAYx4TBPj8MQP9kn6COg
Message-ID: <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_035740_443120_27F857DE 
X-CRM114-Status: GOOD (  10.43  )
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

> >
> > Note that I don't quite understand why we have to batch the whole thing
> > or fallback to
> > individual pages. Why can't we perform other batches that span only some
> > PTEs? What's special
> > about 1 PTE vs. 2 PTEs vs. all PTEs?
>
> That's a good point about the "all-or-nothing" batching logic ;)
>
> It seems the "all-or-nothing" approach is specific to the lazyfree use
> case, which needs to unmap the entire folio for reclamation. If that's
> not possible, it falls back to the single-page slow path.

Other cases advance the PTE themselves, while try_to_unmap_one() relies
on page_vma_mapped_walk() to advance the PTE. Unless we want to manually
modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), which
to me seems like a violation of layers. :-)

Thanks
Barry

