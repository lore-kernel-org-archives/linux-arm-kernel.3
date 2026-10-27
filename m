Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B10606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3jLYY1A4;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZTglpC/5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=; b=3jLYY1A4kUTm+/
	3ntcHG6OuzpQoy+Vheq3kE5lsh3hdLvxBwljCSJ/QuwwRaAvumRxroZeWzaTUj3WfE2g74Z3mzyA4
	f+8z2ZpBr1AH7B2EqlQLkS7XwLY6q0i/KtQVsGFmj799uNqHcbpBIhCDLJewlq2+2ih/qWC/R1QeR
	8gsidIJQC8L4ujRwQU1tx0JyufI7sJQb9ZyWaLZQn4FqNn84dIPCe2qQswXhsPU9BFxbNKJRZ2u93
	NU+Nae4+glcQoyReG/WNGU94yk2qDBvsSMCcrBaOt5bOE42rci4toTpQh9jSpZ3d8BcoZt1ns4EpL
	YWZHgBo5E/914FSSYZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLl81-00000005TpK-3aeG;
	Tue, 27 Oct 2026 17:38:29 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLl7z-00000005ToY-30kl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:38:28 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c34bff61551so10286466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793122704; cv=none;
        d=google.com; s=arc-20260327;
        b=l82pjpc2MqXjZZzanQ02CSY2Vm7kzaZ6QKcSjq5VurXNnFTw5sl4MxxBsS65utgG3s
         gApNk/ioC1s5bnXuKRxQvyRJu4HfVGtCBm+dugRQGOsjD9EVwqFZoUZ/CbSHwwbjCU/O
         nSO7z/0y4mud/Kk1mN+gAkuLCS7W1TZGccyzULp4f3Ljl5z7ZyZRdJAkqCZ5BWiSd8j4
         egnixSzb9YhgxNDaf2Jvd7sAoqOpxlpNfEIXIU8A6y6y4NrWb6BclKSBcjQsPsAdqH09
         5i7rgczIqDmZagXMrxLbJW7GyU4fTjJ5aJgvyQ0GepdovmRW1R3eFIjKv8cyTf9iWjvE
         d2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
        fh=wxfBCU7q4w9BxYDgtvewDf7Nd0x/cgQsVJbqf/Maozo=;
        b=TFrkKrJ688sA2YTbPQqiEEKtDtDj65FHUIYfwYpOp81gHdJJSJKx//aYKBMn0dKMya
         ubQLZ8WuFqWLEzkWUoIsiUfvfjQqBD5vHwhkZ04336U+RNFFk/XBOU9Fw6g7fVwDLZoK
         N/vNCbBUE5ACcqCe7P1sOt/7QL2uKuRm3ovr8t3FuCeEHkneBCFNCga8CcbLTWtJzQmA
         e2Amj6mvD1xZgluHoPIRVJ0GhdzsYVxBt44oNsTbSMEsoDjGB34l09e/kJwg8nv+lSNI
         sM9E5aryQHLRdtSVYwLG/o3zpyLQFpWIKO+Ew5h80U8Vny5ry17hSj1j91VO6nkFSyC1
         l5Mg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793122704; x=1793727504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
        b=ZTglpC/5+Mj/LMpEu5lrM7ARVq/dpB5Pr1zVWgY8yv1XHp2vfK6BH4e88C6t1TXx0A
         xDeycSBvY8a9oOjYfigQBOccz0GxTMSzu5BJhLo3joR7BBA2P4mbclXqeddo1e/W9/t2
         9GA/mC4OiUIdFIhTHR/RVFVJVfZWRFiO6nHZf7BlENaLrK3aRwfcdfiiUOTTEya5HQ0n
         yOFe5yZ1UwcJH+w4WKp8mH6C36bB4oWJB4KabSCzr5vfwjHZ8XD8j94G2ByyGhI0j5YZ
         G4R0FkeLloDLYAG3IIZ89GsofjMO74hc+3m9+OgJLmrFAs3hy5dVOm9yPfSpoN6S+dlj
         voMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793122704; x=1793727504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=75xnGPQfUpxl4aF5uqa7AQlJeR6+8S5bvRDT/N741Fo=;
        b=SvajHrGhreExCPC6k+sOCgtJuEY93G6lEkpaPucUBFyAw5M4aHxI1DgFYC3FNaRNdl
         IL94A4dAl5G1Vk7mqPQe5Txug9PccAgeA+9rlSPRa8K/NvCLnFswZFEjwio/vaqeT/Xy
         WsD11Vt8wpEr7pWNr2qOKKd9mktpxjnPYve4P6qtNfmTWIWZef66dru/Sm/Bs3LNjI57
         xLLvMFCzr9NjrKt1fjWJlBAXTFp236Xi45ku2loz3xnUB9IBcD2TFwOML3drueucFK4i
         My45k9upcplrM30ZcNPcGBbUjao/FuAWVtQ8BHpX4pD9JMacWe3ZfaW2nFRgxpaWjZBJ
         qAew==
X-Forwarded-Encrypted: i=1; AKwUvBz+BSrCqrRO0yVn9pKDTqYRQQwBx2aSskW4CKcWkcfs6FDDWmbm+O4RP4nl2RsGyIzHVmuNjIFrENXxCa0+hCFK@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0ANTgcOLRuaH90JiKR1GyHNbJThXtbuq2RoEcVOabL7iX67a0
	vRQLYucWK+SGuadM/4BLbIe8iodQ98oEeAW20Qa5kZPZjoep40xHSWoSnxHaQ4J25ZNf5WSISqZ
	VqvppgoVknIW7EwqKD4HDXHDXXLTCGcaHcB/pykNf
