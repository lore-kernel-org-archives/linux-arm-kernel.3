Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667D0FEC0EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 17:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/JtUAW8GMSlEGiFymjy5UUqojkB5rvdVEFyaDuZCyA=; b=QdjDAAqHQW44cTwTqmoEcWauIX
	jHEKmIPnX95aT2vfp5AGglzF3wqsAnueTkv5zfVwVqEJv4lBpaFVhjqWCnBpeyVP0tGlejXYfJ0lL
	6n/muOlRRGoJoS3A/Yt+4ZS9u+pINbfdwoRUrDUr2xLo2C3nxKHgQk3AfOetIiuk6bsZ8A8JDT49i
	Yk7+uBkizHGuF9ETboVvgjBSFkz4iSl2BQHuCAOkcttMy59U29ljjDJn2e9Wvzziis0qn3idCLUaN
	TIv82LiNlVO4OQFDs3G6PMPHs0JHOd1sdeiBCxSg+PFS74GJ8CyLFIZkxro2vKwI8b7Psqv0CuAKx
	tr+F0ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55iw-000000020gC-3JPP;
	Tue, 24 Mar 2026 17:39:26 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55it-000000020eS-02FL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 17:39:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9886F112113;
	Tue, 24 Mar 2026 18:39:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1774373954;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f/JtUAW8GMSlEGiFymjy5UUqojkB5rvdVEFyaDuZCyA=;
	b=IVfk07uk/ynDHxds/NRsCk3rHM3TbSBSIOTj/IqLvbEz9cyuAO144EmuDtwORQW1zsNVxW
	rmNoWq9YmK80G3NdDLO7FbGf/FljjqwSPCRhdJMk3VyJCFXZ6BcJe3sDHYOPYB03GNPEHv
	Eiq542aYV+NqmjD6j3BZuScr/0mbOZmCx53FhUQ2LbEgzojWBTxzeHBcE69xFvSeqtlPe5
	IBBvAVDx+7Jdv1xn6bpiREYhkPuMS5tIuDPwg1lTyGe6I1XQO2DjrcaQWlm6xnFoo02+Cq
	dJ0CCD6fjki60dIA3qzlV9i68+aPL7tRjE4uaT7hWj2f2+BEqBnPRwlQdeGu3Q==
Message-ID: <e5d7ca6a-fdd3-4aca-aa1f-1d35bc9c0119@nabladev.com>
Date: Tue, 24 Mar 2026 18:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260312232500.197096-1-marex@nabladev.com>
 <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <acK1YU6M5FGK3qM2@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_103923_265209_94193CC7 
X-CRM114-Status: GOOD (  16.57  )
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

On 3/24/26 5:01 PM, Frank Li wrote:
> On Fri, Mar 13, 2026 at 12:24:04AM +0100, Marek Vasut wrote:
> ...
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>> new file mode 100644
>> index 0000000000000..534737363c9f0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-overlay-panel-ch101olhlwh.dtsi
>> @@ -0,0 +1,42 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2022 Marek Vasut
> 
> 2026?

That was the original copyright year when this was implemented, but I 
can update it to 2022-2026 ?

>> + */
>> +
>> +&display_bl {
>> +	pwms = <&pwm1 0 5000000 0>;
>> +};
>> +
>> +&DH_OVERLAY_PANEL_I2C_BUS {
> 
> why upcase for label, generally it should be lower case

Because this label is really a macro , please read on.

>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	touchscreen@41 {
>> +		compatible = "ilitek,ili251x";
>> +		pinctrl-0 = <DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL>;
>> +		pinctrl-names = "default";
>> +		reg = <0x41>;
> 
> reg should second property,  please dt-format for new dts files.
> check others
What is "dt-format" ? Linux kernel source tree, even current next, does 
not mention such a tool . I did run schema check and checkpatch on these 
patches. obv.

>> +		interrupt-parent = <&DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT>;
> ...
>> +
>> +	ports {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		port@1 {
>> +			reg = <1>;
> 
> need empty line between child node and property.

Fixed in V2

>> +	#size-cells = <0>;
>> +
>> +	eeprom@56 {
>> +		compatible = "atmel,24c04";
>> +		reg = <0x56>;
>> +		pagesize = <16>;
>> +	};
>> +};
>> +
>> +&ecspi2 {
>> +	status = "okay";
> 
> status should be last property. I stop here because these
> should be identify by tools/script
Neither checkpatch nor schema validation complained about these.

I moved the status=okay to the end. Anything else I should update ?

