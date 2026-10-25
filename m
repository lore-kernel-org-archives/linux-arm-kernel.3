Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F7B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NuC6C/+s;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=miWGkCOz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=; b=NuC6C/+sXUKZv8
	GZwwrwbwAje3UbKEpYVU+YTcRwJW+eoOjAoR2xuBhqIS1PlB7sUoCaZMEU2Jvr8vdN6eiUGov3IA0
	kYLcum8PjjlN4HLNG4mZPwrsaLCHGKgy3JrjWQ13d0z+QZBzmVQtyxIBE6lGzK8ZKNGO6xPAge4XQ
	JAZS7su7wD8+1rImxM9WrjfN/1Ht7LYM/TIpvUwj3tvDzAaYglj6ay5DF9mHIW3dyL3FaMNSzvs59
	0p8IR5wR9aVvx8Z8TOhRxlmoXAoI4J8gXBO1Jd9zoQvjQlxZH9fr8iUxsQW8vljD88RNe+r6K+YJu
	NLZSKZq0ceEQ0zv4s48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL7jn-00000001VOW-2YLB;
	Sun, 25 Oct 2026 23:34:51 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL7jk-00000001VO2-1u9P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 23:34:49 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5383c97c8cfso188791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 16:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792971286; cv=none;
        d=google.com; s=arc-20260327;
        b=LcpE6aF/jhOaWZ7Ul48fJovWYNdiEgAeWB1QKZQBy+Jid5YkTZHTE1K/1JsM92CW4g
         ApudifiF6PwAeel5gvSXeFVGCPV3Huz/n1Mo0c+6BtCe3a4JeP7F1DDZcexHWtmIFxyZ
         X3Q8c78ySe9CeELqbOoDV7XXqPG/5Bi7yuRo0ZFysaV9THB2gTg6DKS1rO3k5rLVy/zQ
         jR50jjBm4V8PB/BIJ5ybKtF/cdhO5mkhFFxCwR8q45nKUXo7OH+GMbTLfeor/TDhVVu4
         4wFMIN0D3B/btwJUYbqVNa34o9eyAdPF9KUrRI0CxgYmg+/kSroKdB19g3zlHmBoqPUh
         7iHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
        fh=ZSIOU1HUvHOVAnKwJhdZZ2josHDcQ+KDO/Cy6lQqxOM=;
        b=neMFzpF9HtQRQ3JneeP89C46g3s6v2Yx35tQCflLDOMCv2CMU26ASI8lYYKQUafMGL
         hsaOZRIE9KDDfSLA00mYJ0OFX4U0xORwY6j1eUsXly+J85Ii+OeftBWK3SH4QTs28k2e
         7ISy1IB818EbYiTIa+rdTrdNc7GFODFzovSteQJa84azEofOWuqeJWDzBxnzJ6K9vNUR
         wsYaOLFKnklE7E+IvC/0025o/Iqneq8sqC9a/IG6s8m3dt0Qeo0qDcUXvYKwliDLrmxe
         +LIpyQllVfTKxIvi9xK7vlV/xAZekzNz3p8Nb7MxQvG1Wch20ZzZZu43UY8dfmnvDMdr
         qYxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792971286; x=1793576086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
        b=miWGkCOzrtiCC0xsB4FQQsJwn7PMz0VGHTQr/AeZoEKGATZ2uCZZ5nVetxQE3NgHzw
         I4DsfpJZPF6dJIaMBWxqv28DVcn0WZ3mVUACT+o8u2CGC5qL1Od/tlXDhMXfWt/5wTzG
         22IU/tb7g2WrmJQ0U+ZmU0a2SaC51xdAwpwkObgV0V8gAg0SCqo9DMN+Ifcjg2BHhS+V
         fyKO3g21+zHBh4mGfLNZX/S1nn8VxSVl4d3KJvSkgNUm/DqU6s5DmN+6lwGA++7sbFLl
         5B9ja08z6IQ8xkN3axyATa4iGXORizh/HpuNoQ7DGleMw3zEA2JeYlSMf2XTOnIeuNLh
         yecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792971286; x=1793576086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFWYZrVjrS/TFQfJR/4h0JKkNeZpD/BpXtbdF7kMWlw=;
        b=rYfFSieqRs7TAL2Q0ft4LpKS6kvA7szVL5HhhAMckUR93Yqt5RHrZLHSGQdGQ7teT/
         hReD+CAWN/srwk1cfAgF7SnNj2TMq6OJU7LdhNZ9ylWpMxVmCa+c0gjEXJ9+NRBb9Q3t
         OHBaTZxyK8Mow+xPbwhj+YJ+2pL4RpdJJkoFmGpbKcjcu0sybKFdcPvyduHUIgGMnapX
         Sx8wH3V+Zxp4tU1QlSebQYZlfBXTh1ef23khwBqhK34rPiK2MInSBkuRZyEoqfBeGCYo
         ifYHxI4Yd5jn0i9bHPsUtMGfYk3H4/tAKN1zTV+bZHp2PoNv4LHfaT5icR6FzQl11csY
         J39A==
