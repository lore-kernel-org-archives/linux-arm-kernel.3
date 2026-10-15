Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD38ACC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUb4cagls44kE5et9qrliHAU76p7w/thb7bKXpN7Lxs=; b=IfFo171nzIc3IwK8yxbRnr5kw5
	alVvH7ZIg2898+mWhJTdTBak4zT9QrzbF6Tcg4f3TrmzdEikNQCDvxzofHE+in4b92uLbjUyDEkS9
	fx0rjxenroILjpDGWWteq1KLXG93fNFVrZHMIodC9IubyhWgusLBOuQkFlkrnUQw/Hp0Tv9LkdjMv
	SuUL/z49WdolIZ0f9b4S0rhn4UxCr03X7tSnKZFiSo4Pw24DjAb914Q3kSGH9M5qNu+rLAAlyi9Xi
	1eGHDqxa3j1XnilwTeFc2OTd/1Q9SN29KzkBYdn3LyvGJaMifMay05aWsFt7wqowvgVCha8puaZfa
	/ovDxqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHP5X-00000000y2E-3ME0;
	Thu, 15 Oct 2026 17:17:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHP5V-00000000y1k-3c1m
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 17:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nUb4cagls44kE5et9qrliHAU76p7w/thb7bKXpN7Lxs=; b=pIt5c4rt2cCxCd+UWiIG1qBKMp
	VIFyYDkTMdts1UfhwEd6ssfv2bpplnPWN222vJRDF2+siQDk+sATXcLLuG3zvqM1tXvbSDprjz7K9
	ygcdfImkc9gfzgX83SeapLnkokRsf3GnGukrl9tz4E9QGWtNUeOFmtWjDzs/fcTDQ0xl4v+aBJKag
	muTw7i3hBCMCn7v61MY92wP865/UiZtXFOl6lMP7tyED5CbN3I7jdB4Lp6Qc/0U0gSEldUuynUOPw
	7F5me+rNn0PtefO8vlcYro+Ll4MbuhdY2RcyP8PF8I5MqANmi1kSW3ps186x0MCcMWRQMXhBrapD+
	gSvXRqpg==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHP5S-00000000f4w-2l9w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 17:17:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-486e70f2457so889167f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084669; x=1792689469; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nUb4cagls44kE5et9qrliHAU76p7w/thb7bKXpN7Lxs=;
        b=oWpryt2dIVs/MGVWvsShYdL1LmSM40wqNead17aNrGuncKwZl/2M7Nk893NQJV0O1x
         diF8/X7mLqFLh/c7lZXvmidQNb/IEpgLAa72yvLrjcKc2hXjg+DJsp4bMdfK0rQaze2I
         oySfM31VqDJWCgPu5ITncx6WBeCMbWvhy/Rcq/uqcG/F/VoDelZEUQr5YvhQtnXP29MR
         pudWcI/CE6371hJlpM7PQREw3RFnDf3hC/yIzEnHyZ5j5CXzoe9lzWUAeQeSfQ7w5ekM
         N83k2GBQ7DOqk6SV4FZHr/h6+/d/W+u0FCw0x3lGWkfF6vQGhCHssc2OMrXSoIeDtfCN
         9wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084669; x=1792689469;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUb4cagls44kE5et9qrliHAU76p7w/thb7bKXpN7Lxs=;
        b=zM1yHmoK/K9GWi1G6x8bNAEkGe0p1M7lKjnbesayGUomH6LSmAS/CItHXDiWZJQ/sj
         D9DevQjRH2w6QZ3ujnLQzerf7TDpbXWHG3qKv1g0RaSY0DHxbO5TaR3UV/ryLdLZK6Yo
         xAtF1Igz+Fw+bpGzGKbB8Lwel0mVtygPuoDEL3ZN2W8kw4p8qxwDKsX0JC2e3EI56XU1
         nPXaTKXNDMv7pcZLCLf8ZBY44zlIlZqOv7L+yFTjMncLlTt6GSyHsBhgrxZVRIdJgywr
         Ysv8Nn/PA/yFcDakIIh4XHGd1RKw73DEWz69n0cBp1FP53JUlGWj/B98c6/DCMyPuv5R
         HNKA==
X-Forwarded-Encrypted: i=1; AKwUvByIoMPbMs3g+9K+gyiPeTrBsH4lyneKynXPrpQfgmoYeWqQFRt412XXLUngQlMkFfHfl9IhQIOlDPm/eT9FMbvm@lists.infradead.org
X-Gm-Message-State: AFq9FYK/ds2I1dqz2q9AvHoRcMZitq3B4Pq39t+2FJsJ8QV8ke05BPal
	ieoTGKvnTI+M8x6EiZ1qi9K4gaoCJtH/+pdM2LEjGATKgKQd5rT10nb2
