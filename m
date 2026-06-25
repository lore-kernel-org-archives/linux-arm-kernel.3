Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AC0CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js4jLF01npwzaOg3T/bUVrQbZfaivvWEjYI8DxgoW1s=; b=qjafAZZpWvyatXzpv/yKuf3HIF
	HnXrDopuidDkcssl7Xl5JftY5y+ggcoY/ZDkSuzoS9/U2gdKOjuOMbLOtmCCTHej8GuelgEMexjzI
	6OZglYSdnF2KKiyUQRq0cvZ+kqfy9wzWk8w1aHkZcfphyOM5FOUpIgcVmUr+PAwlwhnW2xvSSjfwT
	f9OHuaA4qgrucM/rP6p5I5JZr1J+PWDc3Sx0L2nJsIMaVLfcxXM0s69f+YyC/8nl7CjntXMdz2aw4
	Om+H8eLbIh+xfsO0spAFZdNs/6CqXkLOVcQoSU0zeEkiGEGWWM2PNHX+rXVQm3USaKo6K15Y879s6
	VTFj5NOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wci2C-000000094vS-0IQC;
	Thu, 25 Jun 2026 11:14:16 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wci28-000000094uk-2zDa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 11:14:15 +0000
X-Forwarded-Encrypted: i=1; AFNElJ/XMTg0OzMdBawLtNpKbW/wXubuAMBpZL36pt5JDrURwToyoJ5IkPOyhP88ICxNisyJWcgEOZstgVLUeu3wOd0y@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782386047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Js4jLF01npwzaOg3T/bUVrQbZfaivvWEjYI8DxgoW1s=;
	b=rUs8tBZd/2YMFX9pjtj7PLeoQzYwfwFmT9cFTAr3cZblfW8iPl04+NxpOAMvMHa7fYpi41
	pbOoBTKeq/bLLGH3FhcPH4AenIw4h7X7GMPE/wFq8dQgkUvYeurdtBB+L4IY2zk+1vP6+d
	ZzOe923K+vDgWcIrDv/jC3Gnmva1pMQ=
X-Gm-Message-State: AOJu0YwWD8Qu31FT7AHc99MmrA9OM3VLkT8ndwl+ApDqPd6t5Lfg+CII
	dHbQwdlVKs7sOe1Cyub045SsulB7BE/r/9exobTyzR/AbR84CZ3mH8NebxOA7XNXkNhlBS3YM5/
	wKjQLRnstHsswUgRJQKOiBkf7WbQkzV8kxxdPm+4m
X-Received: by 2002:ac8:7d88:0:b0:517:99ea:ab7e with SMTP id
 d75a77b69052e-51a6ebaf887mr9204431cf.24.1782386044257; Thu, 25 Jun 2026
 04:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260622190701.2039766-1-fuad.tabba@linux.dev>
 <20260622190701.2039766-2-fuad.tabba@linux.dev> <86tsqtqu9u.wl-maz@kernel.org>
 <CA+EHjTxn8W=KYqTeqs-ZTw-SBD9tH0zUz_O9rTHsq3M7ELXn_w@mail.gmail.com> <86fr2bq6b6.wl-maz@kernel.org>
In-Reply-To: <86fr2bq6b6.wl-maz@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 25 Jun 2026 12:13:27 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzJhP5hPSnp-=2ESCReDz3dPs-Cukw8z5UJru+7haT2jQ@mail.gmail.com>
X-Gm-Features: AVVi8CfTVMMlR1q7q5K8mMEw1_PqrmGvfIYlVGc5ZR0jkKVtOnV-eMOeM419v3U
Message-ID: <CA+EHjTzJhP5hPSnp-=2ESCReDz3dPs-Cukw8z5UJru+7haT2jQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Fix sign-extension of MMIO loads
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_041413_731000_EA108D03 
X-CRM114-Status: GOOD (  21.59  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jun 2026 at 11:10, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 23 Jun 2026 14:51:49 +0100,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > My reading of the ARM ARM is that the byte reversal is keyed on the access
> > size there too. It lives in Mem{size}, with the register width handled
> > separately by SignExtend(regsize):
> >
> >     data = Mem[address, 2];        // byte-reversed by the access size, BE
> >     X[t] = SignExtend(data, regsize);
> >
> > So vcpu_data_host_to_guest(..., len) swapping by len matches the Mem-side
> > reversal. Swapping by the register width would reorder bytes that were never
> > loaded. An LDRSH into Wt reads 2 bytes but would bswap 4: the halfword
> > reaches the helper as 0x0180 host-native, cpu_to_be32 turns it into
> > 0x80010000 instead of the 0x8001 cpu_to_be16 gives, and it never sign-extends
> > to 0xffff8001.
> >
> > If that reading holds, none of the helper's ops are individually wrong, and
> > the only bug was the order, with the sign-extend running before the swap and
> > the width mask then dropping it. But I've gone round in circles on endianness
> > before (to say the least), so please say if I've done it again.
>
> That's quite convincing.
>
> And the quoted pseudocode is much easier to reason about than the
> current blurb in the commit message. For reference, J1.2.3.111 Mem{}()
> is the relevant bit of the M.b spec and clearly shows that the access
> is done LE, and only then byteswapped. Can you please repaint the
> commit log to describe things in those terms?

Will do.

>
> Also, can you augment your test to cover for BE accesses from the
> guest if the HW supports it?

I'll see what I can come up with...

Cheers,
/fuad



>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

