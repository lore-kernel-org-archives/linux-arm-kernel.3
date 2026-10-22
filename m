Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E353C606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 03:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UpyKzuXy;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XYtaE0au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=; b=UpyKzuXyWzA5f5oAKPGCCU+8GD
	xj3+oqNsjZN8nGkKPACab24sZ1aFm8nbpJA+41y+7IUHTmgDCaVmNeMvYT7Ic4vIYgzeqgsYovmu2
	MtGf4O52DYZ4Sy5KkXDEHPjIGzAq5iMBwyW0L07/iCdQNS6JGhamkFP1rPL93fKZPJi/46cj6ULWx
	2BfW3X5Vck/1I+/1H7uSyFW9TuLdRp7VfvB30jsZJyR/o1TuDgRnRDnOG6SwBx6bbHqc4Dl3bdIU0
	RXXNaPBAApG7HZpPlQM2GtEOvsjxCbMlhHHSdF3ld8swJgLdSTphdZsvckD2IlvQHDxmMx/J+UKBO
	F9OpaNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjY2-0000000DHXI-32oP;
	Thu, 22 Oct 2026 03:32:58 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJjY0-0000000DHWV-1Nrx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 03:32:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso1125839a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 20:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792639974; cv=none;
        d=google.com; s=arc-20260327;
        b=VyI8vbkrbzK8saqVu40HJ85AZMy/HaSVjVSOHRCFw+zLOEfDcx4VJxuUMH+FKsfNYB
         7SkVksMrZMh1a9qarQMahxX0PjtPSa0oIVOJ9xabDMSZzzNxQoUqWBCPR5ZaZjDn9+RZ
         nCXwYHTxo2GYvGpjE/AtjCjNP1aj4mQdQ8tr+GDi0NAXl0o+Ui73XpOk/8p+oYksrlK/
         zkMZLgGLRRbBx/HJI+P2adoDZCNVLvnKU04oOIjJzbvS6gSfPwxvHIpTi1sczYJ13qDm
         Czj+zCjBSEUE0SvfUkEn7SgNOyO6KnnZPRS2pLLaqIMwSZkP0x0eYqRU40/pGpUG47bR
         7R8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
        fh=EiqzQ+jEXs58ENJrloZqb7snVJi97+BTbC+apYjzT+s=;
        b=PMJwKXEQ/CT7rd6fDeT4hoyhyIvh6/JTMpudyyUrpxpZggWVXkAddP7EzzYOVmv/GB
         EPjW3PiELgFCyoHWd/U6yyqmVxQdI2pF4bCBjXS4EnmRl79CSq5xk9uK3fzGyUCBTruU
         j370rskZ7e5osD/bs5Eb74KZBtd/OY2Z002OElYCnkTo4Nw9uvKq0qesR/uM/nKBmnBC
         Zk8UgYLX02eb0opbs1b1NtpZqSIrudx5Xqh+yUoW5jKPKxKODWeDBUN1GRaqE7hduPH7
         S3C6eWUK78P2djhHeF3lneOSK0HoaQymRmZ8qV6dwIECr4xdZV/a/VSMil9LsZYCM41s
         Rwqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792639974; x=1793244774; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
        b=XYtaE0aul8X3GEIdu9eMFaCP7XJQ4UUbKfDxseG6B1ljGGeymGamEFeahZ/JKKYukM
         GPHkK/i60fyra+q7+36LzDd/b0daemjT9TG+jl+55V2c1xjhZHzN7ARvE57ApyULqarw
         nY9jw3k2YTP2IakjcklSYLDiB6S+vPOyGeznZ8lAGX203miNKXQQyIqcdT68dxN4s2la
         OcEJw97nD+Bs0kZznApil+lmLbC2yvfDKQ6N28rLc3QtPLuHnwfb9g+BeYeJRa3ddMif
         AMG6GpAoBjlibYXQy1acY6vRVm/k98UWx0eTgoy6wlctqfrQqogyuYGhCc7hRBqpPNhe
         YHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639974; x=1793244774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Un0pCsebAGgOHU5j/UFuxo61lM6ZZUr6aOfHjWXDb9g=;
        b=SM0561HxOgjS7bEevj4DRiRsZKZYDwcfoIH34mV8SRbUlblxMGXWT5s9Xk+Iv18/L4
         1xA9l8y3Vw5m6pmgjvItJwzPUZS4nqGBqCGbMCodII2ooWOU1mA621EaOAEsu8G1LQlN
         9VUsQHoB5YbFJ7FBbWGQ2bqXhPnkZsb9RipV21+mbvyTLCDjzQXWw3x4n6ZeohjJqJG3
         meV9gKOH8t5sSB7Nxeb7uwoQLiAawnBMMDv+PBtFxvQ40bn4b/sh+C7mA40JkB36HaP9
         8yzjjEgrk8bmxHmur1MflKwggTBb3B1LZlW5pCpDUB0cGTdf35mA/rRG99o8fFOyq0o1
         fdsg==
