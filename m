Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945A606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhOW9luq;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=NGVrWQy5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=; b=WhOW9luqZLE59v
	mkHM/fnY/aNr1XDAf3x83D484ZQIFKCzN3ToY2t9V4ndoRxkpXLZ47jqjOVQEYv0Fd4hJk+76C6wc
	wJJ0w3LdtkV3PN3UYSlPvnyibdmT4oTZa+N8agmVAz7OfcHv1PqaQjfNYAQODoAVhgQOcNBvWldTY
	5Awy7STWlOppcz8y3pQgRcp+OLgSETYUQreNlrTo5NtxPylodeNIH4/yeAHn0wsTdrI2cT5A5Wi7W
	59iZVzLsSeVjA2l6J7ln8e313NKFaY2HdDZBwowPvMggKOnASNCfz8qE6Y6FYGQrr2/m5mGrqymfZ
	pTTLbdssu6kt2DMxJUxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4zg-00000001Qbs-2tQT;
	Sun, 25 Oct 2026 20:39:04 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL4ze-00000001Qb8-2TwQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:39:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so3340102a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 13:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792960740; cv=none;
        d=google.com; s=arc-20260327;
        b=S10TkeJntTEGFMMObcYIfXzVA2zWgr0hMc0SDKJZ4kohol1qcIdb5YHipUxL79cx+X
         ewD7NyRZuPD0fGbVWmagmOFm3rNb1fZKMO97W2yr6JL3hsdfVj2ITgHmDrwnZVZPKzoH
         JkeSM60q+IheIlZXXaPBh7ythKhJW0LF/qLsSd35P8hk58LUfIqaN411TIxuxoJ75E8C
         gHlJ63D9iyQLas+Oh5yn3lGmU8ksMkYfcBz+1TNhxDOsfbI70qYMNbbX7hwS4RE9gY71
         3DoBvRHjVyo/qR/lsmOmLmA9tOVa1gqunyiObwdLQ14Kfq9ayjp7Rk1lay2eZH75a1ad
         NtXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
        fh=RQTmjWJkPZMkEI2KdGQsPQH8Dmf504Dhv/nqfEfoB/c=;
        b=mff6ssH/Lw902HW4YTlJVXNgC1PnP4NLEZLdWi4A7FqO5Ntd6R8kbsdKMBXq7hVJMe
         NY5b9kh6UQGPqNIzAVTYWYhHs+2H2i858AwgjcrBe4jpuGLmvkE7iV7MkJwuCvEnzTy6
         dFAF8uBaPGE5US6OOZuOzz5V4JnFdS1mG/vCKmOUB6B0CaKeFcI7tee8IWDcyOzRoOt9
         QMkx4AB8VPEgT9AEc4K9N8qqtiABA9R2hoe5aiVZoHfnrRc5KaVRVFue4mL8pVVl4B1Z
         QEhkJstuXVV+cQvYdzbK+6H/XXqt2CZrjCiVaoDjN/YM2RdtM4oPn92Xj0yWwNcgWL6u
         U1gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792960740; x=1793565540; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
        b=NGVrWQy5y9xi7l0oONLhs/0WZEsfiIX0BK2cpofR01Iu7P4WeFQaE2TkBCiB2v4qxi
         OAsCuQzNOuEKpDxrGmCNyfaE6xPMj8z406RE8P4wcsxsdVNcrx4XXhnVAs1l2NJ7H6Q7
         AOCD6oz98f2pKK/wsdji45XLaM7CY1hfvwYV2LNvo07XeyQvbKWLek63iKvWoNrMeREi
         4KrMuEEfp64SDRMXP+O3XWDb3xBPij8DvmZCpUMnJiSML1ziCvNzlDmyx3Dmvew8ooPP
         q/ON18zQz64c0o0KiUfZ1kFwF6J9CE+/O/qo7VABLsEYcjgRDzpldOyQZnyPb/9IreTb
         /isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960740; x=1793565540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rp5Fden8a6neVzulsysbnvEXD4vRCF1NzLSbVrqKH4E=;
        b=jKuumgpvJr5dbgwbko7PcXapx0Qf2ZsOx4x0Dtamuvi2ZK7NQk0rRjz2Vygjisi4Ll
         NsC+nD93b8I1bOFSPo4oeWD86LxNEBC1b/RRmKArkX560Fum6GigZrfsGjIpmhqrL8pu
         tna8HEhLzgmVO3fj287yfvwKvEIFsqkCjbRe3ZPv5eH4JUaIooMN5b3iLIP0xUyWcVhs
         s+nxeoYOkaGhxD0i4Q8C+ko+7Zksp8+5UpZkuq8q5RcWUz47gxyAymL8EQ6tZQPU0ZsH
         3J0q5NSg3/F1IjcXToWYq1f1vgwlUMqGk+tN80gXC/wURRCtIrIk3s49n+40p1S8Uo7I
         eHbg==
