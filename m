Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B22E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 15:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJEUIcYYIUO0VgSn6UpPyF6jTa3kJCUS99OPUIH/98Y=; b=yB2Zj+UjWy9NL6Q2hJRpo+igfi
	UqgKYNUf8ocFmJ8UewT/B7PV45P0/B3aN3mO1vXZq1VlbGd/F1Wp7rNEiuW+NFgifYeB+BwzZKX1C
	yEl8kUD6zzQ6kMIPIWdo5v3MO2/q1dLaAK2NRb0+SvjJP+bWdGovIl/uK4jWXISxXM88gUGSNKwKT
	fxBHEVJaCO066dYRuRsXkoE4+6d0HR2qbqKVlDdEcLHf8LWoXIGisi+pbN4IeUwj1pHtF5s/eanpZ
	4MfXYYMr3InJh2m4aCl2NCmu6f8PfYhia9LI8myqUsU8ntW8jpeZJQFI+/sWCmnWGqYPuOBfcDUhj
	G4w/MG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB4y-00000005LDA-2ZUi;
	Tue, 07 Jan 2025 15:01:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVB0U-00000005KLv-414t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:56:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC5E1424;
	Tue,  7 Jan 2025 06:57:01 -0800 (PST)
Received: from [10.57.4.77] (unknown [10.57.4.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76BCE3F673;
	Tue,  7 Jan 2025 06:56:31 -0800 (PST)
Message-ID: <1e1915eb-0ebb-4afa-94ed-553c455ae24e@arm.com>
Date: Tue, 7 Jan 2025 14:56:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
Content-Language: en-GB
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
 <bb0c95b6-760d-4de1-bc28-8f82e2fc5dd5@arm.com>
 <45E38F12-3585-4AE0-8F05-431DB355FC69@jrtc27.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <45E38F12-3585-4AE0-8F05-431DB355FC69@jrtc27.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065635_038076_246CF344 
X-CRM114-Status: GOOD (  12.50  )
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



On 07/01/2025 14:51, Jessica Clarke wrote:
> On 7 Jan 2025, at 14:34, Vincenzo Frascino <vincenzo.frascino@arm.com> wrote:
>>
>> Hi Jessica,
>>
>> Thank you for your review.
>>
>> On 07/01/2025 12:56, Jessica Clarke wrote:
>>> On Fri, Jan 03, 2025 at 04:14:31PM -0600, Rob Herring wrote:
>>>> On Fri, Jan 3, 2025 at 12:16 PM Vincenzo Frascino
>>>> <vincenzo.frascino@arm.com> wrote:
>>>>> +       cpus {
>>>>> +               #address-cells = <2>;
>>>>> +               #size-cells = <0>;
>>>>> +
>>>>> +               cpu0: cpu@0 {
>>>>> +                       compatible = "arm,neoverse-n1";
>>>>
>>>> I'm pretty sure the N1 doesn't support CHERI/morello. Perhaps
>>>> "arm,neoverse-n1-morello" if we want to capture what it is derived
>>>> from and since "arm,morello" is taken already.
>>>
>>> Rainier is the codename of the core itself, and Morello LLVM recognises
>>> -mcpu=rainier not -mcpu=morello (there's -march=morello instead), so
>>> perhaps it should really be "arm,rainier". Though SMBIOS reports it as
>>> Morello-R0P1 so it may be best to use "arm,morello" here.
>>>
>>
>> We agree on the concept. It should either be "arm,rainier" or "arm,morello-r0p1"
> 
> r0p1 isn’t right. Boards with r0p0 and r0p2 CPUs also exist (although
> the former are now only within Arm, but the latter are in the wild in
> limited numbers, including a couple here at Cambridge).
> 

Agreed, my proposals were in order of preference. "arm,rainier" seems the best
choice. Let's see what Rob thinks.

[...]

-- 
Regards,
Vincenzo


