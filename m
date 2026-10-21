Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29090606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AR+j6b42;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=QETTeJzp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=; b=AR+j6b42L+Zkl6CllpwI4CiCtB
	66wKKRSShYrwdqmoLdSd/N33Xjl6Je1jLteSj9f6HOfb2I0EuJA9kExoh8G2SqLlNXQbVnUO7sdLQ
	CaS9K/v4GaQ+pTpwRyoz+/QnO0bqHbCWcbFTJVbw0XctpLfTyoqWe5+5T3h9H2FLBIOcI59pkxbQU
	N2qh88tnwmCMse32vjhm+sibEriZrieBhFqxVyPMWUvNV0+6FAbBRCykEeu5IEfKMzjx3hyNvHRvy
	j+UeZCvLvIO3RMWMXGCxoK1GOvNuxC7lk7zpusnc02OQkiu+7p//srDcJ+NJDXsp4JIorcVUw0Gjx
	namio3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbPV-0000000Cguf-2acV;
	Wed, 21 Oct 2026 18:51:37 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbPS-0000000Cgtp-0hvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:51:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso1354492a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 11:51:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792608692; cv=none;
        d=google.com; s=arc-20260327;
        b=lzj/eHTpuXI1rb0xNpKoLzEFClruKRSQhIVLaJNXC2uWjKAy2U52M9DJgBsXel8ZYd
         2DY2RpCsNiHx+oMNjZjT919GOrQS7+/5iapRSbUZDzH9fa2lRZzP4pcOuhtBnfE4RO9/
         /+LE6xt39APSjXTcEliKAWXUZjSfge2Pu2I2TDCE+SBWhq4MErI0bRLDyAk1RjMSBX9z
         /GYZc2H4/UKeSEBs4Bms4UkgWYXVkqvbhcBJr3SOH0/x66LG2vo5+DminxgzSx6LetZG
         emcxeDZ6v3NMZTJ53Ce+jFsSZKj2RhiPxn3GTCNc6Stqew6n9MvnpQSa7ebfEgLN+1Hl
         4Qew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
        fh=oHYbrRTfMJA74VoWkWXgim6pUcT9oskulCvZSQC/oJk=;
        b=m4jB32RL5t1BJfvXE5biyW4PjLhuVOWTW4biRgquPkFNws0OPJKIjNfVVwLN3/9vvx
         mlBAFV0AWoZo00uxwPEOL2NFBChl8ulVRiHrLVANj2Zf4D81ZoM0H1Kjj7rFrP38Gce2
         p3usM0owcQFlVCnvkjhmvlHPtNOVrNqoNo/k5ajJJe0LfhxQza8VU4R4i4xh6j4ewA0Z
         RfDT7bGl3LtLTg4IO23V6eBU5kX62koL99PYFoRBft54UV5+aQsCwHqxWF73iJFg2rWS
         jkRBD+UnvfQZrlA+X58zfrNqsvs10oqdTq5hguGc3l2RCvSBmVGyRlIL+6X+m8iOnD+j
         /8OA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792608692; x=1793213492; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
        b=QETTeJzpsLafSgntkhyQUIEf6MsiA+6yiMT+tQAnCT6ExkELkM7nO+EMPQO61ceFJ2
         druMYJ1h52IcO55wNb2x5r9131uTW2m+iJbfOu1d+p+cywFi9905H4JUjrcpFzd5WfPE
         cIm6joLr7c41dqZLZ9qCcAUrwleAg1QCFscF9lPm06U+Qr097GahML924zNHyINsKflr
         ibJ8YDDpRGZY14H/UQels4BmnVvl2HyDEQSAeE0Dj7uOhw/UV150ng85gXr3GApnA9Vt
         6XzrLgZvR0+pn9c6aHfsLvz3XGG8qdtc30J6fcfTeBZcxvuSSPHvmFd8CIOm7SGWisqV
         24eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608692; x=1793213492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2oW+YxRWdAsPD4uJs1XKcHYT7T/4QzyNKf44tXuYtg=;
        b=naOlUhdx91ekJsAurSyuSdInKQ85grvMjVFRLYDwE751KsB3EhM3N9LmbUJsNs+QmV
         u9oRTtYDv+lMofx2euWNJiWrAvQXKG3O/yz9yzwchBSraR5h+QIWd03OTErZskZEgSeC
         n8seiB+qKZzLYv8xPyoGbNt6Me6fyD4FJIDxeykTMb7svYio3qUAbPqDbs4hc7DVDMBL
         jSRx6GB/CibWmayaTE3wMQjrpSiSU6dXOWaktjeHjsVmLzCV4YAKluqtmsNduWhBIUXe
         Ymbgl32cWNmHZvG0MF/6ZUCQz/hp43gOJrdIsMzSnhfROPjxLS+1BJ2WbsTU9L4pzM0a
         AjdA==
