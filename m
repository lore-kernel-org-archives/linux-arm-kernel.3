Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBFBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=; b=rz4KVCjYUxSgCBI9Cx4CHs7NkH
	pOS9Zrub5YAizTFbWxC5XlQvnNeweSvOc61rvLqrMtH2DfpkcrJ+JLnDlGcAR47nH3ivYTJt6KIrX
	ecwQkEaYFlJde9NCnfoCDMEVvXCLNZ+SRCdIX5r0MVJ0ohEabou69eySRde6W+TPi9AABo+nJo6VW
	d7G3E9EcDUJwiLiDQBA0oKfoN4TfiUWQt9bMMnI6qW7NDBaNd0gEDnzyCLabm1zRds+1TwNEn/PE9
	GwFcdThaiVZwv2NQgdHGbb0I2hdm80odiPB09oxuppLbL/Fjx1nQFdsCIdo8OpDyDcCzeWfheqrfa
	UeweYUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUu3-00000009bwo-0r7D;
	Wed, 25 Jun 2025 18:31:23 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOWf-00000008WOh-2hiY;
	Wed, 25 Jun 2025 11:42:50 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-4e9b26a5e45so558561137.1;
        Wed, 25 Jun 2025 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750851768; x=1751456568; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=;
        b=ONe2dgdRwmcYs4Ymsv32eHhUyPK7wGwR5Layadpc29UY6ie8VF18a/qcQmRPW4ZuqA
         0SWyyN0EnmRKwxz3Ns+J2ayQgkZHm6GMNAIAAsVpL9LNRTTKe2u+1ecyjrsin6Q29fi6
         ZEA1yeDdOlPyf7ck9FBluHr0TWK8Fcud8rVgT8MuwamW/qv6iUiIWZTpsa29kddc7/no
         P2optVizKcoDOOYhSGqENVwYY/YJNX1Bk6tTBHvJgarbqkdIx0iWif407rdXor8Hm4+v
         qsa5oyKPkY0APEa5XaoG8SWQmIALyk+BAaqzxqwbObOkmgUKccNbuZWHSTBqfdTdO94J
         fMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851768; x=1751456568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1E0eHLYsSqj8V6/6/0gwkH/3TSH/eRM7xqdNUicbSQ=;
        b=TLfwc8oxVCQKpnfSZgNNP9D2qornNssko8P6cP6Uo4Ig8Un8M4vZlvupwSi7IPFsjX
         gcLcH1tv6UbzzmOctGLI03d5vJvZ1lM4PtK8KBmVtmq9Il8A8Vj2gvlAvO21IT7SpCUH
         RFqmU89BIRurv4pYriIaVEPMOyz/ot9hnKourP+0Lg8YeW/hKQrtEB/YWouKCXrWlCra
         qEhwh4HAig/MObZzDNra+UNLZXPWUbseUYNszLQ03Cgpz+IKgQeSonKySPoVdgiSzJhg
         QUpCi6tzJg4lCsq8qgvj+B/hUqmikcg42GCV0JT4JU3a2vOwxxDXOpZH3mroZse3bnDQ
         TCrA==
X-Forwarded-Encrypted: i=1; AJvYcCVI85u4JKsWXuYqGtzoBTCAEDhAJXGDx+PE0bF1MqcO+EU8aXcZt7dVX+xMZQbfQdwU29c2qtOQ9w6xkNE=@lists.infradead.org, AJvYcCXmzCY2TQbuavL9bAGw4Xc8xsp/PQZtYoVwoky3Bimz4lfGM9dLWwwbv23zs6i/P0HcjG3jy4kM7qGK+foggF+o@lists.infradead.org
X-Gm-Message-State: AOJu0YyUR8s6dpgWh2fh/hov8MP2sBjXrPlNPvz5OpV0MTjJ4TapUnoH
	RhDKj5lrHw2m6Z18R4CVhk7AI1qLSjik8FesSk26RsdJJxkestTdkpUUFs870Y0/EJ8AQwe1rqT
	aHBLAwqGIygKnlMHqJRtGIU1mkWTDfas=
X-Gm-Gg: ASbGncttmpiF7VLXLa92mzWhR8rT5WQrlqidQu8R8Wt6C1BakMRazw/imgmM0SeZNLd
	H1nar+qWgmHx5yqvCyNJInEohHrbnjCy5aJFEp7TXGgFs8oQYKvDNPHhYqjtxFcEwK5iWznghfT
	rtpDV7/y2UftMc0lSb3XD2ikECakiYLouJ1oQWrePEq7Ng/EyogyRG3Q==
