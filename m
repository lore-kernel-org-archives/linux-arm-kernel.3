Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F4DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 15:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr9E6bgj+FVra1H0FVQ1LPnUfFoxChUOCwxBKvYbs+0=; b=kJ//npabk4m2JlZWHwk3O7RZdE
	mCtvJf6bQALjNh5xV2uDdLU740ovh/svq+r/mWUc0yFwdWKYAmz52N1qRIMYMv9k44TCPAi8sRPWl
	X7GKBhEY5n0ED23urMXZ8rXxklUY+5f8vEr7rapn4h45pn+fQB8seHDgJ1PrwMdpK+Hq/YFF68y9c
	3sNgBraIZKCOupkpz7Wd56rUYqdxbYFDoNG1KsWe74bh2NNmMJNneHG+18hyp2TSt3vpbylwtp5l1
	yidRv16jTPGctjCAGedbY2xJj1nClh+bNU6j9ZhesCHSSTm2F4Wb82YeUNujtDgciu07oj10vGjLu
	9+5t2ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlr0n-00000008EB9-35KE;
	Sat, 22 Feb 2025 15:01:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqzK-00000008DtQ-06Hw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 15:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=lr9E6bgj+FVra1H0FVQ1LPnUfFoxChUOCwxBKvYbs+0=;
	b=Y4gQA153sXLHJXw5OAPbt5ep7sPGg527sh4tlG03czMimAa5U7wDIb42/JqLwN
	x5cvJWjeFjPc8PBZEsJTduIEnN3ccnwoNz2Er0Fk4F+Jrk3o0wA3g8UPVk9Z39eL
	O1j5lLTV7dJ6PgTqmfV5kCNp/cLo7Qmvm3qYUKOjMzsyo=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnSaFy5rlnUPC7CQ--.24012S3;
	Sat, 22 Feb 2025 23:00:04 +0800 (CST)
Date: Sat, 22 Feb 2025 23:00:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, hongxing.zhu@nxp.com
Subject: Re: [PATCH 5/5] arm64: dts: imx95: add ref clock for pcie nodes
Message-ID: <Z7nmckvKi1xcb4Qo@dragon>
References: <20250128211559.1582598-1-Frank.Li@nxp.com>
 <20250128211559.1582598-5-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128211559.1582598-5-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgAnSaFy5rlnUPC7CQ--.24012S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV2NtUUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBX7ZWe5p-zUGwAAsF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_070018_438886_49B78A4E 
X-CRM114-Status: UNSURE (   5.78  )
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

On Tue, Jan 28, 2025 at 04:15:59PM -0500, Frank Li wrote:
> Add "ref" clock for i.MX95's pcie and fix below CHECK_DTBS warnings:
> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
> 	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

#1 ~ #4 are applied and #5 doesn't apply.

Shawn