X-Forwarded-Encrypted: i=1; AKwUvBx09sAAE03dBMBeUb4ONWD9xiqFflSUXDGu5dkHQoWeBVqKxcTi4DHRlsurI5xqB2x+qoyPyevAdbo2Bfry8w+/@lists.infradead.org
X-Gm-Message-State: AFq9FYKSMqBQqkWb5jkhDoqpdJ+jCSNU1jWmbuxe/4TzQvxjzBKAZ8T9
	uaSGGV+FHucQM5MKq4zViHp6dc2MnQ598C2F5/e/OdrrVUAqjn7duBqeDbbcjqq9qxTgP6lVJ12
	QNCU5rpaWM0MPPcqwTCsL/eMCEfEocEyaYWXD9VGt5g==
X-Gm-Gg: AYBFou0HSBasZ5vwTm4B93cV9unpSsZZITWeoZCN6nINe/05rsMTSC1MQk1jRFh3avs
	D389nKsNJcsiHSXpFknQG6m/r5Ab6noB1W8FhqZyGkvVmefCsTn58EZCa50gCACLCoKvjiFAhHt
	TTWhfC4lFAsz7TzZTQ6/qxDA2Jygjy7ouugiCkZh57X75Cf6MAnLXSVnlRGozBoBHXEn+HuOY9J
	pHtIvJCM5lbO+JgXullKG+6ngrBOOFLzE35N0qXsMAnT4RcfNhb8g/gvgCe/wp7wxA8yzD7qNEf
	bJ+E3kreNDH4sC2spooAhc+D41kBrNDPFwkr1V4M9QiVVjlEuyP1A4q5cEMy6YckdxBmfMb0Nbp
	0GvdevS6X/1O3RbVDxE8ypWBB2T1bNY3USYnzl5t9Az8j6GRxURzGSmXgWe7lvItEWh51
X-Received: by 2002:a05:6402:2355:b0:6af:d794:4a8 with SMTP id
 4fb4d7f45d1cf-6b41d595e9cmr1157408a12.12.1792639974111; Wed, 21 Oct 2026
 20:32:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com> <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com> <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
