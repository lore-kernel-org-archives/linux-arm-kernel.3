Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DA9CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgzdODyZLz4GqNmYM3p+s4koXLC462zunCov83SK9t0=; b=fMZtiaZXemG49SvQ5boGW8iAMJ
	9uWl82c9bChtzXEiET/syPIBd626XJO15Tk9rOf180+i8/B4LTvGyu29+rUH7ooU5MTwnH9xLpQgN
	meVzTRzjkaAVrdmGvdUHlys13CWgR2dYYcO9YLWVJaHKrlxHam6MocC9/Z7f0r6NwO0oO7jBaiiqw
	6kIAHktbcuGdsC9OnchopIODogsEiPQjXfnPpDzpzx2vmY3Min1nd0rCkjYzjtSgNHPPDz2sZl5fO
	CxHqSm8k9qXGGg8a0E/TBq3ocg2N2MeTb2nmQT8N21359gnPOQoI1BBZg7z/z2qVW4mAvCw3ORxQp
	kqz/sOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtvz-00000000AdG-3XQs;
	Fri, 28 Nov 2025 08:34:31 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtvw-00000000AZi-1tjd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 08:34:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 671B4C16A36;
	Fri, 28 Nov 2025 08:34:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3542F60706;
	Fri, 28 Nov 2025 08:34:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98471103C8EF1;
	Fri, 28 Nov 2025 09:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764318862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=tgzdODyZLz4GqNmYM3p+s4koXLC462zunCov83SK9t0=;
	b=jL2lRw+ta61DisBvuQJKHw75eiScP4u/1eTq3Dj/KyRjxC3HVIySdyvLe8gSIopegLCoT/
	+Uia2DSqjS8XMe8u1I2OTmhBnCvSELWEu+5Ehg+vwRe6VOy+dmWcv/qVFteEOwoB2G+t2r
	joPlaQWkBOl8qiD1HuDQFn7nSwQgb/S/Ei2ayADTXDtoxlOav4V4ZnWfrtBn7k7BOkgWDC
	KID8FwOyJXvlt1wtcFRKgExuatU20+T1XHrO5LSpGMdbMe682d6vpu+kX5RDlTr+F3PhvL
	BsTDqkzZGLpxkRR0H8HwX3fiM4cVIesD2WLVhzB4FFz6ZAlzdjfggDZ6b5O64A==
Message-ID: <b8d12481-2637-470d-a3f1-784c0d7b4b3e@bootlin.com>
Date: Fri, 28 Nov 2025 09:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, davem@davemloft.net,
 Daniel Golle <daniel@makrotopia.org>, Florian Fainelli
 <f.fainelli@gmail.com>, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Herve Codina <herve.codina@bootlin.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, mwojtas@chromium.org, Antoine Tenart
 <atenart@kernel.org>, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 thomas.petazzoni@bootlin.com, Russell King <linux@armlinux.org.uk>,
 Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-2-maxime.chevallier@bootlin.com>
 <176426738405.367554.14295793625592890396.robh@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <176426738405.367554.14295793625592890396.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_003428_652567_0A1F37D4 
X-CRM114-Status: GOOD (  15.44  )
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

Hi,

On 27/11/2025 19:16, Rob Herring (Arm) wrote:
> 
> On Thu, 27 Nov 2025 18:17:44 +0100, Maxime Chevallier wrote:
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
>>  - The number of pairs, which is a quite generic property that allows
>>    differentating between multiple similar technologies such as BaseT1
>>    and "regular" BaseT (which usually means BaseT4).
>>
>>  - The media that can be used on that port, such as BaseT for Twisted
>>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>>    ethernet, etc. This allows defining the nature of the port, and
>>    therefore avoids the need for vendor-specific properties such as
>>    "micrel,fiber-mode" or "ti,fiber-mode".
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
>>  .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>>  MAINTAINERS                                   |  1 +
>>  3 files changed, 76 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
> Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

Hmm I don't see the connection between this error and my patch...

Make dt_binding_check doesn't show any issue related to the binding
introduced by this patch :(

Maxime



