Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08572C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=izERVxm2+ntmpqePiAy07uUJR+42twLW2H2vEA4ju50=; b=LGpkWB4VaxcNtS0PCH/q1rmHAo
	oAicyL0m5yvXLkQx3KrdAxD4MHI9xqG6IeZAe/eoPv4DJD9yonSwEABUD+aOaBG1IvKlgbIdyd9lX
	IbfE/Z32l8B8t7a47MkHZEg6q90Wq0iec36jua85Z99GJFs1gfhZ2v4Szi2EkYvjoxuXlrrIKXPg1
	WAP9jeRJ7WuOt6QjY8gUeVplgaDcL75fPXyul2lABU+7rGfeZNlUaHNFDXwvMM+w1J5HW9DOJ7ONi
	YY1GyUSnI2P0ykxpMbETNmeLMn5Ct54JsPFNnaDaQPbUFWrTu/rvQO7RvZGMH8xmmjhiNQMNsVEmi
	0UWXq0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLLY-00000003Lke-2z9O;
	Fri, 09 May 2025 10:52:52 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKgz-00000003DM1-2MiP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=izERVxm2+ntmpqePiAy07uUJR+42twLW2H2vEA4ju50=;
	b=keWZgP8cSVuU62zuRHKBjK7P9EZ6VdTqDnuXp+dF4RFUw8G1hPbfC+oqhhKSIo
	0z/GgMWQWsRPfTXQaiFjIzYwQRXF6vIEKlxxPSZ9zAm6E/Tu4gTiqyin50dfm9pP
	mHbPVX1tuKgHvJCJPRONRH75Pd/xo8tQ4LofoslkyEcPM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD31w6f1B1ol0OqAA--.12430S3;
	Fri, 09 May 2025 18:10:40 +0800 (CST)
Date: Fri, 9 May 2025 18:10:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v4 00/15] Update PHYTEC i.MX93 DTS
Message-ID: <aB3Unt2tKNaIBnBS@dragon>
References: <20250422105644.2725168-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422105644.2725168-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgD31w6f1B1ol0OqAA--.12430S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF1rAFy5tr43Cr45ZFyrJFb_yoWkuFg_uF
	4fWrn7Gr1kJrs3Aw15A3Wjq3s29FWYyFyrKFyUW3Z5tr9rGFnIkr9ru3yfGF4qgFnF9r17
	CF18JwnaqrWYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbfgA7UUUUU==
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRdIZWgdnHfvXAAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_031057_904209_595A0F87 
X-CRM114-Status: UNSURE (   6.51  )
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

On Tue, Apr 22, 2025 at 12:56:29PM +0200, Primoz Fiser wrote:
> Primoz Fiser (15):
>   arm64: dts: freescale: imx93-phycore-som: Add PMIC support
>   arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
>   arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
>   arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
>   arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
>   arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
>   arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card
>     write-protect
>   arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
>   arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to
>     fix ERR052021
>   arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
>   arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
>   arm64: dts: freescale: imx93-phyboard-segin: Add USB support
>   arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
>   arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
>   arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically

Applied all, thanks!


