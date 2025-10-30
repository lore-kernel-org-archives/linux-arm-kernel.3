Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2E0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75eS/O8ZNC1UyL0u+tQ9cvsjlhk53nqQlsjqo1BsDyw=; b=2bLiw95wkJBhK1v1zTN0hPwbxS
	5V/bNfS0qEge67ZQniJ+x9nKBF7yym9P37b6riVCTTsojwESeBqtX4qgf8kHmFQcyzcqC0cOwPzPP
	BLle51YbgePD2+tcdami6LkkRwIn//XiYF+MvBxjAjsVdmSzirfE/aUBkoFqenIFdqTbWr7G70cll
	FXteAgU3Vok9jaqSHqKNJJ6G/R94W1MTo3aFBczvIQtIkLqlLIAXrPxAb4DWju76USjfjA/8e3quv
	7OAC426qXQbA9hG4Xckxyozv77Xouj5lIxXHi5sPgCa2RJ3SxcG4Zv3rpXLCFK56BVMlt7MZk1Yzc
	A9kW57mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUK5-00000004M6P-2bwY;
	Thu, 30 Oct 2025 15:12:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUK2-00000004M5S-2v1u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:12:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7D6DA4E413FD;
	Thu, 30 Oct 2025 15:12:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EBB56068C;
	Thu, 30 Oct 2025 15:12:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BF5311808B5F;
	Thu, 30 Oct 2025 16:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761837133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=75eS/O8ZNC1UyL0u+tQ9cvsjlhk53nqQlsjqo1BsDyw=;
	b=zPEnt6Gx1T/+JmQGIi5Xj8VnqeU74tUBVaqL8GRS7d3W8tKP0TTb6IU1r8GFexIH/5C9Oi
	iZwXrcaZT1t2s4qvNWb8BVcpaWlfxmLO7ukREzj1VqSLNovoXOD5YMSPSjexGNKf9hY8ch
	B8kWX23mTs7ilbHAtUEH5W2ZX4vG1f1vS2xoOq4kZXGBz9J4iow0UTEyngIyMSWZs0pM4i
	l0qR6gJKaIpeXC5uawriwcpGUGgDjPQiCMiKsZJehkUiJ6m2/FCUQkcWT7WIS7IJ4k4rVi
	XoWtn5XwfsAMARi4HB8jNYujGm3YuHy8SnKfzBuulNK2Wd74LYMmxVQv0SzZ8w==
Message-ID: <fd961879-bf35-44a6-a043-4a335e6fdb70@bootlin.com>
Date: Thu, 30 Oct 2025 16:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
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
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
 <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
 <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
 <b8561c97-483f-4f43-897c-4bc3a4b916b4@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <b8561c97-483f-4f43-897c-4bc3a4b916b4@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_081218_894990_17A6281A 
X-CRM114-Status: UNSURE (   9.94  )
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



On 30/10/2025 16:01, Andrew Lunn wrote:
>> So that being said, an option could be to only focus on pairs, only
>> for medium = BaseT, and ditch the "lanes" terminology, at least when
>> it comes to the DT bindings.
>>
>> Does that sound good ?
> 
> That sounds reasonable.
> 
> In the binding, maybe try to express that we might in the future
> extend it. You can do that with conditionals. medium is required.  If
> medium = BaseT then pairs is required. That leaves it open, e.g. in
> the future we could add medium = BaseKS, and require that has lanes.

Thanks Andrew :) I'll update that then !

Maxime

