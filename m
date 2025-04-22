Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4C7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUmlgYxptIyCDT5PtD6XKTU21aZLoOCOFtmQ8g7a1dw=; b=2b4qAbj3jjp8ls48pbs64Fpk4C
	Sijdm8YmMSgvIu78QW8YtTyRCkNRLhxZnjb9Nu6JvGPzcnx1Eu7zJavhf4kh8QDbwHhHq2wxisvNQ
	YgODuXLFlkiklaxOFnmuJNgIKYcqOxtYwz5tCUp1M9q9gXkXhyRiWluLI5pcatuGzL5bdsN+pNVXU
	/ZVnnSwdt7itJORvzFjzi9RopL9XMiIbUuPvGLFewmyZIRYgdHdhnf3acIiuFv9GfjeeKalDI9493
	raY3UabVNfvEzhRPVe/Lsb9At48EUtNotjJm4HoADqDSHRgKdhhZ84UEb3jWb9c4WQKcnQOF8TaJQ
	+vWdnTRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73jl-00000005gmr-2PSe;
	Tue, 22 Apr 2025 02:51:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73ax-00000005fey-3y1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cUmlgYxptIyCDT5PtD6XKTU21aZLoOCOFtmQ8g7a1dw=;
	b=WXAaQiA9yyF3hY/Sa591LBbEdVNrTZYGNWOtMOtS+7dloeJ0DRJPcgdEruuLTz
	itRwd2LcOwZyAL/rlc4/XZMju/yXtq8EF6mEBQvhbceuaSpn9gjUjHq7KXjgseIA
	NOf+siWJ7LW/qnOFE/+QNVaM4HXlKoop7tJ6icBa/ZDhk=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC3tUIWAgdouj+8Aw--.13044S3;
	Tue, 22 Apr 2025 10:42:32 +0800 (CST)
Date: Tue, 22 Apr 2025 10:42:30 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Julien Boibessot <julien.boibessot@armadeus.com>
Subject: Re: [PATCH] ARM: dts: opos6ul: add ksz8081 phy properties
Message-ID: <aAcCFtuktdDOXyoS@dragon>
References: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314-opos6ul-fix-ethernet-v1-1-1c0172949b40@armadeus.com>
X-CM-TRANSID: Ms8vCgC3tUIWAgdouj+8Aw--.13044S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4CD7UUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRs3ZWgG8J5SSAAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_194248_288219_8DA25BF6 
X-CRM114-Status: UNSURE (   8.18  )
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

On Fri, Mar 14, 2025 at 05:20:38PM +0100, Sébastien Szymanski wrote:
> Commit c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific
> PHY fixup") removed a PHY fixup that setted the clock mode and the LED
> mode.
> Make the Ethernet interface work again by doing as advised in the
> commit's log, set clock mode and the LED mode in the device tree.
> 
> Fixes: c7e73b5051d6 ("ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup")
> Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>

Applied, thanks!


