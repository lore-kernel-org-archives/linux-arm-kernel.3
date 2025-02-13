Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E33C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:Subject:From
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFuRc4vnJDC+U8vlunBJUoC5VAZxPPiCI440ctYMhMM=; b=khQJgJApFIhRnW
	CmnNd1fGHEPn58XiIktPSvzkuAdQvElgJJe/bxCix0dBcP9rmpyaO1TDaidyj6VgTtse91u9HLnL6
	fq4F8dQn1Xt8Biyx0k5qDjcTm4imyIRjo9Nbs9NJg1XcdihGGZCQ5c1IhV+w04sTYzE2jSvACXA5k
	+x2g9FOmxV/VV+GLMSliR88njzSwTHcXqs76YnfPhLwTLwTGdCFWJJeCJ7NznTvOmf3FcAluysFZW
	xcpaWUt1cx+JtOihGuLMtPIxtCnepurB4J4MVECZl877VkAIMXQDcoNySODJTbtqrPt1fLNwr9Dko
	DFaLW9y6JhZhzcTMmo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tib7L-0000000BWqv-2v4r;
	Thu, 13 Feb 2025 15:27:07 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tib5u-0000000BWZq-2hWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 15:25:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09B78432B4;
	Thu, 13 Feb 2025 15:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739460335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lFuRc4vnJDC+U8vlunBJUoC5VAZxPPiCI440ctYMhMM=;
	b=Zlt2CV4zcUYBMgVH8rk5q0w7VMbNXWZqUiByPBR1Qdrmcku9kewtaX4Fzk9SAgMH5rddsF
	WixvDN8UgC5QEOGXUw5p+PRqfbJWjwzFG6FbnXlEI3/7TOE/Gr0oy0K896FcZwt3IVdXh6
	e03IpWT0pHlAuodihUQTKMBMbNTcrGko5PwNzcp1InTVGKKwyc8QWr8dronU0o1m6aEUO5
	OFWiNk02TA+bKSa5eSv3X9fSGXkXEA4GHF62aUDU3IMaa05LHhvBHxGfd3jZq9UVkIr25r
	yipJY+cw7hVDkqCtszC5/xG+Q3q1EvJokHHpFgrh5LB0SK/ZZelOQ3kpvtD2Zw==
Message-ID: <99247019-bb41-4fd9-bc0c-d31e5688533b@bootlin.com>
Date: Thu, 13 Feb 2025 16:25:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH 01/12] dt-bindings: bluetooth: describe wilc 3000
 bluetooth chip
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
 <20250212-wilc3000_bt-v1-1-9609b784874e@bootlin.com>
 <20250213-chamois-of-unexpected-glory-dd3eab@krzk-bin>
Content-Language: en-US
In-Reply-To: <20250213-chamois-of-unexpected-glory-dd3eab@krzk-bin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegjedufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleejhfevledvgeehvdevueejgeduhfelffegkeejteejveevieejvdeifeekuedtnecuffhomhgrihhnpehmihgtrhhotghhihhprdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrtggvlheshhholhhtmhgrnhhnrdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghjrgihrdhkrghthhgrthesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_072538_829412_5A8F0950 
X-CRM114-Status: GOOD (  20.85  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Eric Dumazet <edumazet@google.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Simon Horman <horms@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On 2/13/25 10:25, Krzysztof Kozlowski wrote:
>> +  wlan:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the wlan part of the combo chip
> 
> No resources here and judging by the driver everything is part of wifi.
> Either you wrote it to match driver or indeed hardware is like that. In
> the first case, why this cannot be part of WiFi with phandle to serial
> bus? In the second case, this needs to be proper hardware description

First, I'd like to reclarify what the chip exactly is, to make sure that we are
talking about the same thing. The wilc3000 ([1]) is a single physical device
packaging two different discrete modules inside (one for 802.11, one for
bluetooth). The WLAN part has its own binding integrated in upstream kernel
([2]) and is based on a similar chip in the same family (wilc1000, which only
have 802.11, and so only SPI/SDIO, no UART).

Now that it is said, no, I did not write this binding only aiming to match the
new driver. I tried to base this description on how similar WLAN/BT combo chips
are usually described (based on those which have existing bindings), and they
seem to describe distinctly the two internal parts of those chips as well. For
those who use HCI commands over uart for the bluetooth part, they expose a
dedicated child node of a serial controller (distinct from the wlan part,
described as another node on PCI/SDIO/SPI/etc). The hardware architecture for
wilc3000 is similar to those, so since the serial bus is the primary interface
to operate the bluetooth part inside the chip, doesn't it makes sense to have it
under a serial controller node (and then to refer to wlan for the additional
operations needed on sdio/spi), than the other way around ?

About the lack of other resources in the new node: there are indeed additional
resources that affect bluetooth, but I am not sure how it should be handled:
there are for example a reset input and a chip enable input exposed by this
chip, which in fact do not only affect the WLAN part but the two parts inside
the chip. But those are currently described and handled by the WLAN part. I
guess that an improvement regarding this point could then be to move those out
of the wlan binding, and find a way to describe it as shared resources between
those two parts of the chip, but how should it be handled ? Is it ok to remove
those from an existing binding (and if so, where to put those ? It is not
bluetooth specific neither) ? Is the issue rather about current WILC3000 binding
kind of mixing overall chip description and internal wlan part description ?

Thanks,

Alexis

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/OTH/ProductDocuments/DataSheets/IEEE-802.11-b-g-n-Link-Controller-Module-with-Integrated-Bluetooth-5.0-DS70005327B.pdf
[2]
https://elixir.bootlin.com/linux/v6.12.6/source/Documentation/devicetree/bindings/net/wireless/microchip,wilc1000.yaml
> Best regards,
> Krzysztof
> 


-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

