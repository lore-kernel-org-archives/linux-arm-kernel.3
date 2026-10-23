Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xP1YC1T0;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kwfX6exM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8FyuJnnll3uJwbR+wT99CVBO9fzREsmjzeqnUECMRTY=; b=xP1YC1T09pirlF7o5w2xCg+RUX
	eDfaTyyENIjjUodSGPmb96jzmXON1pXYyTTRH4+YQCBbYDtFj7BiSf+NvLrHCbTRDXFhHcUjRom1S
	6lF22OAlar48jgEg6ANFyVDmZkThE8pfFYlfWrV4e+FPMJ9i8zGsYUPQyx6xWaiCbPlGNxtx0XXTi
	KQMUDJyjl58btHN1ok31EHwqLYSrHg/zsIdALrIO9HgWPvvsCLZmnIbPTTIPmut6iV03iao9PUbCK
	PBa6bsZ8p0Gy+1yaa2xMyWB68xUdmlr7/lrYPOgex7Z07UAkEDejlQL8uhr/Xz76vUitX9qgIzFVb
	f46r5wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFf7-0000000GRWF-42Bq;
	Fri, 23 Oct 2026 13:50:25 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFf1-0000000GRUn-1WVO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:50:22 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cd633ef819bso405836a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792763418; x=1793368218; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FyuJnnll3uJwbR+wT99CVBO9fzREsmjzeqnUECMRTY=;
        b=kwfX6exMMhD5t9WU8x+8MW+gWvrzhX3L/ozRGngZWfDl5OwoqfbY5R0hPqRSPnSmJv
         60v2sXfXX8uaBjBzwr810ZfZ0Af4c6PKMwSHxSIOAu2ddkUi7ELdQp3eU9fvSLEokCue
         i5VmpB5XfPdqLjq7+1Gl6uBIn0P6pU66fQCfOO1ZadRSciamtl3524NONzNXJoRwtArY
         a6cXTD56sTwnrp1zAaqbvXC7TULnC0CTW3hZHIhTS5uXeFa2/fllxwaGKHAAruAwpB0X
         cuUWXu5CMqSwlN3oKQ2X5MhO71l1Zz23ZENfGhhKm5qS82AVvM2euRb7XCf3lU5zzTuy
         oLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763418; x=1793368218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8FyuJnnll3uJwbR+wT99CVBO9fzREsmjzeqnUECMRTY=;
        b=xs5EHe6htPj6wzZwd6t+0ExkHCCk37R2iqxz9dZJ92Zt2523IW9j4J/bGUNwclMsSa
         ly646r3k+51/q+VGd/0dOTFfqnFZPVXWo2/cE4lH7lxr+MSSHjiSH9VMoOub+zgu1gVa
         d2ISLms2D9gHccBvXEsueF1Wi2xT4XpQD5rauA4iLKfyatUJhfWa2XDv+ml1Ntn9kMs7
         MUFS0J1LLAa1s3dXYi3eAx+g598lzGvaCKc9AajIrszXbBLnEocadtV07kaR5DSVZYTD
         oQ641xTNk+vVI45MYzePXaqC0AI8G1VPX6kmsZP82a6en7PXp/STEX9UyWOmqyOFUDS7
         Vj5w==
X-Forwarded-Encrypted: i=1; AKwUvBx/VE1F57TIhdJhWC05nfpCr1bYuV3+o9XA/UI5W3NIBF9QkOc7ks+2ajJJ+E7tYN5TXNmBePaJ+VpShsDECua4@lists.infradead.org
X-Gm-Message-State: AFq9FYLtC5QxneriAU21giw0EAusS0hvVy1KXS9Rxzo6BkrzQuKEoRuI
	H/3NR009ISyhSNc98X8hFRvG7Wb9HnCl38+7SGsdQ5oJCoQFg1yA+uisH1OleUDTTg==
X-Gm-Gg: AYBFou3ZiRQRiK9GmyyC1URYPVtnrSDgG8CderhUiM4rkObO1yzFEl+2Rky6Tc5WqPB
	9DaIMCv2rNE3lqgdr22nOHedUiNIuaVCTeGIZYBo2OTK4slzVnuUTipMUaB0g0TTNbgJNOLOLxJ
	bS08C8i6At3qb00orwxmwP0JucZyTigMNvEbAtRMbk7luHNogKEFjGovqqzjujIwaM4OctNnmSy
	N4wo3tqu3w8DKXVNqc9qCEpjJHdQVRe0oB1AcZZAhX9bLTmlvoCh6VexX30nUnM/mswkgF8as+a
	FhI5/CEEXqITHy1wDEATXIXip7MX7DVuu15FzklaCkEqyue/c/P1X38U499U9jyreeMB53K1wrq
	V4luM1hLJyrgiNTWVlA2vAovT83TcfYmRlLcugaWnx3w/maAw0CdwiqmG3MdFpEl+GQiSOxNxUj
	MXh0k4xtQHpBBuPBDG0DHAiwPzQ8xglgN8IDKL1BDwqoNe655eah9sbX2z6sfKgJmMXyabQIkwY
	JvUwRWVYpOQype7veVrZIzwM862KeMDcyxcwlKRf8B2scUTdQC80hY9qyv4Pm5ISNGvAJBJUaBS
	jI9OY52kDQq38zGAH9RH6250KxPYXIEN5EwvxQ==
X-Received: by 2002:a17:90b:5906:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3adce0073a2mr1983207a91.29.1792763417701;
        Fri, 23 Oct 2026 06:50:17 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea94677c91sm545015ad.4.2026.10.23.06.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:50:16 -0700 (PDT)
Date: Fri, 23 Oct 2026 13:50:13 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>,
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <attmFVIFU_mS0Y7p@google.com>
References: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com>
 <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
 <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com>
 <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_065020_777585_B313D61A 
