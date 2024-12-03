Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B102CD7833F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=824aGTWhHL3Qz3Ered4xieaatA3IIyIRB4CneFMeiUc=; b=wWcj4a/ZfIy85n6K8HbzlePtxe
	iMjBs9zzTpXN7+JwagU0zYVHJgpdjnq7VAqMf2aO7LUwSW4f7ammu999Buf3y2S1Uea211F4iu7qN
	U46v2xRvkE8XUfxk4Zg/NNqV/IdMpAfulGkdZG5858lTg6s68WYy3ZGkPMcFLtX9+LNssNgOUJQEr
	gOetrsXkvFgi4wm6Gw102taVwD04icO8ipolGoXEb9iy8ALfE0FJSKipCSYvlsF12ziB2qpMQgePS
	TrH/fbfz4IUC1aLOEMgo38FtqTcShPmyTYwUiUEVxj5A2a9zqIOne+YTD02I7q0ajEiNVvflD+wZr
	vOc632zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPlZ-000000091H3-3ATx;
	Tue, 03 Dec 2024 10:04:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPkY-0000000913v-17b0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:03:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Y2bkK1mxQzPpwx;
	Tue,  3 Dec 2024 18:00:25 +0800 (CST)
Received: from kwepemd100010.china.huawei.com (unknown [7.221.188.107])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B397140444;
	Tue,  3 Dec 2024 18:03:14 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 kwepemd100010.china.huawei.com (7.221.188.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 3 Dec 2024 18:03:13 +0800
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 3 Dec 2024 11:03:11 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Vitaly Chikunov <vt@altlinux.org>, Marc Zyngier <maz@kernel.org>
CC: Will Deacon <will@kernel.org>, "james.morse@arm.com"
	<james.morse@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<catalin.marinas@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>
Subject: RE: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Thread-Topic: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Thread-Index: AQHbRHc1pIGPV7SGf0u8eV81r8P21rLTBiuAgAAE74CAAAGXAIAAAhCAgABrXYCAALdLgIAAGCGA
Date: Tue, 3 Dec 2024 10:03:11 +0000
Message-ID: <1847e34fa7724d28aeb22d93752f64f2@huawei.com>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck> <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org> <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
 <20241203092721.j473dthkbq6wzez7@altlinux.org>
In-Reply-To: <20241203092721.j473dthkbq6wzez7@altlinux.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_020322_621136_521ECCFB 
X-CRM114-Status: GOOD (  27.51  )
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



> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
> Behalf Of Vitaly Chikunov
> Sent: Tuesday, December 3, 2024 9:27 AM
> To: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>; james.morse@arm.com; linux-arm-
> kernel@lists.infradead.org; Catalin Marinas <catalin.marinas@arm.com>;
> linux-kernel@vger.kernel.org; oliver.upton@linux.dev;
> mark.rutland@arm.com
> Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
> 0000000002000000 [#1] SMP
>=20
> Marc,
>=20
> On Tue, Dec 03, 2024 at 01:31:19AM +0300, Vitaly Chikunov wrote:
> > On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> > > On Mon, 02 Dec 2024 15:59:40 +0000,
> > > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > >
> > > > Marc,
> > > >
> > > > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > > > >
> > > > > What the log doesn't say is what the host is. Is it 6.13-rc1 as w=
ell?
> > > >
> > > > No, host is 6.6.60.
> > >
> > > Right. I wouldn't be surprised if:
> > >
> > > - this v6.6 kernel doesn't hide the MPAM feature as it should (and
> > >   that's proably something we should backport)
> >
> > How to confirm this? Currently I cannot find any (case-insensitive)
> > "MPAM" files in /sys, nor mpam string in /proc/cpuinfo, nor MPAM
> > strings in `strace -v` (as it decodes some KVM ioctls) of qemu process.
> >
> > >
> > > - you get a nastygram in the host log telling you that the guest has
> > >   executed something it shouldn't (you'll get the encoding of the
> > >   instruction)
> >
> > I requested admins of the box for dmesg output since I don't have root
> > access myself and nowadays dmesg is not accessible for a user.
>=20
> This is what they reported:
>=20
>   kvm [2502822]: Unsupported guest sys_reg access at: ffff80008003e9f0
> [000000c5]
>                    { Op0( 3), Op1( 0), CRn(10), CRm( 4), Op2( 4), func_re=
ad },
>=20

As Will pointed out I think this is access to MPAMIDR_EL1 and is from this
code here,

+++ b/arch/arm64/kernel/cpuinfo.c
@@ -478,6 +478,9 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *i=
nfo)
 	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
 		__cpuinfo_store_cpu_32bit(&info->aarch32);
=20
+	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
+		info->reg_mpamidr =3D read_cpuid(MPAMIDR_EL1);
+
 	cpuinfo_detect_icache_policy(info);
 }

I did manage to boot my setup in 6.6 and this is what happens,

Host kernel 6.6
Guest Kernel 6.13-rc1

[    0.195392] smp: Brought up 1 node, 8 CPUs
[    0.219000] SMP: Total of 8 processors activated.
[    0.219629] CPU: All CPU(s) started at EL1
...
[    0.223212] CPU features: detected: RAS Extension Support
[    0.223927] CPU features: detected: Memory Partitioning And Monitoring
[    0.224796] CPU features: detected: Memory Partitioning And Monitoring V=
irtualisation
[    0.225961] alternatives: applying system-wide alternatives
...

Guest detects MPAM and boots fine.

Host kernel 6.13-rc1
Guest Kernel 6.13-rc1

[    0.196625] smp: Brought up 1 node, 8 CPUs
[    0.222093] SMP: Total of 8 processors activated.
[    0.222769] CPU: All CPU(s) started at EL1
...
[    0.226620] CPU features: detected: RAS Extension Support
[    0.227453] alternatives: applying system-wide alternatives

MPAM is not visible to Guest in this case.

So as I pointed out earlier could it be a case where the ID register report=
s MPAM support
but the firmware has not enabled MPAM?

James seems to be mentioning that case here,

" (If you have a boot failure that bisects here its likely your CPUs
advertise MPAM in the id registers, but firmware failed to either enable
or MPAM, or emulate the trap as if it were disabled)"

https://lore.kernel.org/all/20241030160317.2528209-4-joey.gouly@arm.com/

Is there a way you can find out the BIOS version on that board?

Thanks,
Shameer


