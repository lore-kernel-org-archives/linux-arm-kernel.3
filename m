Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E0C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 22:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4NjeapwgPl7o9j68s8R5yPMQayON7gZ7uf9DS/utGE=; b=wGx2qGgu5lMl4WmuWe/c5YH7iV
	FtMQuuExflko9z00ZXybMXyZFTp4rsag5dXfLlVp6Q1d4/7BTxWhBqv0H5Sbcoyot5IAOIarMEZDm
	ToO1wba+iBvGzNj/5/vuY00kcgZjSRJ1w2WJHPHH6ETYgRvDDC3vzdWa7XRnow3fuGM6HfL2ms/Gg
	Kzz6XTTMFWHJNkI1e95GXt0VgVSF90t1uE9WL1kzpr+8uVizp48obtyNxzc5idZjZMm/oOoOK/Tbl
	ER+0o1qrhLkxQvqC+iW4+mAs9hyJLVQpDHUwLt0rPZyo1mybbuNVtb1lhNdozBcrQw66k6jph1BND
	8SM1pd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVHoz-0000000Fx21-2sqx;
	Fri, 27 Jun 2025 22:45:25 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVHmf-0000000FwXE-3XHm;
	Fri, 27 Jun 2025 22:43:02 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-51eb1a714bfso1591994e0c.3;
        Fri, 27 Jun 2025 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751064180; x=1751668980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4NjeapwgPl7o9j68s8R5yPMQayON7gZ7uf9DS/utGE=;
        b=Ef/ZPwIE2y23FoKTAlfJOVDTWubMLXXas7jFoWYJjO/Sq9ebStokgbhCNCyO/oh6Cn
         /MCbe4i7nV4Pu0z9qx0Cm3UoFARd98WcaCbwNQ5jGlpdQwJe6SIwss2xQw07J+IYtXPq
         tpaAoDXWRWSideSORjJQ4OQqi63+IHdawBuir9fGe2/NBDmlotu1ELudBO0nPQiiqcCu
         LGlozJx8WpjYLRSDGOObx4Sl3E1BrtRsgQlC+elnhXmIcoIG7THCEIRFG1yrUBSHP7ZV
         UckQctmPTkIn+NcXRILPQSgDeVX6G/vIOQ5EaAXPgWDV3YD8MYJ4aFsCBLvlA+rGepHZ
         0b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751064180; x=1751668980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4NjeapwgPl7o9j68s8R5yPMQayON7gZ7uf9DS/utGE=;
        b=HLqg47r5DXgfsnADYKcgqWqTOJjDsgn7zCq0cUl57OEq6MVmZ/Y6A3vWWB/VZZfSB5
         10l2HTgkoFN42UdOzIJTfwfztnDaM5kFtIkEw2XyJmyKRM/TbNiCY1fy1jvXB+RNlwU3
         YQ+8De9GTw6VLKE5lDMHh1vl+xxY+rI3wEesp82TES0TNtEc4mQ0u5wI3sUvWGtLfcN4
         8y24TOyJO0W8ouR8k2VjHbK34hTsuXGrCLw4kVEqeAqqAVY0TBCtWYwCR5AYScF4YllE
         GKFX0jAyeLTQODuZZ92aN9uwMEmAb2ZeyYC7scWCci3D2KvaNDpD15TfZd4tyBQsG4In
         pYSA==
X-Forwarded-Encrypted: i=1; AJvYcCUfthxdCIRPT06p6slIKqQvut4rgYPKhkPMbq7n1GTiPIB+b2bJ1SQG7rTJ0OOdL2HMhFu62c7jyFvfWE5GpgK7@lists.infradead.org, AJvYcCUxve+pPCARy2soXmjNEhEBFXvfbTy5WUS7FufZIcG08HxVCVQYR6OqPZRY3zzauuFDlbVPOdHIv59HReY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyT4dNU6s95gRhcUbxbnh+DpZLaq2Ef7xM+2Sm6vf0vooGbJF2R
	/SCltiE/s+zOmlyKqpRSX8MFbQFSZus6k6CZqVWa7fCKHsgYw89DGUPADYHrmuVroGZmvTQEgQr
	vThUl70kjTaEOf76msfmviMENgg0JmR0=
X-Gm-Gg: ASbGncsQXEeSviIdLOqFJ21O4DIFot02rCWnl0MNbOSzi/zyAlwhz8v8GZFMWt7+FZ+
	YkqKvgpk4ixj6e0gN+ksbVNqxU8Fs2TODk+GR5ybhIzDqBRbXe99i9pXVQA2jwOy3p5n69z8ZL+
	WzNnzMExV70AV0O0SBiyWE69MtySNGeJq334Iaa3iBkEw=
X-Google-Smtp-Source: AGHT+IFk0Ei4GgmAkHyX5mZ9ZCWUvEwxuRN77hDGrq2whD37UOPWeYi0DQsxO0na667fxWtBBPxMAXvU8evvWeuNBWE=
X-Received: by 2002:a05:6122:660a:b0:523:dd87:fe95 with SMTP id
 71dfb90a1353d-5330c0c680emr4562995e0c.9.1751064180351; Fri, 27 Jun 2025
 15:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev> <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com>
 <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev> <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
 <609409c7-91a8-4898-ab29-fa00eb36df02@redhat.com> <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
In-Reply-To: <530101b3-34d2-49bb-9a12-c7036b0c0a69@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 28 Jun 2025 10:42:49 +1200
X-Gm-Features: Ac12FXxGFmLgQUm1TzQ4GRXvYtSFtMDf_ZQxI7m__F1iEVPCgA6gaIbZBp5ogkM
Message-ID: <CAGsJ_4whENJnq+XBu9VnRWMTh9HouQdULO5u1G=+d3JVmdRpeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, 
	riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz, 
	harry.yoo@oracle.com, mingzhe.yang@ly.com, stable@vger.kernel.org, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_154301_880364_36502CFE 
X-CRM114-Status: GOOD (  14.33  )
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

On Sat, Jun 28, 2025 at 3:29=E2=80=AFAM Lance Yang <lance.yang@linux.dev> w=
rote:

[...]
>
> Based on that, I think we're on the same page now. I'd like to post
> the following commit message for the next version:
>
> ```
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio's PTE mappings
> are not fully contained within a single page table.
>
> While this scenario might be rare, an issue triggerable from userspace mu=
st
> be fixed regardless of its likelihood. This patch fixes the out-of-bounds
> access by refactoring the logic into a new helper, folio_unmap_pte_batch(=
).
>
> The new helper correctly calculates the safe batch size by capping the
> scan at both the VMA and PMD boundaries. To simplify the code, it also
> supports partial batching (i.e., any number of pages from 1 up to the
> calculated safe maximum), as there is no strong reason to special-case
> for fully mapped folios.
> ```
>
> So, wdyt?
>

Acked-by: Barry Song <baohua@kernel.org>

Thanks
Barry

