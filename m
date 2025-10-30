Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A19CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmUXgbht16t5LuR1Ifebp4Dn4lQy5nFML5F0cJ2OBYE=; b=aSF5tp3APvlGL1ETli+JI1hDNn
	kxjvjtBvV9Lzz/KHiWue65WfDJuNjsA5nhDyi4rRNw6Km5pz7BLbVpXCD9zBhKBowqsvQi3icTzrY
	sEp4vBO9YbJaYA10ua5iuNA28yZa5qcLcLOkRKu6ckwpIyof9jdycmyjw+k1C/yNpyRuPkfNj1Cnt
	PqjR69ruBlnl78c+qfLsOuvf+P4H9Z6PN84ipv1d1RnB2OQCbXYnYRfPEfHbA7vl93HzMaqhvIZ3e
	bcl0rDUJMXgYV9COUFApyQyBFFhNs2JOpQrkEwVIAh3/YtJLvubhuygXjozsWsmZN8VkVrUH6KAJL
	jtVqBDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERX2-000000045yd-38aZ;
	Thu, 30 Oct 2025 12:13:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vERWz-000000045yD-35eb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:13:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 66FC01A176D;
	Thu, 30 Oct 2025 12:13:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38FFC6068C;
	Thu, 30 Oct 2025 12:13:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96D2B118089E2;
	Thu, 30 Oct 2025 13:13:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761826404; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UmUXgbht16t5LuR1Ifebp4Dn4lQy5nFML5F0cJ2OBYE=;
	b=tdCXrFYwcN46AbuyaR6dJXjGjxEyCuzDx70EpsPcezrhhuC3G1nY0aAj6KMzcubsdbMhSu
	gwZyg+yxGUdcX2Q5LPBpoqScgTZKq9MEVE/TV3OyoIdG299sEUMdhZpGmyDRzv/pnqA11o
	9QqzHfwnkSavf6oHSSWRsclBJR83MFOyIcO6afZjWx3ipsFHAfasdvQYAa+pD+l9FlmAno
	oNdlWNhb+Us3rAZctc5X7e+R7RLUDP8Eoean2x3RKKCDWB6zHDbcC9aPXri2YzY+HOY8za
	7lSIt3ZUiaPkSwooCRnDq1/CT0srkt2WD0L19ta/1cSnVGehs3lqXaqM4SiIZg==
Message-ID: <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
Date: Thu, 30 Oct 2025 13:13:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
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
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251013143146.364919-2-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_051330_093289_E1E6866B 
X-CRM114-Status: UNSURE (   9.17  )
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

> @@ -313,5 +324,12 @@ examples:
>                      default-state = "keep";
>                  };
>              };
> +            /* Fast Ethernet port, with only 2 pairs wired */
> +            mdi {
> +                connector-0 {
> +                    lanes = <2>;
> +                    media = "BaseT";
> +                };
> +            };
>          };
>      };

As Andrew suggest clearly differentiating "lanes" and "pairs", do we
want this difference to also affect the binding ?

I still think "lanes" makes some level of sense here, but at least
the doc will need updating.

Andrew what do you think ?

Maxime

