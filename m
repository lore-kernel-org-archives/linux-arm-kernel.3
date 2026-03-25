Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E63C109C035
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2u7ExN5eifBevZeC2xb3xyOceea1RmqMBZtOrcYzMg=; b=qxvGn70hg5jwrEjSbCxYKHbDxp
	rl2l71Ry6AvF+HmMbIVHXw/WZWGgqTlowSKJvJ7b8Bu69ig981Lf84boSDMl/1vTHbdPsgKogw8Xw
	WUjwH53ry/f6T/PKYgSkNCDsozZjgPhszMnJSLJZ101aV3750br0a0+PhWYmyMu4a2PJ0VKihdpUJ
	ArD4zqtyZYakNNkPKDNvvewPUYxH9XYdOZ13qw6yluatg1J/0s4jmDrsyaVxZkZcqKE3R1HjUgSqP
	OcP0xzqKpsOEs+uzDWx2czX8Df+x1uZGM17Hk9qKi1kXoxuXgcfauyqdmK2Hpiu04/wjW3mRokMza
	qogWgasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7v-00000003tuW-1tJI;
	Wed, 25 Mar 2026 16:30:39 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5R7s-00000003tsR-3QdF;
	Wed, 25 Mar 2026 16:30:37 +0000
Received: from [IPV6:2601:646:8081:9481:619:3ffd:957c:6748] ([IPv6:2601:646:8081:9481:619:3ffd:957c:6748])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62PGDMNL3153560
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 25 Mar 2026 09:13:22 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62PGDMNL3153560
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774455208;
	bh=v2u7ExN5eifBevZeC2xb3xyOceea1RmqMBZtOrcYzMg=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=J5ymzmT6BQR65DUAALhhSYjcHADheoqS/Y1TB20cnYBvtYJoCBoHEmdHJLu/Si20r
	 6rz3J3dMJE/DEAiYOO3Fx6vfsrD2MnYD1ixgvwprxcGhIEVWzMLmCHreu1sLIn5SNP
	 6VBBW2+SCSgr4uOYIIcCe+9jSspVTz7NsGduU1IHGnQyH3sgnggWaXIAuTY0sSScDJ
	 hy7fCQlaHvFN3juiyk0mVo/l0cAc4F3B4clshklYM45be69gwY6re6ju8/GDKmI3HX
	 ln5NoZUdBqzuxxOWGyGyQysV8OXGXSO4zB7ByDmwCtm51dOIhtQh0z8KO6LEy/vgUL
	 bF7T6QJ+oA0WA==
Message-ID: <fa11e4d3-1c70-4fa7-9f03-8772c002be6a@zytor.com>
Date: Wed, 25 Mar 2026 09:13:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] raid6: remove __KERNEL__ ifdefs
From: "H. Peter Anvin" <hpa@zytor.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>,
        Yu Kuai <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>,
        Li Nan <linan122@huawei.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-raid@vger.kernel.org
References: <20260324064115.3217136-1-hch@lst.de>
 <20260324064115.3217136-3-hch@lst.de>
 <59d1d178-c141-4229-81e9-a6c23fa81f2f@zytor.com>
Content-Language: en-US, sv-SE
In-Reply-To: <59d1d178-c141-4229-81e9-a6c23fa81f2f@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_093036_861908_3A67B706 
X-CRM114-Status: GOOD (  15.18  )
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

On 2026-03-25 08:13, H. Peter Anvin wrote:
> On 2026-03-23 23:40, Christoph Hellwig wrote:
>> With the test code ported to kernel space, none of this is required.
> 
> I really *really* don't like this.
> 
> The ability of running in user space is really useful when it comes to
> developing new code for new platforms, which happens often enough for this code.
> 

That being said -- and I do say this as the original author of this code --
this should be reduced to the maximum extent possible to a (minimal) set of
#ifndef __KERNEL__, which should be localized as much as possible. The actual
user space components, even such a thing as a simple #include, should be moved
to a separate user space header.

But pretty please do leave the ability to debug the algorithms in user space.
This is hard code to write and debug; it is not just about regression testing.

	-hpa


