Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D1EC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKk5nHWGdylz6lko9xpOMyn5Y/E4mXiwt9y3ZARKnPw=; b=W7WKULKsn4m1oxF3mTOlEb5tvS
	L3f9TDvbnfqnYm6OJI2HaFUDr/JYS4v3FibM7AgnbUVkPB2WqqvM9ZVakraGFX2LmsIxyf8v0U4SD
	vUwfwCCaBgXY/pirWuYMyGcSvQcl7n0lnMIxosiyC6EQAza2x0KiGW4oOkA9KTcmLVSjfaHgnUopp
	1QCYyzbctF7a3FXN8I+w7PP42w9Qz5p6TW744PN9nwFM/a6V9rZOiT+GxPPG+1a11iXldN8usHc4y
	QKzLinqZ/8O+LUGct0IPI9VewogL/0OppiiNMRrt3nXdPmoKQfcrU4nR1blfB0kBqzwulWJKsqYHG
	Chcfsr6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3E0-00000004fI2-2SNV;
	Tue, 08 Jul 2025 07:58:48 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ29c-00000004USK-34XB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 06:50:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TKk5nHWGdylz6lko9xpOMyn5Y/E4mXiwt9y3ZARKnPw=;
	b=LBCwjU1SrEDmdsfnssxd18SMkm1w7CgeCoKxoloj46sCrGbsdmPmv0qiMjUMmL
	m8SUe6TLOW1piGGAyb39dletwHqrfVBkvNdjYF1kgrNR8bKkvKsNKHjs1c0FbDlm
	0yiyDPQ1McLPGQcGQvr7oyQfCfAC1QrqBnn1b1V/eFGVo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDXX_aKv2xo1nBMAA--.64566S3;
	Tue, 08 Jul 2025 14:49:48 +0800 (CST)
Date: Tue, 8 Jul 2025 14:49:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 0/4] Initial PHYTEC i.MX93 overlays
Message-ID: <aGy_ivfclZ_YXYui@dragon>
References: <20250708042206.329208-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708042206.329208-1-primoz.fiser@norik.com>
X-CM-TRANSID: Mc8vCgDXX_aKv2xo1nBMAA--.64566S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOmhFUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxOEZWhskC2smAAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_235014_157941_EDEC1AEF 
X-CRM114-Status: UNSURE (   5.92  )
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

On Tue, Jul 08, 2025 at 06:22:02AM +0200, Primoz Fiser wrote:
> Primoz Fiser (4):
>   arm64: dts: imx93-phycore-som: Add RPMsg overlay
>   arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
>   arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
>   arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay

Applied all, thanks!


