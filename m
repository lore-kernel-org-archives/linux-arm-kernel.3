Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33C7C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4xIEcssZKWWAvbTH7TLXmgPRORXbepFbz/dh0noRbo=; b=My6wg7cxUTceh8wcR2zM++bL2q
	Vnl05VjiGOu9+e6kJ62ynL/WDynO1cPHVKkw+CruwhPoB4LNHWlmNSfudpPKL2UQsSbugG+FkUjMj
	Txr6Oy0T+S9csBgJqffif6U8n0dx0C+j4Vqv7DznWSPRviQwO76Xh4ii2KywGW+xXL6nBpgFqDj3C
	6d771tlQpiuNBPI2rChJjgtt7JJbFU8f4QBSD1w8QmNOXrx35OMOZ/92mWAZ7shjJKhecz9d99sGN
	6tc1+lacDEyAefgDKuUX/69DNtvF3utfcVHTf6yoYELUDBHLSTxz6L1cUxI6+sgqL/f6jhsvWvC1H
	wtM9b1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EVG-00000004jjy-1bsg;
	Mon, 14 Sep 2026 21:46:18 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EVC-00000004jjF-0v0k;
	Mon, 14 Sep 2026 21:46:16 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914214607euoutp0298349186b776b9ecf42a4bf0e7f739a9~VTims6U5X2157721577euoutp02a;
	Mon, 14 Sep 2026 21:46:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914214607euoutp0298349186b776b9ecf42a4bf0e7f739a9~VTims6U5X2157721577euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789422367;
	bh=Y4xIEcssZKWWAvbTH7TLXmgPRORXbepFbz/dh0noRbo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=DBTeMmmWwRxbmdVpM20Nu8zuMdEAEFE+/dOsYDxgSS9crjm3ehe9Ra2pMO1CTwjkp
	 LJzCe4yelf/KotZpTT/jbdq07pxfM6l3YcTDY3WqQJztYNMva+VobG8k87ffGM52eZ
	 grgKhMAQmYnyS8kpgMxdkRkZ5nwuLdFZGx2RVOI4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914214607eucas1p2a107876f411b6812cdcc505d99eb9022~VTimB3gp42703627036eucas1p2x;
	Mon, 14 Sep 2026 21:46:07 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260914214605eusmtip2f9720a98b374ac418c59f98ea4b5c125~VTikOVkOp2978529785eusmtip2r;
	Mon, 14 Sep 2026 21:46:05 +0000 (GMT)
Message-ID: <fba2ac39-fe79-4065-b9f5-8618c449010b@samsung.com>
Date: Mon, 14 Sep 2026 23:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] soc: starfive: Add jh7110-hdmi-subsystem
 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp
	Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal
	Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ap50F4QOw7jbcvI6@monoceros>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260914214607eucas1p2a107876f411b6812cdcc505d99eb9022
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada
X-EPHeader: CA
X-CMS-RootMailID: 20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132729eucas1p1bd78eb90feaf90b6265c13fc7bf43ada@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-11-484f9ae72715@samsung.com>
	<ap50F4QOw7jbcvI6@monoceros>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144614_551376_78DB50E2 
X-CRM114-Status: GOOD (  12.73  )
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



On 9/7/26 10:23, Uwe Kleine-König wrote:
> Hello Michael,
> 
> On Fri, Sep 04, 2026 at 03:27:12PM +0200, Michal Wilczynski wrote:
>> +#include <linux/mod_devicetable.h>
>> [...]
>> +#include <linux/platform_device.h>
> 
> Please don't add includes for <linux/mod_devicetable.h> as it introduces
> many unneeded build dependencies. Either rely on
> <linux/platform_device.h> providing of_device_id (IMHO preferred), or
> include <linux/device-id/of.h> directly.
> 
> The same applies to two more patches in this series.
> 
> Best regards
> Uwe

Thank you for your review. This will be fixed for v4.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

