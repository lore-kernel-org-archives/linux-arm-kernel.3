Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81FEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 09:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oxB5PSG3rSVBd3uKBa9I0cO8eKhcw0Hi0sAamyaJ6w=; b=L6d2wF6g3v0q0gO9iYG/P1pGio
	2j/Aa2X7qiWdwSr4uxXlMKwAySqaOzJpkcHeZaTtxqJwfxaGTeL2BlYa6hIM5gnlYhNHZbteBLQCm
	3Up8nUeU+lpa+kSlt081WUurMvWpAea3WMI7ENzR5S4GGlXnFoFdSMSEjacNJB5esUZ7cZLmXTGYv
	9553JBlfTiE4sFXyuINmKObmRwy7eGG/JObZBAhvY5e1fenvEwOOBGTKwG9ufN7cF2NVcqwcMVrrw
	bJXLskntMm8VkJ2Cs2MqK78ywGLbcv2Tc441NzSBK3k0N+gCZjcsq1LHW8LFY96pw8Kair8DRa/sU
	08QGEWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueVTe-00000004Sxd-2cGR;
	Wed, 23 Jul 2025 09:09:30 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueV7X-00000004PWF-07FL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 08:46:41 +0000
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753260395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6oxB5PSG3rSVBd3uKBa9I0cO8eKhcw0Hi0sAamyaJ6w=;
	b=PcNSGjeun8cNyHh7w9mXfz6xt7fkCyGGQ28JTMCbfNmUSyyQmZoR+CEfikjwPIwT3nrNZg
	izoee36/x89idG0gpMz4tGLsZCKzotxd1wcCnaCY7GmIIGGowtBNw08PWtpUdLaH85v1QP
	4+lqR8h1ReVVTIikO6ztayivqDq2AV0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 4/4] KVM: arm64: selftest: vgic-v3: Add basic GICv3 sysreg
 userspace access test
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
In-Reply-To: <87qzy7tja1.wl-maz@kernel.org>
Date: Wed, 23 Jul 2025 17:46:14 +0900
Cc: kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>,
 Eric Auger <eric.auger@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <576D387F-15E6-46C1-BA32-34FB64551CBA@linux.dev>
References: <20250718111154.104029-1-maz@kernel.org>
 <20250718111154.104029-5-maz@kernel.org> <aIBseJ3aO+hMVAee@vm4>
 <87qzy7tja1.wl-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_014639_618938_A768914D 
X-CRM114-Status: GOOD (  11.06  )
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



> On Jul 23, 2025, at 17:15, Marc Zyngier <maz@kernel.org> wrote:
>=20
> On Wed, 23 Jul 2025 06:00:40 +0100,
> Itaru Kitayama <itaru.kitayama@linux.dev> wrote:
>>=20
>> On Fri, Jul 18, 2025 at 12:11:54PM +0100, Marc Zyngier wrote:
>>> We have a lot of more or less useful vgic tests, but none of them
>>> tracks the availability of GICv3 system registers, which is a bit
>>> annoying.
>>>=20
>>> Add one such test, which covers both EL1 and EL2 registers.
>>>=20
>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>>=20
>> I've tested this selftest on the RevC FVP with kvm-arm.mode=3Dnested.
>>=20
>> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
>>=20
>> Running GIC_v3 tests.
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'672'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'657'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'672'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'672'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'672'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'672'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'682'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'682'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'657'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'672'
>> __vm_create: mode=3D'PA-bits:40,  VA-bits:48,  4K pages' type=3D'0', =
pages=3D'657'
>=20
> I have no idea what you tested it on, because I get none of this
> nonsense.
>=20
> Where is it coming from?

=46rom lib/kvm_util.c file __vm_create()=E2=80=99s pr_debug().

Anyway, I rebuilt the kernel your recent two patch sets on top of =
kvm-next/next and did the test.=20

# ./arm64/vgic_init
Random seed: 0x6b8b4567
Running GIC_v3 tests.
SKIP SYS_ICC_AP0R1_EL1 for read
SKIP SYS_ICC_AP0R1_EL1 for write
SKIP SYS_ICC_AP0R2_EL1 for read
SKIP SYS_ICC_AP0R2_EL1 for write
SKIP SYS_ICC_AP0R3_EL1 for read
SKIP SYS_ICC_AP0R3_EL1 for write
SKIP SYS_ICC_AP1R1_EL1 for read
SKIP SYS_ICC_AP1R1_EL1 for write
SKIP SYS_ICC_AP1R2_EL1 for read
SKIP SYS_ICC_AP1R2_EL1 for write
SKIP SYS_ICC_AP1R3_EL1 for read
SKIP SYS_ICC_AP1R3_EL1 for write
SKIP SYS_ICH_AP0R1_EL2 for read
SKIP SYS_ICH_AP0R1_EL2 for write
SKIP SYS_ICH_AP0R2_EL2 for read
SKIP SYS_ICH_AP0R2_EL2 for write
SKIP SYS_ICH_AP0R3_EL2 for read
SKIP SYS_ICH_AP0R3_EL2 for write
SKIP SYS_ICH_AP1R1_EL2 for read
SKIP SYS_ICH_AP1R1_EL2 for write
SKIP SYS_ICH_AP1R2_EL2 for read
SKIP SYS_ICH_AP1R2_EL2 for write
SKIP SYS_ICH_AP1R3_EL2 for read
SKIP SYS_ICH_AP1R3_EL2 for write

Thanks,
Itaru.

> M.
>=20
> --=20
> Jazz isn't dead. It just smells funny.



