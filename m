Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32000C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXymtg3MYiCpwLn3zSfoxo2QWzdxsTYzR/5DWbHACj4=; b=pUesu+GUnwmWmh027oIsArrqDH
	ohgFSMOUzFrM8Bto6k5IHuLU5up0zvY0oocrvRjtk+HMIjeZYY3Uo26yojdFoae861PUXdm9RxtJQ
	Cmtc6ulnq2SEBAvDU+sDWZGqFceUqeOSuBJiAuEn91PCooLy9IequbdpeXW7FaBih+dV7otvUhLwj
	fGEOvJLNQHfptLoJZrh5LVt8ISdee1utfcTAtFXUtAwXb0QR7GO1d9BY4piHQR9VC5/sLH9hzxidc
	55mTKOBfNaiALvw3S7WWnvkLJ8WLdPeKFKEBQgAOtHIYNW3t6hN+UpDBZfy71K33+9AVo+uDrnUWP
	491NYcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjsew-0000000DqMk-3gYB;
	Wed, 15 Jul 2026 05:59:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjseu-0000000DqLd-1Ygo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 05:59:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E784339;
	Tue, 14 Jul 2026 22:59:46 -0700 (PDT)
Received: from [10.164.18.40] (unknown [10.164.18.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 110013F915;
	Tue, 14 Jul 2026 22:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784095190; bh=7B48ioxwf7rwtoFa72XIWuS1RYDrC9VzoxrJpJGyidE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OJ+gWSzTGrlNPpFq4ucPZzQ4055IwtDKGd2lgejTzJm5BFxA+mfzI19CuT98gzNPm
	 s55GF/3W3E5QTnkxKNdxy3J2BR4Vv/KotlWPRrl7y8hmIJ9tPykF50ubaM4nOrEWk/
	 ojrr0g1c6icL6Z1PLnjhKGRPin/YWjihzBfGE2E0=
Message-ID: <3f5b3b0c-7431-4438-b376-32171bb07370@arm.com>
Date: Wed, 15 Jul 2026 11:29:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: sysreg: Add BBM_3
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260715053408.1950475-1-linu.cherian@arm.com>
 <20260715053408.1950475-5-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260715053408.1950475-5-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_225952_450687_5B6D3D35 
X-CRM114-Status: GOOD (  10.60  )
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

On 15/07/26 11:04 AM, Linu Cherian wrote:
> Add BBM_3 definition for ID_AA64MMFR2_EL1 register.
> 
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/tools/sysreg | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 7cb61aca3797..e070ada06196 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2259,6 +2259,7 @@ UnsignedEnum	55:52	BBM
>  	0b0000	0
>  	0b0001	1
>  	0b0010	2
> +	0b0011	3
>  EndEnum
>  UnsignedEnum	51:48	TTL
>  	0b0000	NI

FEAT_BBML3 feature is detected via this ID_AA64MMFR2_EL1_BBM value.

https://developer.arm.com/documentation/111107/2026-03/AArch64-Registers/ID-AA64MMFR2-EL1--AArch64-Memory-Model-Feature-Register-2

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

