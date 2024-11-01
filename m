Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEA6D5CC99
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD3ToTjQf4BqeyTCfHtwZ8RgkZVabkJNf3RDZfdMhXI=; b=y5lqDvyiW5/eku1MLiHVQv6DfE
	89JxNDyTwXvWsu3e60WpuqWWX3J5OYTG2Zb9jPVJ+Tl/YlcDH2/YMpIamFx0qGrsYP9jbGUpmeEen
	NaxC9aSPBJIH9sS6hg6DRHPBv7rZBO/syaBCny+cXut6lkp5KpJlw6det6ZXZe6o1No2W8VXVn0ce
	i7jOFjiz/pih4cj6aUaa88PMlpYezU0QcQjNLHMX4vi/Nd8tl9zvhxgB02PgktfI675Z65o1CFoGi
	+5H9mkVuVDl/ypHQvzQ1QYAsnYdgeOzbx6rbSr10+5sgc0Sf1s8UdOMEHEf2uB+usdlaP17qmUg46
	DWhxU//g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPS-00000006TJn-3m8C;
	Fri, 01 Nov 2024 09:57:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oNl-00000006T4Q-3GPv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=fD3ToTjQf4BqeyTCfHtwZ8RgkZVabkJNf3RDZfdMhXI=;
	b=DIUCuVzObRcn55/bgNdO5lV3W+fQPBj8gf7ig2mHznWlQhyJ3tjJ9eypWVMUjg
	u81wid9DJrVfSV3OV1/KTp7/TLPlhq24KGIFrGYyX+oSI3dO0LRIBBiQlKd79zfi
	tND3QrQQshxTXoHGVfjxDqhBiySb7WY6DggSQR010gPVw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXXy9cpSRnohlpAQ--.37559S3;
	Fri, 01 Nov 2024 17:54:38 +0800 (CST)
Date: Fri, 1 Nov 2024 17:54:36 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Bhavin Sharma <bhavin.sharma@siliconsignals.io>
Cc: shawnguo@kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Add support Boundary Device Nitrogen8MP Universal
 SMARC Carrier Board
Message-ID: <ZySlXDDG7jRxl0n9@dragon>
References: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023091231.10050-1-bhavin.sharma@siliconsignals.io>
X-CM-TRANSID: Ms8vCgDXXy9cpSRnohlpAQ--.37559S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4VWlDUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhqKZWckfBh4iAABsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025554_155956_674F401D 
X-CRM114-Status: UNSURE (   9.60  )
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

On Wed, Oct 23, 2024 at 02:41:13PM +0530, Bhavin Sharma wrote:
> Add initial support for Nitrogen8MP Universal SMARC Carrier Board with
> Nitrogen8MP SMARC System on Module.
> 
> Change in V2:
> 
> in patch 1/2:
>         - Drop Unneeded line
>         - Correct the indentation
> 
> in patch 2/2:
>         - Add Acked-by tag
> 
> CHange in V3:
> 
> in patch 1/2:
> 	- In version 2, I forgot to add the Makefile. Adding it now.
> 
> Bhavin Sharma (2):
>   arm64: dts: imx8mp: Add Boundary Device Nitrogen8MP Universal SMARC
>     Carrier Board
>   dt-bindings: arm: fsl: Add Boundary Device Nitrogen8MP Universal SMARC
>     Carrier Board

Applied both, thanks!


