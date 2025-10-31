Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C8BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 13:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Biwe3xggY6rX66H/gYXOoATgjPhp88WrOScO7zPxMig=; b=NKl5KwYLcR7mV0OpY65X0GVNRN
	sK4Do8BNesw5IYiMTYPbsblSVFguBNNoAEIghH3VHckfr/FmEo7sQrcJl6EWRMobW+MXyiwTY8JPq
	unJmnxf1SPKs+8PasIL/tdtbvHcf5Yp87R1c41GtZh++YNuvQM34HmNRxIXAuwse76XwtIX1comyZ
	xmwPnJKHX5+e3bVNnDKrINaz6jnY+lIrTbpW3lOQNQI+cI5z0wJTZxmZvOLbiRDqwtGQHa3NGRA5Q
	KcPC1/+yfESgf4Fv0tri1852WoWTG3jDIhVbEX0qiw3SkFEQLzj6G/fcSVa7Z2Kt71SFQrr5f5Jc1
	2kWSEQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpaG-00000006BTd-3E4z;
	Fri, 31 Oct 2025 13:54:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpaC-00000006BT6-28lI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 13:54:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251031135418euoutp015c5bf6a137093713b5691e266db2ca2b~zl93XwT6Q0096700967euoutp016
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 13:54:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251031135418euoutp015c5bf6a137093713b5691e266db2ca2b~zl93XwT6Q0096700967euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761918858;
	bh=Biwe3xggY6rX66H/gYXOoATgjPhp88WrOScO7zPxMig=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=iaBfzCTizhDjc5gow7AhT58vuDx9h05kGixniiU3hamt4lFZnlBWVs7tqkz0uEFZu
	 qMcshY4usR3ALixCwSfL7fUeYs7r6QUGJuJbNXh39vH8HNZ1RpzA1GkrKKT0U+fGMV
	 CuLCKPuc0/8UJPC5iJCoKsSsPpmDimNKjYG5AC5o=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251031135417eucas1p229a2f6bb12f5ebbeb4ad74c155347e1a~zl921986N0589105891eucas1p2P;
	Fri, 31 Oct 2025 13:54:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251031135416eusmtip1695a6772d241ce4f9305448af7d48726~zl91_Dyis1078110781eusmtip1f;
	Fri, 31 Oct 2025 13:54:16 +0000 (GMT)
Message-ID: <aff4e3de-6dde-475b-9df0-3d7d6ad5d740@samsung.com>
Date: Fri, 31 Oct 2025 14:54:15 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: RPi 4 deferred probe timeout of V3D PM domain
To: Mark Brown <broonie@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
	<florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Ray
	Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Melissa Wen
	<mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Maxime
	Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	kernel-dev@igalia.com, kernel-list@raspberrypi.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "open
 list:GENERIC PM DOMAINS" <linux-pm@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <3c171b6b-f8f5-4192-a3a3-da453a900316@sirena.org.uk>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251031135417eucas1p229a2f6bb12f5ebbeb4ad74c155347e1a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251030191426eucas1p29ce063b538b60e4a998bcd32f925267c
X-EPHeader: CA
X-CMS-RootMailID: 20251030191426eucas1p29ce063b538b60e4a998bcd32f925267c
References: <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
	<a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
	<10a4ef77-0e70-4ef2-b1df-535b476d256d@sirena.org.uk>
	<ecd75fd5-3131-4d10-ae3d-b6f608d9622a@gmx.net>
	<25e500c2-3dc1-476c-b6c1-ac4098a0501d@sirena.org.uk>
	<d6b14388-e0ab-44f0-b4d9-78adf74c2a7f@gmx.net>
	<d88f6420-5013-4856-99d6-da28f79bd7a5@sirena.org.uk>
	<CGME20251030191426eucas1p29ce063b538b60e4a998bcd32f925267c@eucas1p2.samsung.com>
	<043f1702-52fc-4a83-82f7-683a26851623@gmx.net>
	<b02c8890-4568-4afe-8628-10b77e79bf44@samsung.com>
	<3c171b6b-f8f5-4192-a3a3-da453a900316@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_065425_187601_BE0088B4 
X-CRM114-Status: GOOD (  18.49  )
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

On 31.10.2025 13:39, Mark Brown wrote:
> On Thu, Oct 30, 2025 at 09:12:57PM +0100, Marek Szyprowski wrote:
>> On 30.10.2025 20:13, Stefan Wahren wrote:
>>> Any ideas how to solve this?
>> As I mentioned in the other thread, this is imho a configuration issue.
>> If core modules are distributed on NFS rootfs, then one should increase
>> deferred probe timeout by adding deferred_probe_timeout=60 to cmdline.
> Like I say I just don't think we should apply timeouts that take things
> out of commision entirely.
>
>> On the other hand drivers built into the kernel should not depend on the
>> resources provided by the drivers built as modules, so maybe it would
>> make sense to change CONFIG_CLK_RASPBERRYPI from 'm' to 'y' in
>> arch/arm64/configs/defconfig.
> Or the GPU driver should be moved to a module to match the clock.

V3D already is being built as a module in ARM64's defconfig. The problem 
is in CONFIG_BCM2835_POWER driver (defaults to 'y'), which depends on 
resources provided by CONFIG_CLK_RASPBERRYPI (defaults to 'm'). IMHO 
both of them should be built-in and this will solve this issue.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


