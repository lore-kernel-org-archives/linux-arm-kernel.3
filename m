Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16390CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/CPIzx5KaL4TyTuJmekW/24AWANlyqw3dcl3WFRWCE=; b=uYfMCO7FVy+99nALX7jcU1hVHj
	O8aG0yAcV4lKzOu3bMIkXG+GN/42oqj+9Oixz3jQEYjBc03qnnABM5bttxbF6jcSNPvMgVOycIJWe
	2FV7qxdMX/DnAteJircmEV/bAWwQBO2Y7hzRxugMFekQKoe0btjdO7Q2FaRBhtuC8kHrGka39dpkh
	zJv9YO/1mxVntmfOgFPI24I5Oj4zSQ05lypd4y4ubGaBbS6zE68rf0dfmfHhA2+UFdAwmPLQq5yNi
	m0rYxrsUom3fR9J8afJo9xpCKLXb6L3ZjkBKiuQDnxIrWaHo07hHIQ7YlVCzet04JyX8mkmTsLhdq
	lh3Tw3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmFu-0000000CbBn-2hUy;
	Mon, 20 Oct 2025 09:32:42 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmFr-0000000CbAC-45Vo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=n/CPIzx5KaL4TyTuJmekW/24AWANlyqw3dcl3WFRWCE=;
	b=f+td/ulGtsPQnMf4UyE9j/iAeHqvY2m6HE3o3yyNzMK9d9OTLoJmJTOHjc25wj
	YJf6h4X9eVPS8jKXFSIktaRYEv+9nHu7dkShH6/qYgKai+seF6B5DFdOSge0elUr
	zOpjYkLOmANepEswQHnkajIgM/Z0ouimRwMktRf2qkcYU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3zxWZAfZoV+ZTAA--.12317S3;
	Mon, 20 Oct 2025 17:32:11 +0800 (CST)
Date: Mon, 20 Oct 2025 17:32:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/3] arm64: dts: fsl-lx2160a: include rev2 chip's dts
Message-ID: <aPYBmXdpZyO0b62F@dragon>
References: <20240826-2160r2-v1-0-106340d538d6@nxp.com>
 <20240826-2160r2-v1-3-106340d538d6@nxp.com>
 <20250923111038.qluh2kjmc534ytig@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923111038.qluh2kjmc534ytig@skbuf>
X-CM-TRANSID: Ms8vCgB3zxWZAfZoV+ZTAA--.12317S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2puAUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRw-pGj2AZwdHAAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_023240_394760_FD944DEF 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Sep 23, 2025 at 02:10:38PM +0300, Vladimir Oltean wrote:
> Sorry for digging up an old thread, but I'm curious why you applied
> patch 2/3 but not this one? Currently,
> arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi has no user.

I'm not sure how I missed it :)  Thanks for asking.  Applied now.

Shawn


