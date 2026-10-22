Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FCD606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 00:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ID0fZ2tn;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LAaKdol+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voL3QXhcF0nQ+Bl+k+0kNlvS+kVkqIaUYWi4xHN4x/I=; b=ID0fZ2tn6wzs9V2CDpOGOUdtjU
	XXteFQtXl4Klg62+mQuec7SqQi27LLl6kG3Xa0wzpOqK597jXFKJjxa3tgDxgmbnXwjan4inHBENn
	ja5XUNyitgTeuPUbTNh9Qdii9wVawTTP/cKn5Pj0snxNZacyJT2kdYpdwuO4HbjMONUpceEbHQrbk
	uNext0VrK4vECBfC+v0hfmoGsKcfl1SxEziF/+omAcx0lcWZlEpNHNR2jkmzyueyqDoctGleD8G2c
	FR0gZv4Tq6AoJvyxOIL8C131CLxYe/e+EIs4zUP6MVs9SfYaOYQf6OO2sCUpcNTuE0R6B0rIvxK1F
	RNsKP7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgIh-0000000D4pu-0kDT;
	Thu, 22 Oct 2026 00:04:55 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJgIe-0000000D4pD-3tsQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 00:04:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c4395d31228so182628666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 17:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792627491; cv=none;
        d=google.com; s=arc-20260327;
        b=D/MBoadW4Bk8rzxRMEH3UlTaL24RZe/s4/SuZDOBTkikZ7CnK4wGuGt0Cn4qZDdSzM
         jdcAIpJTZV044CPMASFtdNc27BiWB9OpM8l9u+ZKIReTmStdjraDsawX7h7wAlFzBCTL
         08VgG2QDiMrguyoYR0y47MojQyNABxNtR+E13Xox6VXu4P+dwUR3hzA0AlLX40mc0noE
         srL6JdpBECV27GEfQ3d0yHQC5V4N7L+HoOMYoOEhMGACs2Z08/937uwJFirI8RFJ1aOz
         zihhQ7mBrL5zIr9HhSSwQHg0diI8AO5PV2dl9pB9PtqhCnBLKEzUWMUt6dzKECInujWK
         Okdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voL3QXhcF0nQ+Bl+k+0kNlvS+kVkqIaUYWi4xHN4x/I=;
        fh=kQc6MsK8nFNghtIuJJ/4WsL7RFhavDgwtj6L7cKwqPs=;
        b=Yasy2T9B9b3nADBFv5xOORsXQuLjWJAlJzPtfV5cyoqvXOdISHhK/2KQfQmQDV1wHe
         ESiXQNfpc5eCWzJpgVjzy3wiQDXXVWJt5SVC236CAmXfOhCDR905HRdVsd6yGtRdYKdc
         LuB0kGg/Inda6CpoLuSGSQIC6UvU84xW4GpOZoESLliY3BxhSZ3PHR0uFYgOXzdb9a79
         +ndsV9Q8A4s6ok8MMrKkY4zBJ+lz+EE8rxQ0wonyT/UAXHEpz5jR17/k3nKp1Y/bft1A
         aZvvQPQNwrLUSU7pPrP1Szdq0ALeF9qsh3nS/umHYQg+70Xz2OqtvEiM4+ripgPIUYy0
         vGOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792627491; x=1793232291; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voL3QXhcF0nQ+Bl+k+0kNlvS+kVkqIaUYWi4xHN4x/I=;
        b=LAaKdol+fgzKCtTG2AvQ9KRtdHNPN0BPksrjTtBgQESkxGh+Tnx7ugAP+widXRr5yk
         qR9hHWFptC1TxjLRw89XW+UgJBPSTLU51mGFOa5Av/1mjDQUAGs5jGUNoT+HVZUHSG65
         jR0hQqJ1w3KQ07Em1dlEJ7wjM6LAR10RdvY9jqUpf8xzct0qvpoXctN/84N10Dqt+j83
         E9rmNlS/SIG2cZ2B71tMeT1hHqQ6DyynOlp/MAQAeioh5L6eV+OgWs0IYR2pxrvwqGrM
         g7sNer42C5CDKS8aUIoR0W3gUjfvplde2nTlOCe/Rr6klu2PtfgteLZNkeFP3rWamunQ
         TPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627491; x=1793232291;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voL3QXhcF0nQ+Bl+k+0kNlvS+kVkqIaUYWi4xHN4x/I=;
        b=wNdds6l6bH1gLvVRvUVvENYboMSYWlVtHJINs1fQSAritGJb0w6dcFyhrImCr2VHrv
         9M3nNWiZ6k8K+z0E6rwHp1F1h6S1GEsTCTKwVjQQYH4CEeu+NunIFG4WbCS/JRvpMfsh
         iTPJaTXAAYd07z4gBFf31t557Mh4EIq/gfEZNlEP/vzLgKeFOGIsr3DPSesE4m0XSX1/
         NdEEiI/BtpEKJezLBCTNhP290qECtuKvU8bRWwK+A8fciR9bfPRynLh2msg1ccvAsyyT
         bHoL1zOYSjz1n0g+nBU/IP/D8VOrB/gxYUaPRL5o8M7+MjxAh0Iupg06NFzEnZUtXYWr
         L7Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwsbhTHRHjXlK6H46Hj9AqWMwERSghEXwUp7FxBJV/aUPgMwFj4QgLqcoMZbrfUEvOgFsBnZ+3knLvV6vmEmuam@lists.infradead.org