In-Reply-To: <atl7peoVHdP5hz7z@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 23:32:17 -0400
X-Gm-Features: AclHuK8_AnwdTvKegXWFQaKFyzs_ctZH_O_1uRYIa-PRh8yAhLXciiK9Gp-4xIE
Message-ID: <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: David Matlack <dmatlack@google.com>
Cc: tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_203256_444247_CAA887C2 
X-CRM114-Status: GOOD (  45.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 10:57=E2=80=AFPM David Matlack <dmatlack@google.com=
> wrote:
>
> On 2026-10-21 09:26 PM, Pasha Tatashin wrote:
> > On Wed, Oct 21, 2026 at 7:28=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > >
> > > On 2026-10-21 02:50 PM, Pasha Tatashin wrote:
> > > > On Wed, Oct 21, 2026 at 2:47=E2=80=AFPM David Matlack <dmatlack@goo=
gle.com> wrote:
> > > > >
> > > > > On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> w=
rote:
> > > > > >
> > > > > > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> > > > > >
> > > > > > > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsah=
u@google.com> wrote:
> > > > > > >>
> > > > > > >> LUO and its file handlers validate handed-over state with mo=
nolithic
> > > > > > >> compatibility strings ("luo-v5", "memfd-v2"). Any change to =
a serialized
> > > > > > >> structure, even an optional additive one, must bump the stri=
ng, which
> > > > > > >> breaks live update between adjacent kernels. Replace the str=
ing in
> > > > > > >> struct luo_ser with a feature header, so that the target ker=
nel can
> > > > > > >> accept or reject the source kernel state per feature.
> > > > > > >>
> > > > > > >> struct luo_feature_hdr is a fixed 128-byte header: the seria=
lized
> > > > > > >
> > > > > > > This patch is all wrong; 128 bytes is far too large. For ever=
y _ser
> > > > > > > struct, we only need 8 bytes instead.
> > > > > >
> > > > > > NOO, It is not. It is intended to avoid complex mess with unnec=
essary
> > > > > > over-engineering.
> > > >
> > > > 128-byte per serialized struct is not starter.
> > > >
> > > > > >
> > > > > > >
> > > > > > > The first 4 bytes are the size, and the next 4 bytes are flag=
s (i.e.,
> > > > > > > 30 feature flags + 2 reserved bits for flags extension). The =
last two
> > > > > > > bits of the flags indicate whether an extended flags field is=
 present.
> > > > > > > Each extended flags field is 8 bytes, and its last two bits i=
ndicate
> > > > > > > that yet another extended flags field follows.
> > > > > >
> > > > > > If we will have dynamic extension of flags, Think about this.
> > > > >
> > > > > To support dynamic extensions in a backward compatible way you wa=
nt
> > > > > something like this:
> > > > >
> > > > > struct luo_feature_hdr {
> > > > >    size
> > > > >    flags
> > > >
> > > > __u32 size
> > > > __u32 flags
> > > >
> > > > >    extensions  // offset of first luo_feature_extensions (or 0)
> > > >
> > > > __u64 extensions[0]  --> but the size should be specificed in
> > > > declaration macro that I showed in the next patch.
> > >
> > > I think you may have misunderstood what I meant. In my proposal,
> > > extensions is an offset to the first extension, not an array of
> > > extensions that immediately follow the header.
> > >
> > > If the extensions immediately follow the header, then the number of
> > > extensions is baked into the struct layout. Every field after them si=
ts
> > > at an offset that depends on how many extensions there are. If we eve=
r
> > > need one more extension, all the fields shift and old and new kernels
> > > can no longer read each other's struct. That is the problem Tarun
> >
> > We can structure it cleanly by nesting the payload: something like
> > struct { struct header {...}h; struct serialize_data { ... }p; };
> > That way, the header can expand dynamically at the front, while all
> > fields inside `serialize_data` stay at fixed offsets relative to the
> > start
> > of the payload.
> >
> > Since the header size is self-describing via continuation bits (e.g.,
> > the last two bits indicating whether another flag word follows), LUO
> > can
> > easily compute where the payload begins in the incoming blob. This
> > keeps the implementation simple, avoids linked lists of offsets.
>
> Oh interesting. I agree a dynamically sized header at the front can work
> and is simpler than a linked list.
>
> So the header and the payload need to be separate, and the payload is
> located with pointer arithmetic on the header. For example:
>
> struct luo_ser_hdr {
>     u32 size;    /* Size of the payload in bytes */
>     u32 flags;    /* Bits [31:30] indicate an extension word follows */
>     /* u64 extension words follow while the continuation bits are set */
> };
>
> /* Size of the header, including any extension words. */
> size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr);
>
> static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
> {
>     return (void *)hdr + luo_ser_hdr_size(hdr);
> }
>
> On preserve:
>
>     hdr =3D kho_alloc_preserve(luo_ser_hdr_size_for(nr_ext) + sizeof(*ser=
));
>     luo_ser_hdr_init(hdr, sizeof(*ser), ...);
>     ser =3D luo_ser_payload(hdr);
>     ...
>     args->serialized_data =3D virt_to_phys(hdr);
>
> On retrieve:
>
>     hdr =3D phys_to_virt(args->serialized_data);
>     err =3D luo_ser_hdr_validate(hdr, ...);
>     if (err)
>         return err;
>
>     ser =3D luo_ser_payload(hdr);
>
> What would size mean in luo_ser_hdr? The size of the payload or the size
> of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing so
> maybe it's just the size of the payload?

> What would size mean in luo_ser_hdr? The size of the payload or the size
> of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing so
> maybe it's just the size of the payload?

Either works, but having size cover the combined hdr + payload
provides a few extra guarantees:

1. A single static_assert validates the entire serialized struct at
compile time, including the header and the number of ext_flags
elements.
2. Bounds checking while traversing the header continuation bits on
retrieve: we can sanity-check that luo_ser_hdr_size(hdr) <=3D hdr->size
so we never walk past the end of the serialized blob if there is
memory corruption.

If we declare the payload struct separately and pass it into the
macro, handlers also get a clean type for luo_ser_payload(hdr):

#define DECLARE_LUO_SER(name, expected_size, ext_flags_count, payload_type)=
 \
    struct name {                                                          =
 \
        __u32 size;                                                        =
 \
        __u32 flags;                                                       =
 \
        __u64 ext_flags[ext_flags_count];                                  =
 \
        payload_type payload;                                              =
 \
    };                                                                     =
 \
    static_assert(sizeof(struct name) =3D=3D (expected_size),              =
     \
                  "LUO struct " #name " size mismatch!")

For example:

struct luo_memfd_payload {
    __u64 pos;
    __u64 size;
};

DECLARE_LUO_SER(luo_memfd_ser, 24, 0, struct luo_memfd_payload);

