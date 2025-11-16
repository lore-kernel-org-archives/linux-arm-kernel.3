Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A6FCEBF8A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8mkFSpSXqhy3JNKuZq7z1gqffCcwGeVX1rPlpkQrCOA=; b=w58iyHXNMoslrI9HJPT3ASBy+Z
	1SAcTYcj/Rywk2ZDBGoRyTbcVBDKmqPZm1Jo6owdMTkLFCWfKQKTUZrX+NwynC74V10qg8JXuDTAZ
	ey63UODDAqxuU6s9ZFv5ruswOwxUPj9U90sgJHWuZXl84qI4jCQyEC0MnbDEmEWbTTWqyCneEzx0D
	mYbpTDeGI1x2uJN+SSzNQvr3I9DOfwEAk6sdOC1T3i7exsV4qCx6IZsp5BJX6ESzjmA00Slxz9gw6
	gEId4Kr8o0fNEAtsbvuexBFbQg0KktLySQ0GEWmVi2bCBYzr8GvGK2fopztF1TBniDHjkrsoDdVk2
	Kx1rJVrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZaH-0000000EX2x-0V9j;
	Sun, 16 Nov 2025 10:02:13 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZaD-0000000EX2Y-1C8c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 10:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8mkFSpSXqhy3JNKuZq7z1gqffCcwGeVX1rPlpkQrCOA=;
	b=NgY/oeuOAaDhu16In1tbHjJuD7+j7BXkEayRvDJNiO2iR/SSxD/KF8YW1DTozy
	SDpWwwOoL/JthFdULy0EV0vCctO2xy8yHXNzAYAsbeEfZEdVBGh7SHR4l1SVGvkL
	3G2vGkJiJLw2/K1Qhu/hS8zKySliB+JgnscPZbyyX4fy4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBnPs4PoRlpOsYjAg--.8123S3;
	Sun, 16 Nov 2025 18:01:52 +0800 (CST)
Date: Sun, 16 Nov 2025 18:01:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] arm64: dts: freescale: imx93-var-som: Align DTS
 with hardware revision
Message-ID: <aRmhDvdkEvD5cir2@dragon>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
X-CM-TRANSID: Ms8vCgBnPs4PoRlpOsYjAg--.8123S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRANcmkZoRCEFwAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_020209_679177_53F7C0CD 
X-CRM114-Status: UNSURE (   6.23  )
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

On Thu, Oct 30, 2025 at 01:01:20PM +0100, Stefano Radaelli wrote:
> Stefano Radaelli (4):
>   arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
>   arm64: dts: freescale: imx93-var-som: Add PMIC support
>   arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio
>     codec
>   arm64: dts: freescale: imx93-var-som: Add support for ADS7846
>     touchscreen

Applied, thanks!


