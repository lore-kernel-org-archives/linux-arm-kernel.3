Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14685606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NkcnNyU2;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Vx1y36EB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ixKouDoUlCLHB71PytJx4w1v0AUAxSqI48/quFxSDg4=; b=NkcnNyU29MAKx6d+PBX/aN+hP/
	VJ2993FAMr9LoX2/35E9XUWm0cRiWix+dEZdboEx+7dfdfXoPTYLrYRMDgHpl3F5Yp+j5EACln23O
	KXqqI77IhLm09m6qPmFfVMgvkRD9euMbNa5L4IWbeRzvlUQseQFhenArCoza7GIEYEVaEO6p7BCCV
	Bip2zVsTW+hep7Rh8tKrIbLW9682M1qidUwPhZ4Rs3QS43g/Ifd68I7FoZX5ngiD3Vw5kIKC52+Bt
	7IQhF2hXsR7nAwEZ3imDNUxCKFKwYJdxBc9qjQjJLnuqMrZYrY62wIjP2zleye2Ufinlgvn6rC5Di
	wF9GkDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLUcy-00000003UAa-0UXs;
	Tue, 27 Oct 2026 00:01:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLUcu-00000003U9e-1lDS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 00:01:18 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ab98332238so1969586a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 17:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793059275; x=1793664075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixKouDoUlCLHB71PytJx4w1v0AUAxSqI48/quFxSDg4=;
        b=Vx1y36EBrRfJr97k1SjUSWptWpv9yeOCyYtiE4N65xQB0Y4jQFS1xE5Y/yOoRLP4TA
         c2Yf0jzq06yv5y2XO5TTUxgJ/S/Pnn0mvk9f3AmvW4afwtR6Z3ukhvAciLM0ARWhCtRA
         eyQ/RwXmyqwC23KyqI1TbvIMnDZOTMIhNjVTBbBhaVi8i75PMV9X0iXlXq42bII0LN3x
         AxdVJZ/CkNCTp7Hf5BXtEJl6nbD7FT7ooL6hh12Ot4HSJWUL7fZg6s9ALPguCV2V5tLl
         ijEYcKoYaLZ3XQP6M7DL4rSLVWvDdJX+Sn4iV1XeUemFx7pQq0sySV0FlKmMJ53zVjsb
         jJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793059275; x=1793664075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixKouDoUlCLHB71PytJx4w1v0AUAxSqI48/quFxSDg4=;
        b=k0cK7zNaSH90v2/VkIAG9owoFgRCZt09n7X2asCbYPWqgxLIM7KGf429Z9dCbswHq6
         up00ZlMzqbU069u0wiV/MWdGeoqVPK8Y7yHr9tTbEPCUrBjzPDzrts5QTXfpNTJPM0dj
         M7B4vwPEh/u/Cb9ueHJR+fXUes30B3u+rU8twtOp7FL7d1VIdULabGLbD5ivIZfgpVCQ
         kERixrSfwYe/PWdXSmkgXOuusc4LYRyLoJZLf76TM8NuuB010FT2uUAade4yb3SJE9sr
         qxdD5CrxkSS9WKO4z0SLTlMr+iSoX9LatUqCbF5z13FBOjF9/yDnOWk3D7FObCOWp1Tm
         fp4A==
X-Forwarded-Encrypted: i=1; AKwUvBzyJcaCCz5hE6JAlXt79+9/6dAkpXAP3XH9stE5omyqTTG+HuJ59SWGxy26EFMtLpVJCGZHUhjtFPOb9gS0PI3F@lists.infradead.org
X-Gm-Message-State: AFq9FYLBYMninVAs8fJO4E1T5X1nR3NDvU+oQ9yZdoPN5zoS5xNK8YZj
	s1sWMuI+fqd711YludIp1d9BGLGY4yTO1aVKMKm/7Rwu4vEAiXptZY8DSCpGx60gKQ==
