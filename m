Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AF3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/seCHNZ0A/pjeXBH/7QjGRg13yE1mkpjPL934GqMjRo=; b=26uJEnljSZ69F4hVj4sNFLgvL4
	39fQZh/pCaAB6htC7iLI83Mdisyjn41NDyqvVUeFMVFBanRB/iI721ou6hKrdCX5MRXjKG/WvenGr
	nvpLqmwxLNmkO75MmDZB7tMS3vGY59yCH/toLSml8jP6dr9SaOOBPn7QooSe2CjTRv7psE+/o1+lj
	OC23wvM83LNhxi2GhLseNem1C/oUfFbhh5XiBKnQGoUe9msWLJmvdrNqLEkxCFPeOWiUuVV05U5iR
	c32rELo43PxXiqEiAKmS/cxfEMQoIv+nRE88w/DSsrd1G/xwL81Sp3K1Vsug1+fKr1btSytwoiWeb
	m3TBmrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnG36-00000003ZSl-2utV;
	Wed, 26 Feb 2025 11:58:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnF6S-00000003OHC-2xG9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:57:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EBE21BA8;
	Wed, 26 Feb 2025 02:57:39 -0800 (PST)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB9093F673;
	Wed, 26 Feb 2025 02:57:21 -0800 (PST)
Message-ID: <d90bc4a6-2f9b-4b02-9eb5-95a237d30910@arm.com>
Date: Wed, 26 Feb 2025 10:57:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] perf: arm_pmuv3: Add support for ARM Rainier PMU
To: Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mark Rutland <mark.rutland@arm.com>,
 Jessica Clarke <jrtc27@jrtc27.com>
References: <20250220180427.3382482-1-vincenzo.frascino@arm.com>
 <20250220180427.3382482-7-vincenzo.frascino@arm.com> <Z77tD1VuD_W0CK5B@bogus>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <Z77tD1VuD_W0CK5B@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_025724_793912_9D3B5D3E 
X-CRM114-Status: GOOD (  11.25  )
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

Hello Will,

On 26/02/2025 10:29, Sudeep Holla wrote:
> On Thu, Feb 20, 2025 at 06:04:24PM +0000, Vincenzo Frascino wrote:
>> Add support for the ARM Rainier CPU core PMU.
>>
> 
> I can't take this through Arm SoC unless there is a strong dependency
> and/or urgency. I can take 05/10. The other option is you can take
> 05 and 06/10 via Will's perf changes as usual as I they seem quite
> independent to me.
> 
> I can take the rest of the patches through Arm SoC tree for next merge
> window.
> 

Based on Sudeep comment, are you happy to take patch 05/10 and 06/10 as is?

-- 
Regards,
Vincenzo


