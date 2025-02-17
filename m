Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A7EC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KxbE/LUi+pBeXrp6r1WoRsJN4gZHatc3HSxCggqAc8=; b=FNxv0tdbYWWgysey1Do29Tv/4D
	kSB0mTVnOPWRvf6vK9PvBXrWtQQIicpCJeX2zhN6C9mNm3VebQ+GrEWqTyASSVKa7alPd12nvuwMS
	VAkiP3BOtZfZzD/pYK+ytVDPv5sVRBjE7pSiktU1oo+XzDkVKFQPkk805mRV1byIN62FBJQavMsbF
	G6lGrgAZiHuQ3yC6ryZ2wUzMj6JIBdDnZv/Dy1EhbUE2rb3knqe00X4So0mCCnYbTT5ih2DADshFy
	8H7o+Lo6jNHoWRzDObGPxnCn3N0L+wdUjphrMdxpU2OdNKi3iDa94Jt//Dd3tOGPu7ieB5mEuUoVe
	xK/CghZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4q6-00000005RGD-3crU;
	Mon, 17 Feb 2025 17:23:26 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3kW-00000005Dpz-22ie;
	Mon, 17 Feb 2025 16:13:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso2273362f8f.3;
        Mon, 17 Feb 2025 08:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739808814; x=1740413614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KxbE/LUi+pBeXrp6r1WoRsJN4gZHatc3HSxCggqAc8=;
        b=CITy9zIxJ5BxPDqycyf5FzR88I4cerZR+tBg2R93m4Dlad8VEcSeFEgMrnt++5mc1L
         GYfNU1tlcPg6XJy/ybJ6KMB8Y74+u+SmhXxiQ+qlM48OSi/0Wfv9Mso1uafPuPbdz78r
         xP8pm1PWye193zCYfGT7b4cBSLrbxaUkh7BW2/RiRUF9zt82I6X23vAVH4wLnOo+/yX7
         6v9zm1k0/2hj1Dt2hJa9D+jF03p0vwFDtFnSn6vDDeHOwKs1G9oSEgQ1AJPUS+6ZcxcG
         FcOhfk+waPWrj9fyk4MFcxAPFSjUEi/eLSdORdoA6BYBejgogO7+85sx4X3+N9YQniLV
         dkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739808814; x=1740413614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KxbE/LUi+pBeXrp6r1WoRsJN4gZHatc3HSxCggqAc8=;
        b=fNxDDw+lQ8cn1ZfUlwlMDmDurA/LTY7r88BPOjAe/bQnt1kSAgO9Vd5yXUvoeK7jr4
         wAN4869Vyd46cgwZZx707iAlcZjL3FU4crl0oxgIerflxDaA74ECUeDLvvYfy/kjtoRD
         vQarAX2QzTKevh5VLWcuS0dzXyudWvq+KuM9Wdk92ig8nf4mDlQSd+R/6ShysevPsXFQ
         6xEwPvM9tRyERPHrB314QgsomVMEMPScZGlenBQRh8RobO8y01IAPVYHPDB2fVyTsDnc
         btxSqeSoVmK3160uY124+hQcjBB2jY5HvnMQ0Vk5bIMR9teF02488qpeFRwGscRsVMom
         Ay5w==
X-Forwarded-Encrypted: i=1; AJvYcCULdPUksZ8vi8QMQjvC0otA+WeXPpkG6/MapFeEnAfLDBlykxMib0ZfzoVx9xvDQc8PwtOFz+/tYekBp8o=@lists.infradead.org, AJvYcCX8/PrsfY3bzbTHtxsmB9X6d7tIsHz+H5s+fd5qwW5nkS3buxQnoDJ59WwGwcCubfYGBLhNqM2qUn3zjFIG5azZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzny7x5xVBMQki9/piKDWZm7nqXF+IHz4JHdiqXvaqvypcDrZAL
	f3Ij+gFRhd0cZBuWxcJeUfR1HMKj1iAGBzRMBsH6Ux27Ly90zQMoN7TC46rpfk25/EpLJDe//AF
	ko6QHZf9zY03kjQlngPueWVwtedM=
X-Gm-Gg: ASbGncuMbnEfCO60USJVh2RCXm7vaE8CJcnVV2Py3pWR60aI0+wZzXNs7x40GXgjtW0
	GDU7NCtHsLT7c3utoTlwHzr48K7+TQ/lt5VIKRp0vggFrDpzypj3fSoGD32WzBkyHtlE4dUuvEP
	M=
X-Google-Smtp-Source: AGHT+IHm8HBgn3sImk7NTjtXb+A27btOABGGevI0EONCrC/Ff9AcLGqA4yAvmgT0QuA1lhKIHNQku0J8pxt9SI1xfb8=
X-Received: by 2002:a5d:64cc:0:b0:38f:4fa6:bb24 with SMTP id
 ffacd0b85a97d-38f4fa6bca3mr698753f8f.39.1739808814051; Mon, 17 Feb 2025
 08:13:34 -0800 (PST)
MIME-Version: 1.0
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-2-samuel.holland@sifive.com> <CA+fCnZeBEe3VWm=VfYvG-f4eh2jAFP-p4Xn4SLEeFCGTudVuEw@mail.gmail.com>
 <e7t5yzfw3dq5stp5xjy5yclcx6ikne4vwz7d6w2ukfw2b7gr6t@oomoynf3b2jl>
 <zjuvfdbl7q76ahdxk3lrgaznk7vjj43f5ftzfgrnca6dqtcd5x@5qj24womzgyq>
 <CA+fCnZfySpeRy0FCFidLdUUeqp97eBdjAqQyYPpz1WxYwcsW9A@mail.gmail.com>
 <aqhm7lc57srsfuff3bceb3dcmsdyxksb7t6bgwbqi54ppevpoh@apolj3nteaz6>
 <CA+fCnZdjTkreTcoo+J8wMhwDuAFM4g33U5BFy0OPtE0UCvyJbQ@mail.gmail.com>
 <CA+fCnZcoVdfXVN8VBFLx835cV0eGAT6Ewror2whLW761JnHjNQ@mail.gmail.com>
 <sjownmnyf4ygi5rtbedan6oauzvyk2d7xcummo5rykiryrpcrt@kasomz5imkkm> <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