X-Gm-Gg: AYBFou2pWg5AGpcJcXfkljxVWN7WMDS85tnanVbxV8//ufrtS9R01GAdXaevoJ8DbTe
	lJUW/rTMfFEIDC0OpBu641lUZDKUaHDz0qSlySuIEH+qqyhtTZrIuswdxh+CeDR4ifiaoyD3/80
	L0ZMgGjE/jxxFrHp1vUgcsWmRFF6VGAZZWYy56C2f2aDI1l8BD+rLn5h/FHumAEaxvqHUGKFL4a
	Qtf53t27H+XMYvOUe/pwUMACmefZMgw/9c3ZdT4dC0yDHiP9jsEBZUr1YBYGX9sbAMTs/R2tOfv
	Ch3nBsLHaZxqK+30+WRHX1XFSq2J0NOuxI8XjWkLyDkTL/S/2EwScG7EdhPVUAiQ+ZMx4Om45vw
	a9zlLp/SR+Oyyd14n/skjMqy9COHAKcBbowkKihHhkxhTQDkVT0exBpbTpNGQq95J3YIkLqA6xs
	Hdbdi2aCz5tFROx54CHHMlrcaNjoZp+s0Gik0Z6ZAEhnzT2QKiND29xOIw6qJA4+8tvSm5xU25Q
	e795Ufw0AfI+tqpXj4Z1O8WTSXT1ky8uhdErGJgbk/YC0s9cEKx3rEBMq0ivAUjsTzAoWKaeKmQ
	UjXzYpSTHCRqATFI3ZT32yI4+ei+sM0D+bFUYOFTHTd0Hpv0aAOrYYYyqOmMs2B9t8NqeTU=
X-Received: by 2002:a17:90b:528c:b0:3a0:e4ce:31fd with SMTP id 98e67ed59e1d1-3adead444ecmr7102022a91.10.1793059274755;
        Mon, 26 Oct 2026 17:01:14 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4066cf2dsm1119900a91.16.2026.10.26.17.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:01:14 -0700 (PDT)
Date: Tue, 27 Oct 2026 00:01:10 +0000
From: David Matlack <dmatlack@google.com>
To: tarunsahu@google.com
Cc: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <at_pxoULR1Tp5anN@google.com>
References: <20261021152527.375070-1-tarunsahu@google.com>
 <20261021152527.375070-4-tarunsahu@google.com>
 <atlQ_Er0Ig7CCSxv@google.com>
 <CALzav=f00C4yOAseNunW8GgQTDUGWT927Qy=TLm-3-J0TEDH8Q@mail.gmail.com>
 <9huzzew0el59.fsf@tarunix.c.googlers.com>
 <at_CncIPYCxOVkLo@google.com>
 <9huzecdcghxu.fsf@tarunix.c.googlers.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9huzecdcghxu.fsf@tarunix.c.googlers.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_170116_458695_C7F58003 
X-CRM114-Status: GOOD (  40.56  )
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

On 2026-10-26 11:28 PM, tarunsahu@google.com wrote:
> David Matlack <dmatlack@google.com> writes:

> > But looking at this again, I think the required bit is redundant. Whether
> > a feature can be safely ignored is a property of the feature itself, not
> > of any particular file. Every file that has a feature present will have
> > the same required bit for it. The only thing that actually varies per
> > file is whether the feature is present.
> 
> The required bit is subsystem property not the per-file. e.g. memfd_luo,
> it is set at compile time for a kernel. So every file will get that required
> bit set. It is not per file property.
> 
> struct u8 memfd_luo_feature_state {
>        [MEMFD_LUO_CORE_FEATURE] = LUO_FEATURE_REQUIRED
> }

Right, whether a feature is required is a static property of the
feature.  That's exactly why it's redundant to send it in every header.

