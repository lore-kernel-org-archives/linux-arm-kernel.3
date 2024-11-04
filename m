Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1402AD111AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 05:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNgk47u3wRfC4zw7b391h07FE1WMd6Q9cZ/grbxNFII=; b=UAlfvUnMhlh9L4
	NicfUF8ns16FCVnPr+IAjyIJvpruv1OrSR3HJsk88Z8vBAwmM39mMGIwg6WkBnhYKSPkSNTcKqs6O
	dRLdEXK5oFPGRlSbLq69TY8prYP34Hkk74LMV8XlZpkybrUA4TFp4E6Pa6/uO9kzXOPUEWMeULp0k
	R1vIq07nwLhtv9L+t584kyZNFVyJSEAZQmzz/CtCJZcLEjhEBDftQYu9qXhHeQjthp2rOhfK9LhsU
	p3vOXE/JKOM37mzMYUqKWppk8DbfxzIsWtC97ACqNo7x9rtAp7Ck/2+G8FhByHTeQKmWnsjrpW5yT
	zmpqTfBWWFid8ldWEwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7pn4-0000000Ch3k-2NcI;
	Mon, 04 Nov 2024 05:38:14 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7plO-0000000CgtL-0LhH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 05:36:31 +0000
Received: from [192.168.1.107] (87-97-112-21.pool.digikabel.hu [87.97.112.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: hs@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A4FEF89138;
	Mon,  4 Nov 2024 06:36:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730698586;
	bh=zNgk47u3wRfC4zw7b391h07FE1WMd6Q9cZ/grbxNFII=;
	h=Date:Subject:To:Cc:References:From:Reply-To:In-Reply-To:From;
	b=UT1udimvre//bCB8aCJMPmxDMRwwAdn3E0ZYyRJVoH2NwLTtZRBNze6zYt5Ai4F5J
	 DSLoOd20gmFYKvNu30OaNmNsPZpYPlZOysocQX8dPiRiJ7fi29vW9opYLE4HTOhex2
	 5aszpyqKACMCbtew+NhiUORrALUxkUVALm98l5aTTqts2bwvJXQX29gBhuajSrr5QA
	 0S/DRJLoQcTgmA3qYXiAWgbiNcmhvtGSnS86UVlU3bAHsotu9vWbk8WQcvzvDLdiy0
	 SOlyOu5xuNfMCkbYiVKI5JYdrFc8zc/e8c+jFBOzasqiM+u9U8n7ZF5sPYeyNHFNDK
	 B/8BeSD3YBJUA==
Message-ID: <5340fb82-bda0-d22f-23df-de620c8d61c3@denx.de>
Date: Mon, 4 Nov 2024 06:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Content-Language: en-US
To: Shawn Guo <shawnguo2@yeah.net>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241031151238.67753-1-hs@denx.de>
 <20241031151238.67753-4-hs@denx.de> <ZydFO6b6oe9widaa@dragon>
From: Heiko Schocher <hs@denx.de>
In-Reply-To: <ZydFO6b6oe9widaa@dragon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_213630_471671_25E9EA20 
X-CRM114-Status: GOOD (  22.85  )
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
Reply-To: hs@denx.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Shawn,

removed the changes which are clear...

On 03.11.24 10:41, Shawn Guo wrote:
> On Thu, Oct 31, 2024 at 04:12:37PM +0100, Heiko Schocher wrote:
>> Add support for the i.MX8MP based aristainetos3 boards from ABB.
>>
>> The board uses a ABB specific SoM from ADLink, based on NXP
>> i.MX8MP SoC. The SoM is used on 3 different carrier boards,
>> with small differences.
>>
>> Signed-off-by: Heiko Schocher <hs@denx.de>
>> ---
>>
[...]
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
>> new file mode 100644
>> index 000000000000..ced35e1d72b7
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
[...]
>> +	pcie0_refclk: pcie0-refclk {
> 
> Can we name the node clock-xxx?

renamed from rename pcie0-refclk to clock-pcie0-ref

[...]
>> +	/* SX1509(0) U2605 */
>> +	gpio6: pinctrl@3f {
>> +		#gpio-cells = <2>;
>> +		#interrupt-cells = <2>;
>> +		compatible = "semtech,sx1509q";
>> +		reg = <0x3f>;

I moved compatible and reg to the beginning of the node,
as you commented this also on other places.

>> +
>> +		semtech,probe-reset;
>> +		gpio-controller;
>> +		interrupt-controller;
>> +
>> +		interrupt-parent = <&gpio1>;
>> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
>> +	};

Should I remove newlines here too?... but looking into the example from

Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml

there are this newlines ... so I let this lines in... or?

>> +
>> +	/* SX1509(1) U2606 */
>> +	gpio7: pinctrl@70 {
>> +		#gpio-cells = <2>;
>> +		#interrupt-cells = <2>;
>> +		compatible = "semtech,sx1509q";
>> +		reg = <0x70>;

I moved compatible and reg to the beginning of the node here too.

>> +
>> +		semtech,probe-reset;
>> +		gpio-controller;
>> +		interrupt-controller;
>> +
>> +		interrupt-parent = <&gpio4>;
>> +		interrupts = <19 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +		gpio6-cfg {
>> +			pins = "gpio6";
>> +			output-high;
>> +		};
>> +
>> +		gpio7-cfg {
>> +			pins = "gpio7";
>> +			output-high;
>> +		};
>> +	};

and let the newlines as I did...

>> +
>> +	/* RTC U2607 */
>> +	rtc0: rtc@51 {
> 
> I2C slave nodes should be sorted in addresses.

done.

> 
>> +		compatible = "nxp,pcf8563";
>> +		reg = <0x51>;
>> +		#clock-cells = <0>;
>> +	};
>> +};
>> +
>> +&irqsteer_hdmi {
>> +	status = "okay";
>> +};
>> +
>> +&lcdif1 {
>> +	status = "disabled";
>> +};
>> +
>> +&lcdif2 {
>> +	status = "disabled";
>> +};
>> +
>> +/* HDMI */
>> +&lcdif3 {
>> +	status = "okay";
>> +
> 
> Unneeded newline.

Many thanks for your review, and sorry, for trivial fixes...

bye,
Heiko

-- 
DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de

