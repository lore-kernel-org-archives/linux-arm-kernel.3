Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE37D49232
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 14:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ws6w/h+ocGHgXoKslH3aTkpzb0iw8aDky8/QSNIKFA=; b=iTeCL5jR/8nNKrzR/pZMXeFZbn
	epfleUu2DWGRSo/4q9I+iMUZK6PWTmIqpP6AtAwOmz3zu94thFqROieJwQS5cXdGpvSc7I7wq/Zbd
	q2W2Q5K3yMxFkOE3LrzK/CoNUoSTd8IkDGvjDbPo3xhAXqQtfUEXNbyxNEAlqKA5B37hebpGrTpBV
	afHcfOWdHIsfjkUKc/Ge4Znm/AOKYAN3jhwXcscUMqtmWDvATIL16F3i/ewJYtU43f6n3fYYL4UDW
	kDdLEcxs7oQaYEOrZJSuOHTAnEIus1bwjhRPpbJpYFkuo5XMbDyh63qM42zTwolp2dd3BrajZMdw8
	xD31j2OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4aT-00000000drh-05Wr;
	Fri, 12 Dec 2025 14:57:41 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU4aP-00000000doM-0iow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 14:57:39 +0000
DKIM-Signature: a=rsa-sha256; bh=4ws6w/h+ocGHgXoKslH3aTkpzb0iw8aDky8/QSNIKFA=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1765551350; v=1; x=1765983350;
 b=lKqb0Ewwk2P9x7xWmAco6D6Vb4U9a1BhGCwrhdQoau5rmSp1f9sM8gPW/vc/YBZPrrfS275F
 1PD8w92z8zLgtq6cN30ya1uSfWBPLl7CGMJSQQgm0DJ06i/pOtDzo+uAcihfukJZi4o01bpOFi7
 5RzQhGIDEaS/cUlWYnE6tDrFnptw1HL1mJbnEgqPX4WIyqVPwxf0TnF/SxSojUFbIS2ZAlQ3AlB
 CeWMlwkgKY/Ayrd3Nu36IaC+73iA6NKkxCIAJWwD+hvqgrqv5p7QAy48y+tFk3zxLrv8J+RiwOY
 ZzOXpaf34kuaxdLkfUBuVBMDLk10Z28DFPTWFenpUc9PA==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 97b39aec; Fri, 12 Dec 2025 15:55:50 +0100
Message-ID: <b92172f3-10f4-470f-b90a-121ff7fea988@dujemihanovic.xyz>
Date: Fri, 12 Dec 2025 15:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DONOTAPPLY RFC PATCH v2 4/4] arm64: dts: samsung,coreprimevelte:
 add wifi node
To: Karel Balej <balejk@matfyz.cz>, Brian Norris <briannorris@chromium.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Ulf Hansson <ulf.hansson@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Jeff Chen <jeff.chen_1@nxp.com>,
 Peng Fan <peng.fan@nxp.com>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <20251026182602.26464-5-balejk@matfyz.cz> <aTCv75hjdX5XvgCh@google.com>
 <DEW3NQVZ84JU.22G38WMULFZJG@matfyz.cz>
Content-Language: en-US
From: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
In-Reply-To: <DEW3NQVZ84JU.22G38WMULFZJG@matfyz.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_065738_229448_76041D9A 
X-CRM114-Status: GOOD (  22.72  )
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

On 12/12/25 09:36, Karel Balej wrote:
> Brian Norris, 2025-12-03T13:47:27-08:00:
>>
>> Do we have a min/max voltage for this regulator?
> 
> The downstream node is defined with the same values as the above ldo14,
> they however are however only defined in the PMIC dtsi and correspond to
> the actual physical limits of the regulator specified also in the
> driver, so this doesn't really give any specific constraints for the
> board itself.
> 
> The downstream code enabling WiFi seems to force it to 3300000 (which
> also seems to be the startup value) unconditionally, so I suppose I will
> just set the both limits to this value?

This sounds reasonable to me.

>>
>>> +			};
>>>   		};
>>>   	};
>>>   };
>>> @@ -523,6 +531,13 @@ &sdh1 {
>>>   	pinctrl-1 = <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
>>>   	bus-width = <4>;
>>>   	non-removable;
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>
>> I wonder if this should have:
>>
>> 	vmmc-supply = <&ldo16>;
>>
>> rather than regulator-always-on above.
> 
> You mean ldo15 right?
> 
> Not having any board schematics, I don't really know what exactly the
> regulator's purpose is. As I mentioned in the commit message, the
> communication with the chipset seems to work even if this is disabled
> (e. g. FW loads, networks can be scanned for,...) which doesn't seem
> like it should be the case if this was a main power supply for the bus,
> only actual connecting to networks doesn't work (gives
> CONNECT_ERR_ASSOC_ERR_TIMEOUT errors).

To me, this strongly suggests that the regulator powers the WiFi 
transmitter or at least a part of it (such as the RF amp).

> So this didn't seem too fitting for either vmmc nor vqmmc as far as I
> understand their semantics, so I went with the regulator-always-on
> approach to be safe.

Considering the above, I'd reckon it'd be good to have the option to 
toggle it for rfkill if anything. I'm however not sure what would be the 
right way to do so, nor how rfkill even works, if at all, with mwifiex 
(from what I see, the driver does not use the API).

Regards,
--
Duje