X-Forwarded-Encrypted: i=1; AKwUvBx5Ep/kSOn3dSjr9sd+T04f7keLrWLS+g3qObyNfXGllP631fEey+JYLayTDCWRDZ6Ezy3kkvHSU5bUq5cG/ZkM@lists.infradead.org
X-Gm-Message-State: AFq9FYIfgBMhfJtGLDJai3WtyEE+hDLRTp6n5BAQ+0JuD26NhoHBNCVy
	nl5nV9hrhkmWV30zmV6o62AMq5fILeUUcxkH+JAicu+D1ccac5/0cd2KE4cEdHZV8frB/4zhdfj
	xHuUuXhKoJ7jXkCa+A/IEmr1pMxAmZsWn7z3Uge5B
X-Gm-Gg: AYBFou20s/nE/50enZC8Kr1R4hde41n540EAFzR5VuebXaZHBKI/EI3XUtt33vxPxuH
	Hi9ysF8UffufalgUmpcWA03kyB+OyFIJtZYSqdII+pTDT3UHxKY/9KrXOJO9eWkfhPRT9qHG2e0
	RmGoEPl4jZJ6MKgqx79wPc+z+T/iyRO1UrfGYUZ8Jz70lRSzFEqmkUKV7IeIRm64nmkmQC20e+/
	IskFNcCNvvR5wtzd5s/xs2T61H76gnsZwfCnrNqowrRkCA33B58t4js/1Qh0T9TV4THJrITJfED
	TU5nE8TYBjjo1luRGimvxW3Ge0bb3qkrXJFWCaabmcfCis87kTpC+OcjECXFrC/UpXE26LpTxDk
	C0o7xW+RKFM7lq5b+SUAkK2BL/boNohWENA==
X-Received: by 2002:a05:622a:5806:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-5383b53f3afmr23124761cf.7.1792971285094; Sun, 25 Oct 2026
 16:34:45 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261004195027.227748-1-danielmentz@google.com> <20261016180521.GJ14213@ziepe.ca>