In-Reply-To: <tuwambkzk6ca5mpni7ev5hvr47dkbk6ru3vikplx67hyvqj2sw@rugqv7vhikxb>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 17 Feb 2025 17:13:23 +0100
X-Gm-Features: AWEUYZmQ1uvVHZE607fk9A3oqamhim11vzns-dfPoe7sFHHzYYWlnLIpBeOBi1A
Message-ID: <CA+fCnZcHnWr0++8omB5ju8E3uSK+s+JOFZ3=UqgtVEcBzrm2Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>, 
	Evgenii Stepanov <eugenis@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_081336_526175_37A7DC19 
X-CRM114-Status: GOOD (  33.30  )
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

On Fri, Feb 14, 2025 at 9:21=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> On 2025-02-13 at 17:20:22 +0100, Maciej Wieczor-Retman wrote:
> >On 2025-02-13 at 02:28:08 +0100, Andrey Konovalov wrote:
> >>On Thu, Feb 13, 2025 at 2:21=E2=80=AFAM Andrey Konovalov <andreyknvl@gm=
ail.com> wrote:
> >>>
> >>> On Tue, Feb 11, 2025 at 7:07=E2=80=AFPM Maciej Wieczor-Retman
> >>> <maciej.wieczor-retman@intel.com> wrote:
> >>> >
> >>> > I did some experiments with multiple addresses passed through
> >>> > kasan_mem_to_shadow(). And it seems like we can get almost any addr=
ess out when
> >>> > we consider any random bogus pointers.
> >>> >
> >>> > I used the KASAN_SHADOW_OFFSET from your example above. Userspace a=
ddresses seem
> >>> > to map to the range [KASAN_SHADOW_OFFSET - 0xffff8fffffffffff]. The=
n going
> >>> > through non-canonical addresses until 0x0007ffffffffffff we reach t=
he end of
> >>> > kernel LA and we loop around. Then the addresses seem to go from 0 =
until we
> >>> > again start reaching the kernel space and then it maps into the pro=
per shadow
> >>> > memory.
> >>> >
> >>> > It gave me the same results when using the previous version of
> >>> > kasan_mem_to_shadow() so I'm wondering whether I'm doing this exper=
iment
> >>> > incorrectly or if there aren't any addresses we can rule out here?
> >>>
> >>> By the definition of the shadow mapping, if we apply that mapping to
> >>> the whole 64-bit address space, the result will only contain 1/8th
> >>> (1/16th for SW/HW_TAGS) of that space.
> >>>
> >>> For example, with the current upstream value of KASAN_SHADOW_OFFSET o=
n
> >>> x86 and arm64, the value of the top 3 bits (4 for SW/HW_TAGS) of any
> >>> shadow address are always the same: KASAN_SHADOW_OFFSET's value is
> >>> such that the shadow address calculation never overflows. Addresses
> >>> that have a different value for those top 3 bits are the once we can
> >>> rule out.
> >>
> >>Eh, scratch that, the 3rd bit from the top changes, as
> >>KASAN_SHADOW_OFFSET is not a that-well-aligned value, the overall size
> >>of the mapping holds.
> >>
> >>> The KASAN_SHADOW_OFFSET value from my example does rely on the
> >>> overflow (arguably, this makes things more confusing [1]). But still,
> >>> the possible values of shadow addresses should only cover 1/16th of
> >>> the address space.
> >>>
> >>> So whether the address belongs to that 1/8th (1/16th) of the address
> >>> space is what we want to check in kasan_non_canonical_hook().
> >>>
> >
> >Right, I somehow forgot that obviously the whole LA has to map to 1/16th=
 of the
> >address space and it shold stay contiguous.
> >
> >After rethinking how the mapping worked before and will work after makin=
g stuff
> >signed I thought this patch could make use of the overflow?
> >
> >From what I noticed, all the Kconfig values for KASAN_SHADOW_OFFSET shou=
ld make
> >it so there will be overflow when inputing more and more positive addres=
ses.
> >
> >So maybe we should first find what the most negative and most positive (=
signed)
> >addresses map to in shadow memory address space. And then when looking f=
or
> >invalid values that aren't the product of kasan_mem_to_shadow() we shoul=
d check
> >
> >       if (addr > kasan_mem_to_shadow(biggest_positive_address) &&
> >           addr < kasan_mem_to_shadow(smallest_negative_address))
> >               return;
> >
> >Is this correct?
>
> I suppose the original code in the patch does the same thing when you cha=
nge the
> || into &&:
>
>         if (addr < KASAN_SHADOW_OFFSET - max_shadow_size / 2 &&
>             addr >=3D KASAN_SHADOW_OFFSET + max_shadow_size / 2)
>                 return;
>
> kasan_mem_to_shadow(0x7FFFFFFFFFFFFFFF) -> 0x07ff7fffffffffff
> kasan_mem_to_shadow(0x8000000000000000) -> 0xf7ff800000000000

I'm a bit lost with these calculations at this point. Please send the
full patch, including the new values for KASAN_SHADOW_OFFSET (do I
understand correctly that you want to change them?). It'll be easier
to look at the code.

Feel free to send this patch separately from the rest of the series,
so that we can finalize it first.

