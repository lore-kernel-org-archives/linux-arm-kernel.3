Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA616C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7af4jWZsHVBiCUdoAK1Vz/BOl8LAviulacYVvdC+OmI=; b=vHOOh+OgGLGcnSMDETNZMDTaZy
	wo0fxg3RoJGzsImMbFgEPdxgAOTgwbe9IvkQcf/O7My4zditMqVn11zAgQxwn6qH4RHiAuftOI7ki
	4UurHLikF97c130mx8KAP2JFz3xbPss2Gm23QEAMUQqHzq5W3lqjQVi9nObyE71nH+ejJiSKgjfCK
	XI7wodp7e7f+Z8/wFviCF9rLiyM3lrAlLXTAFhb6OU+y4wcexjxCXLH3Or+QrppF+I6NB5y5jsNZx
	OJi1z3JjF/3Ard6cwMeLUR8T56OurTI4NrpYlsBtLlZBrG6oj2DORHb7QUat3UhKq4ciHJBw0mcjb
	VV9IMcHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4yH-0000000HSd6-3EmZ;
	Mon, 28 Sep 2026 06:36:17 +0000
Received: from out-216.mta1.migadu.com ([2001:41d0:203:375::d8] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4yE-0000000HScG-3eWa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:36:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XmPJSx18eqJeVxHruAgtYbCK0Co0IzaObDatai+KAlU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790577369; v=1; x=1791182169;
 b=g7eTD0sMisXp70OTcuW1Rxf6CWYSN/U8Fly56QPdKJUYMjvUx+w0Pjdb2ZIHUiPY+FjgqGv3
 EAbcGrWs7ltQpMNA1d6Tp+wzOyVggmYo6BzaUUNimDUuECdLU7LVLZ917NSgu63EcJx/BkMMT2X
 uIUZdANwk9jIMXkbwBOBmNzs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 65755cb907038199;
	Mon, 28 Sep 2026 06:36:09 +0000
X-Mizu-Trace-ID: 65755cb907038199
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so3621e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:36:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhn447rboazuhDzcOKZ9l/UjUE1nUuArZYfZhwbLkA7yPggQEFZy5YhNp+JwoSPFpcx9PX8YwDHy079sPBCN1f@lists.infradead.org
X-Gm-Message-State: AFq9FYIJtLmFG3IO9qFEly0zcc2IN6lcsqYEIS9UgYhFdDKKh0zhwO5E
	iB9frKMxR2JOITeGuQeXx5A1gGPBg1UfKHRJ4gbyFoxA8HAWMubtCVAxwtXI+kaDvN12y8USrsX
	fwg79O0mqhp62PinJ+8fxctW8pbFD5cuKyFFtZVIY
X-Received: by 2002:a05:6512:3414:b0:5b8:e83d:6c23 with SMTP id
 2adb3069b0e04-5b8efad55femr120630e87.15.1790577368622; Sun, 27 Sep 2026
 23:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260925090619.852995-1-fuad.tabba@linux.dev> <20260925090619.852995-4-fuad.tabba@linux.dev>
 <87y0cn2gys.wl-maz@kernel.org>
In-Reply-To: <87y0cn2gys.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 07:35:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyk3t4EA8O9i9NmFMuzVY-GQR3J3SkRz=_9XM0jrvy60Q@mail.gmail.com>
X-Gm-Features: AclHuK85fW7vrPFrlWsC7DIcsxs-RY3lLVk9SII-CnTwoETGC8BkTe57Cq68c7k
Message-ID: <CA+EHjTyk3t4EA8O9i9NmFMuzVY-GQR3J3SkRz=_9XM0jrvy60Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] KVM: arm64: Use the host's HCR_EL2 for
 non-protected VMs in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_233615_198893_2B9AEAEC 
X-CRM114-Status: GOOD (  22.86  )
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

On Sun, 27 Sep 2026 10:15:07 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > ATA, an owned bit, stays clear, as pKVM doesn't support MTE for any
> > guest. TID2 and TID4 move to pvm_init_traps_hcr(), since EL2 now sets
> > them only for a protected VM. A protected VM's HCR_EL2 is unchanged.
>
> But the host does set these bits for non-protected VMs. What is going
> to honor these traps?

The host, as it does today: the traps of a non-protected VM that the
hypervisor doesn't handle itself are forwarded to the host. What
changes is where the bits come from: for a non-protected VM they come
from the host's HCR_EL2 with the rest, and the hypervisor only sets
them itself for a protected VM. I'll rewrite the message to make that
clear.

>
> No mention of why you are adding HCR_EL2_GPF here?

It was only there to name the bit in the mask below. It's gone in v2.

[...]
> > +#define PKVM_HCR_EL2_OWNED        ((HCR_GUEST_FLAGS & ~(HCR_TWI | HCR_TWE)) | HCR_BSU |        \
> > +                                 HCR_E2H | HCR_TGE | HCR_TEA | HCR_GPF | HCR_TERR |        \
> > +                                 HCR_FWB | HCR_DC | HCR_ID | HCR_CD | HCR_NV |                \
> > +                                 HCR_NV1 | HCR_NV2 | HCR_API | HCR_APK | HCR_ATA |        \
> > +                                 HCR_DCT | HCR_FIEN | HCR_AMVOFFEN | HCR_ENSCXT |        \
> > +                                 HCR_EL2_RES0)
> > +
>
> The name of the macro doesn't indicate that this only applies to
> protected VM.
>
> Also, please don't add new uses of the compat HCR macros. I really
> want to remove them (probably post -rc1).

Will do: the masks in v2 are named per VM type and use the HCR_EL2_* names.

[...]
> This feels fragile. You start with a restrictive set (TWI, TWE, VSE),
> and then drop it all. At this point, I have no idea what you are
> letting in.
>
> It would be better to express things in a consistent way:
>
> - either the bits that are controlled by the host for either protected
>   and non-protected guests,
>
> - or the bits that are controlled by the hypervisor for either cases.
>
> Here, you're mixing both, and that's confusing.

Ack. I'll go with the bits the host controls, one set per VM type:
TWI, TWE and VSE for a protected VM, and those plus the per-VM traps
and virtual interrupts for a non-protected one. The flush then applies
the same mask logic to both.

Cheers,
/fuad

