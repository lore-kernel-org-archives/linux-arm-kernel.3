Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B747C83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 01:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWLaBlCVDMaG0LM+7ESP1e8rEdQZfK6CkV/TbehX7h0=; b=1xK8tVEPPfElVb76AOqgM8aBXt
	G7BWLGcJW89skuuEA/p2uaqy9z79BH0b7ihskPldAn2xFKlJ/PcRfyUSmtrhS4Lf1L/sSCQFN0TFr
	IkdIQBGasFx92QA5zBQC7ZqIs+JG0f9/Hpth5D003zl2q3PqWkzaJ642jGPTUM3bmNTXFWz9FLOL5
	ZmLrTA+3OOsGFKk9Jy1AhCGZ6tCSfrSqieGXsIBGXnC/LJQJBQx5z38kWU2rhcBRZpaZxeZ1epgK7
	VZLETq0ELWqKthO3yI094oaDzTSDNMSmP/QNk+mOxY5Eyz2kyW73zg3j2zkyrdA4FVvEPuGxuWbcU
	z6TjGUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ualkw-0000000HFTU-3MgL;
	Sun, 13 Jul 2025 01:43:54 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ualiW-0000000HFOV-0s16
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 01:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vWLaBlCVDMaG0LM+7ESP1e8rEdQZfK6CkV/TbehX7h0=;
	b=E3+8DopXZ90MyNE8JeJ19lNdg6CVVUoetjdwpPd9L5MZjFG3adC9dP5Hx0tY0q
	mqSruYdstve+zKA5DZtiUVF9t2eDiElZhpvci6dwLphC5TkPnTHJrXhsCReJC5xo
	QDmGHIDG7uCK1IDf/rmEKygDU+9V6oHsoxM/rXs1YmD/c=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnP6enDnNoU2t5AA--.2390S3;
	Sun, 13 Jul 2025 09:40:58 +0800 (CST)
Date: Sun, 13 Jul 2025 09:40:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 13/13] arm64: dts: imx8q: add camera ov5640 support
 for imx8qm-mek and imx8qxp-mek
Message-ID: <aHMOp7cjFDOrrA26@dragon>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com>
 <aHC7wm98PlShUqWk@dragon>
 <aHEkNZPfVw2drb4p@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHEkNZPfVw2drb4p@lizhi-Precision-Tower-5810>
X-CM-TRANSID: M88vCgDnP6enDnNoU2t5AA--.2390S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUe5rcDUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgqkCmhzDqpVRwAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_184124_589792_3144CEC6 
X-CRM114-Status: UNSURE (   7.11  )
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

On Fri, Jul 11, 2025 at 10:48:51AM -0400, Frank Li wrote:
> > > +	ov5640_mipi_0: camera@3c {
> > > +		compatible = "ovti,ov5640";
> > > +		reg = <0x3c>;
> > > +		clocks = <&xtal24m>;
> > > +		clock-names = "xclk";
> > > +		pinctrl-0 = <&pinctrl_mipi_csi0>;
> > > +		pinctrl-names = "default";
> > > +		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
> > > +		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
> > > +		AVDD-supply = <&reg_2v8>;
> > > +		DVDD-supply = <&reg_1v5>;
> > > +		DOVDD-supply = <&reg_1v8>;
> > > +		status = "okay";
> >
> > Unnecessary "okay" status?
> 
> Yes, Do you need me to resend?

I fixed it up and applied.

Shawn