X-Google-Smtp-Source: AGHT+IGsSxCfiBHYZxf4zTJngUXVXeIOT0PdP8VNFGZYgDUlzbW2AoPZQk3j5HWq3IA1WM6a9fvGa9ZMm28LZKzgbU4=
X-Received: by 2002:a05:6102:689a:b0:4e6:a33d:9925 with SMTP id
 ada2fe7eead31-4ecc6a67b6emr1171422137.5.1750851768456; Wed, 25 Jun 2025
 04:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com> <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
In-Reply-To: <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 23:42:36 +1200
X-Gm-Features: Ac12FXwHQ4LRq0KMwLDA3cdKc56s07Bk3-vMKyiAdfGW1BevfTrz5ebfq42hUs0
Message-ID: <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_044249_701325_46AFCBEB 
X-CRM114-Status: GOOD (  29.50  )
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

On Wed, Jun 25, 2025 at 11:27=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 13:15, Barry Song wrote:
> > On Wed, Jun 25, 2025 at 11:01=E2=80=AFPM David Hildenbrand <david@redha=
t.com> wrote:
> >>
> >> On 25.06.25 12:57, Barry Song wrote:
> >>>>>
> >>>>> Note that I don't quite understand why we have to batch the whole t=
hing
> >>>>> or fallback to
> >>>>> individual pages. Why can't we perform other batches that span only=
 some
> >>>>> PTEs? What's special
> >>>>> about 1 PTE vs. 2 PTEs vs. all PTEs?
> >>>>
> >>>> That's a good point about the "all-or-nothing" batching logic ;)
> >>>>
> >>>> It seems the "all-or-nothing" approach is specific to the lazyfree u=
se
> >>>> case, which needs to unmap the entire folio for reclamation. If that=
's
> >>>> not possible, it falls back to the single-page slow path.
> >>>
> >>> Other cases advance the PTE themselves, while try_to_unmap_one() reli=
es
> >>> on page_vma_mapped_walk() to advance the PTE. Unless we want to manua=
lly
> >>> modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), w=
hich
> >>> to me seems like a violation of layers. :-)
> >>
> >> Please explain to me why the following is not clearer and better:
> >
> > This part is much clearer, but that doesn=E2=80=99t necessarily improve=
 the overall
> > picture. The main challenge is how to exit the iteration of
> > while (page_vma_mapped_walk(&pvmw)).
>
> Okay, I get what you mean now.
>
> >
> > Right now, we have it laid out quite straightforwardly:
> >                  /* We have already batched the entire folio */
> >                  if (nr_pages > 1)
> >                          goto walk_done;
>
>
> Given that the comment is completely confusing whens seeing the check ...=
 :)
>
> /*
>   * If we are sure that we batched the entire folio and cleared all PTEs,
>   * we can just optimize and stop right here.
>   */
> if (nr_pages =3D=3D folio_nr_pages(folio))
>         goto walk_done;
>
> would make the comment match.

Yes, that clarifies it.

>
> >
> > with any nr between 1 and folio_nr_pages(), we have to consider two iss=
ues:
> > 1. How to skip PTE checks inside page_vma_mapped_walk for entries that
> > were already handled in the previous batch;
>
> They are cleared if we reach that point. So the pte_none() checks will
> simply skip them?
>
> > 2. How to break the iteration when this batch has arrived at the end.
>
> page_vma_mapped_walk() should be doing that?

It seems you might have missed the part in my reply that says:
"Of course, we could avoid both, but that would mean performing unnecessary
checks inside page_vma_mapped_walk()."

That=E2=80=99s true for both. But I=E2=80=99m wondering why we=E2=80=99re s=
till doing the check,
even when we=E2=80=99re fairly sure they=E2=80=99ve already been cleared or=
 we=E2=80=99ve reached
the end :-)

Somehow, I feel we could combine your cleanup code=E2=80=94which handles a =
batch
size of "nr" between 1 and nr_pages=E2=80=94with the
"if (nr_pages =3D=3D folio_nr_pages(folio)) goto walk_done" check.
In practice, this would let us skip almost all unnecessary checks,
except for a few rare corner cases.

For those corner cases where "nr" truly falls between 1 and nr_pages,
we can just leave them as-is=E2=80=94performing the redundant check inside
page_vma_mapped_walk().

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry

