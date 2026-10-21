Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3AF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VSwtVvnh;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=B5pOEOO9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=; b=VSwtVvnhBJphKgJGu8W5bS+MTt
	5g0emnbjnTcALuuvYgupbZS6gj6sLHaPt4bDlzH4P1hgapwUTH2+BnukokP1bRBSMNwhk1l+kzfVK
	2FwH8Vwig4MoqagLiX1y3gw0A+p06Xjz6Gfs23ctlX8IUfGCQK0NT2zOoP2DPTAqcjWAe0uhKqPvu
	LbVEl5im3iqvUAjYsgh0m10FbGDq0JGwQLHnczNFIWLwJKNiCf5Nbs0/yWRRa1r56dWgOeVMUszlx
	FRZud9M5MQIzm8bok6jgetSsCOiVJNoILr26abi4aTrsHd8P84godunj2UHQ9iTbIf1dVbAubiPXO
	SRITPB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbLY-0000000CgR6-0ZWt;
	Wed, 21 Oct 2026 18:47:32 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbLV-0000000CgOs-2Tge
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:47:30 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1785752eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 11:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792608447; cv=none;
        d=google.com; s=arc-20260327;
        b=jwB35e3SOu+sNCOA3pfFM5tektJfv5GmnkUCIkAMK9fFrQRjsO/pMzVkDXfAjYg+Fs
         VP8OwFroKKqHQa4kV768JHvjLyZAHhqM3NJp3FHIso7J0F4APLzF9tZIGpjQJvaOjUpo
         yyTBA0UDgK29sT3KjYtFzNDQxcFQNfHsp8MxGAvYDY+c0BlHEubgFryCx8XOOab5SvL2
         iDc07ok2GD1yyGpA0ZLU+6MmClrkw5xuvV6hiHFt+gHiSblVXIxICq31W2N0fU5U3Ytr
         jm6e2yM6Ikn9Z8WxUGBeT+c6FYBCfNEnmjTT5MDRqxOxrbSGoEMinG59LCdJw+lKhk4J
         7CBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
        fh=zVT3D17TrsH5VrMNR+o99lymvLWGpLxZO1GM6Zdh50U=;
        b=FgEWtSYkDYE3r2ox37EeBnTeFphjcYM1QYlQXusxubpvNqm1FYF9Wg8zGXAtf6omSz
         +H7fwvnbdgYpEuUidvSou1TUno9UmHsaLiJJ3fMZnJbbeWc0lzqZFXfWCXs+no8u/rf+
         ZdG50gbXQBR/rd6GFN3uzWHZ2bCyVnHFmB2uoprp/3UbUFjXAR506RBLasKbz8t0Sh6j
         cBJO5Qia7feg7bDwqOgDUVm1DQX+h0HJdaHuhre9kiICXVpO7NA/mwlYCIhzElDjTmxT
         9Mp7rGPFLYtCap/5o6cZ4gwkL9MbdukuKs3w3wFsULM5KLW4S89hSPIOEOJIimCrSQje
         YA8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792608447; x=1793213247; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
        b=B5pOEOO9JLLKoD9jBa8QaslKE2J8NYWlbPtzs3eH2U9bGqLs8r7rsChjfmNPIgtkr4
         tWqEwrr6uH+XXE9WBDwjSLodcZpiugvqdzxbU1zVvHxSurwuAa2lpLVyXxS7cTaTT1ua
         vn9aWcCd8uutngM/lluI1CiuRbtf2zD/avxI9SMXaVRS6g47X8QapxsrXQIHmY+vD/Ov
         RFvbvqiBN/MA2kbp2nUWjOcsStinijWNLNWpCUtszveGwTFubxrPwBMqkBr5wYfWjncP
         ZhK0SV3lPWslU4qEnKkZ5ZPbgf0m0+TDbF+ynwKHWzxIK6MpkrwHlefwuKBem8dXIQg4
         EAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792608447; x=1793213247;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dSTZtcyPK3yzGl0K7b9zLKEzjIcPw2EBeTAvW8QX6I8=;
        b=beEdIyTANwoqvsv1qHkbS6K54pW4RN89xjhwu5KnDfbPDa3FgoiPjZKtdLvosHnsRk
         twaJnhnKz12B125orrMgg//9qvJs/yz7dUzumK4bhd30g9rTSrk+4xHYm+Uyp6NOZxWV
         VcJyHbVRR0md2wxuR75YhuPrtKI6vVBf5XOqmP1uzFGH7ahTsrMBfHCrp8/e5fqzha6D
         iKA58Sdiqfq3EoD9P1KICarDwYvtpTEqy7U1AWsrR8XbsLn3tj+irM9z8R/1p58oWPC6
         qeKov9aPh4hggsWe3Yg8DhHxbijj9S7aViqPHk5zW1p9YiI9m6zKa3Q4m1fo5QHG4FqU
         sx7A==
