Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F4AE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/iMVzDzy02gi31lf16xXLEo5aQ7jq8vQ19xQlZJ3pHM=; b=jqyfIKprcM0oSetOPirIElDldO
	kV8Jl0ZJqqzqUOllVRo4XxmSfC0yCNb4owefog1IfNEHJp9Mw3X3JnAaLmURjx4eoKOLf7zKFWJWx
	clnh9znCAiYyRAcqTeIPAQghXrTDswgibq2eD9a22AV5dFETj0f1y31bFhCFthOBwBY4ju7bvOm17
	4hKQiGlvjqmTomlKBt0vNOojjKQzMu2ra4VEK+o1YVydFnlwSYr2Cf98QTiu1iq1pVHykbmXvOMBR
	mmLq4GhAlPX3/itFvcOhQZkgUUcqTk1Z4mtvgoszUkTKaD7qMDcrU6Y7GKrFD+bYwe1788ld5MECD
	ZCyEKTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAz8-00000005JyP-2A7e;
	Tue, 07 Jan 2025 14:55:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAu8-00000005IXU-3I68
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:50:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A92B1424;
	Tue,  7 Jan 2025 06:50:28 -0800 (PST)
Received: from [10.57.4.77] (unknown [10.57.4.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FD643F673;
	Tue,  7 Jan 2025 06:49:58 -0800 (PST)
Message-ID: <c6ac20ec-f979-4028-9488-f453953a43b5@arm.com>
Date: Tue, 7 Jan 2025 14:49:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: morello: Add support for common
 functionalities
Content-Language: en-GB
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20250103181623.1980433-1-vincenzo.frascino@arm.com>
 <20250103181623.1980433-3-vincenzo.frascino@arm.com>
 <Z30hypjCMmSsf81L@Jessicas-MacBook-Pro>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <Z30hypjCMmSsf81L@Jessicas-MacBook-Pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_065000_877159_1A34911A 
X-CRM114-Status: GOOD (  14.24  )
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



[...]

>> +
>> +		soc_refclk85mhz: clock-85000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <85000000>;
>> +			clock-output-names = "iofpga:aclk";
> 
> If this is ACLK for the IOFPGA outside the SoC, why is it called soc_refclk85mhz?
> 
> Not that it seems to be used in this patch series.
>

Good catch.

Indeed, it is not used in this series and the name and placement are incorrect.

I can either rename it and move it to the board file or remove it and add it
again in future.

[...]

>> +
>> +		i2c0: i2c@1c0f0000 {
> 
> The I2C controller lives in the IOFGPA on the board, not the SoC.
> 
>> +			compatible = "cdns,i2c-r1p14";
>> +			reg = <0x0 0x1c0f0000 0x0 0x1000>;
>> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&dpu_aclk>;
>> +
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			status = "disabled";
>> +
>> +			hdmi_tx: hdmi-transmitter@70 {
> 
> The transmitter is a discrete chip on the board, not the SoC.
>

Agreed on both the points, please have a look at my reply to Rob.

> Jess

[...]
-- 
Regards,
Vincenzo


