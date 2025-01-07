Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A8BE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgBLze+/xUSNvnSsObxWqlHVEV4DvNjEJwzhF0HeeSA=; b=Sn49wxwVFC2FKOURGL1Qw0+UlB
	Oxf2Vj+CK003HVXNfvkdcGvSDRYKskBi9RoC8oEykoiOmMrbugZ008O6++2qG8LoD132Y0LNkEDow
	mRoiRy/QOnK+Pp149phISlbcpv3nRVgFf1tc0k0SALWqDyghg7Tobb7JVpkI6eXOeinRPrOCDNH0V
	e1MB9lWIsrbfUTuBRFyOjzUM5okV6eINHaKomHwaJbkVUmVBHUhsEIP55gBzESjau9IR/x1/jPQQn
	GJa/JidhHV7FFM8YGbw0BbZcAFG+af61PRMghKrxCBr2WShHYJElyhM7r8mPAESwZcRU/yHWoTnzg
	I5brc11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAs5-00000005I05-2qHq;
	Tue, 07 Jan 2025 14:47:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAmM-00000005GNm-2q0i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:41:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E5FA1424;
	Tue,  7 Jan 2025 06:42:26 -0800 (PST)
Received: from [10.57.4.77] (unknown [10.57.4.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDF0E3F59E;
	Tue,  7 Jan 2025 06:41:56 -0800 (PST)
Message-ID: <881c5084-3487-4ae2-9140-8d393e934652@arm.com>
Date: Tue, 7 Jan 2025 14:41:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>
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
 <CAL_JsqJ9y92aHUYhD9_YX8GKvZC-GioWbMr+gjcQiMA_XQ0RaQ@mail.gmail.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <CAL_JsqJ9y92aHUYhD9_YX8GKvZC-GioWbMr+gjcQiMA_XQ0RaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_064158_755697_2812571E 
X-CRM114-Status: GOOD (  19.54  )
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



On 03/01/2025 22:26, Rob Herring wrote:
> On Fri, Jan 3, 2025 at 12:16 PM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
>>
>> The Morello architecture is an experimental extension to Armv8.2-A,
>> which extends the AArch64 state with the principles proposed in
>> version 7 of the Capability Hardware Enhanced RISC Instructions
>> (CHERI) ISA.
>>
>> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
>> some functionalities that have conveniently been included in
>> morello.dtsi to avoid duplication.
> 
> One more thing...
> 
>> +               i2c0: i2c@1c0f0000 {
>> +                       compatible = "cdns,i2c-r1p14";
>> +                       reg = <0x0 0x1c0f0000 0x0 0x1000>;
>> +                       interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>> +                       clocks = <&dpu_aclk>;
>> +
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +
>> +                       status = "disabled";
>> +
>> +                       hdmi_tx: hdmi-transmitter@70 {
>> +                               compatible = "nxp,tda998x";
> 
> It is odd that you add this node here, but don't enable i2c. If this
> is shared with fvp, then enable i2c here. If it isn't, then move this
> to the soc/sdb .dts.
>

This node should be on the dts file. I had it there in v2 and I can't recall the
rationale for which I moved it here. It is clearly wrong. I will move it back in
v5.

> I'd rather see the FVP dts now rather than later so we can review how
> you split things. It's a little odd not being soc.dtsi and board.dts,
> but that's fine I think.

I do not have a complete DTS for FVP yet (I was planning to work on after this
series is merged). Is it OK if I post it with a future series and we move things
around at that stage if there is a need?

>
>> +                               reg = <0x70>;
>> +                               video-ports = <0x234501>;
>> +                               port {
>> +                                       tda998x_0_input: endpoint {
>> +                                               remote-endpoint = <&dp_pl0_out0>;
>> +                                       };
>> +                               };
>> +                       };
>> +               };

-- 
Regards,
Vincenzo


