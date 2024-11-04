Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB6D132DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcWFSZr9JVwe+FnVkwIBv8XwNCVApdz75FRgbSIp5fM=; b=HMFgTYh6c7HYs5Q+8+8jsA8DQk
	l8/tu5g3TBlZLNV+F+z2z5AQ8USh00XYiFsfnzD4Uo25QhzuRvViiOH+nfWKHYWHFQIBKlQIdkbw+
	DXwngQj5YJ1mngK0AvSrx+YBptoTK4jD78bhy3PBZJFSE/9f0WlaumI99Sc1I9Q67zX49UyEb/D1H
	FRMgE4bWdnrVGBnhcsxRtx4f+Zr6Ilrx2A3EzV/OihjjkKC73QnXEUACvRXpn6tOvNX24FKiZznWW
	T/5nP1x9snACrjAJppCws+ICHpQI3hTMxgRD0kFJjdNizD3U4D2AhwuqD6zTPrUyywvCi5h5Ve9Ku
	U/20c9wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ybQ-0000000E8uJ-0ZoS;
	Mon, 04 Nov 2024 15:02:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yEo-0000000E59W-0exi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 14:39:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2DF31A42EB3;
	Mon,  4 Nov 2024 14:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B03C4CED1;
	Mon,  4 Nov 2024 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730731165;
	bh=uuNW8QkqgnaDeBYjYCEj/zDRiaDiB3NGiL194aT02nA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=cRn/+vtbSTam1Cs8Yl9oy23CvCJS08Zp0BZeig6G3nUi2Sm3Zl1DNOYMI+4ktZPVU
	 eT930TVQMEqK5Z4NG2OCjLFwh5S3Q7K7cpKWRFeKa+KhZc+KYE7ruVB8f+A1YQex3W
	 8G/qtAUPzZ9vLE63kJaYqThzf7mUqdGbIO4nRLCSOjNV7nZXteyaQWALOQOH0nF4YK
	 0LvPU5O5h23KF8+dR30UxrV7llNQNvdCfOpM4mvCDoDHs++qWBA4Yx+n5bWMr++b19
	 HVbS5pvttFfD2tlHSHnEHMbsxzU9kX2lCn7+N8t8icqFPq6EbjfZD8+JHurPSuurqM
	 a//QVvoJooYzw==
Date: Mon, 04 Nov 2024 08:39:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Tero Kristo <kristo@kernel.org>, linux-usb@vger.kernel.org, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Devarsh Thakkar <devarsht@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Felipe Balbi <balbi@kernel.org>, Hari Nagalla <hnagalla@ti.com>, 
 linux@ew.tq-group.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Nishanth Menon <nm@ti.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 linux-hardening@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
References: <cover.1730299760.git.matthias.schiffer@ew.tq-group.com>
Message-Id: <173072771143.3690742.7100697196468196200.robh@kernel.org>
Subject: Re: [PATCH 0/5] TQ-Systems TQMa62xx SoM and MBa62xx board
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_063926_500456_0AE3376B 
X-CRM114-Status: GOOD (  17.48  )
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


On Mon, 04 Nov 2024 10:47:23 +0100, Matthias Schiffer wrote:
> This adds Device Trees for out AM62x-based SoM TQMa62xx and its
> reference carrier board MBa62xx.
> 
> Two of the patches are adapted from the TI vendor repo ti-linux-kernel to
> add RemoteProc/RPMsg support for the R5F core. A similar patch has been
> submitted for mainline by TI themselves for the closely related AM62A SoC.
> 
> Not yet included are overlays to enable LVDS display output and MIPI-CSI
> camera input.
> 
> Devarsh Thakkar (1):
>   arm64: dts: ti: k3-am62: Add DM R5 ranges in cbass
> 
> Hari Nagalla (1):
>   arm64: dts: ti: k3-am62-wakeup: Add R5F device node
> 
> Matthias Schiffer (3):
>   dt-bindings: usb: dwc3: Allow connector in USB controller node
>   dt-bindings: arm: ti: Add compatible for AM625-based TQMa62xx SOM
>     family and carrier board
>   arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and MBa62xx carrier board
>     Device Trees
> 
>  .../devicetree/bindings/arm/ti/k3.yaml        |   7 +
>  .../devicetree/bindings/usb/snps,dwc3.yaml    |   6 +
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi    |  24 +
>  arch/arm64/boot/dts/ti/k3-am62.dtsi           |   8 +-
>  .../boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts | 917 ++++++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi | 346 +++++++
>  7 files changed, 1307 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dts
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
> 
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y ti/k3-am625-tqma62xx-mba62xx.dtb' for cover.1730299760.git.matthias.schiffer@ew.tq-group.com:

arch/arm64/boot/dts/ti/k3-am625-tqma62xx-mba62xx.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#






