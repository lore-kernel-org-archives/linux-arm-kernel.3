Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29A9D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt0bVS+dg/E4D/40L3Rqo22NkXCeP8ALUu6d+/7zrIE=; b=HDFJfBdf1ZIR5sylKvyCICM5ez
	sgsmvumcLpOhhiZnTS20LVJSoUVIsbqIR9QwlZSiI/bcGm+CL+P0xg8IUwR5rhmWz7c7FaQL1rK00
	LdBZJ7734Y+my0jOf1iopgUBGqMqz9EXj2xHYvEaDBSSLJ8YLFZy7gKLjM5Yy1vSrHejZ0BOYZlU4
	B9bvFHideXaqXHPdEZs1EzW91kEv5vMuUdSqeUtoLIwnQyAyttxhWDJTDq9RjpzEAH9MysFLD/OoI
	GfO9TgdGAf01y8rYWfBaw88PWDmzIXK87Qi0orILDudNGvtdUWwOZp9iJ76eo6sTE8Y0U/fHACvtV
	GcfiQRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtx0-00000000At5-1hqt;
	Fri, 28 Nov 2025 08:35:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtwx-00000000AsV-1jaQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 08:35:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 352771A1DE6;
	Fri, 28 Nov 2025 08:35:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09EB760706;
	Fri, 28 Nov 2025 08:35:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF2A1103C8EF1;
	Fri, 28 Nov 2025 09:35:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764318926; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bt0bVS+dg/E4D/40L3Rqo22NkXCeP8ALUu6d+/7zrIE=;
	b=kG/emZ/q4AlsESETvUY6cJ8iOxWvuUVxDCqR93cSukgqmqi5/LCMQVLWn/a0bOrFtfiqi1
	68f2icCURNipB7gan5YKT06hmGsb8iD1dJUFYG7yGUylVTCAo5ymdoA9MhwUUidaouAkfn
	Gqzd9OJ0nNQwvnw/W9hfs+rDAgG6d0iXOcyD8/W9wqgGKlbmBmkQsp8ENDCEizVp9zvBJ8
	Uuj2ONgLAtSYjz4ugMOwi8Vx58ErimfuTiAf0LUOmcoaIcOTZMRAqlnOyx8sqBQIRPsGFD
	qwKJriMsgATLDwEaiIhlJ17qgWibLeMK9Ip9chCU6yM2cLx+Wg1gAt+8/b4x4A==
Message-ID: <dff88906-d1f5-4ad1-840b-df1cbec56fc5@bootlin.com>
Date: Fri, 28 Nov 2025 09:35:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 05/14] dt-bindings: net: dp83822: Deprecate
 ti,fiber-mode
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 Florian Fainelli <f.fainelli@gmail.com>, mwojtas@chromium.org,
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>,
 thomas.petazzoni@bootlin.com, Conor Dooley <conor+dt@kernel.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Simon Horman
 <horms@kernel.org>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Herve Codina <herve.codina@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 Daniel Golle <daniel@makrotopia.org>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Antoine Tenart
 <atenart@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-6-maxime.chevallier@bootlin.com>
 <176426738519.367608.14469073626442288770.robh@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <176426738519.367608.14469073626442288770.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_003531_587783_2E550DA5 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi,

On 27/11/2025 19:16, Rob Herring (Arm) wrote:
> 
> On Thu, 27 Nov 2025 18:17:48 +0100, Maxime Chevallier wrote:
>> The newly added ethernet-connector binding allows describing an Ethernet
>> connector with greater precision, and in a more generic manner, than
>> ti,fiber-mode. Deprecate this property.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> ---
>>  Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
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


I don't see any error here :) maybe an issue with the bot ?

Maxime

