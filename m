Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796F7CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mn3bY0rBz51Jb7COCJ8fj1VQyN0UarXaJb16cSjuLT0=; b=zS0rcJjh1pEjqFeB6frTvF5OL4
	ZSYWXLvttiRo3E+DuKhoay+fHFGoCr1ww0ZVznx9/kDlU3UFmYL0KjNW3/leli3gLOhF/N398X+A0
	GlBZqpWRouBJe5BECUGdRCusnhnKgAhBX6K1oEZ4RRrIB4I+HB083DdIjjRR63+BqYNuk9UYA4FgE
	1s7WSlnHJ5TBjpRy5p0ot2KE1+0iruInwECxVIhyTXasT1RMnyyamQX5iN2zTls1cH7uP3O2GS02y
	oQdYpP7YmGbBZg75/T8htvcOs6k89ZmXhL8agKnPfeNGflTDAnGtagAth2Aas/96ssurUZoqps6iS
	OShOsGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPJLK-00000001V5D-2X14;
	Sat, 29 Nov 2025 11:42:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPJLI-00000001V4m-1xqI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Nov 2025 11:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0618A40492;
	Sat, 29 Nov 2025 11:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF4EC4CEF7;
	Sat, 29 Nov 2025 11:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764416539;
	bh=OiJJoLGTt8ux1ryDxA1jS99SlMC/axq49Ib56TBKzoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s7JzutlJmipipiOvOvZ9s6lS10qPsQMhiyI67iD32MQPADdmIEzOmvSMDa/B5DMRO
	 RY2omE5tkRjajZrWRIkJZf5tc8cXhQOTSlCJOOLXax/kE34E2T5dwTedawHBt27mlX
	 vkiuzWyUihH2Aqvg0mm+IA5JCd52ymeD9SRj+K0O55mtwnYvUHrB2jEGlpju2kj9G7
	 qiZgxTfq4nPK6HRxTSdsik+v59g+wbgzbrh1GdHt756tsPqkpc2yjnIr0zl822R7UI
	 TKbZnr6HOg9ebFVEmg5svPwriJ/v9x9ncE58VIGFp7KP6ycpDHt5CgJQ9OObUMUWq4
	 iC3AMqORk5diQ==
Message-ID: <f87d6e32-7b40-4e52-9460-6711486b4844@kernel.org>
Date: Sat, 29 Nov 2025 12:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 05/14] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Herve Codina <herve.codina@bootlin.com>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 netdev@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, mwojtas@chromium.org,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, davem@davemloft.net,
 Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-6-maxime.chevallier@bootlin.com>
 <176440811592.3523266.4372040709133421609.robh@kernel.org>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <176440811592.3523266.4372040709133421609.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_034220_567602_9F97C65C 
X-CRM114-Status: GOOD (  15.64  )
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
> On Sat, 29 Nov 2025 09:22:17 +0100, Maxime Chevallier wrote:
>> The newly added ethernet-connector binding allows describing an Ethernet
>> connector with greater precision, and in a more generic manner, than
>> ti,fiber-mode. Deprecate this property.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>   Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> 
> 
> doc reference errors (make refcheckdocs):

No errors listed apparently, the bot has a problem.

Christophe


> 
> See https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Fdevicetree-bindings%2Fpatch%2F20251129082228.454678-6-maxime.chevallier%40bootlin.com&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Ca89d85159e8a4a4e6a9d08de2f28c066%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639000049232512534%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=JOIl5FJPybTScu9tl2If5oN%2Fs46eLE4znVe7QXHALX8%3D&reserved=0
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


