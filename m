Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE7DE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8hktlKaRyGbVHCVpye89ZWee6gbJk6eenpzIhLg7YI=; b=4/O4fTmWaf7XjJiCQjHvaJfEgf
	WtA1rEL4+fpIVvaFzoPOLNxS9bMbAjjJePgTSl8qFSBDgl2vlh+/cfjIJHwY9cEFZbhJImHmBCAqz
	4C9Mk7hIh4WahROO0urpaGR3QMcOrSvcJRL5uFGLBx61B6ip4Dii9mlKFs1IwVHeZOLhGKpnEEJ81
	rtHN5dthwVAeifgGKkEi72lOCwUr77CLIwKDGiTcqZ6U8mc6be+bfJwHRemdAWewWEF3Y/kR1UqEz
	FIU3nOpcrp28ffVM16z0xlpusBGWivr1gTgxhukbCfdHG4IZbzhjXYPKdbb4LSZ4vvC5yFi/Aqhvg
	W5ffOruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIBq-0000000EEqG-3vdx;
	Wed, 11 Dec 2024 08:35:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIAn-0000000EEjn-0LND
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:34:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E978E1063;
	Wed, 11 Dec 2024 00:34:46 -0800 (PST)
Received: from [10.162.16.49] (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7933F3F720;
	Wed, 11 Dec 2024 00:34:15 -0800 (PST)
Message-ID: <86ad5edc-ad57-43c3-86d2-0bd854a479c5@arm.com>
Date: Wed, 11 Dec 2024 14:04:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/7] arm64/hw_breakpoint: Enable FEAT_Debugv8p9
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
 <Z1hzdLQLlIPg7eV5@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z1hzdLQLlIPg7eV5@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_003421_170241_16DF0AE6 
X-CRM114-Status: UNSURE (   8.59  )
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



On 12/10/24 22:29, Mark Rutland wrote:
> On Mon, Oct 28, 2024 at 11:04:19AM +0530, Anshuman Khandual wrote:
>> This series enables FEAT_Debugv8p9 thus extending breakpoint and watchpoint
>> support upto 64. This series is based on v6.12-rc5 although this depends on
>> FEAT_FGT2 FGU series posted earlier, for MDSELR_EL1 handling in various KVM
>> guest configurations.
>>
>> https://lore.kernel.org/all/20241001024356.1096072-1-anshuman.khandual@arm.com/
> To avoid further confusion: since we discussed things further on the v1
> thread after this v2 thread was posted, I'm waiting for a v3 to be
> posted which addresses the comments there (e.g. ID reg field handling,
> mutual exclusion for breakpoint manipulation).

Agreed, although I am still working on the mutual exclusion for breakpoint
manipulation problem. Besides just carved out - MDCR_EL3.[TDS|TPM] related
EL3 boot requirement's document update in a separate series as discussed.

https://lore.kernel.org/all/20241211065425.1106683-1-anshuman.khandual@arm.com/