X-Forwarded-Encrypted: i=1; AKwUvBxPXP6uCxihJ7Pni2UgF0MKF04BX4RTd9ZP+HztAchcOuNFFgw3RYOnK+ls9CPxBxJgADOa3xJG9XLPV6SPlkxE@lists.infradead.org
X-Gm-Message-State: AFq9FYLotOvsPjwCSDAAM0Ssm0pgufjU9I3/u2w/dCx+L0uY7EhNGiDx
	1qUDOoCR4aEONinS8Lne9dqbJiQpRNIXy68Ya+JuP0gGp8M78IrUSJVkgnyExfJkYfzVbhXdbly
	hWjbOEGBA1nfUX1BIf5kuBPI0IjdYEko1zuzxOAie
X-Gm-Gg: AYBFou209picuB2SSiM9wmA6otuSgxPhLY95ilWYboP1yPWga+nfgC8kBnT6OH1yrm7
	CANhc2APeZeGImhgFGWhPUBaUm6GrLM0RcP4biS3+OQYoSSrfdMKiCkOjSXRr+mp9mLlzYMCnKZ
	TVdXWShXDdOeFTMrNUlTjAewTVyUK6B6QkbRCTuU8bxuhVYg0VMerkUhq6QaPsVABtMx+uhZyjJ
	Lsu2W54dd1Y0EExRcHNkAF9yfArSgK23M6Lm3X/L21+bVFD7oaOLnpon6KYhRM6jIVqM3ASDe0Z
	dI8SajAN/TEZXSTjzdH70VuhiGtd+kCMvVR15JLyt7QijWsXkH9iugSF+JKhzo9kXNztnsZo1Dw
	gNJCDeO61wSJrpUkpve1kgBYsHnWAWglGE53FR0Jmt0LNftZ0H+qFlfmYh6E=
X-Received: by 2002:a05:7022:2507:b0:14c:efa5:ee7 with SMTP id
 a92af1059eb24-190a4d18cc9mr4696437c88.14.1792608446024; Wed, 21 Oct 2026
 11:47:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-4-tarunsahu@google.com>
 <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com> <9huzecdi6go0.fsf@tarunix.c.googlers.com>
In-Reply-To: <9huzecdi6go0.fsf@tarunix.c.googlers.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 21 Oct 2026 11:46:56 -0700
X-Gm-Features: AclHuK9GVWu4pH4tc-A36maNXu-EHT2uwChCmCT-hqS2EBFk28gxkLJBLwcVEzg
Message-ID: <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
To: tarunsahu@google.com
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, 
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, 
	arnd@arndb.de, jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, 
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
X-CRM114-CacheID: sfid-20261021_114729_661216_0C2133D9 
X-CRM114-Status: GOOD (  20.85  )
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

On Wed, Oct 21, 2026 at 11:40=E2=80=AFAM <tarunsahu@google.com> wrote:
>
> Pasha Tatashin <pasha.tatashin@soleen.com> writes:
>
> > On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.c=
om> wrote:
> >>
> >> LUO and its file handlers validate handed-over state with monolithic
> >> compatibility strings ("luo-v5", "memfd-v2"). Any change to a serializ=
ed
> >> structure, even an optional additive one, must bump the string, which
> >> breaks live update between adjacent kernels. Replace the string in
> >> struct luo_ser with a feature header, so that the target kernel can
> >> accept or reject the source kernel state per feature.
> >>
> >> struct luo_feature_hdr is a fixed 128-byte header: the serialized
> >
> > This patch is all wrong; 128 bytes is far too large. For every _ser
> > struct, we only need 8 bytes instead.
>
> NOO, It is not. It is intended to avoid complex mess with unnecessary
> over-engineering.
>
> >
> > The first 4 bytes are the size, and the next 4 bytes are flags (i.e.,
> > 30 feature flags + 2 reserved bits for flags extension). The last two
> > bits of the flags indicate whether an extended flags field is present.
> > Each extended flags field is 8 bytes, and its last two bits indicate
> > that yet another extended flags field follows.
>
> If we will have dynamic extension of flags, Think about this.

To support dynamic extensions in a backward compatible way you want
something like this:

struct luo_feature_hdr {
   size
   flags
   extensions  // offset of first luo_feature_extensions (or 0)
}

struct luo_feature_extentions {
    flags
    extensions // offset of next luo_feature_extensions (or 0)
}

And then an example serialization struct would be:

struct foo_ser {
    struct luo_feature_hdr header;
    ... fields ...
    struct luo_feature_extension extensions1;
    ... fields ...
    struct luo_feature_extension extensions2;
}

