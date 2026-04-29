Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498DAFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Umh2GNLzS0ZLJ1ouGA7sN5L/Audjee+GTfXIQgbar64=; b=Fb803Vt3Egs/lWoi31oizO1vha
	+B1wdGL377sbQapa93gctgdNUTZ/T7JJO4h8bJDMwF262mGriHQfuCG6etKSabZNU0pI4Jn7e70xa
	jH/gxEiXJTzwqqhLdq+8uYkLNlncZvMtoH2eFVDfuCgl3/uyBW5DofDuitWix8a5+P/Fc6x0gUsc/
	tNmUHwsuJqPFZu9QspYuokp1N2GYA0yGZ9Bgp7o29suaVp/Fq4SKLi0qH5X22Y3crTKqK3b0Mbphc
	otyogC2BPtEVZx5V5zGMFSMbBb9iJ48x2iG6lEkmBw00cUpp0/msmSh/2Lv7gbfPoV1hNS+QaD+Fq
	Zwr2tp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1fq-00000003PBd-0zWY;
	Wed, 29 Apr 2026 09:57:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1fp-00000003PB3-2ZDW;
	Wed, 29 Apr 2026 09:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Umh2GNLzS0ZLJ1ouGA7sN5L/Audjee+GTfXIQgbar64=; b=L5hJk3io3fAVDZsT+P4P3sNFEy
	hvESbosUOG1UGwKYXVm4zuJrTY9hN5sECsgQbITGxfUhTPwub34eI6RIDToKb/XRmTu6yiDCyBobk
	LrGygpsUHyzWfaaSDwLtGI1aFOi9HtUsPENpDqbzNuCt3QiCzajSN22/BPD0ehFL4f+cK1aNu17t1
	MTrxBTut9L5JXu4xL3PexvZjoaA3QzkrUdapfD2w0e1VED8eomjdml9oqM2KTSdhwolRJPBq0aMNa
	gdzX5Q2BC/xM6TR/+TehQf7fwYRMRDpitCYmgHC0qXiCn7zwa+loOx8dRPLaLCae6Z0pgKpclXiyS
	PtTtV7sQ==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1fl-000000052km-21HP;
	Wed, 29 Apr 2026 09:57:40 +0000
Received: from [10.95.65.160] (unknown [167.220.238.0])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5250A20B716C;
	Wed, 29 Apr 2026 02:57:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5250A20B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1777456652;
	bh=Umh2GNLzS0ZLJ1ouGA7sN5L/Audjee+GTfXIQgbar64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q31XCOROwAjmtXRERBx2iF+/+sJsH2ybABfnJCzFn77NWB9EVyO4d6UDaaSUN2seb
	 YQ7d0/CyN4ooJv9sS8ZRGDqMJBY896FQHOvEKQgI5tVaj4mJi2D6hDXN+gA0IZ5wgq
	 80ZbIizjLbl6bTb0czS/dH3jkSHeHVV2s6z/Ha8s=
Message-ID: <80efa86b-de96-438c-ac04-fda22c655500@linux.microsoft.com>
Date: Wed, 29 Apr 2026 15:27:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] Drivers: hv: Move
 hv_call_(get|set)_vp_registers() declarations
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "vdso@mailbox.org" <vdso@mailbox.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-9-namjain@linux.microsoft.com>
 <SN6PR02MB4157852404B5258EF13A5450D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157852404B5258EF13A5450D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105737_860054_B9C3ABC8 
X-CRM114-Status: GOOD (  14.06  )
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



On 4/27/2026 11:09 AM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
>>
>> Move hv_call_get_vp_registers() and hv_call_set_vp_registers()
>> declarations from drivers/hv/mshv.h to include/asm-generic/mshyperv.h.
>>
>> These functions are defined in mshv_common.c and are going to be called
>> from both drivers/hv/ and arch/x86/hyperv/hv_vtl.c. The latter never
>> included mshv.h, relying on implicit declaration visibility. Moving the
>> declarations to the arch-generic Hyper-V header makes them properly
>> visible to all architecture-specific callers.
>>
>> Provide static inline stubs returning -EOPNOTSUPP when neither
>> CONFIG_MSHV_ROOT nor CONFIG_MSHV_VTL is enabled.
> 
> Looking at the drivers/hv/Kconfig, it's possible to build with
> CONFIG_HYPERV_VTL_MODE=y, but not CONFIG_MSHV_VTL. In such a
> case, mshv_common.o doesn't get built, which is why the stubs are
> needed. Is such a configuration desirable for some scenarios?
> 
> I wonder if having CONFIG_HYPERV_VTL_MODE force the building of
> mshv_common.o would be a better approach. Then the stubs wouldn't
> be needed. The "ifneq" statement in drivers/hv/Makefile could use
> CONFIG_HYPERV_VTL_MODE instead of CONFIG_MSHV_VTL, and
> everything would be good since CONFIG_MSHV_VTL depends on
> CONFIG_HYPERV_VTL_MODE.
> 

This looks good. I'll try this and make the changes. In case there are 
some challenges with that, I'll revert back.


Regards,
Naman