X-Gm-Gg: AYBFou14i3ZDWblbXdbE+IogwBbTYx9Is71E9Uo2M6yiQ+nA8ILaovNaMDCb8tBDyma
	gawrvghcRZiXrCnvGvOldnKIP0pYIhzJCzdmVlijQv+OF0kCOl7isQ6Vw6ocfFMJvIMX4kz8m2D
	s81+rJeaKCj3+GlqzF6kd01rL0fwEhRktMANRX1LUwBbk0XFR5nnuZ3kH+vWXZ5G/+rQvakj8BX
	U3adcQeENnaIk/Xv250aOaznnenLuDBC7hEqtFeJZ3wBxbNa4hJobOzsSD+plmBgUH0JWBeKkx2
	D4yMqBJS0oq0AyUr93xDkpIwnunhYPQTYulZLxTKUSadyDO4ggjhybnAwzv70F92e3PD81SD7ks
	bU+110o7kEODulVizL1xQmfB27Kd/mkNTkisY7UU5QJpbEi9M3ANLfOYTTdASIBhG5OqIrPsPQ+
	nS9tA4bHbweCrZGP/mmk/XZ8sH71LXvty95a0soNRuleQB/thAEGEr3KZdpJ1GjwNFOGapbFrz8
	RI2a4LpTyb/S8NTBoxI9mi0VxO1vbbfy7u8xOJw/ZhBriwatLwrYysoHXF0AD3kYB6jqdjP5Yad
	GlcF8GE0R2bKLcA6D56hUm2Gj6YYWGEnjBI=
X-Received: by 2002:a5d:44cd:0:b0:488:89e4:c3af with SMTP id ffacd0b85a97d-48dbaae4869mr30499724f8f.45.1792084668569;
        Thu, 15 Oct 2026 10:17:48 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfaf1acd7sm1180327f8f.1.2026.10.15.10.17.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2026 10:17:48 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ackerley Tng <ackerleytng@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
Date: Thu, 15 Oct 2026 17:17:46 +0000
Message-ID: <20261015171746.51538-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAEvNRgHtB8j6=9r=txjsKvQM0F85nRN4KW5sdnuv_-Og=cWEfg@mail.gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com> <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com> <20261014095702.39676-1-griffoul@gmail.com> <CAEvNRgHtB8j6=9r=txjsKvQM0F85nRN4KW5sdnuv_-Og=cWEfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_181750_742732_D77A515A 
X-CRM114-Status: GOOD (  25.08  )
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

Ackerley Tng <ackerleytng@google.com> writes:

> To borrow David's words, the part about this that makes me itch is
> conversion. We have to support conversions. Even if it doesn't merge in
> the first patch series, we have to have line of sight to how conversions
> would work.
>
> Conversion requests originate from the guest and then the host handles
> the guest request by making calling an ioctl on guest_memfd. Hopefully
> this part doesn't change with alternative provider support.

Agreed, and it doesn't change. Conversions still go through
guest_memfd. It is the only one that knows which pages are private.

> Suppose guest_memfd still gets the conversion request first, in RFCv2,
> to reach all the mappings in various page tables, it would have to be
>
> + [GUEST_MEMFD] -> [KVM], [USERSPACE]
> + [GUEST_MEMFD] -> [PROVIDER] -> [IOMMU]
>
> since guest_memfd must ensure no IOMMU mappings to guest private pages?
> There's that extra step through the [PROVIDER]...

Right, there is a step through [PROVIDER]. But it can be a step through
the mem_provider code in mm, which every provider shares, rather than
through each provider driver. Then guest_memfd doesn't need to know who
else maps the frames, and providers don't have to get it right one by
one.

Here is the idea, on top of your in-place conversion. The VMM gives the
same provider file to guest_memfd and to iommufd, as in v2. When
guest_memfd converts a range to private, it claims the range:

  int mem_provider_claim(struct mem_provider_attachment *att,
                         loff_t offset, loff_t len);
  void mem_provider_unclaim(struct mem_provider_attachment *att,
                            loff_t offset, loff_t len);

The claim revokes the range for every other consumer of the file. After
that, get_page() returns a hole to them. So iommufd unmaps the pages
and can't map them again, and nothing changes on the iommufd side.
guest_memfd zaps its own mappings, as it does today.

Going back to shared is the reverse. guest_memfd returns the frames to
the host first, then unclaims the range. The other consumers then map
the frames again. So a conversion looks like:

  [GUEST_MEMFD] -> [KVM], [USERSPACE]
  [GUEST_MEMFD] -> [PROVIDER] -> [IOMMU]

That is your second chain, but the [PROVIDER] step is the common code
in mm/mem_provider.c. It does the revokes and hands out the holes. The
provider driver itself only gets one callback, and it can refuse a
claim. For example, it would refuse if it also lends those frames
through another file. Conversions can already fail, so this fits. If a
later step fails, guest_memfd just unclaims the range.

This also answers your earlier question. The provider doesn't need to
know what is shared or private. It only needs to know which ranges are
claimed, so that it doesn't move or share them, and only takes them
back once the guest has given them up.

I haven't implemented this yet. My plan is to rebase on kvm-x86 next,
which has your conversion code. Then I'd demo it with a
KVM_X86_SW_PROTECTED_VM and the sample provider. A device sees a shared
page, loses it when the page becomes private, and sees the same frame
again when it goes back to shared.

Does that match what you have in mind?

> Thanks, I will prototype what I have in mind too to make sure things
> work as I think they will :)

Thanks, that would really help. The sample provider and the KVM
selftest in the series could be a starting point.

Thanks,
Fred

