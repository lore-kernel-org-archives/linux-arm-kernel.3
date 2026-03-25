Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD7D109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+c64TX9TAStG5n4QBbOwBHxDLYCJ+PjBNcVbNtGMx8=; b=xUjOF7ISBKMIA6rZT5oLPkRBlk
	EjXKEvKs86aQ4JUV2AqgRYX9PFZ/wsh5niCfU8V5ujR5Nnv/iw8BUyUyEBtEXIouyC7CGgVCyTnpw
	rK1EYDSyw+8U+bbKZABI/ERviEdhPVJIAZfTYlPIzrinVNybeCUMPvOLqwd66E8GEzMR510U6ntOi
	0rODE1O7FMuYKM+7/rp32Ri9Fr8VwODC3gartop1O6nfC/d5Kpum/e/HH4Xa10LoGnq+XxjH+Hogd
	WWWWW8Jsiu2mrrt0bbATJFFmMfn4tvzwQZkxMVUBU3Zlor5bWdjZAf3MmesP1M/G+53mS6YjIHjX1
	ja5kIj6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qcc-00000003pwx-1fr1;
	Wed, 25 Mar 2026 15:58:18 +0000
Received: from terminus.zytor.com ([2607:7c80:54:3::136] helo=mail.zytor.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QcX-00000003pwG-2GnJ;
	Wed, 25 Mar 2026 15:58:16 +0000
Received: from [IPV6:2601:646:8081:9481:619:3ffd:957c:6748] ([IPv6:2601:646:8081:9481:619:3ffd:957c:6748])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62PFE0CM3057644
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 25 Mar 2026 08:14:01 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62PFE0CM3057644
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774451646;
	bh=m+c64TX9TAStG5n4QBbOwBHxDLYCJ+PjBNcVbNtGMx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RHklxLfiOlJf6ydmRmJruDGnJeWMZSbz2TgxABeLCgguQaUbYsc9vR9kpgjAtaRk6
	 D7BSdsEd+lvAoCQg+RbZcvgtOjl5ikAs97OdfN6AYdowAx+SkUCmf/8a7rxvIX1199
	 n1C53Bc4syiY0JVf3wcgOdQFaGlli8ZPulCYU+tqXHoikLbqaKaukH46nBwaABbmkR
	 FqzyBozoAq6ydYU475wWtUu9yg9VB2ezfO6KFROa2nbUotE425BtfRIaR4mJKhTxf8
	 dVWONsYwf/QQWCyfrPeHYwfZmG0pn9A7Kw7p2V6FDiyY1iJynsS0qMGEvvGfkQIYvu
	 dNPPZv5PxcbxQ==
Message-ID: <59d1d178-c141-4229-81e9-a6c23fa81f2f@zytor.com>
Date: Wed, 25 Mar 2026 08:13:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] raid6: remove __KERNEL__ ifdefs
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
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260324064115.3217136-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_085815_796143_1AC89A2B 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

On 2026-03-23 23:40, Christoph Hellwig wrote:
> With the test code ported to kernel space, none of this is required.

I really *really* don't like this.

The ability of running in user space is really useful when it comes to
developing new code for new platforms, which happens often enough for this code.

	-hpa


