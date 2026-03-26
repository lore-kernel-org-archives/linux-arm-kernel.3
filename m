Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8951210A3D96
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjFhihNQXqVvaS3yrIRsjhwMKylGgdbEHwpl/RezACY=; b=bUPpbBHU4Mc7WT6ZDwKDG7hKS+
	TWldNZrRphhd3YRsnexpRA2/C4l9Avk3JDTU4hYoHLekIqHADMywuLlQrVsZeX2hUzPON1FpCD8gN
	GJSBgXoACYiDLM4T2m9rwGEjoqxTIhEAx1pCC99I58Vjg1toEE9Q9S22IJBD8DNqK82fEvn7kcw79
	d0dsjmfnG8643i1Kwmws8qQ1M2kkLeUl9cNRp/udOWzCU4bGzGeoWgO9EXb2K/1mlUsQEYt4szxPN
	MkhckpJclGiPPukkEFKjGoIhzKpypsHkrxBlt/grvlypUO1DdH9sRdlf21OPOo2ottrs7OQx1txcV
	6bmtZ4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mJ8-00000005iLN-2G4H;
	Thu, 26 Mar 2026 15:07:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mJ5-00000005iKi-03MA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DjFhihNQXqVvaS3yrIRsjhwMKylGgdbEHwpl/RezACY=; b=jBwPy/JMyqbXw1QFp6IaqaQEc2
	bWW9fpWpXm545sborXC3of8i8MKsUHrkJOuqHEi6Iwa0Vfu/6ve6+FvgeEm+t7dOpxI/3dpcAy5GW
	okIbuXyklAfD25rlOA6GZKUYhyEDDT5htKEwSgJLSJw9LcyFgaJQQuPj+qVAvqBo8DCQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w5mIz-00DUw2-OE; Thu, 26 Mar 2026 16:07:29 +0100
Date: Thu, 26 Mar 2026 16:07:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] arm64: dts: imx93-11x11-evk: remove unused
 property clock-frequency from mdio node
Message-ID: <b247f1d3-8e2b-4320-a66d-5e6cb0591369@lunn.ch>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
 <20260326-b4-imx91-qsb-dts-v2-3-b991b81639e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-3-b991b81639e6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_080735_050691_2D08A59F 
X-CRM114-Status: UNSURE (   7.61  )
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

On Thu, Mar 26, 2026 at 03:51:39PM +0800, Joy Zou wrote:
> The clock-frequency property is not implemented. Remove it to clean up the
> device tree.
> 
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