X-Forwarded-Encrypted: i=1; AKwUvBwZWNrY0o1au/b1l56wZqvIgzHC23hFDYo+nreVXCIP3ybpcMNNnT3dtTfvfgu8k1JD4z+e/cquYXPrSK8XY3yB@lists.infradead.org
X-Gm-Message-State: AFq9FYIReQ/Xft/DzDDT46vU4T8YD+aUbVh+GWOXGqUEnP7aLYzB3uHl
	vaBampUEPxHKAoTG7U9/tacw0My4qx2eJFiqVsC+qk5U6WfEkawnQHLzZiikyJnJW+p8qRPdEh3
	eCWDxDNhC4LZ2Gq9rIltdQaaS0n3VTTcqB7GC/ToF8A==
X-Gm-Gg: AYBFou1dfLST+ASnWI3d09gscXkiiC67ut/ApBXtkdxAZ69NYNp3axN5mYDX556+wqd
	lhutJYyRZFuLXbDtVOhHMMjAQOmxAmkwb6akjUdIojJqEMVvrJP+CFNtZ3vVg24TBVA5JzohCg8
	xCKBstWmVeyckHI8TSKCqDnAGl6YffvTTi7Tqr1hNrhy2CDU48Upjdo4Omuo+VBroiPNtHc+1Zy
	eO1ZSlUNQ4h7020mWU0LVtHOW6HmdhR2l+WgMoczv6gbCUAQcNLRdjzmG50bMsH/XBl+O5/nkI/
	2gM6bIBHJH9arTPIJ3qVQQXQN3T7Xqtob4PCCLvYRRBfpB6IDRodBHa1tSYZ4obFndili3TgHep
	eh3nJlcWFMXh8Z++f2JI6Z4s2TDuXCJd5Hk2WsjDfAVVUJ9FCze+lMEEgxPES7WL9px8=
X-Received: by 2002:a05:6402:241a:b0:6b4:1df2:244e with SMTP id
 4fb4d7f45d1cf-6b41df242e6mr53870a12.38.1792608691873; Wed, 21 Oct 2026
 11:51:31 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com> <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
In-Reply-To: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 14:50:54 -0400
X-Gm-Features: AclHuK9td__2XcAMViewCe_NhDoA_TjTC8gr4y8u3SANqGewpEKZoTgIKv6iXME
Message-ID: <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261021_115134_238296_6F1DF17E 
X-CRM114-Status: GOOD (  25.02  )
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

On Wed, Oct 21, 2026 at 2:47=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> wrote:
> >
> > Pasha Tatashin <pasha.tatashin@soleen.com> writes:
> >
> > > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google=
.com> wrote:
> > >>
> > >> LUO and its file handlers validate handed-over state with monolithic
> > >> compatibility strings ("luo-v5", "memfd-v2"). Any change to a serial=
ized
> > >> structure, even an optional additive one, must bump the string, whic=
h
> > >> breaks live update between adjacent kernels. Replace the string in
> > >> struct luo_ser with a feature header, so that the target kernel can
> > >> accept or reject the source kernel state per feature.
> > >>
> > >> struct luo_feature_hdr is a fixed 128-byte header: the serialized
> > >
> > > This patch is all wrong; 128 bytes is far too large. For every _ser
> > > struct, we only need 8 bytes instead.
> >
> > NOO, It is not. It is intended to avoid complex mess with unnecessary
> > over-engineering.

128-byte per serialized struct is not starter.

> >
> > >
> > > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > > 30 feature flags + 2 reserved bits for flags extension). The last two
> > > bits of the flags indicate whether an extended flags field is present=
.
> > > Each extended flags field is 8 bytes, and its last two bits indicate
> > > that yet another extended flags field follows.
> >
> > If we will have dynamic extension of flags, Think about this.
>
> To support dynamic extensions in a backward compatible way you want
> something like this:
>
> struct luo_feature_hdr {
>    size
>    flags

__u32 size
__u32 flags

>    extensions  // offset of first luo_feature_extensions (or 0)

__u64 extensions[0]  --> but the size should be specificed in
declaration macro that I showed in the next patch.

> }
>
> struct luo_feature_extentions {
>     flags
>     extensions // offset of next luo_feature_extensions (or 0)
> }
>
> And then an example serialization struct would be:
>
> struct foo_ser {
>     struct luo_feature_hdr header;
>     ... fields ...
>     struct luo_feature_extension extensions1;
>     ... fields ...
>     struct luo_feature_extension extensions2;
> }

