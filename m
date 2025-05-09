Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCB5C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuQstWxJDXR/04PVLTbjP9qbMp3yZCsqLaieSEbXh9o=; b=XYKvgjxvk0uZG6gsUGwuNXbVBW
	gaJ7db2Ge6k6JADGegex1uqgCLs3bQjFniyBa/uGIc62nY8ivQ4dqWkuhTZ0zIwqWg8zmHxgi6H4w
	r+Z/Tv2x1IoiMBC2Po7H7HZrZ2XxWQ+4tkGAbGJVJuJ6tZ1hR/DpEM8teQyK0Btozsq7VpJmcgr0o
	L+PH0iVkDK1JwplqJF1T+PB2xJEHr0+bOE75/nf7m0mxGV4IU9iRCqcmDBUKdt4xw9jn3PAkC55Wm
	1Qts8KPvzWfGPHFtndBx2Bakfac2XsKt3IvdDfwm3hsB067eYOhpnczOX7Tg2d4jxuU5zZjngTru8
	IbTKRquw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU81-00000004jKO-0IDB;
	Fri, 09 May 2025 20:15:29 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP4h-00000003zl8-3Y4d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YuQstWxJDXR/04PVLTbjP9qbMp3yZCsqLaieSEbXh9o=;
	b=ANF7p8rNE2VTcGJHz/ZlduVP9KN3auIwL60liLPmQLodnIBzBxcx4nTgpNN4Hu
	FTMWfjc7/1lb/SH3e/Vkse2sbu3y1OdSKxb6CKXcMnXRKA6xNNx61Zl/zWfWqkLE
	q1eCqk++4HmdwdXB7cW95QOZlmJdbTxdC0aelboymgDp8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXTxNyFh5odDutAA--.16540S3;
	Fri, 09 May 2025 22:51:32 +0800 (CST)
Date: Fri, 9 May 2025 22:51:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] bindings: arm: fsl: Add PHYTEC
 phyBOARD-Nash-i.MX93 board
Message-ID: <aB4Wcr0WtASkP0la@dragon>
References: <20250505075107.2579801-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505075107.2579801-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgDXTxNyFh5odDutAA--.16540S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBREqWgeFnS9gAAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_075144_205882_9D1DCA1B 
X-CRM114-Status: UNSURE (   8.31  )
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

On Mon, May 05, 2025 at 09:51:06AM +0200, Primoz Fiser wrote:
> Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
> the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).
> 
> Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
> be able to add additional board based on the phyCORE-i.MX93 SoM.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied both, thanks!


