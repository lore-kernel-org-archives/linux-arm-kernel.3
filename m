Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4567C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 01:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Id22/7tm+Zaocd+//weofrSOLUTaguDbJHut8xcfyCY=; b=35BflsVCMd24JUD6ofFmLjvD+c
	M0H0wiL1AVZkeF3O9OAed89GRM0HCN+QklFHbx/c/u7FhojPEjjOxuVf3yZVhv3t4X8Fv4b8pdGqc
	nARQ9OwDpQURn252OVQ93/kXABMLUDM6TvO2pNl9VNNDXRo152jPtV6BrgM8fRvARhRDuLLoU/I6q
	YEpTOTc0pGLbzQLE+qeHFIey7P9qvQObNs+k41PV1iwHh8AKO8p9IN+e21pUTY5u3cEfdiZIwmgoH
	KDsVCRkJaTdAnv9V+J7kou+TnLdEZQ9GMuza/s+OKpEYusIEuA4K6tN0qzOU2GBPEEccCgsOHdNhL
	v0nmlJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88JT-0000000Fjgh-2pjA;
	Fri, 25 Apr 2025 01:57:11 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88Hb-0000000FjV3-32zl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 01:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Id22/7tm+Zaocd+//weofrSOLUTaguDbJHut8xcfyCY=;
	b=XK7jsiJcvUalXjrajYdMc3nboZ3OB4yi1na1bZ64d+AI78qWdVfWuZoJYPl886
	bGl2ZaxaQDVqJxNOXsDYxtdadTdJb0OtiIhzvaAIG5Na7AkXAyElEQsuhuZCJgyq
	AZVGph5nnNaSuP91oopBWGh5nMK8tdHpI/z5hi8i/uwAA=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHBNNs6wpoRjTaAw--.27963S3;
	Fri, 25 Apr 2025 09:54:54 +0800 (CST)
Date: Fri, 25 Apr 2025 09:54:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Vitor Soares <ivitro@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add support for Toradex SMARC i.MX8MP
Message-ID: <aArrbFZxJKRJ1vCT@dragon>
References: <20250414123827.428339-1-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414123827.428339-1-ivitro@gmail.com>
X-CM-TRANSID: Mc8vCgAHBNNs6wpoRjTaAw--.27963S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyxJry5KryDJw1xur18Grg_yoW3Krc_Ka
	n3GrykArZrJF47GanIk3WSvrZYkay2yF13t34kZr1SyrWkCF93JFykKw18Aw1fWFy5XF1r
	A3sxAws5ZrW7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0RWlDUUUUU==
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCws6ZWgKsODTPwAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_185516_076240_36288A83 
X-CRM114-Status: GOOD (  12.34  )
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

On Mon, Apr 14, 2025 at 01:38:25PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds support for the new Toradex SMARC i.MX8MP
> System-on-Module (SoM) and its Development carrier board.
> 
> More information on the SoM and carrier board can be found here:
> https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx-8m-plus
> https://www.toradex.com/products/carrier-board/smarc-development-board-kit
> 
> Changes in v2:
>  - Move the Makefile rule to the proper place. (Daniel Baluta)
>  - Remove the dsp_reserved node, it is already disabled in imx8mp.dtsi
>  - Add Acked-by from Conor Dooley
> 
> Vitor Soares (2):
>   dt-bindings: arm: fsl: add Toradex SMARC iMX8MP SoM and carrier
>   arm64: dts: freescale: add Toradex SMARC iMX8MP

Applied both, thanks!


