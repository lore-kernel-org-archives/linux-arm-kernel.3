Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E529C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 02:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynTyUmTRCgFTrUshSeCg3vb32qg0W3S4+Fy0XJ4c8bs=; b=MByXHNG3kOSPpvmByV1bHuNrNc
	kfqlnAzkZPn3okACzl+KhdJG6cNTE2VE+O10Qx/SVKQr2iQIlvY4qhSm95ENstGX/MNVi15sVtiGD
	aNViSBMXi7GdItIdbJx/IASEwaCg1sVcUXnbrpnshpHyG3mgkv5ia4D+S19B5UnRddDb03mR8o/31
	pmsqx0l0hbklgTmWDURjSx75j7y5JG+KPCU5BgomcbTNJ3Q01ygwTyXH2zFsH5TmIgyxX43Rln2kJ
	CBYipiIF+uKqrj7tRiGixsk70o1qpKoP8nbtg+uxMP6wshWdSF1DoMvBzwzA8zgm1yAg+CUs5F9/a
	DZloj5SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpW9-00000004ROu-1MVx;
	Tue, 11 Mar 2025 02:38:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trpUO-00000004RF7-2MIS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 02:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ynTyUmTRCgFTrUshSeCg3vb32qg0W3S4+Fy0XJ4c8bs=;
	b=lPnlQljQAhc8CzTGxTeVOX4ueEc/kN7y2BvyDQp4u5LvrdQPaN8hStqne9EMN2
	FUNpegP2C6hbrt+Xx5h/RZYg7fhsXJlYeumba48vBAHlwKtyylT4vRtopgPar/p4
	dNUQ4HkoEYQ0opeCu4j57BMGcDwLF7vIADn8JTjYMF1Cc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXFkPEoc9n2Xe0AA--.48983S3;
	Tue, 11 Mar 2025 10:36:54 +0800 (CST)
Date: Tue, 11 Mar 2025 10:36:52 +0800
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
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: im8mq: move dwc3 usb port under ports
Message-ID: <Z8+hxCxum9uTLGGC@dragon>
References: <20250224193308.407606-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224193308.407606-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgAXFkPEoc9n2Xe0AA--.48983S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4fGFy3XF1kAw15ZrykGrg_yoW3uFX_Aa
	17Wr1rur4DZFs7KF1jyFn7Aa4UK347J3srXryfXw1kXryIv3Z2kF45tr95ur1UGF40qF93
	Ar15JF10y39akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0rsqJUUUUU==
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgANZWfPVKnuuQAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_193704_910685_BA1B43E7 
X-CRM114-Status: UNSURE (   6.62  )
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

On Mon, Feb 24, 2025 at 02:33:07PM -0500, Frank Li wrote:
> Move port@0 and port@1 under ports to fix below DTB_CHECK warnings.
> 
> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: port@0:reg:0:0: 0 is less than the minimum of 1
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dtb: usb@38100000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'dr_mode', 'phy-names', 'phys', 'port@0', 'port@1', 'snps,parkmode-disable-ss-quirk' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied with a change on subject prefix, s/im8mq/im8mq-librem5, thanks!


