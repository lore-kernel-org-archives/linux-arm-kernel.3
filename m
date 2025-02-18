Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5F8C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 06:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r51NZJyM932DUUX3KUZoKs91XCO6S2lEq75YZIvO/ug=; b=Cx14KwToSLLpr4dwgRVGsKELnw
	gVi9as36tcKsDzCXiPRc2NeflcjunftZIp28Rtdt2ItpUAGl8rbgE2ot3oS94mB54kED7Chz6Tu3o
	F2EXwU7NbCGO2tbZLjRr+snSeHGOK28wFk70QjjGXX375tpWPqTd7vUc2LoWiKcFegxNU7SUt3nB8
	YYZjWCwYV4qB1AaSRzEiMZ1gMmvWh8+8l3/1HgkSC56dNx7SXvJq/CzAmm/8wZpqBCBFIDv1WyaDh
	6HB9orDD1XF5qVEIz2ubIYZHjps7Ct9YO10jL+FsprFG9S3tHbd5u5ujrrx6SrIH318tTpwblYdHX
	CfB1EQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkH0Y-00000006yJA-0bp3;
	Tue, 18 Feb 2025 06:23:02 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGyv-00000006y5x-0MAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 06:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=r51NZJyM932DUUX3KUZoKs91XCO6S2lEq75YZIvO/ug=;
	b=XrHC4xvq1nhQsM6JiwiQ6eiZVYe6wh9M1+/GhpkdU705ElP6eQIApCwPG09TBT
	lUsDAd4R4DLFgC+HUSIfNaarwEXmuks5cNgnXMQ5+rLQ9fpJaaP6EbeBRkoz/45+
	u5W0lCGFQC0bu/lK/jVlMYcF3Au5OIox4BP4G3w5fHFdg=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXOVXEJrRnVhA3CQ--.18612S3;
	Tue, 18 Feb 2025 14:20:53 +0800 (CST)
Date: Tue, 18 Feb 2025 14:20:51 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply
Message-ID: <Z7Qmw51J0Dc3a88d@dragon>
References: <20250107150310.996683-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107150310.996683-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgDXOVXEJrRnVhA3CQ--.18612S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU3oGQUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhj3ZWe0E1YVmgADsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_222121_439763_80D2A4FE 
X-CRM114-Status: UNSURE (   7.81  )
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

On Tue, Jan 07, 2025 at 04:03:09PM +0100, Alexander Stein wrote:
> eMMC is supplied by BUCK5 rail. Use the actual regulator instead of
> a virtual fixed regulator.
> 
> Fixes: 418d1d840e421 ("arm64: dts: freescale: add initial device tree for TQMa8MPQL with i.MX8MP")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


