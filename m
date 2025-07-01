Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E92C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEnrDDcCW0+uNi7Li/7EBjKT/lB/N/YIH1Gam18Rgys=; b=w8iLNNnCbxcrxqaL9jN+/sRlNT
	MwzYjo/9vQZefOZmuZqovoIRJ7leG+x3+foL8Ll37dpwKHCZwJexlUUSD42KfU7FS9xI59aO2XJyC
	e/xq1mumSEQ3tQxcUkzledRt8oOwWJiS5BIDz8kWATPNtZt+FjxZ+VQkPQdqc7CjJqkmY91/yWA4l
	LJm11iMArHA8tj68pBpmQ+3iRCWk/ELufovBvxYmOuMsR9nk7bMXuho0oac7XJ7jH+/AN6YdS+fmU
	DNO52vW4dSxdDaEiLHnZtr2lo3/lsy6qPM6Ifz8vO3UvSRpwH4+G4mGqIVxXaqfD48flQlTgL9b2u
	+EHLAVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWc6a-00000005jMI-2EuY;
	Tue, 01 Jul 2025 14:37:04 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWagj-00000005RYX-1nTZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sEnrDDcCW0+uNi7Li/7EBjKT/lB/N/YIH1Gam18Rgys=;
	b=eZ07VeVYykK8lNUX1eBXrC/u3PXr/45h/URm8aa1PhSrcmLsoJDRgGWmGWoMHb
	jXDL4U0F0EwXNHekUBnBFb0gg/1c8+rAeBpWQUO+z3bL3KJoZVKeJOUskb8xlFx/
	Re94eKkN+NRJNicXXsWimzKC+EEcA+enODCIvQJ/y0tSM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHVuQ43WNo87YbAA--.10731S3;
	Tue, 01 Jul 2025 21:06:01 +0800 (CST)
Date: Tue, 1 Jul 2025 21:05:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phyboard-nash: Move ADC
 vref to SoM
Message-ID: <aGPdNy8Bn37XiOpy@dragon>
References: <20250602125207.2265222-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602125207.2265222-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgDHVuQ43WNo87YbAA--.10731S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xr15WF17tw47WryruF4xCrg_yoWxKFc_ua
	48WFWvyr1UJF4xua13GF12v3s3G3WUJrWxZr4fGrn3tr92yayxG3sYy345Jw47Xw4DArsI
	vF1rAa1rur1Y9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBp43Whj3TqWqAAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_060617_830552_78A5B932 
X-CRM114-Status: GOOD (  10.08  )
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

On Mon, Jun 02, 2025 at 02:52:07PM +0200, Primoz Fiser wrote:
> Move configuration for ADC voltage reference from board DTS to a SoM
> include file. The SoC ADC reference voltage is connected to a "VDDA_1V8"
> voltage node and supplied by the PMIC's BUCK5 regulator. The reference
> voltage is thus defined by the SoM and cannot be changed by the carrier
> board design and as such belongs into the SoM include file.
> 
> Moreover, with this in place, customers designing own carrier boards can
> simply include imx93-phycore-som.dtsi and enable adc1 in their own DTS
> without the need to define dummy ADC vref regulator themselves anymore.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!