In-Reply-To: <20261016180521.GJ14213@ziepe.ca>
From: Daniel Mentz <danielmentz@google.com>
Date: Sun, 25 Oct 2026 16:34:34 -0700
X-Gm-Features: AclHuK9W-YhajRJtMqxwo_KiR_knxSPaf7RrqxDVchqoNSjrX0LK8PI-lTwz6Ks
Message-ID: <CAE2F3rD3WPfJYBu-HPwppwjzdXB1v5gRwu6Dy7rCrgBAs1JBnQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu-v3: Align memory attributes for
 SMMU-originated accesses
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, nicolinc@nvidia.com, smostafa@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dawei.li@linux.dev, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_163448_557254_5D521126 
X-CRM114-Status: GOOD (  24.79  )
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
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 16, 2026 at 11:05=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
> On Sun, Oct 04, 2026 at 07:50:27PM +0000, Daniel Mentz wrote:
> > The SMMU specification defines several types of SMMU-originated memory
> > accesses, including Stage 1 and Stage 2 translation table walks, stream
> > table accesses (L1STD and STE fetches), CD table accesses (L1CD and CD
> > fetches), and queue accesses (CMDQ fetch, EVENTQ write, PRIQ write).
> >
> > While the memory attributes used for Stage 1 and Stage 2 translation
> > table walks are configured in io-pgtable-arm based on whether the SMMU
> > is coherent (ARM_SMMU_FEAT_COHERENCY), the attributes for stream tables=
,
> > CD tables, and queues are currently hardcoded to Inner Shareable,
> > Write-Back.
> >
> > On non-coherent systems, however, memory for stream tables, CD tables,
> > and queues is allocated via dma_alloc_coherent() /
> > dmam_alloc_coherent(), which provides CPU mappings with Normal
> > Non-Cacheable attributes. Having a non-coherent SMMU access these
> > buffers with Inner Shareable, Write-Back attributes results in
> > mismatched memory attributes between the CPU and the SMMU.
> >
> > Configure the memory attributes for tables and queues in
> > arm_smmu_device_reset() and arm_smmu_make_cdtable_ste() based on
> > ARM_SMMU_FEAT_COHERENCY, matching the attributes used for translation
> > table walks:
> >
> > - In SMMU_CR1, use Outer Shareable, Non-Cacheable for non-coherent
> >   SMMUs, while retaining Inner Shareable, Write-Back for coherent SMMUs=
.
> >   This applies to stream table accesses as well as queue accesses (CMDQ
> >   fetch, EVENTQ write, PRIQ write).
> > - In STE.{S1CIR, S1COR, S1CSH}, use Outer Shareable, Non-Cacheable for
> >   non-coherent SMMUs, while retaining Inner Shareable, Write-Back
> >   Read-Allocate for coherent SMMUs. This applies to CD table accesses.
> >
> > Assisted-by: LLM
> > Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> > Signed-off-by: Daniel Mentz <danielmentz@google.com>
> > ---
> > Changes in v2:
> > - Rename local variables 'cache' and 'sh' to 'cr1_cache' and 'cr1_sh' i=
n
> >   arm_smmu_device_reset() (Nicolin, Will)
> > - Collect Reviewed-by from Nicolin
> > - Link to v1: https://lore.kernel.org/linux-iommu/20260929032229.353224=
7-1-danielmentz@google.com/
> >
> >  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++------
> >  1 file changed, 27 insertions(+), 10 deletions(-)
>
> I think this looks OK
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Did you check the spec that this is every access? I remember there is
> a table outlining every access and where the memory attribute lives?

Hi Jason,

Thanks for the review!

I checked section 13.8 ("Attributes for SMMU-originated accesses") in
the SMMUv3 spec (ARM IHI 0070), and all other accesses are already
covered:

- STE fetches (SMMU_CR1.TABLE_*) and Queue accesses
  (SMMU_CR1.QUEUE_*): updated by this patch.
- CD fetches (STE.{S1CIR, S1COR, S1CSH}): updated by this patch.
- Stage 1 and Stage 2 translation table walks (CD.{IR0, OR0, SH0} and
  STE.{S2IR0, S2OR0, S2SH0}): already handled by io-pgtable-arm
- VMS fetches: governed by SMMU_CR1.TABLE_* (and not used by the
  driver).
- Event queue, PRI queue, and GERROR MSIs (*_IRQ_CFG2):
  arm_smmu_write_msi_msg() already programs these to
  Device-nGnRE since they target an interrupt controller.
- CMD_SYNC MSIs (CMD_SYNC.{MSIAttr, MSH}): the driver only uses
  CMD_SYNC MSIs (CS_IRQ) when ARM_SMMU_OPT_MSIPOLL is set, and
  arm_smmu_device_hw_probe() only enables ARM_SMMU_OPT_MSIPOLL when
  coherent is true. When non-coherent, CS_SEV (or CS_NONE) is used and
  MSIAttr/MSH are ignored.

Daniel

