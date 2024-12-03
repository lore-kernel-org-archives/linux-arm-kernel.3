Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B667E74AFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 22:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARBoA/491KfTjwM3j7tR2fgJcBrjkB1Mi0CScHy/oN8=; b=pOJJ+MyKQMr6mmK3sHXO0AraZK
	m/oK7+wBcAB02DxVRR7VEZE+2UiILNKHZxtV+S4gP9Enhwf2tx2wkx5OZLlPXdIQKSXX1gxk2aF1U
	oljuEW5mHGG/kJhTe/wkP9FEtdM4UwLfy801rRRKHJPedLxhLmSVrdrQh7JdVXf6kZ0rMALA/zBBu
	ucQuqaTllcngT8NLWLBvTx9bWvFfys9u5sxjCz/2kfUF6Aeb+vI37cBvDTHoqX71XMvZJSzdah2Ff
	Vv7vFWKy+avJxsYq/irhQ4usXSX/w09lQ4Y2vW73MAtVCLtWdhvMQ3GMdMyLGH5Mzvd0jXQN778vY
	NOXBhd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbLX-0000000Aumk-0IIs;
	Tue, 03 Dec 2024 22:26:19 +0000
Received: from vmicros1.altlinux.org ([194.107.17.57])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIbAX-0000000Ass6-0Ndh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 22:14:59 +0000
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id E12D172C97D;
	Wed,  4 Dec 2024 01:14:53 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id CFD1636D0178;
	Wed,  4 Dec 2024 01:14:53 +0300 (MSK)
Date: Wed, 4 Dec 2024 01:14:53 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"Wangzhou (B)" <wangzhou1@hisilicon.com>,
	"Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <20241203221453.mwh6sozyczi4ec2k@altlinux.org>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
 <20241203092721.j473dthkbq6wzez7@altlinux.org>
 <1847e34fa7724d28aeb22d93752f64f2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <1847e34fa7724d28aeb22d93752f64f2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_141457_455171_3746B8EF 
X-CRM114-Status: GOOD (  36.15  )
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

Shameer, Marc, Oliver, Will,

On Tue, Dec 03, 2024 at 10:03:11AM +0000, Shameerali Kolothum Thodi wrote:
> > -----Original Message-----
> > From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On
> > Behalf Of Vitaly Chikunov
> > Sent: Tuesday, December 3, 2024 9:27 AM
> > To: Marc Zyngier <maz@kernel.org>
> > Cc: Will Deacon <will@kernel.org>; james.morse@arm.com; linux-arm-
> > kernel@lists.infradead.org; Catalin Marinas <catalin.marinas@arm.com>;
> > linux-kernel@vger.kernel.org; oliver.upton@linux.dev;
> > mark.rutland@arm.com
> > Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
> > 0000000002000000 [#1] SMP
> > 
> > Marc,
> > 
> > On Tue, Dec 03, 2024 at 01:31:19AM +0300, Vitaly Chikunov wrote:
> > > On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> > > > On Mon, 02 Dec 2024 15:59:40 +0000,
> > > > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > > >
> > > > > Marc,
> > > > >
> > > > > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > > > > >
> > > > > > What the log doesn't say is what the host is. Is it 6.13-rc1 as well?
> > > > >
> > > > > No, host is 6.6.60.
> > > >
> > > > Right. I wouldn't be surprised if:
> > > >
> > > > - this v6.6 kernel doesn't hide the MPAM feature as it should (and
> > > >   that's proably something we should backport)
> > >
> > > How to confirm this? Currently I cannot find any (case-insensitive)
> > > "MPAM" files in /sys, nor mpam string in /proc/cpuinfo, nor MPAM
> > > strings in `strace -v` (as it decodes some KVM ioctls) of qemu process.
> > >
> > > >
> > > > - you get a nastygram in the host log telling you that the guest has
> > > >   executed something it shouldn't (you'll get the encoding of the
> > > >   instruction)
> > >
> > > I requested admins of the box for dmesg output since I don't have root
> > > access myself and nowadays dmesg is not accessible for a user.
> > 
> > This is what they reported:
> > 
> >   kvm [2502822]: Unsupported guest sys_reg access at: ffff80008003e9f0
> > [000000c5]
> >                    { Op0( 3), Op1( 0), CRn(10), CRm( 4), Op2( 4), func_read },
> > 
> 
> As Will pointed out I think this is access to MPAMIDR_EL1 and is from this
> code here,
> 
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -478,6 +478,9 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	if (id_aa64pfr0_32bit_el0(info->reg_id_aa64pfr0))
>  		__cpuinfo_store_cpu_32bit(&info->aarch32);
>  
> +	if (id_aa64pfr0_mpam(info->reg_id_aa64pfr0))
> +		info->reg_mpamidr = read_cpuid(MPAMIDR_EL1);
> +
>  	cpuinfo_detect_icache_policy(info);
>  }
> 
> I did manage to boot my setup in 6.6 and this is what happens,
> 
> Host kernel 6.6
> Guest Kernel 6.13-rc1
> 
> [    0.195392] smp: Brought up 1 node, 8 CPUs
> [    0.219000] SMP: Total of 8 processors activated.
> [    0.219629] CPU: All CPU(s) started at EL1
> ...
> [    0.223212] CPU features: detected: RAS Extension Support
> [    0.223927] CPU features: detected: Memory Partitioning And Monitoring
> [    0.224796] CPU features: detected: Memory Partitioning And Monitoring Virtualisation
> [    0.225961] alternatives: applying system-wide alternatives
> ...
> 
> Guest detects MPAM and boots fine.
> 
> Host kernel 6.13-rc1
> Guest Kernel 6.13-rc1
> 
> [    0.196625] smp: Brought up 1 node, 8 CPUs
> [    0.222093] SMP: Total of 8 processors activated.
> [    0.222769] CPU: All CPU(s) started at EL1
> ...
> [    0.226620] CPU features: detected: RAS Extension Support
> [    0.227453] alternatives: applying system-wide alternatives
> 
> MPAM is not visible to Guest in this case.
> 
> So as I pointed out earlier could it be a case where the ID register reports MPAM support
> but the firmware has not enabled MPAM?
> 
> James seems to be mentioning that case here,
> 
> " (If you have a boot failure that bisects here its likely your CPUs
> advertise MPAM in the id registers, but firmware failed to either enable
> or MPAM, or emulate the trap as if it were disabled)"

I tried to verify that MPAM is advertised with qemu+gdb method, as
suggested by Oliver, but ID_AA64PFR0_EL1 register is not there.

  (gdb) i r ID_AA64PFR0_EL1
  Invalid register `ID_AA64PFR0_EL1'

Are there other suggestions?

> 
> https://lore.kernel.org/all/20241030160317.2528209-4-joey.gouly@arm.com/
> 
> Is there a way you can find out the BIOS version on that board?

Unfortunately, admins of the server do not provide me with this info.

For such cases, when MPAM is incorrectly advertised, can we have kernel
command line parameter like mpam=0 to override it's detection?

I think with "If you have a boot failure that bisects here" it's
acknowledged possibility and it's confirmed by our server.

Thanks,

> 
> Thanks,
> Shameer

