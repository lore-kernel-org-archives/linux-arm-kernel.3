Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88E1C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 20:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I87a+TgPwoFR/xesW1OS3yyO05m0/4fbwy3NLcAtNm8=; b=RdutI/KNdVT0B+ucA2OCjVZZYT
	yDk+ua62HXg9/QMHuunxxz7HnbvkjlKIrFBJSZ2k7JicsoGoWtaoTyBfOAONIZgNaAt5ItG/QvQp9
	DhicGtsgU+PmECM9ka1db2UwZQqO1Q1Q9BHQ3+Xi/b1Zrc1XbI/uHbWfATs79V4NfxllanXXe7DCN
	kJWbMYUO5Q122GiopmauAvKhgCR1G5vHcsY7gwy7EBvz3YnYrHVpsO0DT/zmATPswXDyhDzwqTNzS
	sfpe8xEqYNEr/3uA05+qYZ+0PwTEt6D+NWUoJ1D+E2OKwQ+bqnN8Hx8dhUAQXHuECPppgMPXXmOl4
	wWA5QsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAC8D-0000000EJzc-0nva;
	Fri, 25 Sep 2026 20:02:53 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAC88-0000000EJy3-3jQe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 20:02:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B09D7C63441;
	Fri, 25 Sep 2026 20:03:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 896446073B;
	Fri, 25 Sep 2026 20:02:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24A9B102F1E35;
	Fri, 25 Sep 2026 22:02:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790366560; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=I87a+TgPwoFR/xesW1OS3yyO05m0/4fbwy3NLcAtNm8=;
	b=ftAqJu03PKELrq/9DVzKPyaxyLEbv8nks7KxPKkhG6WIpbSLyHDyRc2riMwEi6JVOBt8nm
	YK8iwOQK31hgIIKb87uF2joMZID5OP2sQlwexE5QcoIEsSfnW7mwi3kj1ws4GlJ2URzOl6
	aTPgFsf7fXn2eYqnCs1hB9UB0YxVBqZIXwLRVNRLEAs9/J6Y96L8q4x82pte9mYoOf+OhV
	aQF/njcNUtOa2YnqeravxM1Udogx++NzjCT/64+PFKqwXp9UmjdNoA2PFd3VDGBryAELgz
	0SfuEl5j4GPQcxfsd5JQ5Axy5LmKX4X1MtkbhlNn9V3pVzP5jG0wHMX/itdfIw==
Message-ID: <d704ea9d-6cca-4f2f-b18b-0267a9082e18@bootlin.com>
Date: Fri, 25 Sep 2026 22:02:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 0/7] net: stmmac: More selftest-related fixes
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 David Laight <david.laight.linux@gmail.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
 <20260921152202.64d4c67a@kernel.org>
 <f8fc89b7-15ff-4915-8f1c-49c3b2357699@bootlin.com>
 <20260925122202.611d655a@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260925122202.611d655a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_130249_124145_5E5C9D1F 
X-CRM114-Status: GOOD (  10.40  )
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

On 9/25/26 21:22, Jakub Kicinski wrote:

> BTW - I see you have a thing called "netdev series report"
> I've been meaning to ask someone if they want us to add to SUIE
> subsystem tracking (https://netdev.bots.linux.dev/suie.html)
> I could easily add a drop down to filter just stmmac patches there.
> On the scale of 1 to 10 how useful would that be?

I'd say, 10/10. To give you a very concrete example, I was on training
for the past 4 days, with little time to look at my inbox.

Today was a struggle to just browse through the stmmac pending
patches, some being straightforward patches, some complex but from
well-known contributors, some large glue series that are 10+ patches,
and then some likely AI-generated series sent as-is without real clarity
on whether the author actually fully grasps what's being sent.

So, I resorted to SUIE, ctrl-f stmmac, and going over that list in order...

I think you're asking this question at the best possible time, at least
for me :)

> Is there something beyond "active series" that you need to see?

All the info I'm interested in is already there I think :)

Maxime

