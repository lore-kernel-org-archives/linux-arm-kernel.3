Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89110606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 02:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3hmIQLYY;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pyFKK/+4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EhJunI31x30V5twb29p5JvXR/ZnOh8avGc16eTeBG0=; b=3hmIQLYYOqBSBMoNtm9iNxTAiw
	LLb9CvQCP6yCf05Fd3Fi3XNqpqkCMAGIhBRsl693vLwm0g4eg42KhBrsTewkWMONV6mY2bLuztq03
	xfq8y+ZB9/LGq/Baa4kkHCWMH5pbgfUYOLFhFc4XWNiKFlUQ0TFYxrRlmzyaDKLS7lg5cHLl0pq4+
	3Up0Aq0LxBrSH3f4oClPFING4Jp2E/R8AzoqRxvcXpjJGl/3wmEmeOkWdYWgCyzkVhwmiF/umMWBd
	rRBSXZ44eBjdxazJ0PeXRTUPlXrWVIVhez5VL61G0XpyQNlgITobWYW4SeP7lxrzQqRL2W3NbTDjV
	mLlY8Z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj03-0000000DFFn-3fe6;
	Thu, 22 Oct 2026 02:57:51 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJizz-0000000DFEz-1VE9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 02:57:49 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so531474a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 19:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792637866; x=1793242666; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EhJunI31x30V5twb29p5JvXR/ZnOh8avGc16eTeBG0=;
        b=pyFKK/+4/ebrAtp3dbaTY+qsmEhwkNCEQ9b4yVpqwFg2ap5tZKpjujQroA+dpDqywI
         U6yv3MhUflSQPZ7/Tg9OQigOWobvd9VGqzZeO8GbwnMSDFjSyy/bT3/KfXBcyhZt1bFq
         5M8Kum9Ty9+lA1eqZagfQaZoMsKmOqqzYlFiOb3oTuVzpJqwVflswa+njG6ae7f1fQX6
         FE1SsG80goc+3PpqSLlJEB29Ni8NMVTlWc8c+RFYEE9a+RD7k/WYbhs9twOiPdDJYULx
         XZbdU8W6C25DTuLskCtKtIDr1J+wiT12lSYkBSwG6jxxE1QggAI1p8dnNkCz7tAHWlSJ
         Htew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792637866; x=1793242666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9EhJunI31x30V5twb29p5JvXR/ZnOh8avGc16eTeBG0=;
        b=KKCQuAb3R8Pmvkf1zaE1rcPl6p6RyftcN4nAGz1JiKVbhFXFdimJL5HjlDKH44XSuy
         fAApk+a8JuZH963gZHZLIwie3OWZemUtuuFuytBm4TZ+vtFLUTwzPjFjYO1cRrS5nkLy
         HFFxqjZKF4pkB0crfo8PyF5Ke0gDjZal1fiMCwNxs9E9jcj4Zs1TDyBW4xzbXp2JICSd
         CAqWNgVxuYOG+DZoMgXr7yYaoU0NUXNkM4oez4WASAIsI3LgQrfVPNRcjowkXCGJldPL
         AExZ23c91aWgG79D+tc8yYN8lv5BDjjbm1VxWw5DUPWzi0XHOei9Az8PxVqoYrQ4Bm+p
         dcrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy77JfoH8lzH1NWz7Z+sPMqm8EcqB5FRsTD/QxYq+yPy4nqi8J3EURPE1twShy5h4errvRW6yFvK0Nc+hyKlK8/@lists.infradead.org
X-Gm-Message-State: AFq9FYIbYLApWpNEWmvfEBa9rg3lK+og4a0w+WmK1FmBxkE0EQ363zO4
	u0XdmzY1jwQyLEadw8d+AN/AD1h6sD/5MoEyG9StVSsl1ZBgubrKaK/fCFAXlmYE8g==
X-Gm-Gg: AYBFou34c47p6FN9ALFWXz4/PFMo7I71UkZmQsS/cXK02WtdoBXCpgRVT9/rFg3Ol+/
	g5nUWMj5O+yGEObOcm7tB3T72Ti2nl6fTx2H2oqTq06UwcsoMpzJuJSVoPXJXTkHDQ/N3p0gU5f
	+xSdA273KZNN0Iz1z9aAlrivNFwimO716tDYS7RtJdrLcQeeJG6h6SqiuudeP5fKeOb5EFtQGF+
	irMFpwjomxnO1kdOS6Uh5GW7UABgnYah5GNmAg5i3Vve8udazWt2H83OVRqSaVYaBiHZIYKzGVb
	VircLlBYx7A5LuvwDoIBM+xUDFlFjNVlyLJfjqTVqD6zQGVlCYUZxPfUq7HHBH7LKB5i3svyYPV
	zTtRDbP4KkO7fNoo2oEywYm+d69c++kCgGGv3jP3iTFRFhF0OJ/J2RVZuJrbnE3nDIiS1E6TjwC
	jnUFQP3azRY7Pxs7suJ6cMuQqJBPt0PrrokG0PwxIqYXQpU5LNm9ZVYnrl3u3vZ6AGNlCLQ2x7d
	0mt1S8PyeQ/dp7SWIGUfrPwdQgXoiSUrp4ZRkdn7jw1uawwRNsYyBR8sNfp9d5SaTWOG365eZyV
	eZJ0wYHfPwqOToKS