X-CRM114-Status: GOOD (  41.22  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-22 04:53 PM, Pasha Tatashin wrote:
> On Thu, Oct 22, 2026 at 1:51 PM David Matlack <dmatlack@google.com> wrote:
> > On 2026-10-22 12:11 AM, Pasha Tatashin wrote:

> > > Lets drop the fourth macro argument and generate the combined struct name:
> > >
> > > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count)              \
> > >     struct name##_hdr {                                                    \
> > >         __u32 size;                                                        \
> > >         __u32 flags;                                                       \
> > >         __u64 ext_flags[ext_flags_count];                                  \
> > >         struct name payload;                                               \
> > >     };                                                                     \
> > >     static_assert(sizeof(struct name##_hdr) == (expected_size),            \
> > >                   "LUO struct " #name " size mismatch!")
> > >
> > > For example:
> > >
> > > struct luo_memfd_ser {
> > >     __u64 pos;
> > >     __u64 size;
> > > };
> > >
> > > DECLARE_LUO_SER_HDR(luo_memfd_ser, 24, 0);
> >
> > I think we are getting close, bu I have two remaining concerns:
> >
> >  * Reserving bits in each flags word for continuation leaves gaps
> >    in the flag space that users have to know to skip.
> 
> Yes, but callers should never manipulate the raw flag words directly,
> and we can provide simple accessor macros or inlines that take a
> contiguous feature ID (0, 1, 2, ...)
> 
> enum luo_memfd_feats {
>     LUO_MEMFD_FEAT_HUGETLB = 0,
>     LUO_MEMFD_FEAT_SEALS   = 1,
>     /* ... */
>     LUO_MEMFD_FEAT_FOO     = 15, /* Automatically lands in
> ext_flags[0] bits 0:1 */
>     LUO_MEMFD_NR_FEATS
> };
> 
> if (luo_ser_get_feat(hdr, LUO_MEMFD_FEAT_HUGETLB)) {
>     /* handle hugetlb */
> }

Sure but why deal with all the complexity just to save 8 bytes? All of
these structs are allocated on folios and there are kilobytes of unused
space to fit this header. And even if we optimize that we are talking
about 8 bytes per FH/FLB... or 16 bytes for structs with arch-specific
sub-structs like the KVM ones.

> >  * struct name##_hdr only matches structs written by the current kernel
> >    (in terms of length of array and offset of payload).
> 
> This is not an issue on the incoming path, we never cast incoming data
> to struct name##_hdr or access ->payload directly. Instead, we parse
> the incoming buffer, dynamically compute the header size from the
> continuation bits, and cast the payload offset to "struct name *"
> based on the negotiated feature flags.

How?

This is the only data structure that describes the header. Are you
saying the incoming path will parse the header purely with a void *? Or
use this header but just be careful not to access payload?

We should have one header structure that can be used on the incoming and
outgoing path. We should not have one header data structure that can be
used on the outgoing path and one that can be used on the incoming
path.

Also we need a standard header that can be shared across all structs,
not a per struct header. Otherwise you will need to do weird casting and
overlays to implement the shared helper routines that parse it.

> > How about this instead:
> >
> > struct luo_ser_hdr {
> >     __u32 size;        /* Size of header + payload in bytes */
> >     __u32 nr_flags;    /* Number of features encoded in flags[] */
> >     __u64 flags[];
> > };
> >
> > Each feature occupies 2 bits of flags[], so feature N is always bits
> > [2N+1:2N] of flags[N / 32], with no gaps:
> >
> >   00: Feature not present
> >   01: Feature present, safe to ignore if not supported
> >   11: Feature present, must be supported by the next kernel
> >   10: Invalid
> >
> > The length of flags[] and the header size are computed directly rather
> > than by walking continuation bits:
> >
> > static inline u32 luo_ser_nr_flag_words(const struct luo_ser_hdr *hdr)
> > {
> >     return DIV_ROUND_UP(hdr->nr_flags, 32);
> > }
> >
> > static inline size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr)
> > {
> >     return struct_size(hdr, flags, luo_ser_nr_flag_words(hdr));
> > }
> >
> > static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
> > {
> >     return (void *)hdr + luo_ser_hdr_size(hdr);
> > }
> >
> > and bounds checking is just luo_ser_hdr_size(hdr) <= hdr->size. The
> > payload is always 8-byte aligned.
> >
> > Payload structs are then declared on their own, with no header:
> >
> > struct luo_memfd_ser {
> >     __u64 pos;
> >     __u64 size;
> > };
> > LUO_SER_ASSERT_SIZE(luo_memfd_ser, 16);
> >
> > The static_assert covers the payload to catch embedded structs changing
> > size.  Asserting the header doesn't add anything since its size varies
> > by kernel. And because flags[] is a flexible array, the header can't be
> > embedded in front of a payload in a combined struct; it can only be
> > reached through luo_ser_payload().
> >
> > I think the only downside is that the header increases to 16-bytes when
> > there is at least 1 flag. But I don't think we need to be so concerned
> > about an 8 byte difference...
> 
> I would prefer to keep the default header at 8 bytes. With 15 features
> fitting directly inside the base __u32 flags word, adding the first 15
> features to a struct keeps the header at 8 bytes and does not shift
> the payload.
> 
> Computation-wise it is also very similar: for the 99% of structs that
> have <= 15 features, LUO_FLAGS_CONT is 0, so computing the header size
> is just a single bit test with no loop. Even if a struct ever needs
> ext_flags, the loop will walk at most one or two extra words.

Please explain why it is so important to keep the header 8 bytes that we
have to jump through all these hoops to map a contiguous flag space
onto a u32 + u64[] array structure where certain bits are reserved and
have to be skipped.

