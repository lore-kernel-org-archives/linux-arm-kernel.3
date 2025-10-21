Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D12CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7SnhTdf3/ZnBb/Auo/xtgJWFGAq+ocBosOYhh6RlpME=; b=znkjJ0YmKcDy7UQcYU9y7OUlxU
	BdvWXVQ7AHOT3TAeunb8CZLpX6Yt9mhgcyi5bqeSQTbdZrEITeNYuCszdz20TjS6kFbBHvDafHsAI
	werYXZUt+fIblErlPTwuQup5Hg9gThnMh8qmrja71cyir95KpU2HVuCbPCaJv5IC9HFpSCJm8wBwu
	VrpwLs/rvpPmCp7KDbRKEJNjSAsrEZkcQwZSdRciSjCNCVNKR0CtmVXdAn3shNJmuSfUSzBLUy0lN
	t1+zuEUl1OzN+obk8L078QU+VsW8CE/GHEvcN0Hjd65DTLksDYteOKG88QBx8iOm460UebcxzMwWC
	eIN+WoIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDyM-0000000HRwC-3GmC;
	Tue, 21 Oct 2025 15:08:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBDyK-0000000HRvO-17v4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:08:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7A52A4E41246;
	Tue, 21 Oct 2025 15:08:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 423FE60680;
	Tue, 21 Oct 2025 15:08:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58768102F2401;
	Tue, 21 Oct 2025 17:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761059293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7SnhTdf3/ZnBb/Auo/xtgJWFGAq+ocBosOYhh6RlpME=;
	b=sWV0ZhOhrBGkxxTsVko6gsm7SFgXKpZfniXDYQ+53CvCE3bHfz1UVt9V/FoRu3uemhbpzp
	jB+jLCo/zHeHi7GnJ2VUZzLrIe6TBV78WrURJ1VwRc0uUPQ64as+OQbLKQoVQSfSgmZ2Wv
	NEvux7I9qCCmbdTowGnMeiVgVc/sLqcv1vMUXRiFIzQIw7y2vnemItpnsTUE7oh1k7QWMJ
	xGi3s/FR3fDgX4bdRPhMmRXkspskq4ULH6LiADl/zV1zQMb/1yYfNREBBPfcZU/bhQogZF
	Ek3DxRNL14OEAxh47i2QrP+RiFYWdUtv+urGqqcVAIbuOn++ipgHmo+WQhzA9Q==
Message-ID: <0e71d2b2-a08d-4ec9-b0d3-9094d3802065@bootlin.com>
Date: Tue, 21 Oct 2025 17:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 00/16] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
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
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251020185249.32d93799@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251020185249.32d93799@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_080824_441343_90A1119A 
X-CRM114-Status: GOOD (  10.14  )
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

Hi Jakub, Andrew, Rusell, Heiner,

On 21/10/2025 03:52, Jakub Kicinski wrote:
> On Mon, 13 Oct 2025 16:31:26 +0200 Maxime Chevallier wrote:
>> Hi everyone,
>>
>> Here is a V14 for the phy_port work, aiming at representing the
>> connectors and outputs of PHY devices.
> 
> I can't help but read the lack of replies from PHY maintainers
> here as a tacit rejection. Not entirely sure what to do here.
> Should we discuss this at the netdev call tomorrow (8:30am PT)?
> Would any PHY maintainer be willing to share their opinion?

I may have gotten my timezones wrong, but this call is in ~20 minutes,
right ?

I didn't see any annouce for this netdev call, it may be of too short
notice for the PHY folks ? I'd be happy to discuss that in any manner :)

Maxime

