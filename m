Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D67FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 01:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUd1uRT/xLiAftfidXKIq5PpZVoa+Ty/sg4D9wULGPE=; b=kDZu93eh3oIkRDByN6snFQDw2E
	3PtnAJzG8ynQErUZCv8iDOo9MqwsxcrrUteoXCAGD+RbYKsWCz11A8gB2uD2qqwNljlxvnUJTf97H
	MMji3PvaDCK9VcSZ2R6kJMZ42hBlhVIPVtWNiacEgSXSyZrxVFr1zVuZkfu3NeBcFiGfJNscV5hxA
	ukgm07WbF/bx4ptTshL+O/pHDhruIIGawTw2ZURwOi7l0sKUDQ8KSAanSzIhrZsYR4025hVA0i1IA
	3dCJma5Fhcf9MmraGVLTou7XmbJncV9ccHEnxp14ERdJHHPKGu+HglQiCo/DCxwauTh1feXG1Uh2k
	3jqNshjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troSL-00000004Li9-3VVU;
	Tue, 11 Mar 2025 01:30:53 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1troPP-00000004LPP-0Ps7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 01:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=IUd1uRT/xLiAftfidXKIq5PpZVoa+Ty/sg4D9wULGPE=;
	b=VhMpyXWueRjMCzQuQzyXA8/6J8sU6SRwpZn1XOlJH7FejxOxo2i8eYYtRjDFDs
	FcWD/ydRINoqPyZHI5bd6d02I+6n/NxCufbCaQUYYQY/TDrym/maZfJKeedlfNc1
	biv8Ug1kgoyhFEDs+KoLbDoWyw1c1buG6xG3QK1yt87fo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXC0+Hkc9nkneuAA--.826S3;
	Tue, 11 Mar 2025 09:27:37 +0800 (CST)
Date: Tue, 11 Mar 2025 09:27:35 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	patchwork-lst@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks to
 overdrive rate
Message-ID: <Z8+RhzwHNJvUcF+P@dragon>
References: <20250204182737.3361431-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204182737.3361431-1-l.stach@pengutronix.de>
X-CM-TRANSID: M88vCgBXC0+Hkc9nkneuAA--.826S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4db1UUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwINZWfPUl2s+wAAsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_182751_453447_92ED7D71 
X-CRM114-Status: GOOD (  10.59  )
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

On Tue, Feb 04, 2025 at 07:27:37PM +0100, Lucas Stach wrote:
> A lot of other clocks on the i.MX8MP, including the DRAM set up by the
> bootloader are already running at overdrive clock rates. While this is a
> deviation from the configuration of other i.MX8M* family SoCs, overdrive
> is the default for most i.MX8MP boards and only some special purpose
> boards will choose to run the SoC at nominal drive rates. Up the GPU and
> NPU clock rates to their overdrive level to be consistent with other
> clocks set up in the dtsi.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>

Applied, thanks!


