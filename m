Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2471BC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 03:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRhNmTmhoxtdmDvyd8LrRatUmgj8eny+E90agNFLQ/4=; b=dMKR1S4576/cdN
	JS38qbrOBIzT0/eVdEY+/duAMjs09QcDCnUGHRlbRbJU6rTCQgDgbXZrKKTRCIwaePmYJUm6pGFbb
	Y28Qx4LSMc99wro/OmQVYGSRi6ArlVsv7iRTIF56d19XhS8e2n4RSKnolTIcW+gqrWMrhwx6jR/uT
	6uOBReYyZncDdpz3yusenynV4L20ttS7HJyVuJo55RgVXSN4lpjM1dLWKW8Wrjagf/TOCltBw/TNF
	LQwDq4tYDEVhwFp8LzcjOv4qQtxSZMLY+4XkVye+XhWYNjJ8c3uvtkESFaPYfpA8hUD89Xwrr4arF
	WGssy9bvnQyjQaFmftew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCUr-00000008mFl-1Guz;
	Wed, 11 Jun 2025 03:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCOx-00000008lIm-1NYM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 03:45:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59E1B168F;
	Tue, 10 Jun 2025 20:44:58 -0700 (PDT)
Received: from [10.164.146.17] (J09HK2D2RT.blr.arm.com [10.164.146.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC1563F66E;
	Tue, 10 Jun 2025 20:45:13 -0700 (PDT)
Message-ID: <9b378582-44eb-4fbb-a03a-40eb317daebd@arm.com>
Date: Wed, 11 Jun 2025 09:15:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/2] KVM: selftests: Change MDSCR_EL1 register holding
 variables as uint64_t
To: Marc Zyngier <maz@kernel.org>
References: <20250610053128.4118784-1-anshuman.khandual@arm.com>
 <20250610053128.4118784-3-anshuman.khandual@arm.com>
 <864iwnedjk.wl-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <864iwnedjk.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_204523_404284_59441779 
X-CRM114-Status: GOOD (  16.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, linux-kselftest@vger.kernel.org, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 10/06/25 10:31 PM, Marc Zyngier wrote:
> On Tue, 10 Jun 2025 06:31:28 +0100,
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>> Change MDSCR_EL1 register holding local variables as uint64_t that reflects
>> its true register width as well.
>>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oliver.upton@linux.dev>
>> Cc: Joey Gouly <joey.gouly@arm.com>
>> Cc: kvm@vger.kernel.org
>> Cc: kvmarm@lists.linux.dev
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-kselftest@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  tools/testing/selftests/kvm/arm64/debug-exceptions.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/arm64/debug-exceptions.c b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
>> index c7fb55c9135b..e34963956fbc 100644
>> --- a/tools/testing/selftests/kvm/arm64/debug-exceptions.c
>> +++ b/tools/testing/selftests/kvm/arm64/debug-exceptions.c
>> @@ -140,7 +140,7 @@ static void enable_os_lock(void)
>>  
>>  static void enable_monitor_debug_exceptions(void)
>>  {
>> -	uint32_t mdscr;
>> +	uint64_t mdscr;
>>  
>>  	asm volatile("msr daifclr, #8");
>>  
>> @@ -223,7 +223,7 @@ void install_hw_bp_ctx(uint8_t addr_bp, uint8_t ctx_bp, uint64_t addr,
>>  
>>  static void install_ss(void)
>>  {
>> -	uint32_t mdscr;
>> +	uint64_t mdscr;
>>  
>>  	asm volatile("msr daifclr, #8");
>>  
> 
> Why change this in the place that matters *the least*?
> 
> arch/arm64/kernel/debug-monitors.c is full of 32bit manipulation of
> this register, and that's only one example of it. So if you are going
> to change this, please do it fully, not as a random change in a random
> file.

The first patch in this series changes mdscr system register to 64 bit
in the mentioned file (i.e arch/arm64/kernel/debug-monitors.c). 

> 
> Thanks,
> 
> 	M.
> 


