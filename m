Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C7BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJT4xsqbCeKyk7dx2NmpkzCo8Yb5OL/Hrsp+1j5RBYs=; b=rvjXvMQ/LakSBMy8O+5JyWSeLV
	kb6wDoWeCgFww85nrNIirGWTaFy1HKBsEWL8KfjsRLMFvYSe9+WUMCKUP34xzAZvKIYgptw3E/EIJ
	cxN+uQO+nvm4qv4hqs/EDQFVEPC5Si50XlCYn3RRTuv9K9BsY65U5tMRTiR81Of5CzlurCQ6IU2m1
	cjYWbZlg6TOkrQH53sMSOAPN/QEvWPKNiUKL4csQn5eZjztn63r9P9mBE/FZvmD0/n0S52zyj+cvH
	1xc1D7rLIAhf8Q5EtZc/+ZMHUsaBt4gJPTNqiQ4Z/dm5GvRXfozDv+GQqI9Iez/O2nVfszKQpizZS
	n4GjqOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trocJ-00000004MK6-2CFm;
	Tue, 11 Mar 2025 01:41:11 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troae-00000004M93-3bVG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:39:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VJT4xsqbCeKyk7dx2NmpkzCo8Yb5OL/Hrsp+1j5RBYs=;
	b=O8Iu6ebBGznucoDxC+RfhL7A/nGyaoT5hck34WWzMoW1onI5FYl7g5NiF746J/
	N5u/1QGZY9Zo3xcmxvwI5uph9f5XMBH1TKcCkJ/kmU4Xg2qY/0c70+cq2mBhSnBa
	coN6uxisRc7hTlX1LziCcQNsBLPbsy4grYM2ZiULjj7o8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3H27uk89ng7SzAA--.51122S3;
	Tue, 11 Mar 2025 09:37:52 +0800 (CST)
Date: Tue, 11 Mar 2025 09:37:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/6] arm64: dts: freescale: imx8mp-skov: switch to
 nominal drive mode
Message-ID: <Z8+T7sdtIsvkJ1i2@dragon>
References: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-imx8m-clk-v4-0-b7697dc2dcd0@pengutronix.de>
X-CM-TRANSID: Ms8vCgD3H27uk89ng7SzAA--.51122S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVNeODUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEh0NZWfPVKmw0gAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_183929_216940_3A308CDE 
X-CRM114-Status: UNSURE (   6.39  )
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

On Tue, Feb 18, 2025 at 07:26:40PM +0100, Ahmad Fatoum wrote:
> Ahmad Fatoum (6):
>       dt-bindings: clock: imx8m: document nominal/overdrive properties
>       arm64: dts: imx8mp: Add optional nominal drive mode DTSI
>       arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
>       arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
>       arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode

Applied 4 DTS changes, thanks!

>       clk: imx8mp: inform CCF of maximum frequency of clocks


