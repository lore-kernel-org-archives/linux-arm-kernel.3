Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BC2CF2591
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaS3ZdSbPQezkjUn3kY0l8sOg9ANCiNcfd7cBBiSjJs=; b=dOprKJcOjEb338Ezc1v+/Ctzkp
	qvEgMsNKH6RF7tQPPIM4bjQrifBJXAu2kVlkp1ewGhy/VkOoIVXjyizidBdZpaYWZfZcp/puFoQtt
	jaXGUHuHrrrxzBwQZH0RKwX6vdJRAWsSjNzDAwPgyNNhq50e12xJoLnlzkaGCDLvLxVpVUn8CTTvz
	Pi53s6mpaFB9X/tgKaa1Y8S6Gk0aG68gNWbJDqo9QCvhxIsJar+TJhSOfukOUIQDf7HVLa9volGDO
	bFfz537y6/ADyyvSTJ2+oOizZ5dy10q9/8GmY2vT36Uo3yYRRg9A0KKgnAA/QEGrQfHtJbsDGaggU
	05MGMjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiHw-00000003Hvo-1R9R;
	Wed, 19 Nov 2025 13:32:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiHu-00000003HvA-0dXK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:31:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 88BF84E4179C;
	Wed, 19 Nov 2025 13:31:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 592C060699;
	Wed, 19 Nov 2025 13:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19C3F103719E1;
	Wed, 19 Nov 2025 14:31:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763559115; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vaS3ZdSbPQezkjUn3kY0l8sOg9ANCiNcfd7cBBiSjJs=;
	b=0gmiVh8UaCRT7zY9SiDcEvIiKuAsdvMVd7SaAZy19TBxbHoFKHeT4joUfdqGlfkHEil3KE
	YDrSOX3Rlayrdt9Ue6VF60cfxajoF6LxefKpc+V0PtL9SmPDDW9b8hVZX11rzm1iLptLuF
	cq2GRnN2gMZ2n3A0uDTV5C7E2228RMhpPNZaksuRzTvg/fHy+V9y5pUpgZol80MCyPBjtI
	9svpCUDUrKFNBgW1SR54P9+Lb+t/6KFWt0x0sZ5j/utytcogyr2Z7lAwJb2DIrszSdrOF0
	n6yNVdk8Bjvp0sOiQ4AWVlkPxE4ZOGNkTNiU4JSzSN3JadYqTpqzyqqIImMDJA==
Message-ID: <2013f0f9-d1fc-46b9-b068-438cb19954b6@bootlin.com>
Date: Wed, 19 Nov 2025 14:31:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 15/15] Documentation: networking: Document
 the phy_port infrastructure
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-16-maxime.chevallier@bootlin.com>
 <20251118191759.28d14e32@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251118191759.28d14e32@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_053158_329893_AE89A127 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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



On 19/11/2025 04:17, Jakub Kicinski wrote:
> On Thu, 13 Nov 2025 09:14:17 +0100 Maxime Chevallier wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -9281,6 +9281,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
>>  F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
>>  F:	Documentation/devicetree/bindings/net/mdio*
>>  F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
>> +F:	Documentation/networking/phy-port.rst
> 
> I think you should add a MAINTAINERS entry like the one we have for
> NETWORKING [ETHTOOL PHY TOPOLOGY] no? Please include some keyword matches
> on the relevant driver-facing APIs if you can:)

I'm fine with this, I'll add that for next iteration.

Thank you for the round of reviews,

Maxime

