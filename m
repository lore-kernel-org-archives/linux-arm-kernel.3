Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C512E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0FKrM3AiUXZLlAKdmu40nx7U2sKWPc+PI+/z4YnXUk8=; b=yC9oaM98omvDeA1E/uUf0C86Mi
	LLX6s8a2NfBIFDiAUZeSrKG1PFn1+WUMIz0BuyRDes2AoXQYPSzP/ni8Bk+SrQhSCQ8aPG1z7W4sR
	AiHt5Y8HZpSOcVYnCgMCWmeY3xE+VrJwBqsJ0BPqjfhYu3LVjKtbuKXmDlQ1zDe/EVEYCdB/lz7G2
	RdEoDZ2Axeo2amRVsaixahoLewVEehpnxNKFPDiMF9CPT3CU+LvkcmWQfZx8BAoIhmqlR+rdjpT44
	TUT/3e5e7ownOFZnhQlnjwIhvHdP8jdbjrmnqG1otn1XqHA8A8/MQ6cvkvOLxPCBL7jJul7T05EQX
	MHjIYmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAgX-00000005Exb-0dnv;
	Tue, 07 Jan 2025 14:35:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAfK-00000005Ejt-3t0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:34:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 520CC1424;
	Tue,  7 Jan 2025 06:35:10 -0800 (PST)
Received: from [10.57.4.77] (unknown [10.57.4.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40AF73F59E;
	Tue,  7 Jan 2025 06:34:40 -0800 (PST)
Message-ID: <bb0c95b6-760d-4de1-bc28-8f82e2fc5dd5@arm.com>
Date: Tue, 7 Jan 2025 14:34:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
Content-Language: en-GB
To: Jessica Clarke <jrtc27@jrtc27.com>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
 <20250103181623.1980433-3-vincenzo.frascino@arm.com>
 <CAL_JsqLYu_z6yNA-MgKgoA=nC5ftzOEH5UNkswA_=xTJiOB0+g@mail.gmail.com>
 <Z30kbmA-3h-Rhg7l@Jessicas-MacBook-Pro>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <Z30kbmA-3h-Rhg7l@Jessicas-MacBook-Pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_063443_009779_CDC1D710 
X-CRM114-Status: GOOD (  23.48  )
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

Hi Jessica,

Thank you for your review.

On 07/01/2025 12:56, Jessica Clarke wrote:
> On Fri, Jan 03, 2025 at 04:14:31PM -0600, Rob Herring wrote:
>> On Fri, Jan 3, 2025 at 12:16 PM Vincenzo Frascino
>> <vincenzo.frascino@arm.com> wrote:
>>> +       cpus {
>>> +               #address-cells = <2>;
>>> +               #size-cells = <0>;
>>> +
>>> +               cpu0: cpu@0 {
>>> +                       compatible = "arm,neoverse-n1";
>>
>> I'm pretty sure the N1 doesn't support CHERI/morello. Perhaps
>> "arm,neoverse-n1-morello" if we want to capture what it is derived
>> from and since "arm,morello" is taken already.
> 
> Rainier is the codename of the core itself, and Morello LLVM recognises
> -mcpu=rainier not -mcpu=morello (there's -march=morello instead), so
> perhaps it should really be "arm,rainier". Though SMBIOS reports it as
> Morello-R0P1 so it may be best to use "arm,morello" here.
> 

We agree on the concept. It should either be "arm,rainier" or "arm,morello-r0p1"
if we want to capture the information of SMBIOS. When we reach consensus I will
update the patches accordingly (Please have a look at my reply to Rob).

> The real problem is that the board compatible has changed to include a
> generic "arm,morello" node, with the argument that a v2 board could
> appear. So why not instead change *that* to be something like:
> 
>   compatible = "arm,morello-sdp-v1", "arm,morello-sdp";
> 
> Then you can use "arm,morello" here for the cores.>

The name morello on its own is too overloaded of meaning if we do not specify to
what we are referring to.

> Though some of this may depend on what the FVP's DTS looks like; is it
> going to claim to be a Morello SDP, or does there need to be a common
> denominator compatible beneath that it can use?
> 

I still did not start bringing up to speed the DTS for FVP but I think that we
should distinguish in between SDP and FVP since not everything is the same,
hence it should have something similar to:

	compatible = "arm,morello-fvp", "arm,morello";

> Please CC me on future versions of this series.
> 

Will do.

> Jess

-- 
Regards,
Vincenzo