X-Received: by 2002:a17:90b:3ec8:b0:3ac:adce:60ad with SMTP id 98e67ed59e1d1-3ad86e96c9emr2886416a91.22.1792637865925;
        Wed, 21 Oct 2026 19:57:45 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada495315dsm2092370a91.15.2026.10.21.19.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:57:45 -0700 (PDT)
Date: Thu, 22 Oct 2026 02:57:41 +0000
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
Message-ID: <atl7peoVHdP5hz7z@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-4-tarunsahu@google.com>
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com>
 <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com>
 <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_195747_403370_9FAC97F8 
X-CRM114-Status: GOOD (  42.74  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 09:26 PM, Pasha Tatashin wrote:
> On Wed, Oct 21, 2026 at 7:28 PM David Matlack <dmatlack@google.com> wrote:
> >
> > On 2026-10-21 02:50 PM, Pasha Tatashin wrote:
> > > On Wed, Oct 21, 2026 at 2:47 PM David Matlack <dmatlack@google.com> wrote:
> > > >
> > > > On Wed, Oct 21, 2026 at 11:40 AM <tarunsahu@google.com> wrote:
> > > > >
> > > > > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> > > > >
> > > > > > On Wed, Oct 21, 2026 at 11:25 AM Tarun Sahu <tarunsahu@google.com> wrote:
> > > > > >>
> > > > > >> LUO and its file handlers validate handed-over state with monolithic
> > > > > >> compatibility strings ("luo-v5", "memfd-v2"). Any change to a serialized
> > > > > >> structure, even an optional additive one, must bump the string, which
> > > > > >> breaks live update between adjacent kernels. Replace the string in
> > > > > >> struct luo_ser with a feature header, so that the target kernel can
> > > > > >> accept or reject the source kernel state per feature.
> > > > > >>
> > > > > >> struct luo_feature_hdr is a fixed 128-byte header: the serialized
> > > > > >
> > > > > > This patch is all wrong; 128 bytes is far too large. For every _ser
> > > > > > struct, we only need 8 bytes instead.
> > > > >
> > > > > NOO, It is not. It is intended to avoid complex mess with unnecessary
> > > > > over-engineering.
> > >
> > > 128-byte per serialized struct is not starter.
> > >
> > > > >
> > > > > >
> > > > > > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > > > > > 30 feature flags + 2 reserved bits for flags extension). The last two
> > > > > > bits of the flags indicate whether an extended flags field is present.
> > > > > > Each extended flags field is 8 bytes, and its last two bits indicate
> > > > > > that yet another extended flags field follows.
> > > > >
> > > > > If we will have dynamic extension of flags, Think about this.
> > > >
> > > > To support dynamic extensions in a backward compatible way you want
> > > > something like this:
> > > >
> > > > struct luo_feature_hdr {
> > > >    size
> > > >    flags
> > >
> > > __u32 size
> > > __u32 flags
> > >
> > > >    extensions  // offset of first luo_feature_extensions (or 0)
> > >
> > > __u64 extensions[0]  --> but the size should be specificed in
> > > declaration macro that I showed in the next patch.
> >
> > I think you may have misunderstood what I meant. In my proposal,
> > extensions is an offset to the first extension, not an array of
> > extensions that immediately follow the header.
> >
> > If the extensions immediately follow the header, then the number of
> > extensions is baked into the struct layout. Every field after them sits
> > at an offset that depends on how many extensions there are. If we ever
> > need one more extension, all the fields shift and old and new kernels
> > can no longer read each other's struct. That is the problem Tarun
> 
> We can structure it cleanly by nesting the payload: something like
> struct { struct header {...}h; struct serialize_data { ... }p; };
> That way, the header can expand dynamically at the front, while all
> fields inside `serialize_data` stay at fixed offsets relative to the
> start
> of the payload.
> 
> Since the header size is self-describing via continuation bits (e.g.,
> the last two bits indicating whether another flag word follows), LUO
> can
> easily compute where the payload begins in the incoming blob. This
> keeps the implementation simple, avoids linked lists of offsets.

Oh interesting. I agree a dynamically sized header at the front can work
and is simpler than a linked list.

So the header and the payload need to be separate, and the payload is
located with pointer arithmetic on the header. For example:

struct luo_ser_hdr {
    u32 size;    /* Size of the payload in bytes */
    u32 flags;    /* Bits [31:30] indicate an extension word follows */
    /* u64 extension words follow while the continuation bits are set */
};

/* Size of the header, including any extension words. */
size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr);

static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
{
    return (void *)hdr + luo_ser_hdr_size(hdr);
}

On preserve:

    hdr = kho_alloc_preserve(luo_ser_hdr_size_for(nr_ext) + sizeof(*ser));
    luo_ser_hdr_init(hdr, sizeof(*ser), ...);
    ser = luo_ser_payload(hdr);
    ...
    args->serialized_data = virt_to_phys(hdr);

On retrieve:

    hdr = phys_to_virt(args->serialized_data);
    err = luo_ser_hdr_validate(hdr, ...);
    if (err)
        return err;

    ser = luo_ser_payload(hdr);

What would size mean in luo_ser_hdr? The size of the payload or the size
of the combined luo_ser_hdr + payload. luo_ser_hdr is self describing so
maybe it's just the size of the payload?

