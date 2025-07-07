Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EDCC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7346OZHTuSrLm7WiDgkYI1AvDhjuIewBzgFjJ+P/eQs=; b=k+0UdvHMAQqBJ9iV94Y8dHVy7+
	G8hFTSLbWzuY60pR7BuE10dWvjWJD+3DVkx1BhCXD7LXpbS/lG8C2yhuw/VyrxLuaHPTLcpCAhIaG
	1ZOphTtu9/tix0lB+rWbpVJve7TrGKCA8vR1VVQXnSYxwfsrc8Zbx1xoUTsrU+hRpXFUn2fq8wyS+
	T1WMqQNhlTmPc/1Ul+EQ76MkOKcITn0bDn7c1QYJA+3TO+wn/XqC7H+6e3VGWSxqLZ2no6TzHJbX8
	sqS4SfD3oEdL+EI1ouz02Jy2H2S0TICMAhOqI6TbH3FL0tTHm23Xef6mUdcibi40DLYr2WWBw28BC
	hR7GDHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYh1D-00000001pXX-1eCZ;
	Mon, 07 Jul 2025 08:16:07 +0000
Received: from proxy25212.mail.163.com ([103.129.252.12] helo=proxy41132.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgQa-00000001iMN-14Or
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=7346OZHTuSrLm7WiDgkYI1AvDhjuIewBzgFjJ+P/eQs=;
	b=jJvp+wqEORUgf5bHI7laU///x9HXRZv0yPGdDonkb2PfI/m+wW2621MG6aroIJ
	Kr4+4P1HtNHIWtDcpf4AwEH5H5l8e/nEtXa1POqi+x82vT19GmWgjOezD2gS3oiQ
	fuKB6fl6IjvNJctcq+BxQgOBtYzmROYohhwbvKeTdst/E=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXX_YmeWtoME88AA--.37050S3;
	Mon, 07 Jul 2025 15:37:12 +0800 (CST)
Date: Mon, 7 Jul 2025 15:37:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Keep LDO5
 always on
Message-ID: <aGt5JoocafXbX1cX@dragon>
References: <20250623132545.111619-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623132545.111619-1-francesco@dolcini.it>
X-CM-TRANSID: Mc8vCgDXX_YmeWtoME88AA--.37050S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4rur4rAFWUXryftFyDGFg_yoWDtwc_CF
	ySqr4xWw1xGFWjy3yqkF4UZFW8Kas3tr97tayIgrZxJF9xZay3XFWktFn5ZrnxGanxur98
	Zw13t3saq3s7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAhdwmhreSi2IQAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_003816_567422_976D4E3F 
X-CRM114-Status: GOOD (  13.38  )
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

On Mon, Jun 23, 2025 at 03:25:45PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> LDO5 regulator is used to power the i.MX8MM NVCC_SD2 I/O supply, that is
> used for the SD2 card interface and also for some GPIOs.
> 
> When the SD card interface is not enabled the regulator subsystem could
> turn off this supply, since it is not used anywhere else, however this
> will also remove the power to some other GPIOs, for example one I/O that
> is used to power the ethernet phy, leading to a non working ethernet
> interface.
> 
> [   31.820515] On-module +V3.3_1.8_SD (LDO5): disabling
> [   31.821761] PMIC_USDHC_VSELECT: disabling
> [   32.764949] fec 30be0000.ethernet end0: Link is Down
> 
> Fix this keeping the LDO5 supply always on.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
> Fixes: f5aab0438ef1 ("regulator: pca9450: Fix enable register for LDO5")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!


