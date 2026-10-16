Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C5ACCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZevcWiyLssYrcecoNHy/jCvQmVpEF5cYvIqi5PEJnk=; b=I0BMYE3iqyzjh1EckRCyZaQXOd
	hg4e3IqGd0+9ap+SckQNCTZfohluZRZi6YdxsGKXNIFp+7io/14NQeL9565ecB6/up856mrSUFAVf
	sWDrSpXftjv5pzZCPpJK3zklmhBwxo87qXGKu723dsY5Ul4b30AiVMge6oJ2gTT5ehOofKHFLLZW+
	HIhdM32DFDQLiEJ9wAMwC3XMD9FlxUK17ALz8u4CBy9cLJa1pE6l7Ykb2ZEvH0Cu6uNHa6kF4gCLX
	ylS8YIrT/HkWTeLEC+VWPY4H81yMk5qSF6NBDGMYnu7Y8mpQA4Qf9U2hDs2zWdGI6fkTTJgG9jWNm
	1N9OEXcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbiL-000000029S2-0jcn;
	Fri, 16 Oct 2026 06:46:49 +0000
Received: from out-247.mta1.migadu.com ([95.215.58.247] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbiI-000000029RS-2Be5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:46:48 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Fq2kJAt2D35K+AljUwJE/9dkfpEho8mR0jX5LFexqKI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792133203; v=1; x=1792738003;
 b=BTYV6L6Hvr0xPyhRSRaLHS7djWmdPS+1dUeDRUPlgnlCRKjk1y6cR/h2zNhHLryT9VWgLROw
 +fNK88S/Drwe8VLa9NoRHBvo5RSdqSq2MhYdxFPai79Sij53fPx4JZOfq2CrG8rrMOK8zi0RLjX
 SYK7DGao2OXUZooIS5ukEnds=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9fa7352bdc3aa3bc;
	Fri, 16 Oct 2026 06:46:43 +0000
X-Mizu-Trace-ID: 9fa7352bdc3aa3bc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso2971e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:46:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzV3ipxHCJgkEAb5GppiKd0aHXCC3Gjvt25XrekmXCJwqGKn1UHOYm2I296SZR28LZHhDx13yyC+JU8FnpHFqyl@lists.infradead.org
X-Gm-Message-State: AFq9FYLC4LGMCfOLn9zB66cX2T9Vbwx07laNPj4F92T4p6CJf1FndWXl
	SH/WWqbG6kdd1sfQvgkMjzcLE+/8Coxp10QjJ19fnRm7MUpSlGbQSiMSFb53EhqYvZwt1RbD2P4
	8QPTPhDN1dCJjRqLOp7IETS/iHu9iDG1H7sluc67y
X-Received: by 2002:a05:6512:6816:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5be403b66a5mr223821e87.14.1792133202280; Thu, 15 Oct 2026
 23:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20261015153041.3770032-1-fuad.tabba@linux.dev> <86h5im29xv.wl-maz@kernel.org>
In-Reply-To: <86h5im29xv.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 16 Oct 2026 07:46:05 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwZCkfj8V4x-VJhB09x4V=R84Zky8fU=ffyWAJNrJYyCw@mail.gmail.com>
X-Gm-Features: AclHuK-Mh0opfYvOg-0ZXaKxljR9jjbWCLN44NxLHz-5KGKDM7ZO10cIFATr3tM
Message-ID: <CA+EHjTwZCkfj8V4x-VJhB09x4V=R84Zky8fU=ffyWAJNrJYyCw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Only enable S1PIE and S1POE for a guest with
 TCR2 and ATS1A
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_234646_892004_9227825A 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Marc,

On Thu, 15 Oct 2026 17:41:16 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
[...]
> > +static bool feat_s1poe(struct kvm *kvm)
> > +{
> > +        return (kvm_has_feat(kvm, FEAT_S1POE) &&
> > +                kvm_has_feat(kvm, FEAT_TCR2) &&
> > +                kvm_has_feat(kvm, FEAT_ATS1A));
>
> Where's what the relevant bits of the JSON say:
>
> (FEAT_S1POE ==> FEAT_TCR2)
> (FEAT_S1POE ==> FEAT_ATS1A)
> (FEAT_S1POE ==> FEAT_HPDS)
>
> So this is missing an additional check on FEAT_HPDS, which is advertised
> as:
>
> (FEAT_AA64EL1 ==> (FEAT_HPDS <=> (UInt(ID_AA64MMFR1_EL1.HPDS) >= 1)))

Thanks, I'll add the FEAT_HPDS check to feat_s1poe() and respin.

Cheers,
/fuad

