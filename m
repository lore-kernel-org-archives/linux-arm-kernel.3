Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF60C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLHFqrB2AUJXMa7TnwIkEJ0k4wehW0BbG+sRDBDW7nY=; b=yCZPGY2R9gfU9aPkBdRe1+ov9r
	4QsVMEv1r2YG+Kv5YatxmwaNpmhBw9nPpPhjAj7GYWLC2ADH0+58mx8etwWVNP0j6Ym8Td5XoChYD
	+sBpz6hL605TXVwhF/PxJ0shZLfFy8AFVQojfga/fFj9zgyMOQqe0UG2CkreR7I3Q/iprAwubVYdX
	X5/iHTqi7IMWySexj4zH07ALsnStstwqwt18Z/itDrfS3JcvauehAMXt7aGAFouga31M4ZZvVl97V
	5FBTVStLbdC326WVXoJhOLr3lj/Ovllnmidw15neWkegGf5aRrWnhS0UeEo5xiMnkULPHFYa0aYO3
	UxE2UAcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4sM-0000000HSEj-3zPW;
	Mon, 28 Sep 2026 06:30:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4sJ-0000000HSE5-26KM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:30:09 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CF6201A0FD3;
	Mon, 28 Sep 2026 06:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DDB9601BD;
	Mon, 28 Sep 2026 06:30:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70353102F1E74;
	Mon, 28 Sep 2026 08:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790577002; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bLHFqrB2AUJXMa7TnwIkEJ0k4wehW0BbG+sRDBDW7nY=;
	b=EVdWJG8o7hk3j/Yid2903h3z+AipNuWaQQNXL98A4MLA674wHUX/rMlrgx0i4NnsqCbnC4
	Zsj8Y2fZ9xO0NmdGj+uJ0b9F/vNsTdHmwf+dxDFQhbgetY1Et9emWisnZ53aZ150hGwFJ5
	eNwkY1xiCvMkAnzqwZ7Ejale/jtfLf4CPP33Y5MzNS0qajv4/GIiy/0Wmaax/1A55PQ4TO
	GH8ZdwVbP1nmF+TAMt0N3DKAqMudq2QdeariHERn+X+vQGI3KBrfmAuJwiHKFWhtE8kuil
	AvS04UfRIh123GkMrNKlQRIvQAaXzoIeiHW4SwiuSmq5PaS5cuCTLOJeogvaUQ==
Message-ID: <db817925-eb0c-4fe4-8ab2-2cd5cde505d1@bootlin.com>
Date: Mon, 28 Sep 2026 08:29:46 +0200
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
 <d704ea9d-6cca-4f2f-b18b-0267a9082e18@bootlin.com>
 <20260925132204.03ce9495@kernel.org> <20260927152001.2e890f9b@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260927152001.2e890f9b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_233007_687955_471AB1BC 
X-CRM114-Status: UNSURE (   5.42  )
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


On 9/28/26 00:20, Jakub Kicinski wrote:

> Added the per-MAINTAINERs entry filters under the funnel icon
> (Note that you also have to enable the filter as a while with 
> the checkbox at the top, or middle-click on the funnel to toggle)

Thanks Jakub, this is helpful :)

Maxime

