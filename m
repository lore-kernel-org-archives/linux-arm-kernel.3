Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DA1CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV7434LtfJE9BZlDJGCgsCgIQ+62HrStedVeASbrsMw=; b=Ih2mprLWIvZBO6yHjSTlqzdAqQ
	6Z22iCIHQbXJfglfNv5Ry18LzVZm/WP3olMonxOowVs7iwcv09LcGeHhVBErAcOslnbyLN12JGhZI
	Gg/8AIvFEUNVC9Z2jskY4dkDKIPR4fXNyifwmcnbYtnllxrOj3Zx041nb+KndioxaKWJGnWwJp3Aj
	g9ONF9wpvY8uxL6/rsthGn5Ir+pHN88ypSIPFPiXxn7vfyJ1X3nv0J+pYcqQhX3tnuHeltd6V0ilW
	bNn40Q58xFNZxjs+7Skv0x3y+kToDZEni5qE44Y7TIE9JViZxqJ4/wIpTYLh8ITp78xvmkxVScRAM
	7gzdIBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZ6o-0000000CEAg-03JA;
	Wed, 20 Aug 2025 03:03:30 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZ0w-0000000CDP3-4B0B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 02:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eV7434LtfJE9BZlDJGCgsCgIQ+62HrStedVeASbrsMw=;
	b=lMOvkY1LzCLkfwqn+mBkiG1jjmxW8cgpYJd+WnCezQjkqvtW17nGatePD9612y
	yE8borI7zEVkhJMym3LuMWw4t20k1WvdoxIYdrHyhmFlVRM2B0o8c+RWq6lVysU4
	bHT3aeDh8PI3xr5Dh8vVnVU4O4OmQAWNUAOqaWfA4pk0s=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn3wyAOaVo_eEJAw--.27675S3;
	Wed, 20 Aug 2025 10:57:06 +0800 (CST)
Date: Wed, 20 Aug 2025 10:57:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: Frank.li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org,
	boerge.struempfel@gmail.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/3] arm64: dts: Add support for Ultratronik i.MX8MP
 Ultra-MACH SBC
Message-ID: <aKU5gAKdUY5m3msu@dragon>
References: <20250716154808.335138-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716154808.335138-1-goran.radni@gmail.com>
X-CM-TRANSID: Ms8vCgDn3wyAOaVo_eEJAw--.27675S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYHq2DUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBB2vZWilGKVrjwAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_195727_341578_AD5B7B7B 
X-CRM114-Status: UNSURE (   5.66  )
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

On Wed, Jul 16, 2025 at 05:48:03PM +0200, Goran Rađenović wrote:
> Goran Rađenović (3):
>   MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
>   dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
>   arm64: dts: imx8mp: Add initial support for Ultratronik
>     imx8mp-ultra-mach-sbc board

Applied all, thanks!