X-Gm-Message-State: AFq9FYLBSwD+2AUvep1EZcE3CqSDDVLb8gBoZe6s4hYF/WCG6XPYG885
	PdwA+sEltEM7yxsqfkyaPjmqa95xmOqSDGAqaZuHMArx/Et6n/NKzUdNc5r+uYvg/VL2DaziviO
	KsOtTZ9CLmP48Or9nyLFi4heqn1PX0S8Id5EhATCu
X-Gm-Gg: AYBFou2CRGhw9Z5JSnrmPDdN/14rny9+mScWw9Ds2B1qBU1+n0/AqCqyyHbiSBELg5A
	HOEGrSW5JeW6nVAo5s6dcsCo2qni1tfdMWPFX8sNPuBgUWH+IFjeL0oL00e0BzYlS5VB0+zPQNP
	kHclxy1r36ObhfznKDfFRRV2+/nCX/qPEWMcNVU4Aw4D2OLd+gKo8DywIIM3HYFYqEpXSVTKWiZ
	Ra44WxLpcvsZ+3oU5G8z+KeXs1nkE7HI0IaBqrbN4ofjHP3HiEaZyd1XEH8tI6HZD/VvwD4aCFu
	CzTbBURdxADz2tB55IjGxsXh+ANIS+zHyygQiQEB/1m7Rsj8mJCSdlzU4mb9mK1XZ6qvpG18Rkg
	Bu1oKwmMmfPU+I8uxoqUUvaQCF1NTpulSkCGtFw==
X-Received: by 2002:a17:907:86a7:b0:c34:cf13:a930 with SMTP id
 a640c23a62f3a-c4679689896mr324348966b.34.1792627490183; Wed, 21 Oct 2026
 17:04:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <atlQ_Er0Ig7CCSxv@google.com>
In-Reply-To: <atlQ_Er0Ig7CCSxv@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 21 Oct 2026 17:04:22 -0700
X-Gm-Features: AclHuK9LuxkFhyY58-PllQ_xn35qEFAv5-F2hDjCZHaof6GARbd972qVOi8lSVA
Message-ID: <CALzav=f00C4yOAseNunW8GgQTDUGWT927Qy=TLm-3-J0TEDH8Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, 
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org, 
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, will@kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_170453_011610_31492493 
X-CRM114-Status: GOOD (  38.28  )
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

