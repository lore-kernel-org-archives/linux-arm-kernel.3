Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC86ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 19:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+x1LX5OmQin6Dq8FxOKHjnYslDEkntbvnJRtJZ0W24=; b=M5bjnkD63Fk6KrjVlVdb1EOueB
	oSmOWps30lxHCqSph0gpb97rg2ownquXzBOl6Ixo2oeCGwGAEA6TP2DsQvh2l66LXsoLGtV5Xcv2h
	gjYWkdlFs5lNe6q3fdgB9ufLO8t+s3AUG6lg8xvkEiRgELQ3TuetOaeFEPKYTGuWTVsHwBAGf2ts3
	zHggIbL+x7VVWktkyj4z5U5QWMdOPWTu9V+9uL4BzMYZd0YHbiuFtRfMiQopHxJGkDEdhnB1OXRWE
	YRv3hgBEDzLOBFDjWofODCvBvgClkd+DU1hZ2cEXF+jLUM5Mof2Ju/NW4JIEJDfiVpmFvU30sVA2P
	40SQXjiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY25-00000004eKA-1bV6;
	Thu, 30 Oct 2025 19:10:01 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY21-00000004eIr-1cUf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:10:00 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251030190950euoutp028fda77ae8c42d57965bbbb6d42422137~zWoFC3Y182840128401euoutp02r
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 19:09:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251030190950euoutp028fda77ae8c42d57965bbbb6d42422137~zWoFC3Y182840128401euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761851390;
	bh=/+x1LX5OmQin6Dq8FxOKHjnYslDEkntbvnJRtJZ0W24=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=V50f4CWT77uKjW2SsksK+p5PzsI6HdYMZIJhtNcrB+ZvVz40VmP93CBjx7fUVy74T
	 qb0mnFWd/HjNLApw2WHh2NQf29gDY9+46L2JjESqp90KRtLA8aAnfQgzR7iy9j7+s8
	 LKSWkeBJlUEIluv/w2i4hv+cDAY4RMCvPDNAMIEY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251030190949eucas1p16f0fbaa326f4b11b391ee606e06de25b~zWoEUNbLz2409324093eucas1p1U;
	Thu, 30 Oct 2025 19:09:49 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251030190948eusmtip169f9b036eaa452cf32d70c8d5f198fd8~zWoC10_nK2402524025eusmtip1B;
	Thu, 30 Oct 2025 19:09:47 +0000 (GMT)
Message-ID: <a3ff2ac0-573c-44c6-b8b4-8b6d11548a16@samsung.com>
Date: Thu, 30 Oct 2025 20:09:47 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
To: Mark Brown <broonie@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Ray
	Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Melissa Wen
	<mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Maxime
	Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251030190949eucas1p16f0fbaa326f4b11b391ee606e06de25b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251030125919eucas1p17450881a921187fd804abf531ccfe1e2
X-EPHeader: CA
X-CMS-RootMailID: 20251030125919eucas1p17450881a921187fd804abf531ccfe1e2
References: <20251005113816.6721-1-wahrenst@gmx.net>
	<9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
	<a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
	<ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
	<a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
	<10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
	<ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
	<25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
	<d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
	<CGME20251030125919eucas1p17450881a921187fd804abf531ccfe1e2@eucas1p1.samsung.com>
	<d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_120958_546218_7E316399 
X-CRM114-Status: GOOD (  19.12  )
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

On 30.10.2025 13:59, Mark Brown wrote:
> On Wed, Oct 29, 2025 at 08:51:38PM +0100, Stefan Wahren wrote:
>> Am 28.10.25 um 19:47 schrieb Mark Brown:
>> Okay, here is my theory. The difference is about (boot) time. In my setup
>> the whole device boot from SD card and in your case the kernel modules are
>> stored via NFS.
>> V3D requires two resources, a clock and a PM domain. Additionally the PM
>> domain itself depends on the very same clock. In arm64/defconfig the
>> relevant clock driver is build as module, but the PM domain driver is
>> builtin.
>> During boot "driver_deferred_probe_timeout" (10 s) expires before the clock
>> driver could be loaded via NFS. So the PM domain core gave up:
>> [   16.936547] v3d fec00000.gpu: deferred probe timeout, ignoring dependency
>> So this breaks probing of V3D driver in this case.
> That seems buggy on the part of the core, particularly since userspace
> isn't there yet so we might be missing some filesystems - I would have
> expected the device to probe once the supply becomes available.  But I
> do agree with your analysis, it doesn't look like an issue with this
> driver.

Well, I see this partially as a configuration issue. Probably in case of 
NFS root and modules distributed there it would be good to add 
deferred_probe_timeout=60 or something like that. I'm not sure if there 
can be any generic solution for this kind of issues.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