> > The required bit still has to be conveyed to the target somehow, since
> > the kernel that needs it is the one that doesn't know about the feature.
> > But it can be conveyed by the feature's number rather than an extra bit:
> > split the flag space into required features and optional features, and
> > assign each feature to one of them when it is defined. This is similar
> > to the required_flags and optional_flags approach in struct pci_ser [1].
> >
> > Keeping the same header shape as discussed with Pasha:
> >
> > struct kho_ser_hdr {
> >     __u32 size;           /* Size of header + payload in bytes */
> >     __u16 nr_required;    /* Number of required feature bits */
> >     __u16 nr_optional;    /* Number of optional feature bits */
> >     __u64 flags[];        /* Required bits, followed by optional bits */
> > };
> >
> > Required feature N is bit N of flags[], and optional feature N is bit
> > nr_required + N (using nr_required from the incoming header). The length
> > of flags[] is DIV_ROUND_UP(nr_required + nr_optional, 64). Both spaces
> > are numbered contiguously, so there are no gaps, and up to 64 features
> > still fit in a 16-byte header.
> >
> > Each bit just means the feature is present, so the truth table becomes:
> >
> > Source bit       Target supports  Action
> > ---------------  ---------------  ------------------------------
> > Not set          -                Accept: feature absent
> > Optional set     No               Accept: ignore the feature data
> > Optional set     Yes              Accept: use the feature data
> > Required set     No               Reject: -EOPNOTSUPP
> > Required set     Yes              Accept: use the feature data
> >
> > There is no invalid encoding left to check.
> 
> 
> IIUC, I believe this will not work.
> 
> To Communicate between source and target, We are defining a protocol, A
> protocol which will be standard for all the kernel. And each bit location in
> flags must have the same meaning in both the source and target kernel.
> 
> Now in you approach, If Source kernel send feature N to target kernel,
> target kernel must understand Nth bit as the same feature. Even though
> the bit position in your approach is not fixed but they are fixed
> relative to their starting point.

I think you misunderstood the proposal. I'm not proposing to pack only
the set bits, and I'm not proposing that each feature have a bit in both
ranges.

In my proposal, there is no such thing as "feature N", there is
"required feature N" and "optional feature N".  Required feature N can
be found at bit position flags[N]. Optional feature N can be found at
flags[nr_required + N].

In more detail:

 - Each feature is defined as either required or optional, once, when
   the feature is added. That choice is permanent.

 - Each feature gets exactly one bit, in its range, and that bit is
   always at the same position whether or not it is set. Required
   feature N is bit N. Optional feature N is bit nr_required + N.

 - nr_required and nr_optional are the number of features of each kind
   the source kernel knows about, not the number of bits set. They tell
   the target where the optional range starts and how long flags[] is.

 - A set bit means the feature is present in this file's payload. A clear
   bit means it is absent.

 - There is no invalid or reserved encoding to define. Each bit just
   means "present".

 - The target doesn't need a supported table. Required features are only
   ever appended, so it rejects any required bit at or beyond its own
   MEMFD_LUO_NR_REQUIRED. Optional bits need no validation; the target
   just checks the ones it knows about.

> For the current appraoch and V3 [2]. Think the below one as msb is
> required bit and lsb is feature present in payload bit.
> 
> 00  FEATURE_ABSENT / DEPRECATED
> 01  FEATURE_OPTIONAL
> 11  FEATURE_REQUIRED
> 10  IS INVALID (analogy: required set but feature is not present) which can
> have different meaning in future if in future, a need arises to reuse this
> field.

In v3, 0b10 is reserved and not checked by the target. That means an
older kernel will silently accept it, so the only meaning it could ever
safely take on is "safe to ignore", which is what 0b01 already means.
A reserved encoding is only useful if older kernels reject it, and at
that point it's no different from adding a new required feature.

> Deserialization can happen per feature from right to left. without
> jumping back and forth.
> 
> Because of all these reasons, I believe current approach presented in
> V3 [2] is the better. It is close to your PCI series with two flags
> field for required and optional except I combined both field into one
> flags. In your above approach you do have two counts but not having gaps
> (which is wrong) and the way you proposed to parse with an offset is different.

