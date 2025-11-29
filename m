Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C6AD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 11:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD0hvTl9YMp9wIsLZ2/rV7hNGrWlIVr81lCd4/BVey4=; b=BFjtyMW2jxs0RFJ7b9Mqf2xg04
	5mtRbKgOocOH+kJbUTBAVJSJCqwANS78jF/kfwlK7ENuzODQUmDwJHSBM1ZMGtOTc8ORHEJ41NM3K
	2DBtisEttMfOKsn1+WzvrIAjK4FhgEoM2cMgP8FxdKsx/LkUaRMuOn/naBrdAuGOt2OMBtKEY5qfU
	gIBmmxpDsHuTl/NiELKpB5K/mF1fKwOCaAOcTjib4fZdEh1SOEhv+JTSeSyM8G6NodzKJAAJYtWsw
	h/UOK0FIIueehYYRV5TLjODCP8RJq2P8Pa+lMg0nswz0VIETyDTXxnXFdlWYTzd9Fs9QWTM/ScsoL
	Jp40lhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPJJW-00000001Uwx-0lrJ;
	Sat, 29 Nov 2025 11:40:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPJJT-00000001Uwa-0XzP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 11:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 57DAD41807;
	Sat, 29 Nov 2025 11:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53903C4CEF7;
	Sat, 29 Nov 2025 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764416426;
	bh=rkc0SFY1jXLwTWHpMx0nncdAQVf5LkNyXZAWC8E23lw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h6WUNJz5xPskj0GkNAUsp99ssWs7bSg48Y65uDLHbxUd6InRpV98KIqJljrpDfLx8
	 sd15LRHAthip+3P4K2eK9l8OvNTZBf6W+VGLGdEiLuegJzeVzi0Plv+OKUUwiXmiBk
	 S+tTwqz4HJ+ssudxvhPmFgahVJ4KMNbK9O5uI1geiP3cs/b8yZwZ8bQHvTJiTULgJJ
	 b9u1X+tpOEDicfWLNtMjyMOoSfoLfgG9blXzbkWfFD0RkaqBvmr+xAHLMm5jd09iwn
	 MyL7lPc986yFSc4ADlKk1AYsdViNGJMsqWMFPLScUasmDvYdIzLSaIT7YKYTlkkLHJ
	 aQQLs1t5qv+kg==
Message-ID: <5dc32a3f-42d8-43d7-854b-3cf11c05544c@kernel.org>
Date: Sat, 29 Nov 2025 12:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, Antoine Tenart <atenart@kernel.org>,
 mwojtas@chromium.org, netdev@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>, Herve Codina
 <herve.codina@bootlin.com>, Eric Dumazet <edumazet@google.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, davem@davemloft.net,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, devicetree@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit
 <hkallweit1@gmail.com>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Tariq Toukan <tariqt@nvidia.com>, =?UTF-8?Q?K=C3=B6ry_Maincent?=
 <kory.maincent@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-2-maxime.chevallier@bootlin.com>
 <176440811455.3523222.6418355134728802633.robh@kernel.org>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <176440811455.3523222.6418355134728802633.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_034027_251502_31C4FE3E 
X-CRM114-Status: GOOD (  14.66  )
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



Le 29/11/2025 à 10:21, Rob Herring (Arm) a écrit :
> 
> On Sat, 29 Nov 2025 09:22:13 +0100, Maxime Chevallier wrote:
>> The ability to describe the physical ports of Ethernet devices is useful
>> to describe multi-port devices, as well as to remove any ambiguity with
>> regard to the nature of the port.
>>
>> Moreover, describing ports allows for a better description of features
>> that are tied to connectors, such as PoE through the PSE-PD devices.
>>
>> Introduce a binding to allow describing the ports, for now with 2
>> attributes :
>>
>>   - The number of pairs, which is a quite generic property that allows
>>     differentating between multiple similar technologies such as BaseT1
>>     and "regular" BaseT (which usually means BaseT4).
>>
>>   - The media that can be used on that port, such as BaseT for Twisted
>>     Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>>     ethernet, etc. This allows defining the nature of the port, and
>>     therefore avoids the need for vendor-specific properties such as
>>     "micrel,fiber-mode" or "ti,fiber-mode".
>>
>> The port description lives in its own file, as it is intended in the
>> future to allow describing the ports for phy-less devices.
>>
>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>   .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>>   .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>>   MAINTAINERS                                   |  1 +
>>   3 files changed, 76 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

Those errors are unrelated to the blamed patch, the patch is about 
Ethernet the error is about thermal-sensors.

Christophe


