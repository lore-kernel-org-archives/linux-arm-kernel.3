Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A606AC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I87Av/MwXWoM8xzWi/f8xlGiaslW/Qp2/zw+nq+E/Yc=; b=qqY6E4CqMulKw29TDBKqGw2yiW
	zf7BUXSYuTYsXS9VsVAyEHJ2VGYDS5PL0AnLpxSg/6LBPe8puT64YTfO8+bQJAvalcZol1kaT12dO
	WfnZRxuRZBqCh21oaWzKAgESJPXqF4iapj+Q1bzdwhdLBYCDfsVXFIVsw0q3tAhbEY3WE6dKGnImi
	ozwxlkHSGOv09l2ceVf1SXmuh5/v7o4403PjvUHLI3AIaGA7NoGxGbIzJWZPAfQSwLV8LGAMuUGkz
	W8dvtP1u/GjgvbEOw2FxpC+GAXJCd18ex0s2pExxffxrqJHW3QRtZoN4rkZdfexJaGBJSrY9517pC
	zwxWl53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH58-0000000Fu8S-0J1r;
	Fri, 27 Jun 2025 21:58:02 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGu3-0000000FspV-1ctN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:46:36 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RLjxNJ2516423;
	Fri, 27 Jun 2025 16:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751060759;
	bh=I87Av/MwXWoM8xzWi/f8xlGiaslW/Qp2/zw+nq+E/Yc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fh2/IP5sT0iO0Fdz0SLIWRGWUqjsQ5p6QI03ou4g3cjTPnc9ZQRUidtxGED9Y4yOF
	 pWhx1EoTftKw2bxS7O+hRSColqRh+vELSsaYs3wOWp4TQGjBMJG5V6vU9NMS+QJh6/
	 DrwQiBJfpd5DMgyg2ZOASUgiQ9uiek6MaWPhL0UI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RLjw3G750176
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 16:45:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 16:45:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 16:45:58 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RLjwh93486775;
	Fri, 27 Jun 2025 16:45:58 -0500
Message-ID: <a754b9e8-dc89-4188-bd2f-18c29c299fb7@ti.com>
Date: Fri, 27 Jun 2025 16:45:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Robert Nelson <robertcnelson@gmail.com>
CC: Kory Maincent <kory.maincent@bootlin.com>,
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
	<marc.murphy@sancloud.com>,
        Jason Kridner <jkridner@gmail.com>, Andrew Davis
	<afd@ti.com>,
        Bajjuri Praneeth <praneeth@ti.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Thomas Bonnefille
	<thomas.bonnefille@bootlin.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
 <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
 <CAOCHtYgNfnAK43GBTdN675dFSHrbTJfy_2GbRE88E-0keoChrg@mail.gmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <CAOCHtYgNfnAK43GBTdN675dFSHrbTJfy_2GbRE88E-0keoChrg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_144635_520698_D65641F0 
X-CRM114-Status: GOOD (  13.84  )
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

Hi Robert

On 6/26/25 7:03 PM, Robert Nelson wrote:
> On Thu, Jun 26, 2025 at 6:23 PM Judith Mendez <jm@ti.com> wrote:
>>
>> Hi Kory,
>>
>> On 6/20/25 3:15 AM, Kory Maincent wrote:
>>> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
>>> (BBG). It has minor differences from the BBG, such as a different PMIC,
>>> a different Ethernet PHY, and a larger eMMC.
>>
>> Thanks for the patches.
>> I was testing against next and noticed a kernel paging request error:
>> https://gist.github.com/jmenti/d861528f98035b07259c29e76e5fae8b
>>
>> Did you see this by chance?
>>
>> I will double check that I tested correctly and come back, but was just
>> curious to see if this is expected.
> 
> The tps65219-regulator.c has a bug, make sure with this board you also
> have: https://patchew.org/linux/20250620154541.2713036-1-s-ramamoorthy@ti.com/


Thanks! I don't see the issue anymore! (:

~ Judith


