Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2F5CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxESBsBcOxfIXhfEgZgU6ibboT4Rgframa1w/vi5IdE=; b=iFdeqrsk7avi61Kw3zaBTYw+li
	OYY+9onB07kA0cMhK6iR/CIccd9elyjvEh6k/mO9SJR4Ih5iFaCxiNlCI9PWzsv9KQ2lGtOzE+25d
	ZbvTRqfxiYh8KmTBemW7+APQ40r8t/b0bqoAOUNgBhcwplFKImSizP+i8Nyta6NmSCnUKiRf90zNU
	NzStrIOF/Tr3vFg9PwYKFFdYwjB92+5nynhma0tfSC4fllfu/R0HnGECNcXLD591SO6unlqcoPsLu
	qyAV7sVn/3IjHSGT6H+4hjO1fjg3qc2qPcInXNzZaqXkXb03esS+PvCVDDjCXuMw+kyIdKGnhhA28
	TDzHv7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEzp-0000000Gw2k-0AOP;
	Thu, 15 Oct 2026 06:31:21 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEzk-0000000Gw1j-2Nbl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 06:31:20 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6B3EA1FAE5;
	Thu, 15 Oct 2026 08:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792045870;
	bh=HxESBsBcOxfIXhfEgZgU6ibboT4Rgframa1w/vi5IdE=; h=From:To:Subject;
	b=zzQuVjTIDnlKGOVfK6vm4rVXgCh5moV/gqYTfDabv86bGMpRNP4ZJkj5ZqNHA079n
	 rVCKfmhb2JYJhimweFdfdC4bAhRB+OMjW+U0f3YzgAtliHKpMQTOavGvMJjKiy3Gue
	 9j+lrelQA3LfwygkQ0qcS5yPJgKA+w+0Lg5N85tqzkw5xI0opeMFxiLtsq0qTmaRvK
	 yQMtpeL20zCmEReNzv486ii7N7qNyZEzYgJC7EXuUwwZ7qsO1zMI/14cw3gvEYfwcX
	 Jiz8PaRUNneymfFB0Rn9UOSmQDod3q6HoRUXXhgAno6eUqfeYfcIg0yi2ZLHJxd0kf
	 kxrxPARlvXS1Q==
Date: Thu, 15 Oct 2026 08:31:05 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>, Liu Ying <victor.liu@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <20261015063105.GA5720@francesco-nb>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <as-JyQG5vgaPYLeH@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as-JyQG5vgaPYLeH@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_233117_510818_3040FAE0 
X-CRM114-Status: GOOD (  12.78  )
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

Hello Liu,

On Wed, Oct 14, 2026 at 08:55:21AM -0500, Frank Li wrote:
> On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:

[...]

> > diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> > new file mode 100644
> > index 0000000000000..e94fbc6eae07d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8-ss-dc0.dtsi
> ...
> > +
> > +	dc0_pc: pixel-combiner@56020000 {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		reg = <0x56020000 0x10000>;
> 
> reg should be first property, check others, you can use
> 
> https://github.com/lznuaa/dt-format/

We have a tool in the Linux tree, ./scripts/dtc/dt-check-style,
I would advise to use it and improve it if needed.

Documentation/devicetree/bindings/dts-coding-style.rst is the reference
document.

Francesco


