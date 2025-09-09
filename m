Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F005CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/HYMCMuYEcwZfqdm4rB55PkMqnCZvaYjKyqS9qkEH0=; b=ZcxN5sfJkSLkLPvLFgkYmyKChz
	sjxs6FK9u6UzFzBVQUF8KxIywQ2cgCr/YeXg+JgYzuM0/0GKl9+v3DGk1qs+W7nO8rOvb5/sf77LN
	HQcW17sY0nT0moOjdmysMyPT9J5lJIKkAXqEpxY0FCMIerR30H8BOEjRe2aNx8ZYM+IfKGF1scmPI
	N2sj+0ImrVVvO9ofWkdcUGO69FanVg2jkDn0jUAFO8at1o675s/1jaWFPfF81TsNFVRlfb+YPNuK6
	S5s7Ih28TxlhZNg0/1+PVDO/t1IF04bFsv9eKWuu/OCjFEPKk48WvsNIDxetEjczn7fSfl3Rw//oM
	Ig3DBP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIU-00000004xnn-3VXC;
	Tue, 09 Sep 2025 06:57:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpNO-000000043SE-0tHu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 03:50:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FEFC15A1;
	Mon,  8 Sep 2025 20:50:26 -0700 (PDT)
Received: from [10.163.72.34] (unknown [10.163.72.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 728C03F63F;
	Mon,  8 Sep 2025 20:50:30 -0700 (PDT)
Message-ID: <bfe55fd9-e00f-44a8-bf4f-0b0a6cfc16bb@arm.com>
Date: Tue, 9 Sep 2025 09:20:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/2] arm64/sysreg: Update TCR_EL1 register
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250907123000.414181-1-anshuman.khandual@arm.com>
 <20250907123000.414181-2-anshuman.khandual@arm.com>
 <a195095c-8ebd-4d74-959b-7b407d416a1f@sirena.org.uk>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <a195095c-8ebd-4d74-959b-7b407d416a1f@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_205038_302589_A4CA4349 
X-CRM114-Status: UNSURE (   9.29  )
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



On 08/09/25 7:28 PM, Mark Brown wrote:
> On Sun, Sep 07, 2025 at 05:59:59PM +0530, Anshuman Khandual wrote:
> 
>> Update TCR_EL1 register fields as per latest ARM ARM DDI 0487 L.B and while
>> here drop an explicit sysreg definition SYS_TCR_EL1 from sysreg.h, which is
>> now redundant.
> 
> I actually checked against DDI0601 2025-06 to spare my poor machine the
> strain of loading the ARM.

Right, they are the same.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks !
> 
> I guess the cleanup of the redundant definition could've been a separate
> patch but it's not super important.

Dropping SYS_TCR_EL1 definition from header (asm/sysreg.h)
into a separate patch ?

#define SYS_TCR_EL1 	sys_reg(3, 0, 2, 0, 2)

