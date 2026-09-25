Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C5EC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkP8BrEWT30kLP9eSQGchhYsA7DxDtHozH0yKPW1NRY=; b=4Mt2xVT+v3Xr7DGkqoVhadxgh7
	RVmWMzV2heMKAdbH3wGVtNrAHVFOt5P90zZcUfWVdDWyFD7E+ZIQOm6PrIXVwPVZO0Q8h6d4aLU4w
	Mk/Y8RmvR1DwhtWiiKVUTwa11dtJWE2CeLjJ+QaNttGO3DjYgQg14pX+tk5P5NTR7aRtHBC62lNp5
	EqrF3Gex2GtaZGnTBhLsw5sEL3p8H3ZaIMP6QiyKpG1E68gU6OHB0/8jcfcmLnOBNECMCgc4op+Jj
	uhTDiE2ytVBl3eAKIFOIRDt+lMVqQGaZdHljldqQJnHG5hxSKSECv4MZfZCnEApU7ZgRnjc3tidWa
	lt5mVx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7l5-0000000DlpD-3PCZ;
	Fri, 25 Sep 2026 15:22:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7l4-0000000Dlou-3VVx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Sep 2026 15:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JkP8BrEWT30kLP9eSQGchhYsA7DxDtHozH0yKPW1NRY=; b=CZR5qdZ7GDxvGPv9mFKx8yAbgg
	R6gImLXs/zLqKtr2a1hV90pc3HMG9+m4MkunUYv7nU9b+mk41htDt7eo0QXDLboO79Hyc3hGVzFD/
	FuGdlTKXMRkmV0eCL7G6eePCpooQHqlv0ZO+intv51TRCsprvoEgOCiIbE4DfrxL/dOqc9GXbToud
	re+/6OQ3CsqigFJSCmcB+mN6hkTkehYFP4bfOUqgGjZXvvCLRC6ktDASh5TIxqpqpVQUNXNPtaROz
	+Y2SXNJLZLEvudmifrkF0/CHTHGxMco+aybZWvHG7TpIc1PcJrkTPpbw2qY4sUQw0MjsZjob55Juh
	qcnEunmg==;
Received: from out-250.mta0.migadu.com ([2001:41d0:1004:224b::fa] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xA7l1-0000000H3Ra-3l5j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:22:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=z060NorVjkdchyRWUzkmKu19VquiP8XV8AyIxkINsfE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790349754; v=1; x=1790954554;
 b=YKwr0zlfW/JHsocYquG4Dq6Do2Vffw/g7EvImboh/FRaqcbp72oAlJykQeq4RScWz3ALwkGo
 DilQc0173VU7xtNeBaeo2Nt3NXcxqeGjcvSEp58Nysu2zkX8MFlYEXpgAnh//MX3VxFx/aWADeR
 07H+7gwU6jAcQRUlW2T72dc8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2fcf0e616ef4fbeb;
	Fri, 25 Sep 2026 15:22:34 +0000
X-Mizu-Trace-ID: 2fcf0e616ef4fbeb
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b8ea0ca5baso4912e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:22:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxK3olM9p93cpXeCngu6zjfcy5XCi42dYUS7PlQLxIRBFCvHxiaqPYf11A2R2RX25YsoHTckUvfRr+yBtd3fz2R@lists.infradead.org
X-Gm-Message-State: AFuF++mXlMvbvW/31eMBv0qH8Q0MlxVZWpjMHZjq9AqgvZtfBqtJ0jc1
	L1CVkaBrxMu1QuaGRXDS4IwNyVgL9F9OnJT2Lfw9VKdxzzvigerC2LH3brcGprZd1/tnsvJeFkB
	9xuTey1vCGLPvhiawBOfIBYEuvae0Z+o8p4ri0B5r
X-Received: by 2002:a05:6512:ba4:b0:5b8:eb6b:2a52 with SMTP id
 2adb3069b0e04-5b8ed09a59amr43196e87.2.1790349749415; Fri, 25 Sep 2026
 08:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260925090619.852995-1-fuad.tabba@linux.dev> <20260925090619.852995-3-fuad.tabba@linux.dev>
 <8733ux4bow.wl-maz@kernel.org>
In-Reply-To: <8733ux4bow.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 25 Sep 2026 16:21:53 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy2hfn0qighn2kZ-Gyy_3nKtwiRCGMrox6K-Yn22ZkP6Q@mail.gmail.com>
X-Gm-Features: AclHuK_gTf2iqS9h2Xa5Ix6rBbxV4n0KGAvJD4FiA9vRXr5yyjusiCbOGjiate0
Message-ID: <CA+EHjTy2hfn0qighn2kZ-Gyy_3nKtwiRCGMrox6K-Yn22ZkP6Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Clear HCR_EL2.RW for 32-bit
 non-protected vCPUs
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_162240_089738_0624BB6C 
X-CRM114-Status: GOOD (  19.33  )
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

On Fri, 25 Sep 2026 16:01:35 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> Apologies from repainting the proverbial bike shed, but I find the way
> the above is written very hard to understand, because you are
> describing minute aspects of the code without giving the big picture
> upfront.

Writing commit messages and comments is hard! :) I'm working on it...

>
> I'd rather see something like:
>
> "pKVM maintains its own copy of a per-vcpu HCR_EL2. On initialisation
> of the hypervisor's private vcpu structure, HCR_EL2.RW is set to 1
> unconditionally.  However, nothing forbids userspace to create a
> non-protected, AArch32 guest. Since HCR_EL2.RW==1, entering the guest
> fails with an IL exception.
>
> Make sure HCR_EL2.RW is cleared when the vcpu is AArch32 at EL1, and
> that the HW actually supports this."
>
> which describes the problem without the reader having to dig into
> code. It makes matching the description and the code very easy. At
> least for me, YMMV...

Much clearer, I'll use that for v2, and give the other messages in the
series the same treatment.

[...]
> That's another example: yes, this is all true. But how relevant is it?
> Are you clearing RW just for the sake of vcpu_el1_is_32bit() to work
> and prevent an UNDEF? No. It is so that 32bit guests do work. The
> above really is only paraphrasing the ARM ARM.
>
> What you don't describe is that if ARM64_HAS_32BIT_EL1 is not
> implemented, you let the vcpu walk to the cliff with RW==1, and rely
> on the CPU generating an IL exception. For me, this is the important
> piece of information that needs to be captured.

The comment should say what happens without AArch32 EL1: RW stays set
and the entry fails with the IL exception, rather than EL2 switching
registers that are UNDEFINED there. I'll rewrite it for v2.

[...]

> Other than that, the patch looks great! :)

Sashiko didn't complain... :D

Cheers,
/fuad

