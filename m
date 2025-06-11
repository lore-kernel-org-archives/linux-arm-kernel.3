Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A4AC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 08:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9+jn47auQ8C9viZG2l85GSY3kGgdeG6PFjEMxhDHHU=; b=a6eBc0Kx488Mit0o0aXZqPvihl
	NjThvUqVv3y7zFxIonfTDxc33fmmD6k9YwdyC4krVQ9i4v1zBbJpGdFgnjfHG1jAKDgFuvPMaW/+Z
	bZ7lIw13N6lalWimm6bOmV25j2IE+sgJMqEHx4lifqOEwBNDSw496LPQ5lCuOZevU0W5kpghyuVLT
	8HafpyNtGIQk3O3cm4xNH5zkgoEGDesnsJPBZVQakQHn0cbITdUIplb28sBwNhat0Wxajlj/bHVvH
	1DtsSiMU3YNGzfpdWX6SPgOZuf65snHrLXcrH3ilzV+BMsPsNdnMArFs+Uuxk+04ZDe0CD4vhYR4U
	e50vLkkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGW8-00000009Dgc-3v8d;
	Wed, 11 Jun 2025 08:09:04 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPFSK-000000093t3-3vEF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 07:01:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90F2C1485657;
	Wed, 11 Jun 2025 09:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1749625258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y9+jn47auQ8C9viZG2l85GSY3kGgdeG6PFjEMxhDHHU=;
	b=eQx2s46SHQCZ0jYl8XxIcc+yhUFyAF0jkOaw9RpQ0IBXzyKuKkHuo3Wa4E+Jhsw8yDZs2F
	n44T2u0fL6S1PDj072QY5sywdaYuL4nvzeO/6cbJPdcjdFh2ik+0ZOYdkyOG+ctPqpukS4
	ATXTH8/mkxkfKZGFch4xvNbmKCX5gJ5nVGm/4vd1k4J1Jlb9WK/Z8/Ub92BOVx7IsPcc0q
	vOqRMogCAoQPEkpzdBe9QMb0zXr7fR8s9KsiXQ3tY2RTassBnOptivN1X1eJGwrn1HP+1q
	nZCxQI+eajprNS5pMgEXFnL2LWQu24GCojcK9voBxIux+aWbz3+Gd7v5ISPRAw==
Date: Wed, 11 Jun 2025 09:00:51 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Alexander Dahl <ada@thorsis.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes
Message-ID: <20250611-unread-other-a559c3b98494@thorsis.com>
Mail-Followup-To: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20250610060756.8212-1-ada@thorsis.com>
 <aEhQfvmJMf/SyGmK@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEhQfvmJMf/SyGmK@lizhi-Precision-Tower-5810>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_000105_437356_6A21AB75 
X-CRM114-Status: GOOD (  18.60  )
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

Hello Frank,

thanks for reviewing.

Am Tue, Jun 10, 2025 at 11:34:22AM -0400 schrieb Frank Li:
> On Tue, Jun 10, 2025 at 08:07:56AM +0200, Alexander Dahl wrote:
> > The i.MX 8DualXLite/8SoloXLite has a different connectivity memory map
> > than the generic i.MX8 has.  One conflicting resource is usb, where the
> > imx8dxl has a second usb2 phy @5b110000, while the generic imx8 dtsi has
> > one usb2 phy and one usb3 phy, and the usb3otg @5b110000.  When
> > including both imx8dxl-ss-conn.dtsi and imx8-ss-conn.dtsi as done in
> > imx8dxl.dtsi this leads to a duplicate unit-address warning.
> >
> > The usb3otg node was introduced after the initial imx8dxl support with
> > commit a8bd7f155126 ("arm64: dts: imx8qxp: add cadence usb3 support")
> > and since then leads to warnings like this (when building with ptxdist):
> >
> >     CPP generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
> >     DTC generic/platform-v8a/packages/linux-6.12/boot/imx8dxl-evk.dtb
> >     /home/adahl/Work/bsp/thorsis/generic/platform-v8a/build-target/linux-6.12/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
> 
> why linux-6.12? maybe just your directory name. trim down
> "generic/platform-v8a/build-target/linux-6.12/" just keep kernel's related
> patch here.

Yes, just my directory name.  Sorry about that.
Same happens when building recent v6.16-rc1 or master.

> what command do you use? I have not met this warning.

This is ptxdist [1] building dtb files with its own recipe, not going
through kernel's make dtbs.  I could reproduce it on a clean kernel
tree however like this (with PATH and ARCH=arm64 set):

    make defconfig
    make W=2 dtbs

Output (stripped) is this in that case:

      DTC     arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
    …/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi:148.24-182.4: Warning (unique_unit_address): /bus@5b000000/usb@5b110000: duplicate unit-address (also used in node /bus@5b000000/usbphy@5b110000)
    …/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi:52.23-81.4: Warning (unique_unit_address): /bus@5f000000/pcie@5f010000: duplicate unit-address (also used in node /bus@5f000000/pcie-ep@5f010000)
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi:41.23-50.4
      also defined at …/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts:645.8-653.3

These warnings do not show up with W=1.

So why do I get this?  kernel build calls dtc with
-Wno-unique_unit_address or not depending on warning level.
ptxdist does not call dtc with that option, so those warnings are not
silenced (details for the curious at [2]).

Do we fix issues coming up with W=2?
If yes I would adapt the commit message and send a v2.

Greets
Alex

[1] https://www.ptxdist.org/
[2] https://git.pengutronix.de/cgit/ptxdist/tree/scripts/lib/ptxd_make_world_dtb.sh

