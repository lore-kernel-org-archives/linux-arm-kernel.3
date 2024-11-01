Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EDFE6F070
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz0ryjT9mPDcej02Hk6SsCveNSUKvfeMX0qnfVx6BcQ=; b=quXcOK9JPz7FYWgOdWLmZJPxpZ
	qNAE5N1s4JtRmueLo8gcOZyG2QpaPqbJmjItNI/7g2PKQrjcE3g7JW2ZL7ugsu04vGEw0K5OZUV3z
	ACxSMX13znlwkuFvQs2M9CiKM9M6k2E1Yp2MYhE6VXNqDIHMc68xhK7l8vKNyI2ikVPuiZpwLNwf8
	+BcQHVI2V5zM7oBSXzsLAMgYO49xBy3/EizfSuFJQE6xrqkZ/fsXQiXuVyBl8LNdCitsL02e2LRki
	cWfMxGe/Es0GZ1A2FOyzAF5zVgOwPw8Ml8R23/fP+ZVE1bdvN9j2x+/ABv5f91Jgzjib2KcNbytRw
	heVk1Kzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uzE-00000007mED-0yKR;
	Fri, 01 Nov 2024 16:59:00 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uxW-00000007ldX-377A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:57:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=rz0ryjT9mPDcej02Hk6SsCveNSUKvfeMX0qnfVx6BcQ=; b=dHtuGpshL5PlID52fzj6TToJtB
	voL1NnNpNpigoGyWGbG1JIHgxlYkjHE07feIqQSWiFQ4TLqEjZANCHWP7+drN0m0hFsEj+uZDgYjG
	oEKIs4ZbmTlp6UGJkxopWOmAlJR7HcQHCVGUUi9/udSAE4H9vrcyFzgIRN6I1myLXajOjJ2erqw86
	2XOLj1Ua1l1Qrdm8sYu3Psp++nGNAY50w2oazW6cAkZvI7qLzhvWIGN+yhhZ7BVwzATWnRroG7Pqs
	k6MQJhLIEI3s0CWqFb+j+LLCAC4FAJU4Ih2eFUZVtKoMCWrg5nb47Kun60Q4qidMPojx16jEebAr+
	GtKgcKAA==;
Date: Fri, 1 Nov 2024 17:57:04 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] ARM: dts: add Kobo Clara 2E
Message-ID: <20241101175604.20bc5427@akphone>
In-Reply-To: <172986441097.1907834.7871985467741599221.robh@kernel.org>
References: <20241024142206.411336-1-andreas@kemnade.info>
	<172986441097.1907834.7871985467741599221.robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; aarch64-alpine-linux-musl)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_095714_823669_6B03C318 
X-CRM114-Status: GOOD (  15.60  )
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

On Fri, 25 Oct 2024 08:55:18 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Thu, 24 Oct 2024 16:22:03 +0200, Andreas Kemnade wrote:
> > Add a basic device tree for the Kobo Clara 2E Ebook reader.
> > It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
> > are not ready for mainline yet.
> > 
> > Changes in V2:
> > - improved commit message about devices without binding
> > 
> > Andreas Kemnade (3):
> >   dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
> >   ARM: dts: imx: Add devicetree for Kobo Clara 2E
> >   ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E
> > 
> >  .../devicetree/bindings/arm/fsl.yaml          |   8 +
> >  arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
> >  .../dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
> >  .../dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
> >  .../nxp/imx/imx6sll-kobo-clara2e-common.dtsi  | 514
> > ++++++++++++++++++ arch/arm/configs/imx_v6_v7_defconfig          |
> >  2 + 6 files changed, 572 insertions(+)
> >  create mode 100644
> > arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts create mode
> > 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts create
> > mode 100644
> > arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi
> > 
> > --
> > 2.39.5
> > 
> > 
> >   
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in
> this series.
> 
I think they all come from existing dtsi.

Regards,
Andreas

