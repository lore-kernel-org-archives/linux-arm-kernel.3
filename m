Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9638DE6F09A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 03:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANBeQg3BIZC2MxnhvEH4gAK8e61+0m9Yr8bFK4R/WhA=; b=2Vsehlyv2nWwkk04E09ue9pc17
	LPKTcTMvC3xAM5Smo/2yZaMqfEy6HeXZh7YRX1srXCBex6VRTVbawg11xU/IrJzgWIreJjjfeNL99
	DVyMGyXkXY0raod3OXt3Yc78vX8gt9iqze/qFcWQyDbOc9gHiEQAqbLLPgrkS0o9oRHpvpzEWx6LU
	iJcDqXl6D+u3QgZOAje0T9RsYgGXN6xT0A65edqEK9mDtNh4d1pO/CFEcTcMoArSLXFtEq3jdW+53
	/YCLoONkGyIFxbZUSjshJ+BnNNGLYxhncqvgyi5NgGvoAbiF0FEpBDSEYujzlqH+MyS/YIu7uLZMZ
	Spn5aN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74Sa-00000008vCD-3GIb;
	Sat, 02 Nov 2024 03:05:56 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t74Qt-00000008v0e-0N7G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 03:04:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ANBeQg3BIZC2MxnhvEH4gAK8e61+0m9Yr8bFK4R/WhA=;
	b=cEGfSccsODcmEk9CfsTGs+7qzKJsdowUgKk3yHE6TbswYJQK+LWTLl2bjaUEWC
	HRuvDiNhmmhNcN8H7Jdt5eiOPS+lPw59MapV+SMuxuJj/0+X4tDG3voUt48AvXFU
	xh3iGWkf6Rptzsbsm8Z2tlsU8xHQ/EBS7ApOYWbqIublk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBHk_2VliVn_Lh1AQ--.14550S3;
	Sat, 02 Nov 2024 11:03:51 +0800 (CST)
Date: Sat, 2 Nov 2024 11:03:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx8m[mp]-verdin: Fix SD
 regulator startup delay
Message-ID: <ZyWWlA7sGuhg0rJw@dragon>
References: <20241024130651.49718-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024130651.49718-1-francesco@dolcini.it>
X-CM-TRANSID: Mc8vCgBHk_2VliVn_Lh1AQ--.14550S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxtxhDUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh2KZWck2JnQywABso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_200411_508543_D2FFC9AB 
X-CRM114-Status: UNSURE (   7.99  )
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

On Thu, Oct 24, 2024 at 03:06:49PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The power switch used to power the SD card interface might have
> more than 2ms turn-on time, increase the startup delay to 20ms to
> prevent failures.
> 
> Francesco Dolcini (2):
>   arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
>   arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay

Applied both, thanks!