On Wed, Oct 21, 2026 at 4:55=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2026-10-21 03:25 PM, Tarun Sahu wrote:
> > LUO and its file handlers validate handed-over state with monolithic
> > compatibility strings ("luo-v5", "memfd-v2"). Any change to a serialize=
d
> > structure, even an optional additive one, must bump the string, which
> > breaks live update between adjacent kernels. Replace the string in
> > struct luo_ser with a feature header, so that the target kernel can
> > accept or reject the source kernel state per feature.
> >
> > struct luo_feature_hdr is a fixed 128-byte header: the serialized
> > structure size from the source kernel followed by 15 chained u64 featur=
e
> > flags entries. The fixed size keeps payload field offsets identical in
> > every kernel, regardless of how many flags entries a source kernel uses=
.
> >
> > Each feature has a 2-bit pair (req, active) state (enum luo_feat_state:
> > LUO_FEAT_DISABLED, LUO_FEAT_OPTIONAL, LUO_FEAT_REQUIRED). A flags entry
> > holds 31 features, and bits [63:62] =3D 0b11 chain to the next entry (4=
65
> > features in total). Each subsystem defines its feature states as a
> > static const u8 array indexed by its feature enum, which
> > luo_feature_hdr_init() packs into 64-bit flags entries with
> > LUO_FEAT_EXT_MASK chain bits. The target kernel validates the header fr=
om
> > the source kernel against its own feature array via
> > luo_feature_hdr_validate() according to the per-feature (req, active)
> > truth table:
> >
> >   Source Target Action
> >   (1,0)  (x,x)  Reject -EINVAL: invalid source kernel (req without acti=
ve)
> >   (x,x)  (1,0)  Reject -EINVAL + WARN_ON_ONCE: invalid target kernel
> >   (0,0)  (0,0)  Accept: feature absent
> >   (0,0)  (0,1)  Accept: feature absent
> >   (0,0)  (1,1)  Reject -EOPNOTSUPP: target kernel requires the feature
> >   (0,1)  (0,0)  Accept: ignore payload data
> >   (1,1)  (0,0)  Reject -EOPNOTSUPP: source kernel requires the feature
> >   (x,1)  (x,1)  Accept: use payload data
>
> I think we have different definitions of "required".
>
> In the PCI series [1], required and optional flags describe the _data_
> the previous kernel handed over, not the kernel itself. A required bit
> means "this preserved state depends on feature X; a kernel that does
> not understand X must not take it over". An optional bit means "the
> data for X is here, but you can safely ignore it". The source kernel
> only sets a bit when the preserved state actually uses the feature.
>
> It's up to the FLB/FH retrieve how to handle the scenario where a
> required bit is set that the target kernel does not understand. For the
> PCI FLB we panic since failing to adopt the PCI state could lead to
> memory corruption as preserved devices can be doing DMA.
>
> The target kernel never requires anything from the source. If a
> feature is absent, the target kernel must handle that, e.g. by
> falling back to default behavior. If it can't, that is a compatibility
> break and should be handled by the compatible string.
>
> In this patch each kernel has a single static feature array that is used
> both to generate the header and to validate the incoming header.  So if
> kernel N marks a new feature X as required (so that older kernels reject
> data they cannot understand), then kernel N will also reject every
> kernel that does not have X, because of the (0,0) -> (1,1) row in the
> truth table. That breaks forward updates from N-1 to N, and rollbacks
> from N to N-1 even when **nothing being preserved uses X**. Therefore,
> every new required feature becomes a compatible string bump.
>
> I would drop the target-side required state entirely and let the source
> kernel decide which flags to set for each Live Update based on what is
> _actually_ preserved. Accessing a field added after the original struct
> then always requires checking its flag.
>
> At the end of the day it is up to userspace to never start using a
> required feature while they can still rollback to a kernel that does not
> support it. Cloud Providers know how to do this since Live Migration has
> the same problem. This also means we must be very careful when adding
> new required features, as they need some way for userspace to explicitly
> opt-into them. I do _not_ think we should try to have some generic LUO
> opt-in for required features. That is up to the File Handlers and FLBs,
> as they have their own uAPI.
>
> [1] https://lore.kernel.org/linux-pci/20261013162529.1928093-1-dmatlack@g=
oogle.com/

Oh and please see the follow-up PCI series to preserve BARs and bridge
windows for some examples of using optional_flags to extend struct
pci_ser with additional data without breaking backwards compatibility.
e.g. https://lore.kernel.org/linux-pci/20261019213054.3157159-5-dmatlack@go=
ogle.com/

I don't yet have a use-case for a required_flag.

