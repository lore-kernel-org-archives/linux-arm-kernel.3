Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D528C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 02:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS/tUAIA1b6CCBXh10C6SNMxVsUo85DYXePoK+bxjKw=; b=260aMtzHHUAbUTaiqVQVbFRSqg
	z2uLQi3DACW9gM9RzB5pmbMUg6Ic1ZlQr6s0SvLgSfGk3Bxl4Fxxgo9kQzV+Uu5qcoBPoIXTvA2gP
	/VUioIrC2YNZC0HXBs4Wdr9EpHJ2oVpJ5Szh4bVIkUmSDWKoWYaJIOE05L5c0+HMEAx6SJtuiD3VN
	wNFusIU/eeOc0FyRT0Ko/QxmnIm8/sgadOGMjKq9kaIHFH8KR0zrW3m+LRdIQZ6CUrpYVXss1NRzj
	RftBeKB/tRhPwfb/tw8pyLfXO1+ynuydxIVjKV8Y1GvpVO2bmddn+pSIHYGvqoACLzLyLT/XLiFz3
	rxAEn2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDJZ-00000002EaT-1QZK;
	Fri, 09 May 2025 02:18:17 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDDHb-00000002EP2-0OU5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 02:16:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5492G6Vs1272622
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 21:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746756966;
	bh=CS/tUAIA1b6CCBXh10C6SNMxVsUo85DYXePoK+bxjKw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=njGFB6KfQhtmDsI/ZzB2KRWKAAsHm43knJdCkczOtmxLG+e8+obmpwefk95YQ+4jc
	 fv64ExsKnp3guxCe6yymutSzGr/ePPCk2Z8NCVuDXtctmmjFblNBGilyKZvi69k8mV
	 qh/bJz5zo7Fc6Uh5sKg0QWn6P6WK6+7tk1hjLSkQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5492G6jY113458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 21:16:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 21:16:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 21:16:06 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5492G5ds106642;
	Thu, 8 May 2025 21:16:05 -0500
Date: Thu, 8 May 2025 21:16:05 -0500
From: Nishanth Menon <nm@ti.com>
To: Bryan Brattlof <bb@ti.com>
CC: Paresh Bhagat <p-bhagat@ti.com>, <vigneshr@ti.com>, <praneeth@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <khasim@ti.com>, <v-singh1@ti.com>, <afd@ti.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <20250509021605.zgfwx5ubbccbxwbb@equator>
References: <20250508091422.288876-1-p-bhagat@ti.com>
 <20250508091422.288876-4-p-bhagat@ti.com>
 <20250509002201.g2db6cf5w4mtow6k@bryanbrattlof.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509002201.g2db6cf5w4mtow6k@bryanbrattlof.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_191615_264434_B55F850B 
X-CRM114-Status: GOOD (  14.98  )
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

Paresh,


On 19:22-20250508, Bryan Brattlof wrote:
> On May  8, 2025 thus sayeth Paresh Bhagat:
> > AM62D-EVM evaluation module (EVM) is a low-cost expandable platform board
> > designed for TI’s AM62D2 SoC. It supports the following interfaces:
> > 
> > * 4 GB LPDDR4 RAM
> > * x2 Gigabit Ethernet expansion connectors
> > * x4 3.5mm TRS Audio Jack Line In
> > * x4 3.5mm TRS Audio Jack Line Out
> > * x2 Audio expansion connectors
> > * x1 Type-A USB 2.0, x1 Type-C dual-role device (DRD) USB 2.0
> > * x1 UHS-1 capable µSD card slot
> > * 32 GB eMMC Flash
> > * 512 Mb OSPI NOR flash
> > * x4 UARTs via USB 2.0-B
> > * XDS110 for onboard JTAG debug using USB
> > * Temperature sensors, user push buttons and LEDs
> > 
> > AM62A7 and AM62D2 SoCs share several peripherals in wakeup, mcu, thermal,
> > and portions of the main domain. To improve reuse and reduce duplication,
> > common *-wakeup.dtsi, *-mcu.dtsi, *-thermal.dtsi, and *-main.dtsi files
> > have been introduced. Each board will have a dedicated DTS file that
> > includes both the shared and SoC-specific .dtsi files.
> > 

I suggest doing a cleanup and internal review before public next
level patch. We have enough number of patches in upstream to use as
reference as to how to do this correctly.


Let us look at this in the next window, I do encourage using the time to
review internally to use the best practises and have less discussion on
minor organizational topics.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

