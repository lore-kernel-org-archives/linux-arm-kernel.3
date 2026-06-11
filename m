Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849CFCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DcbLxyeLnLt+dWkutr0TiqwaNoorbC+rO+5F8+s/9E=; b=FnUhPYWtGUFhosWRgNLjzh9aAD
	JcizbwCR8h5c4rURMj47lA9/UxOfrU1N4ELjIgV3TluDgdby7GVIUyz37NY51wqz+0+I1cwQ+tCxp
	0UmjH/dLhETF5rJHwLSirMQASz6ewWVtQIzBGbUWdNi7pDuhNZdJ9CB0hPeYmyVp3U87WI5NgLnaQ
	A4VPE+W7S61Q+KPszgdkb0kVyI06eOErcE/9BYW0S0s8HwXYirmSToHvPNMrVtRSEZdEA/TuzXKpN
	SzMwx8uOMP4E9gxMwI3qmlv8Kok8Dwo5dDPrn+JDgx3U7BtHnGaNi3W+WfdDUerQAG/GzAr4dEBOp
	Ny37qKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXa2T-00000008tQJ-2iFt;
	Thu, 11 Jun 2026 07:41:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXa2S-00000008tQ2-20nY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:41:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA0D2600AB;
	Thu, 11 Jun 2026 07:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C38F1F00898;
	Thu, 11 Jun 2026 07:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781163679;
	bh=6DcbLxyeLnLt+dWkutr0TiqwaNoorbC+rO+5F8+s/9E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pyg9IWDp9i1MnYJeB8ILm2CAEQJ8wM+Ox7qyJW70dkO3hvAJmRi0Byvhwiu5ojPwg
	 0oe7FHF/C+mZZlfwb1QuQEPcZnza2fxxN6xsU3LVF6Dz4HO6yCTw7e4KJ5ESi4LKn4
	 iHGJ5QDBZ7m/g/wJRbZoHmBULSHwoCkF24WASM5ZKG8ukwPypn2k5trgflV9tOdL6K
	 kiAERNuqzR6q/UqrSyEseXgTywK3BL/CaQHnI+76a6Hjc2SRoYLE5zd0Rmp097zymZ
	 KWiFLNOGCU2rc+epVqB7oV/xeJY+yhaMDHAsjv2R7Qs98dme/bH5i26A0gNRO9OvHC
	 H7qOr7R+63ZwA==
Message-ID: <992261bb-6e2e-4662-96f2-c5b18d513b32@kernel.org>
Date: Thu, 11 Jun 2026 09:41:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add
 audss clock controller
To: Joakim Zhang <joakim.zhang@cixtech.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "bmasney@redhat.com" <bmasney@redhat.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Gary Yang <Gary.Yang@cixtech.com>
Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20260605032225.523669-1-joakim.zhang@cixtech.com>
 <20260605032225.523669-4-joakim.zhang@cixtech.com>
 <6c87641d-d505-44ff-a994-eeabf55f4c73@kernel.org>
 <SEYPR06MB622688915CBD1AA9B65FFB33821D2@SEYPR06MB6226.apcprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <SEYPR06MB622688915CBD1AA9B65FFB33821D2@SEYPR06MB6226.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 09/06/2026 08:27, Joakim Zhang wrote:
> 
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Friday, June 5, 2026 5:24 PM
>> To: Joakim Zhang <joakim.zhang@cixtech.com>; mturquette@baylibre.com;
>> sboyd@kernel.org; bmasney@redhat.com; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; Gary Yang
>> <gary.yang@cixtech.com>
>> Cc: cix-kernel-upstream <cix-kernel-upstream@cixtech.com>; linux-
>> clk@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org
>> Subject: Re: [PATCH v2 3/5] dt-bindings: clock: cix,sky1-audss-clock: add audss
>> clock controller
>>
>> EXTERNAL EMAIL
>>
>> On 05/06/2026 05:22, joakim.zhang@cixtech.com wrote:
>>> +description: |
>>> +  Clock provider for the Cix Sky1 audio subsystem (AUDSS).
>>> +
>>> +  This node is a child of a cix,sky1-audss-system-control MFD/syscon
>>> + node  (see cix,sky1-system-control.yaml). It does not have a reg
>>> + property; clock  mux, divider and gate fields are accessed through the parent
>> register block.
>>> +
>>> +  Software reset lines for AUDSS blocks are exposed on the parent
>>> + syscon via  #reset-cells. Reset indices are defined in
>>> + include/dt-bindings/reset/cix,sky1-audss-system-control.h.
>>> +
>>> +  Six SoC-level reference clocks listed in clocks/clock-names feed
>>> + the AUDSS  clock tree. The provider exposes the internal AUDSS
>>> + clocks to other devices  via #clock-cells; indices are defined in cix,sky1-
>> audss.h.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: cix,sky1-audss-clock
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +    description:
>>> +      Clock indices are defined in include/dt-bindings/clock/cix,sky1-audss.h.
>>> +
>>> +  clocks:
>>> +    minItems: 6
>>
>> Drop
> OK
> 
>>> +    maxItems: 6
>>> +    description:
>>> +      Six SoC-level audio reference clocks that feed the audio subsystem,
>>> +      in the same order as clock-names.
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: audio_clk0
>>> +      - const: audio_clk1
>>> +      - const: audio_clk2
>>> +      - const: audio_clk3
>>> +      - const: audio_clk4
>>> +      - const: audio_clk5
>>
>> Pretty pointless names. Names matching indexes have no benefits, drop all of
>> them and instead list items in "clocks" with description.
> Yes, you are right, I will describe these more meaningful.
> 
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +    description: Audio subsystem NoC (or bus) reset line.
>>> +
>>> +  power-domains:
>>> +    maxItems: 1
>>> +    description: Audio subsystem power domain.
>>
>> So the clock part has power domain but reset part does not? This is odd.
>> Especially that parent is audss (right?) and here you describe that this is audss
>> poer domain.
>>
>> Same question about resets.
> 
> The reset and power domain takes effect on the entire subsystem, i.e., audss can be accessed only after powered on and reset released, including the CRU registers which contains clock/reset/control bits for all device within the audss.
> 
> Because the reset controller probe does not access the hardware, while the clock controller does, so at that time, the power domain and reset were placed in the clock driver. At present, it does not seem very reasonable either. 
> 
> Linking the "reset" and "power domain" to the parent node requires us to ensure the order of the probes. We need to perform deferred probes within the child nodes until the parent node has been probed.
> 

Please wrap your replies.

You refer here to probe, so driver design, but I did not ask about that.
I asked about hardware design.

Best regards,
Krzysztof

