Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC29C4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 04:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvcqjcKD2k24eeG1X+IgiTsgr1jJ4CBmmqIvgaG6pRU=; b=Jo/OKPdBV64Kd57i2c9OEjsAMj
	zj+SnFX41yFvUfCLY0MkIQnTA2N0X6iEzjMNNsNUAxhQoMyuQ6lhWDIHc4IFoQF4rK6uPj5U0bJEl
	bxmyMSj5VqGTCWOQS7kW0r65a9aT/MK+2kMqW2uXi/Uv7yg82esp4rIlZScG8VjhtV05GaGx5xzEk
	ON+62MFzpCt8UQZVwh3H252bx8/cDUQ19+Qq9JlDAMVKG9dnOcLlI+jbi1gl0Yse5X50wzOsuUAwW
	dYbcUNWVNP6OLnIs4DCDZeicO8C+HdCzpsf63yQ5DCvn9l8w67T+3xJYMdRDHNzcVo1w3lbL7+vK8
	kPCLczMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wka01-0000000170U-04Fy;
	Fri, 17 Jul 2026 04:16:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZzy-00000001705-3kPU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 04:16:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 207651476;
	Thu, 16 Jul 2026 21:16:25 -0700 (PDT)
Received: from [10.164.18.90] (unknown [10.164.18.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 562023F7D8;
	Thu, 16 Jul 2026 21:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784261789; bh=qbRRlxOtRN6hWppRiqfYwDql1OvoKXqkARDwBGDBgBY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBQA1azIq5p20nHyKyJX1ATjKM0CRuIaUkF0sGkJBbdJ7Cf55ezLmUl3KBCpVimjA
	 y9Dv4lsQnL9UOtMFVZdlDyCENDDHnXXEaGnRIcaNtCngwdFrOqb+LGcgeU5UkBgwQJ
	 0/m1kIKdvfx2hl9pVtPkU+DK372qUVeyxRQfxmI0=
Message-ID: <8f512add-b78f-49df-9239-274e7a9558ea@arm.com>
Date: Fri, 17 Jul 2026 09:46:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/defconfig: Restore built-in 9P rootfs support
To: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Eric Biggers <ebiggers@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org
References: <20260716100243.1604526-1-anshuman.khandual@arm.com>
 <2fae9ef8-2ec1-48ed-9b25-8526db625732@oss.qualcomm.com>
 <cd8cc649-c4e9-4868-b68a-6a9de72b32fe@app.fastmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <cd8cc649-c4e9-4868-b68a-6a9de72b32fe@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_211631_147969_CA0DB06A 
X-CRM114-Status: GOOD (  12.22  )
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



On 16/07/26 5:01 PM, Arnd Bergmann wrote:
> On Thu, Jul 16, 2026, at 13:01, Krzysztof Kozlowski wrote:
>> On 16/07/2026 12:02, Anshuman Khandual wrote:
>>> Commit d521c4ca039f ("arm64: defconfig: Switch Ethernet drivers to modules")
>>> had changed 9P and virtio-9P support from built-in to modular instead. This
>>> breaks simple kvmtool boots using a 9P root filesystem without an initramfs
>>> , because the kernel must mount root filesystem before it can load the 9P
>>
>>
>> And that commit explained you must use initramfs. Nothing got broken,
>> because there was never a promise that a recent, virtualized environment
>> must work on defconfig without initramfs.
>>
>> You fully control your software, so just build initramfs which is
>> absolutely trivial and we all moved on to that for arm64 long time ago.
> 
> I still regularly boot KVM guests on arm64 without an initramfs,

Actually that is a very normal use case particularly with KVM tool.
> but I just use 'make kvm_guest.config', which turns on all the
> commonly used virtio drivers as built-in. I wouldn't call
> 9pfs root trivial without initramfs, configuring 9p built-in
> is already complicated enough.

Alright - fair enough.
> 
> So I agree we don't need this patch, but there is a trivial
> workaround for Anshuman in case he wants to avoid doing this.
The following sequence does indeed solve this problem for now.

make mrproper
make defconfig
make kvm_guest.config

