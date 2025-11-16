Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AD6CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 09:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/0v29LNdkN3c0TsJQzVdp5QigjeZCzTwl5nAgC3p+Y=; b=dVsLNGwzq0KSJ4IMnVIj89iNAE
	gPJ3WishPaKZqsq5/07+w2eqIM4c182V4fSzytLL5cfBnEjnTzZiR3z3DpUKuFVt1gOjjJhINV9FQ
	kBBA4kGU6gDsl5LeSW9QkNFgKNbegDPjum0yk56FjS2bdsyQKV1DgtRBg1MNNoOc25A0VLXSJfK/5
	MTYq3KRe3uXplXFrgmbmrSgQ0hS8o9cH0kqJ485+0oBT5Mkmk2SkwE3CzrdTEz3tq13u8a0myGdMa
	tZdz7MYDSCJeTIhQjBdF+fieoFNsKgGzalu3NVUEp9RH+GSU1Suu012TRVkvk4FaW+b8bCcqixF2d
	MhwPupaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZH0-0000000EWBu-0EGf;
	Sun, 16 Nov 2025 09:42:18 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKZGx-0000000EWBb-0HiA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 09:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=x/0v29LNdkN3c0TsJQzVdp5QigjeZCzTwl5nAgC3p+Y=;
	b=hZF0SMoUF9Nc5zFp+OVBVeCULFLpJkLEXZ4BuBG+Tpv6a3dLAMzAX+YGYWscuS
	nvJ00yMJDdqOS5rmVgzVYuX+AhvO7Vbi2i+klBrByWIjU5AeyNsUl/3IzSyZuaUv
	Qu38lzPn77Cd6G5yekOhEN+IeYviWuAloMJoG3E5AiiC8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCniOponBlpAo0jAg--.8173S3;
	Sun, 16 Nov 2025 17:42:02 +0800 (CST)
Date: Sun, 16 Nov 2025 17:42:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2 1/2] arm64: dts: freescale: imx93-phyboard-nash: Add
 jtag overlay
Message-ID: <aRmcaMwxOUotXx7a@dragon>
References: <20251028115820.3165399-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028115820.3165399-1-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgCniOponBlpAo0jAg--.8173S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUra9aUUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIAvhR2kZnGt6DwAA3-
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_014215_408799_D18FE6D9 
X-CRM114-Status: UNSURE (   5.81  )
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

On Tue, Oct 28, 2025 at 12:58:19PM +0100, Primoz Fiser wrote:
> Add overlay to enable JTAG pins on the board's JTAG (X41) connector.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied both, thanks!


