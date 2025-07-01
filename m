Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907D6C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlOXn2QdKGfBXkKhkm4yPrNrC5aKO1sGXt2KBKxXjcA=; b=TLYcQcT62buQzzIbGhvHd9JaTS
	aUsCVT6aWt76elotbFkNykMd9NXqxyFTtxyd/Cp8nUn8P+Xtoa45lSooQf4sia+LAfv4cw4DFViib
	KvN37dNVrQ0oiW9LoEZNwC23o7AVynNNH0D77TxJQlQKavPG9RkXirS8aM04gc4U2VX3Saez4/Oh9
	ecTGplcJKmthuSmB7YX63ZsalYY0vJIvKKMH6IXb4jlqbyrlrkuMHNF8BJBdTXwK16ehFieotTlOc
	xBw/PFOTNGiffZRFKWeRjwMYKxZ3FXdA5Yz8jqN/m4tQJMvLaDA6Y44Ckmyh8PRl6LBJsnohbjwTW
	fsCZAkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcd1-00000005qHL-3uMC;
	Tue, 01 Jul 2025 15:10:35 +0000
Received: from proxy25212.mail.163.com ([103.129.252.12] helo=proxy41132.mail.163.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWb7f-00000005Wx0-15O5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:34:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=YlOXn2QdKGfBXkKhkm4yPrNrC5aKO1sGXt2KBKxXjcA=;
	b=oxGR1fJRqwlIx3lhqKThp4PryCDSK8yu7lv8JhvaNJNTBJRiAJ7/xkRHDjC0IG
	IYyfPMSrYflApQ/dDtdwxBle02eLGsIHDF54Mi4VnLupRF9dvpctYaXjM2Lakcnu
	Et/XuQVxpBWuU9/PhV+8ocAGfR8deKrTy2mbRGt/QP5co=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3l9qO42NoKVABAA--.3311S3;
	Tue, 01 Jul 2025 21:33:04 +0800 (CST)
Date: Tue, 1 Jul 2025 21:33:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: freescale: imx93-tqma9352: add memory
 node
Message-ID: <aGPjjrT4AAwGh//b@dragon>
References: <20250604093122.203929-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604093122.203929-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgD3l9qO42NoKVABAA--.3311S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOPfHUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRAQdWhj45APxwAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_063407_550356_6B13E2E3 
X-CRM114-Status: UNSURE (   8.24  )
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

On Wed, Jun 04, 2025 at 11:31:21AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> Although the bootloader should fixup with real memory size,
> add memory node here with smallest assembled size for
> readability.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!


