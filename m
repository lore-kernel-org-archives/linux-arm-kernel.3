Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC0CD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UuhlMt+xKMZUo21Zwoyz9Z0SmtmmUjCG1ylmETi6EM=; b=F7OhIsmQDcq4+SN1fEu5+Z8ttg
	p9JPFyvNhm0RpY7aiJshhziJBhiajiXeVvvJPfJ7pxomXQt0bQtjT17Qo6ijh2hT9EbwZtHwyIP5w
	OjVCEC8bdRJl6XSncyzKb+UY8ODEZAshmBDwY/6QNxGPSHmMrKnSWvowyuQQ+57PQCSM19jhOyR2X
	0w/5tOVhED1gmL3lU37Wq2TV7RbTkd3wDBcszyTbWreRa8LBxa/Kl3j6OD8evwrm1o4jFZDBETGIU
	DzHqnZl4bz6dR0eHmb/CqbNBSfhDJ+/7Jx9EcioaOKLIQgRaGfS6weej0yEmS8ysUJgU9qsYVddD8
	ZtJ5G2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYy5-0000000GLrC-2ZkN;
	Thu, 27 Nov 2025 10:11:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYy2-0000000GLqH-1PyM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:11:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC3B6C16A1B;
	Thu, 27 Nov 2025 10:10:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7ABC06068C;
	Thu, 27 Nov 2025 10:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 813CE102F275A;
	Thu, 27 Nov 2025 11:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764238270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=3UuhlMt+xKMZUo21Zwoyz9Z0SmtmmUjCG1ylmETi6EM=;
	b=Idmcn53QlfBfCgbcymkMTd0ok7+aou9cOVD0Hlxmegy9ogCg3hnJIYpRN9wkK5QRcyAbHV
	VeYPG/lv+3K4E5atdFIx5vbbTSTWoI5Et1hxldmQI63H8ZT8ZpISh8W12V1IBP7TLjVVGx
	qNJWvt8vA5+6Yfudrvf6DeYftZrLLSevl7NARl3PS1m4wgCt61KAWPZR6qXNFJr6oteavV
	7G+SOjSoV5eqnHW7zbJ3KaFD66CejCXEUihtV8DmVuI81n4Pj0CMZ/l605ffTIDW2LssuQ
	Cuw/bB6b1tFMv9dJJfE8o2rCAeZlyeS7i+vH2tINTIS+baB12qkYubtEuxdYcg==
Message-ID: <966bb724-59bd-4f45-a2a6-89a1967a851e@bootlin.com>
Date: Thu, 27 Nov 2025 11:10:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251126190035.2a4e0558@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_021114_548842_AE27554F 
X-CRM114-Status: GOOD (  12.44  )
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

Hi Jakub,

On 27/11/2025 04:00, Jakub Kicinski wrote:
> On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
>> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
>>
>> This v19 has no changes compared to v18, but patch 2 was rebased on top
>> of the recent 1.6T linkmodes.
>>
>> Thanks for everyone's patience and reviews on that work ! Now, the
>> usual blurb for the series description.
> 
> Hopefully we can still make v6.19, but we hooked up Claude Code review
> to patchwork this week, and it points out some legit issues here :(
> Some look transient but others are definitely legit, please look thru
> this:
> 
> https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574

Is there a canonical way to reply to these reviews ? Some are good, some
aren't.

I'll summarize what I've done in the changelog, but it skips any
potential discussions that could've been triggered by these reviews. I
guess this is a matter of letting this process stabilize :)

Anyhow I'm impressed by what it found (when correct), that's pretty nice.

Maxime



