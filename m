Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A95C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jL3UrAs4Pzh8kulwSxN4uC93Iezx2+kJVwgk+0EkKw=; b=Uqp+vKKSLZAYoFPUSr9ql7PzA8
	rknpg1KoyobfvCoCzmE+NpgWw1HvmuDEuH2NMMtoCcjur7Qv7LN7x0CQvPXESn/NtnN3DTL323nJs
	CKs5j8o5qcY7CCcdos509f2xqX0lhfiYdPEouqJlJZq1yz/VO/Ep+vwmkBIzkHPUdZICAuKlFlpJ8
	x9ogVylQL5SuzlrPbmB0e3lotMaLO41ZLh4tS89xSPiiSd6jsQDfrxiBxZtx2OVgBLbe/3dw17juG
	DISl6Ugkm4ALgi1EWuM6HOGEhJHtOx9Iwtdmf+ekYn8d2ONygEeK/uab8GFPgnzpsYFh/NdIWBFyl
	tolgxKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6fz-0000000Bygc-4C2e;
	Thu, 19 Jun 2025 04:15:00 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6Vu-0000000Bxa4-232C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:04:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9jL3UrAs4Pzh8kulwSxN4uC93Iezx2+kJVwgk+0EkKw=;
	b=bSShQE55tirU3sipXpiYeBLELSwKyTdAktdIeB5Ju68r2tne88Yk3mvskCIpQe
	HaLjME3x4OYb9HAHv3p5Sog2wQltkjwVHUSM5K0shcFeGUdLE7NdLhmi6nUsGiIl
	0sxO22PUZx64GHwecIFZYm772I4O74C7b/1xl/FcsfCPQ=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjlE_jFNomST8AA--.27276S3;
	Thu, 19 Jun 2025 12:04:17 +0800 (CST)
Date: Thu, 19 Jun 2025 12:04:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v7 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Display
Message-ID: <aFOMP+eFULDDAtOr@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-7-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-7-a8f0195420aa@gocontroll.com>
X-CM-TRANSID: Mc8vCgBnjlE_jFNomST8AA--.27276S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7sqXDUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgtxZWhThWMa0QAAsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_210434_867280_B4E176DA 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, May 20, 2025 at 08:34:56AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> comes with a 10.1 1280x720 display with a touchscreen (not working in
> mainline).
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


