Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F96FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 03:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwOaswZgGOsgqXKWcGBLJ3uk8ya9oX6rPmP/Wc5KgHU=; b=HrqImLf0JuSUXyfFyGz5UiVTda
	+YwSZBtjpfH6/08K3JrW9NE9/r/2cB2LPzk0/T9nH3irswRier8s5bxJ99A2j0jq0tKsfqXf1u02W
	ZZH/DGFiWMfBCmU4twwRkX0zmS3fwCcEe5zQouy6udElBD/iSrmEsG6mBbp6AGGxMhljyFdpoJzaz
	mPTfW7Uhpq46eUU2xzaNpx8j8k/v2xwsEARXljaCLAhUtXSUNw3KobinmTv8qDHyVGDgbCLE7HSh8
	qUdLAjhhxhQPNS8sl4jDpEuf1HaZtyNdRTZAznGnjBSAOXDBfDrtKP8DVz6bC5OJhIDRgmuTFp6Nf
	DBheIdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsD55-00000007Qjo-0Ubh;
	Wed, 12 Mar 2025 03:48:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsD3N-00000007QcH-3Dhc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 03:46:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C775C152B;
	Tue, 11 Mar 2025 20:46:50 -0700 (PDT)
Received: from [10.163.43.50] (unknown [10.163.43.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 570513F673;
	Tue, 11 Mar 2025 20:46:36 -0700 (PDT)
Message-ID: <ddeb3df1-995b-44f4-ad20-50edfb906a28@arm.com>
Date: Wed, 12 Mar 2025 09:16:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, robh@kernel.org
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev, stable@vger.kernel.org
References: <20250227035119.2025171-1-anshuman.khandual@arm.com>
 <174171335999.3659520.16613654046629962007.b4-ty@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <174171335999.3659520.16613654046629962007.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_204645_856100_57C81F0B 
X-CRM114-Status: UNSURE (   8.85  )
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



On 3/11/25 22:47, Catalin Marinas wrote:
> On Thu, 27 Feb 2025 09:21:19 +0530, Anshuman Khandual wrote:
>> FEAT_PMUv3p9 registers such as PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1
>> access from EL1 requires appropriate EL2 fine grained trap configuration
>> via FEAT_FGT2 based trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2.
>> Otherwise such register accesses will result in traps into EL2.
>>
>> Add a new helper __init_el2_fgt2() which initializes FEAT_FGT2 based fine
>> grained trap control registers HDFGRTR2_EL2 and HDFGWTR2_EL2 (setting the
>> bits nPMICNTR_EL0, nPMICFILTR_EL0 and nPMUACR_EL1) to enable access into
>> PMICNTR_EL0, PMICFILTR_EL0, and PMUACR_EL1 registers.
>>
>> [...]
> 
> Applied to arm64 (for-next/el2-enable-feat-pmuv3p9), thanks!
> 
> [1/1] arm64/boot: Enable EL2 requirements for FEAT_PMUv3p9
>       https://git.kernel.org/arm64/c/858c7bfcb35e
> 
> I removed Cc: stable since, if it gets backported automatically, it will
> miss the sysreg updates and break the build. Please send it to stable
> directly once it lands upstream, together with the dependencies.

Sure, will do that.

