Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8F0C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c48FdaYUBETORNVRHnKeGAi+dO5DvZl4pZvPld9S9xs=; b=eRZ36lCE7li4gq8ifIDDfv1u3S
	IPSPyMBARd8rtB76SZqz1UCG6T9sVHBN/1+yufmwphwkM19U6sv3xtkuwVbw7q/iOKP7bW4TzCVuT
	Iq3BJDsbSxzuPAt1FE8oX6tNKdOlIQXZX/d31UROYXVIqllkQd3wt/H+ZR3A7RaDqIfngyPXoms3u
	xXSmdB7vqm0bC60iZw8Lzr8mmC7XC1/iT1qlkmGknpNxhDNydhBK8Y0bu9q4mLAg1JB3F+y0r3w/5
	D6VX2rCImj79f69A4WKyrTAYRLDROpdYaDgZ0JUz3Wanrpjjq5PMggb0I7v+wGpAdt7yx9r2U1Ab/
	kPjjBmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH9f-0000000FuXs-3hCz;
	Fri, 27 Jun 2025 22:02:43 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGw6-0000000Ft8D-0E6A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:48:43 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RLmK8d2841413;
	Fri, 27 Jun 2025 16:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751060900;
	bh=c48FdaYUBETORNVRHnKeGAi+dO5DvZl4pZvPld9S9xs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AQfIPDnOuERmi0XwmMIvUYTCmUpBOeKEQY7wxkcO8M7+Yxbp0ibrKJco1fhXiU8pt
	 HsPuS4sKbGLvDQ+XCNx3tS7nfSEuCL86z1TgYM/xpWrdhqAbB4oj+ISf+sPyNksGyn
	 tdgFeG+JRjjY+knEm9QNv+/eBqIryYtZmUkdckCI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RLmKSP751364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 16:48:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 16:48:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 16:48:19 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RLmJ7J3755700;
	Fri, 27 Jun 2025 16:48:19 -0500
Message-ID: <89457440-8b3f-4e21-8352-6ee05b269398@ti.com>
Date: Fri, 27 Jun 2025 16:48:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King
	<linux@armlinux.org.uk>,
        Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy
	<marc.murphy@sancloud.com>
CC: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>,
        Bajjuri
 Praneeth <praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
        Romain Gantois
	<romain.gantois@bootlin.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_144842_147535_61ACFAE0 
X-CRM114-Status: UNSURE (   8.17  )
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

Hi Kory,

On 6/20/25 3:15 AM, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

For the series,
Tested-by: Judith Mendez <jm@ti.com>


