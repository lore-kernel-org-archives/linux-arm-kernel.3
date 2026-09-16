Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C25C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9TGNcoh/UUF4V8YnlKW3/0U/Hv15updyUlsY+Y1w/0=; b=hIF2D2dfOkiEUJH20Xdpi5h03W
	Sl3bKGwYu4v84jrPHoOyyqnm6H/kin++2hoYqHiWZS348zyoCUie2e6Ks/WnPoasnPqbnQg7uJVCt
	2Ij7OipyPwpqgdbzR0+oz+AtUARsBE7o/iESyeB3DnULX/tAxguZjbjMHpgLmWk2+BNnZ0UgyGSC1
	JtD0fJly+Qr6Jp6eD3Fu1s3OoNSgv3wY78h4RfwTX8CN1+0TrXWIhHlQG8R745iITp13nufvZ2G3/
	onmg7ftimfuk5YkDZpNf1lrrIe+9KGJCcaT9pwR/J8cdM1EZDw31XvH9QA8OFz0HfOMpyAsruVkNT
	mdkuPWQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nrW-000000095FF-1Zjl;
	Wed, 16 Sep 2026 11:31:38 +0000
Received: from out-202.mta0.migadu.com ([2001:41d0:1004:224b::ca] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6nrT-000000095EU-3Its
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 11:31:37 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=H9/X4Q083/Be4Ty8+X1bHX6F/upo2FhttV8SucE1Kc4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789558292; v=1; x=1790163092;
 b=gIrZXGuSEfW3dH/sbbkbdRfmm8b9gUSKI3legviFOgRmrV4xEjTmRSTrsNsNNtd2rRnDjJae
 /PWaYN0Hr641bLRa1N2iuMInvMNKsRwlgRI32JGJyWEu9aObjZcK0vLnnu1pOf8EAR2qpkGzaES
 IaQVuPAClPzs6aYd0YYrr9Jk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 06762f5d39736ba6;
	Wed, 16 Sep 2026 11:31:32 +0000
X-Mizu-Trace-ID: 06762f5d39736ba6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5985e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 04:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLkvgi0mjEE/4z9oSzzK7eZ/uA+nkzr/VnaIcj+/g/q/4QdZLEeO+lKKEyVYxUyRSTHWHZwS0eI5pOjjJ4IK1w@lists.infradead.org
X-Gm-Message-State: AFuF++lZL9BWAdPs52c5isgze5xbhjdfW8Tal605Aq+CpF3Sh9tvjaWF
	CtgaknbXvy7PEcySqhpiMpoFyx8Q9B3XqQzVDWJe3FMhVbtXioIvuA4c3S70q8RP44y4rlemUOV
	68axFJMfEmwg01GlphmSXhPfqhZPnqFobJ/m2KRSL
X-Received: by 2002:a05:6512:1348:b0:5b8:b19a:6d1d with SMTP id
 2adb3069b0e04-5b8b63618f4mr78123e87.10.1789558287151; Wed, 16 Sep 2026
 04:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123846.2317931-1-fuad.tabba@linux.dev>
 <20260915123846.2317931-4-fuad.tabba@linux.dev> <aqp25JLeqyCKtCQH@e143914.arm.com>
In-Reply-To: <aqp25JLeqyCKtCQH@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 16 Sep 2026 12:30:50 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzrLF3Hg5ydxyH42_5MuVy8UgX_2i+9j=b9iGv4HXQO8w@mail.gmail.com>
X-Gm-Features: AcwNN1Vz9eSWek0wyBJeKGdLSTjp1eCz6MDTP6a0k4XXrJwyuhhk-6TSflZWtaw
Message-ID: <CA+EHjTzrLF3Hg5ydxyH42_5MuVy8UgX_2i+9j=b9iGv4HXQO8w@mail.gmail.com>
Subject: Re: [PATCH 3/7] KVM: arm64: Validate the host-provided vgic model in pKVM
To: Joey Gouly <joey.gouly@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, seiden@linux.ibm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	vdonnefort@google.com, qperret@google.com, Sascha.Bischoff@arm.com, 
	steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_043136_341267_E93F00B9 
X-CRM114-Status: GOOD (  12.86  )
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

Hi Joey,

On Wed, 16 Sept 2026 at 12:00, Joey Gouly <joey.gouly@arm.com> wrote:
[...]
> > +       if (vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
> > +               vgic_model = 0;
> > +       hyp_vm->kvm.arch.vgic.vgic_model = vgic_model;
>
> A bit confused by what is expected by writing 0 here? I would have maybe
> expected to refuse running this VM? What happens if the host writes some
> garbage here, so vgic_model=0, but then tries to access gic-v3
> registers?

0 is vgic_model for a VM with no in-kernel irqchip, which pKVM runs.
An unsupported model is treated the same, as a protected VM's features
are masked rather than rejected.

At EL2 the model only selects the GICv5 world-switch path (GICv3 is
saved and restored under the gicv3_cpuif static key) and gates
__vgic_v3_perform_cpuif_access(), which returns 0 for anything but V3
and leaves a trapped ICC_* access to the host. A host that writes a
model it doesn't have gets a guest without a working GIC, which it can
do anyway, but can't make EL2 run the GICv5 path on a GICv3 machine.

I'll say so in the comment if I respin.

Cheers,
/fuad

