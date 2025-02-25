Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AE7C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05R7bVXk4IHj5rB4riQOcFEC0OBm1w3BcRQA3SDCAiA=; b=dxx5nqmP8tUN9R3jl6JzoI5gc1
	LXQN/+Wb3AVvNX158kBOk7ItZYWn6UP+XoZJ/8Ih7SimUFriY2m1Pp+CUxCYrScmDz5HOgpZJaO1m
	CWGOt2rZ8Ng1zEg7W/kXqGG4IzEh7LhCo5iyn/2cA75QWEWUejy8MJa+Hs8PeH36p5EJpJjWqxKY8
	SG3rvhu/YEmeUR7vLHLy6Ypm+QE2tkI1LImlURIku3HM+pp0ta+pw+CDJQJsBdSPBvWb+KSTZ7eQt
	+InxJCAtNwIln+jrt13y1XC+1rAPZppY7vgc5b2i+nAm3uEvmgcHGnnzn24NFYylKKxy1Kp+HMkTT
	1BCSaVvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmy3S-00000000PPB-44xj;
	Tue, 25 Feb 2025 16:45:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxQN-000000009T1-2odu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 16:04:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 728041BCB;
	Tue, 25 Feb 2025 08:05:00 -0800 (PST)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 741353F6A8;
	Tue, 25 Feb 2025 08:04:42 -0800 (PST)
Message-ID: <c8e89c26-2ae0-4928-a625-46a6b6efd88f@arm.com>
Date: Tue, 25 Feb 2025 16:04:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] arm64: dts: morello: Add support for fvp dts
Content-Language: en-GB
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jessica Clarke <jrtc27@jrtc27.com>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
 <20250220180427.3382482-10-vincenzo.frascino@arm.com>
 <CACRpkdbZmQxtVqtc=Fw6kiOe3NdEE2mBHr2rKXLP76U7Dguhgg@mail.gmail.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <CACRpkdbZmQxtVqtc=Fw6kiOe3NdEE2mBHr2rKXLP76U7Dguhgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_080447_751968_200CAA08 
X-CRM114-Status: GOOD (  14.30  )
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

Hi Linus,

thank you for your review.

On 25/02/2025 15:31, Linus Walleij wrote:
> On Thu, Feb 20, 2025 at 7:05 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
> 
>> The Morello architecture is an experimental extension to Armv8.2-A,
>> which extends the AArch64 state with the principles proposed in
>> version 7 of the Capability Hardware Enhanced RISC Instructions
>> (CHERI) ISA.
>>
>> Introduce Morello fvp dts.
>>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> 
> This one has the PL110 graphics as well, right? (To be added
> later, just asking.)
> 

Yes I will add it later. This series focuses on the bare minimum to build the
infrastructure.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij

-- 
Regards,
Vincenzo


