Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2E6CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKqZQ6H2ucEXsZBClsOawsfzpF0vS0ppOGE8BHVT8ek=; b=IU/jG1XO5Mn1UYbq8FhT2mW7ob
	3bM6gmXIUMHSjyH4ae98exYnvPJPHWJkn4gK3rMd0ES20uYr6mXRzNCcgk4SszTkl4CnDpOoVjadE
	xVbMHbdZEvOfZsc42sjZgBu6CYOxsSN5eEwe+8kLtcedI1/U0rRVt+dkDlmvrQFq7Pm7AOyKhXoVA
	iZfD8PYDEkIOe38uNO/uRUQV2ba/LsLg4lXTA6FnuND3mD70UPls4uWAFBAk9YimGDbsCYHfhRcm2
	NSribgIOZbnNOgh/w9s9L/WgCuq7g0iQ4EVXPVnmZuR2vjSzor6RgaeTqh9lMIApKQJF00dqvH37+
	NDXY3JFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3E9-00000009TbZ-1tpa;
	Tue, 09 Sep 2025 18:38:01 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3E6-00000009TaK-3sYB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:38:00 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589IbtWf4165019;
	Tue, 9 Sep 2025 13:37:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757443075;
	bh=GKqZQ6H2ucEXsZBClsOawsfzpF0vS0ppOGE8BHVT8ek=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hLZZkvJzmUzftQ9dGmPV4TDIRVTEmcKWMKzsRFwkRgI2vtW3RJclHsAfrsdyJy7Jp
	 evddrp7TC0ii087yQvc8zcOio4GTg2gltaXlx47LmLJAqUgyBaJcaujNrw0g0A/wPM
	 5a6eZ8Sduaof/73h9KoLMxNv7AznH4fVHyjRdNtU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589Ibtt63346572
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 13:37:55 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 13:37:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Sep 2025 13:37:54 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589Ibs4N3272256;
	Tue, 9 Sep 2025 13:37:54 -0500
Message-ID: <228bd986-6182-4e4d-ba2f-58ed4dea27e0@ti.com>
Date: Tue, 9 Sep 2025 13:37:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Add support for Variscite VAR-SOM-AM62P5 and
 Symphony board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250904132240.36819-1-stefano.radaelli21@gmail.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250904132240.36819-1-stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_113759_014673_95ACDBCD 
X-CRM114-Status: GOOD (  14.16  )
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

On 9/4/25 8:22 AM, Stefano Radaelli wrote:
> This patch series adds support for the Variscite VAR-SOM-AM62P system on module
> and the Symphony carrier board.
> 
> The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
> featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
> peripheral interfaces. The Symphony board is a feature-rich carrier board that
> showcases the SOM capabilities.
> 
> The series includes:
> - Device tree bindings documentation
> - SOM device tree with common peripherals
> - Symphony carrier board device tree with board-specific features
> 
> The implementation follows the standard SOM + carrier board pattern where the
> SOM dtsi contains only peripherals mounted on the module, while carrier-specific
> interfaces are enabled in the board dts.
> 
> Tested on VAR-SOM-AM62P with Symphony carrier board.

For the series,

Reviewed-by: Judith Mendez <jm@ti.com>