X-Forwarded-Encrypted: i=1; AKwUvBy4volvDB7GfWX2MQMZJkGK+zSXvihCtBAgfOmhUAQut8hghQuxDQy/zzqUfOMTU2+BDmcL5UJGlnRemdj3AAe3@lists.infradead.org
X-Gm-Message-State: AFq9FYJI93rGReBB4dDKS03mAuecyXqrI72DlXzunMxy0d7L1RJBT4tr
	qR+GlvUjWpRr8UzMwCJZhKxnBFuiXU8nmJ/1v+CnyxwrP0mESoL3QetdSORqaXnsrOxWxUtPCid
	DliO/j5RGVhVrf/wmvNeEwexpag8v0HL5L/ZeSXIbdQ==
X-Gm-Gg: AYBFou0IV7/EgaAai9NOut84JMg0xi0LUDfQGz0/1o3EA5XLpvtA9pZIz9cdk4RgsAb
	cITV7aRW+zxZJvoBQb9qAl/7RsP26ZHjweClrlt/p95BsUSCbRte+gCjauLee3UJg+M8mPVbFxU
	hPpiqGnM8qUp4d2SIiUH0AniTDqOUQbsaS9znMtl+0oKsa4DSWYRgrLRfg6vwdy4NtKgeVV/iHJ
	B/Yk5nLWhee7gvH1yonbBNB6wbCy6JZFJluBXZUZEeukW2gpeSglYviP7gyuyyMJnTPt60CuKVp
	Ry33XioMnHlqJYpKa3dX24FUX5Vsb7l577hOSvVZ/s3mQ1Ndj7OV/ShQs8jwzum584JTl6MaYMU
	sW2Da2s4wbgbbf2dkW3nO6RhbiKdM3V2nVyaaj9Q+Alnvwu2vcOEtxEu/h66JiGXfjC6t
X-Received: by 2002:aa7:dd0f:0:b0:6b2:2339:370d with SMTP id
 4fb4d7f45d1cf-6b443000b00mr4543991a12.39.1792960740017; Sun, 25 Oct 2026
 13:39:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com> <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com> <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com> <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
In-Reply-To: <attmFVIFU_mS0Y7p@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 25 Oct 2026 16:38:23 -0400
X-Gm-Features: AclHuK80OiwlBnY6tUr3jZ6atHcY2MdRSOFYk5-Bhewn5rIfzUZ_oGQw-LNyjus
Message-ID: <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261025_133902_660139_AA6CF527 
X-CRM114-Status: GOOD (  34.56  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 9:50=E2=80=AFAM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-10-22 04:53 PM, Pasha Tatashin wrote:
> > On Thu, Oct 22, 2026 at 1:51=E2=80=AFPM David Matlack <dmatlack@google.=
com> wrote:
> > > On 2026-10-22 12:11 AM, Pasha Tatashin wrote:
>
> > > > Lets drop the fourth macro argument and generate the combined struc=
t name:
> > > >
> > > > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count)      =
        \
> > > >     struct name##_hdr {                                            =
        \
> > > >         __u32 size;                                                =
        \
> > > >         __u32 flags;                                               =
        \
> > > >         __u64 ext_flags[ext_flags_count];                          =
        \
> > > >         struct name payload;                                       =
        \
> > > >     };                                                             =
        \
