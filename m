Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC8ECD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEt7eA3uP6JAyccJIcFiTdXELf0PynanwGq4vjPPSgE=; b=zwPkuiRMaLkM48z5E0bPc1ikJ9
	NQvPotkTwpQtbCxponnVjmcikAg/IgmMOi1KgRa5UH3YAiBxEgZa6JgBW1uEYYFitj8FwUBVVyix5
	+EWmtzXEjTsVty+n1l5sTo8KvtmC7EKn/9cNP090sDXZuKeT11pbTgrlA7Ea+o4SV9R1AcW+rUlXK
	PCITvnDKZITEm3fAjBt3kQ+263DJZmTVoMsoEJsNrB/7gOljpLXEdA0UEIgP3nCLLLRpfSXPfSFOG
	iw495j5vXTg/5dNowjEjDB9NdeceHe43AQ8DIuV/oGsL7GbjKHpIK4zBcvHMRV64Wx0J9MuuVPGpl
	r0eDXvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZB5-0000000EVvG-20pm;
	Sun, 16 Nov 2025 09:36:11 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZAx-0000000EVuw-1DcN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 09:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sEt7eA3uP6JAyccJIcFiTdXELf0PynanwGq4vjPPSgE=;
	b=IVc2HGu4fS3G946024aDdYz4IhPJuGR4emT5yUIUPd3KmRCS2wCIc/YXfnBQqo
	MwPOuy3Lrzpmc5sbROCW/OerDrMNJgUYJpmCHqKDN1TkRdfM8N4rj9MIs3fU++1o
	1aukII4O0epi64l+Ii968fOJd0SMswfxZyyX2SgkZ4+6c=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnAwPumhlpSzUWAg--.7823S3;
	Sun, 16 Nov 2025 17:35:43 +0800 (CST)
Date: Sun, 16 Nov 2025 17:35:41 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add PHYTEC
 phyBOARD-Segin-i.MX91 board
Message-ID: <aRma7QLJIplT_cck@dragon>
References: <20251028043244.496662-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028043244.496662-1-primoz.fiser@norik.com>
X-CM-TRANSID: M88vCgCnAwPumhlpSzUWAg--.7823S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUzSdyUUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhCD6GkZmvDOBwAA3K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_013603_717936_0FB7FEB5 
X-CRM114-Status: UNSURE (   6.24  )
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

On Tue, Oct 28, 2025 at 05:32:43AM +0100, Primoz Fiser wrote:
> Add device-tree bindings for PHYTEC phyBOARD-Segin-i.MX91 board based on
> the PHYTEC phyCORE-i.MX91 SoM (System-on-Module).
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied both, thanks!


