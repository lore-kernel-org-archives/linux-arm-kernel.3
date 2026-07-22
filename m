Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652E5C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNf+StBq+Xe+3jbYQBIhdsx2jh5oqIZIvT85TkHHRhA=; b=SCvak+w2LWG+yzTSWoZjN74yRD
	BdEgfnKXfarpx7BZaAdDR3JQcxDGL3ELp+Roa+OMUfTv2jHLbHCggGJRkIfTxJ+9NklrxednO4akf
	SRLfyoCj/WhmXlum/bEGurv23ms7BL24FkXylkHBtBd1kaD+vVEYSDPaq7MlfxnV24PPM7K5Vk6yf
	LaDJle5YgqKWRDz2WJDG+esAOtpADE58fKAown+4zRL9lmBPolppJAcZS5VRlKoZM4OqZWDoBliLc
	FKwu/uopZ09ZwcAcSKWjtZtp2JAtAFJunSjYhlT8LzpLrxqvfevGSbQGPu7VzQn+ia2mUTC02TIxE
	VGt3jCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmbCi-0000000CWls-32wD;
	Wed, 22 Jul 2026 17:58:00 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmbCf-0000000CWlL-3WCa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:57:59 +0000
X-Forwarded-Encrypted: i=1; AHgh+RpZT+nQZ34NxQzsu/LdrIjNx/3ePvT2pAtd+HsFoEtnNleRt23oTjUec/mZ9Be1tiD4E5lo78sL8DAKG3KaFWGj@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784743074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNf+StBq+Xe+3jbYQBIhdsx2jh5oqIZIvT85TkHHRhA=;
	b=QYHPEr0qUpBcl7wkBDBM2a1XNGnk9/kddjb7MhJYsmekC4rGq/RqIr1M8Hh0TtZ/w9L2xV
	Xp1r1Q59eLsIGnAIlXGqu7y6bFeyIETBw3EVcujelgFb4qliPn9xP/aiqKCECYwvvClpeY
	y+1l2WU4kZLVMKDBTDg4V1d2qdcXybA=
X-Gm-Message-State: AOJu0Yy6a28RFnwNYBH9ms2LDnJ23yt1A3BWW/rx9pNqNk46ozvPRVpU
	+RNnRgAcYcRZfYDkKJ0xmUnXL9k2rlduXMKbRzR1Hp/J6u2WZRk6JyJv1Hl24aBuCeYnb0xXdw7
	UTMe0lRwxfEaF06GHd/fmO1kGJaWpPrVVIJ/oPZit
X-Received: by 2002:a05:622a:a981:10b0:517:6dc0:698d with SMTP id
 d75a77b69052e-5283b8641f5mr863721cf.0.1784743059542; Wed, 22 Jul 2026
 10:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260703154811.3355680-1-sascha.bischoff@arm.com>
 <20260703154811.3355680-37-sascha.bischoff@arm.com> <CA+EHjTybDSAgr44jXNFnssnYq_vVeuZ+1qORS8f4dtQgMzOZ5A@mail.gmail.com>
 <71dc44828b55c848ca7bc842cb13b34681617ac7.camel@arm.com>
In-Reply-To: <71dc44828b55c848ca7bc842cb13b34681617ac7.camel@arm.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 22 Jul 2026 18:57:02 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwMHxwpRLi0BEx5ykH+Nc1Oxja=6DYmdeS=3A3yzYYRzg@mail.gmail.com>
X-Gm-Features: AUfX_mxTwAstkGjzWOdnvL1hFBOCWR33UqAdcJvL9E7YW2li2DEVUoBMCGBfKY8
Message-ID: <CA+EHjTwMHxwpRLi0BEx5ykH+Nc1Oxja=6DYmdeS=3A3yzYYRzg@mail.gmail.com>
Subject: Re: [PATCH v3 36/40] KVM: arm64: gic-v5: Implement save/restore
 mechanisms for ISTs
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	Timothy Hayes <Timothy.Hayes@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, nd <nd@arm.com>, 
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, 
	"maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_105758_336361_E7255CEE 
X-CRM114-Status: GOOD (  28.10  )
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

Hi Sascha,

...

> I think that this is a great idea. It makes a lot more sense than
> blindly trusting that the VMM has done the correct thing. With this,
> KVM can validate that the VMM at least claims to have done what we'd
> expect.
>
> I guess you had something like this in mind?
>
>     struct kvm_vgic_v5_ist {
>         __u64 spi_ist_addr;
>         __u64 spi_ist_size;
>     };
>
> Which then means that we can do:
>
>     struct kvm_vgic_v5_ist ist_attr;
>     size_t expected = kvm->arch.vgic.nr_spis * sizeof(__u32);
>
>     if (copy_from_user(&ist_attr, uaddr, sizeof(ist_attr)))
>         return -EFAULT;
>
>     if (ist_attr.spi_ist_size != expected)
>         return -EINVAL;
>
>     if (!ist_attr.spi_ist_addr)
>         return -EINVAL;
...

> When I originally designed this API, I was keen to re-use the guest
> memory here so had quickly dismissed this approach. However, looking at
> it again now, I think it makes a lot of sense, especially as we are
> limiting the guest to 16-bits of ID space - this wasn't the case
> originally which allowed the size of the ISTs to balloon significantly,
> and hence it made more sense to re-use the guest's memory.
>
> > That would remove the ordering requirement
> > entirely, and by my reading the worst case is 65536 entries at 32
> > bits, so 256 KiB, given the 16 bit clamp on the guest's LPI ID bits.
>
> I am actually in favour of this approach. It removes the asymmetry
> between the LPI and SPI ISTs on the save/restore path, and avoids the
> explicit iteration over guest memory to save or restore the LPI IST.
>
> With this, the proposed struct would become the following.
>
>     struct kvm_vgic_v5_ist {
>         __u64 spi_ist_addr;
>         __u64 spi_ist_size;
>         __u64 lpi_ist_addr;
>         __u64 lpi_ist_size;
>     };
>
> The VMM would need to read the guest's IRS_IST_CFGR and IST_IST_BASER
> to determine if the guest is using LPIs or not, and how many it needs
> to provide storage for. If no LPIs are in use, then allow
> lpi_ist_addr/lpi_ist_size to be 0, but otherwise the size must match.
>
> Does this align with what you had in mind?

Pretty much, yes. Folding the LPI IST in the same way is better than I
expected. All __u64 also avoids implicit padding.

The LPI size is the one that matters. The SPI size is nr_spis * 4, and
nr_spis is something the VMM set itself through GRP_NR_IRQS, so the
two sides cannot disagree. The LPI size is derived from IST_CFGR
instead, so that is the buffer where the kernel computing the expected
size and rejecting a mismatch earns its keep. The entry is a fixed 4
bytes either way, since only the architected 32-bit ISTE is exposed,
so sizeof(__u32) is right.

The main thing I would ask is that the checks be strict both ways,
since turning silent acceptance into -EINVAL is really the point of
the size field. Two cases: reject a non-zero lpi_ist_addr when the
kernel has no LPI IST, not just allow 0 when it does; and on restore,
reject rather than silently skip when the LPI IST is not configured
yet, which as far as I can see makes an out-of-order restore, the IST
buffer before IST_CFGR and IST_BASER, a no-op.

Another thing your proposal cleanly resolves is the ordering point
from my earlier mail. Once the LPI IST save writes the userspace
buffer instead of guest memory, the requirement to serialise guest
memory after saving the ISTs goes away, since the save no longer
touches guest memory.

Cheers,
/fuad

