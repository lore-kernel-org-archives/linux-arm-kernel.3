Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62361C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6EkHZ6uoB2xHmNiBXZ1kh3u+YSfhV8TuHSXfN/u3xAQ=; b=MGydVnTIEgePkgTlS1MxRRISyO
	t9KcVrXuYH/ngViVd1i88175GbNaFZH9NsT1Ks13pOO7kDWRAOz5tHyLKLkdcB6vsqEzeBa9Kzy0W
	Z9XzIujFibCc3MMUAL6L8w+Ct8QgtmFeZx25M80M8+UULo1cPCzmIAuzWufykAEBEIx1ZFfK3Wu/L
	2iRpsrM8gVF1VnKtFY2mibA/RQFSm5boHFr8lVlh83nP4+raJjSQG/UMHXCiAZzxtYVXANkUATcuo
	k42sOJ8+X66qrhpzXKiY4cTWMa+Kzh/pCvMe7W1I9L41X7xKOuP/qjSNXD2ZtYebTXGABl42yb1FJ
	mTIWRBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU80-00000004jK7-02RZ;
	Fri, 09 May 2025 20:15:28 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOwe-00000003yN4-3Rvz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=6EkHZ6uoB2xHmNiBXZ1kh3u+YSfhV8TuHSXfN/u3xAQ=;
	b=V0d6960n3JUBSgaFAneLnUf6NWJU+XxTBr84bDIiZfFivT+rAU4oWpEwuW6ABd
	MGNCgLJS+TDcLEbCtiC3D8lpUKfRtDvKD3e6aCfn3keTrBrosq57oyHKyCbYrcBb
	8UOTwWx4hh9yfzmfHQSiaDbUsgiVEm9JU4LX3Ul16Q5ME=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXnytmFB5oWHWqAA--.62630S3;
	Fri, 09 May 2025 22:42:48 +0800 (CST)
Date: Fri, 9 May 2025 22:42:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] arm64: dts: freescale: imx8mp-toradex-smarc: add
 fan, ec, gpio
Message-ID: <aB4UZZgSSsLIg3qv@dragon>
References: <20250430094151.98079-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
X-CM-TRANSID: Mc8vCgDXnytmFB5oWHWqAA--.62630S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOzuWUUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQVIZWgd+-h1qQAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_074325_242273_1DEBAE41 
X-CRM114-Status: UNSURE (   6.60  )
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

On Wed, Apr 30, 2025 at 11:41:46AM +0200, Francesco Dolcini wrote:
> Emanuele Ghidoli (2):
>   arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
>   arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander
> 
> Francesco Dolcini (3):
>   arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
>   arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node
>     name
>   arm64: defconfig: Add Toradex Embedded Controller config

Applied all, thanks!