> > > >     static_assert(sizeof(struct name##_hdr) =3D=3D (expected_size),=
            \
> > > >                   "LUO struct " #name " size mismatch!")
> > > >
> > > > For example:
> > > >
> > > > struct luo_memfd_ser {
> > > >     __u64 pos;
> > > >     __u64 size;
> > > > };
> > > >
> > > > DECLARE_LUO_SER_HDR(luo_memfd_ser, 24, 0);
> > >
> > > I think we are getting close, bu I have two remaining concerns:
> > >
> > >  * Reserving bits in each flags word for continuation leaves gaps
> > >    in the flag space that users have to know to skip.
> >
> > Yes, but callers should never manipulate the raw flag words directly,
> > and we can provide simple accessor macros or inlines that take a
> > contiguous feature ID (0, 1, 2, ...)
> >
> > enum luo_memfd_feats {
> >     LUO_MEMFD_FEAT_HUGETLB =3D 0,
> >     LUO_MEMFD_FEAT_SEALS   =3D 1,
> >     /* ... */
> >     LUO_MEMFD_FEAT_FOO     =3D 15, /* Automatically lands in
> > ext_flags[0] bits 0:1 */
> >     LUO_MEMFD_NR_FEATS
> > };
> >
> > if (luo_ser_get_feat(hdr, LUO_MEMFD_FEAT_HUGETLB)) {
> >     /* handle hugetlb */
> > }
>
> Sure but why deal with all the complexity just to save 8 bytes? All of
> these structs are allocated on folios and there are kilobytes of unused
> space to fit this header. And even if we optimize that we are talking
> about 8 bytes per FH/FLB... or 16 bytes for structs with arch-specific
> sub-structs like the KVM ones.

The reason I care about keeping the header compact is that we are
defining a foundational kernel ABI and want to use this header across
almost every serialized data structure so we can evolve them later
without breaking compatibility. While some top-level structs are on
sparse folios today, other serialized structs are tightly packed, and
we are looking to add KHO slab support in the future where tightly
packed allocations will be common.

That said, in your proposal, as long as nr_flags =3D=3D 0 is allowed when
a struct has no feature flags yet, luo_ser_hdr_size(hdr) is already 8
bytes and only grows to 16 bytes on the first feature flag. I am OK
with that.

> > >  * struct name##_hdr only matches structs written by the current kern=
el
> > >    (in terms of length of array and offset of payload).
> >
> > This is not an issue on the incoming path, we never cast incoming data
> > to struct name##_hdr or access ->payload directly. Instead, we parse
> > the incoming buffer, dynamically compute the header size from the
> > continuation bits, and cast the payload offset to "struct name *"
> > based on the negotiated feature flags.
>
> How?
>
> This is the only data structure that describes the header. Are you
> saying the incoming path will parse the header purely with a void *? Or
> use this header but just be careful not to access payload?
>
> We should have one header structure that can be used on the incoming and
> outgoing path. We should not have one header data structure that can be
> used on the outgoing path and one that can be used on the incoming
> path.
>
> Also we need a standard header that can be shared across all structs,
> not a per struct header. Otherwise you will need to do weird casting and
> overlays to implement the shared helper routines that parse it.

Having DECLARE_KHO_SER_WRAP() in include/linux/kho/abi/ makes it
immediately clear just by looking at kho/abi/ which serialized structs
have the versioned header and which do not, while also enforcing the
header when preserving and static-asserting the combined struct size a
compile time.

So with your header (and let's use KHO as we want to version KHO
structs as well):

struct kho_ser_hdr {
        __u32 size;        /* Size of header + payload in bytes */
        __u32 nr_flags;    /* Number of features encoded in flags[] */
        __u64 flags[];
};

The wrapped struct will look like:

#define DECLARE_KHO_SER_WRAP(name, expected_size, nr_feats)                =
\
        struct name##_wrap {                                               =
\
                __u32 size;                                                =
    \
                __u32 nr_flags;                                            =
    \
                __u64 flags[DIV_ROUND_UP(nr_feats, 32)];                   =
    \
                struct name payload;                                       =
    \
        };                                                                 =
\
        static_assert(sizeof(struct name##_wrap) =3D=3D (expected_size),   =
    \
                "struct " #name " size mismatch!")

On the incoming kernel we don't use struct name##_wrap, but we use
struct kho_ser_hdr for the wrapped data, validate the flags, and
unwrap it via kho_ser_payload(hdr) to get back the struct name *
payload type.

Pasha