X-Gm-Gg: AYBFou0QbQjshdpNvWF5+dSWPE4UTCgol2pcVJyAQm6/zd/89B57FHwY4SGz8UzWCTW
	bjC5aUemjC8QY5zA9Z647yEo528ZBrvp5PcVlhnIz8WUkZcZDJQNltRf2jKWBzdzOOPHL17ik0S
	dGvxczKAanCRWLCReO5SLmDP/D350daZnAdfNGNu5zKME0Fkal0nmY8lfU/gbhovuDS9mpadEDN
	n+rKbYP3TJ1v2yTQUZAkjIr3IN9MJXMtqoMxvNOKgK6NbNXSRS0iFfJBPhNlen6LALHkLXUD1gP
	uvK7i0zJp/bv3Z0xdHv7VFgFBlTINDN3XL3xKpL89DJH6MgvlxcavtrUYF8PHCnnJ4WSu+4YBt4
	mOv+5N4nAZBL10Xl5JA3LD4cSUVPHbB9wXe22IA==
X-Received: by 2002:a17:907:d308:b0:c2e:378c:8ce3 with SMTP id
 a640c23a62f3a-c46bde8c44fmr1091193766b.32.1793122703439; Tue, 27 Oct 2026
 10:38:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <atlQ_Er0Ig7CCSxv@google.com> <CALzav=f00C4yOAseNunW8GgQTDUGWT927Qy=TLm-3-J0TEDH8Q@mail.gmail.com>
 <9huzzew0el59.fsf@tarunix.c.googlers.com> <at_CncIPYCxOVkLo@google.com> <auDT5MjXYq3lcQjE@google.com>
In-Reply-To: <auDT5MjXYq3lcQjE@google.com>
From: David Matlack <dmatlack@google.com>
Date: Tue, 27 Oct 2026 10:37:56 -0700
X-Gm-Features: AclHuK9nhZy1yfbGSOSB3h6FsOr-7RUqfg5DsC4iepC4uLqRp9MK3EAsOEkjOYw
Message-ID: <CALzav=dYKAP7pKfoPtz32X1cT_tH4LN0X47_jTO8_HOCT4Pi=w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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
X-CRM114-CacheID: sfid-20261027_103827_805105_A711AF79 
X-CRM114-Status: GOOD (  36.00  )
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

On Tue, Oct 27, 2026 at 9:40=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On 10-26 21:14, David Matlack wrote:
> > On 2026-10-26 11:50 AM, tarunsahu@google.com wrote:
> > > Right, Required bit should be source kernel payload property to tell
> > > target kernel that the payload must be handled to correctly deseriali=
ze
> > > the data. It should be source kernel (userspace) responsiblity to mak=
e
> > > sure it understand the target kernel before doing liveupdate.
> > >
> > > Saying this, During deserialization, target kernel's required bit is =
not
> > > necessary. So I propose the following truth table.
> > >
> > > Source hdr  Target supported[i]  Action
> > > ----------  -------------------  ----------------------------------
> > > 00          0 or 1               Accept: feature absent in payload
> > > 01          0                    Accept: ignore the feature data
> > > 01          1                    Accept: use the feature data
> > > 11          0                    Reject: -EOPNOTSUPP
> > > 11          1                    Accept: use the feature data
> > > 10          0 or 1               Reject: -EINVAL (invalid encoding)
> >
> > Yes, this matches what I had in mind for the semantics.
> >
> > To be explicit: the source kernel should set the bits for each Live
> > Update based on what is actually preserved, rather than generating the
> > header from a static per-kernel array. E.g. memfd would only mark a
> > feature present for memfds that actually use it. That's what allows
> > rollback to an older kernel as long as nothing being preserved depends
> > on the new feature.
> >
> > But looking at this again, I think the required bit is redundant. Wheth=
er
> > a feature can be safely ignored is a property of the feature itself, no=
t
> > of any particular file. Every file that has a feature present will have
> > the same required bit for it. The only thing that actually varies per
> > file is whether the feature is present.
> >
> > The required bit still has to be conveyed to the target somehow, since
> > the kernel that needs it is the one that doesn't know about the feature=
.
> > But it can be conveyed by the feature's number rather than an extra bit=
:
> > split the flag space into required features and optional features, and
> > assign each feature to one of them when it is defined. This is similar
> > to the required_flags and optional_flags approach in struct pci_ser [1]=
.
> >
> > Keeping the same header shape as discussed with Pasha:
> >
> > struct kho_ser_hdr {
> >     __u32 size;           /* Size of header + payload in bytes */
> >     __u16 nr_required;    /* Number of required feature bits */
> >     __u16 nr_optional;    /* Number of optional feature bits */
> >     __u64 flags[];        /* Required bits, followed by optional bits *=
/
> > };
> >
> > Required feature N is bit N of flags[], and optional feature N is bit
> > nr_required + N (using nr_required from the incoming header). The lengt=
h
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
>
> I like this proposal. I bet most features are going to be either
> optional or required, and even if we ever have a magical
> sometimes-optional feature, it can have its own required flag. So, no
> need to pay double the cost on every flag.
>
> Just need to make sure that optional features always start from 0, in
> their own enum, so the offset can be computed correctly in the incoming
> kernel.

Right. Instead of having a single 32-bit feature space where every
feature can either be optional or required, we have 2 16-bit feature
spaces, one for required features and one for optional features. Both
feature spaces span from 0 to 2^16-1, and then are packed into
flags[].

