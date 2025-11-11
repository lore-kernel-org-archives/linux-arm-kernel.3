Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20A1CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXkLRI0g65UAMkaqYzjM8MbTk3dgR2IEiJk+nolN7Bg=; b=RM4pLVTv7QJBaRjCV6iqQpz8oD
	soXjLSQpROe0KEbjgBenPUhUBnPMK8jbRog29GWI+kP2YYoLYouTusuuUpGlUbp+mq7JdO6nwpNVr
	o4OgRfFBHKSpwzvWmVrp49PH97xlnr8ZvFd7z8oJiseiaNfpUVp+Y9QOw/67XLRnRbqcLUb/vPrHf
	l9Mu3mq/Oz441tzst15DYW86GFyZgOz++f7MSXOt+pCbFkZuzRIlZTAscxyusk50nezqIooPDtf2q
	g8gtjmvlLxtOG4tg/M8l1ToT66n/3M6ak3NFCkSvvVFTvr46481ylFomPNiz7RZA/aZXuYETMktQr
	kqXJSoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIkyA-00000006s4g-211A;
	Tue, 11 Nov 2025 09:47:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIky8-00000006s2N-0yju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 09:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=XXkLRI0g65UAMkaqYzjM8MbTk3dgR2IEiJk+nolN7Bg=;
	b=ckeyb71lGo1/OFEuPgVLJStCZXixLHM+k/OiY2qCmam22s5Ibto5T8vJmY9+uA
	mqwDfDtUWt4jPNk9QznDPQI1kFNRPYu2aqFQ7cywpCMeqKgm77825GZhDvxu8xFl
	ExtOiDMCJ7yt0zS/XHOrHDl7cC7lqoop7Y0uGiHIe4y2Q=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnLZcKBhNpcL_DAQ--.5228S3;
	Tue, 11 Nov 2025 17:46:52 +0800 (CST)
Date: Tue, 11 Nov 2025 17:46:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Maarten Zanders <maarten@zanders.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>,
	stable@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
Message-ID: <aRMGCbDMDkasXMlU@dragon>
References: <20251024142106.608225-1-maarten@zanders.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024142106.608225-1-maarten@zanders.be>
X-CM-TRANSID: M88vCgDnLZcKBhNpcL_DAQ--.5228S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNgyjCWkTBgwY6gAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_014720_670689_DB8899A8 
X-CRM114-Status: UNSURE (   9.04  )
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

On Fri, Oct 24, 2025 at 04:21:06PM +0200, Maarten Zanders wrote:
> The i.MX6UL reference manual lists two possible interrupt lines for
> SAI3 (56 and 57, offset +32). The current device tree entry uses
> the first one (24), which prevents IRQs from being handled properly.
> 
> Use the second interrupt line (25), which does allow interrupts
> to work as expected.
> 
> Fixes: 36e2edf6ac07 ("ARM: dts: imx6ul: add sai support")
> Signed-off-by: Maarten Zanders <maarten@zanders.be>
> Cc: stable@vger.kernel.org

Applied, thanks!


