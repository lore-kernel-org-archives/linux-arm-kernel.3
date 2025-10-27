Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393FACCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PecZQr+AQLxYrOsqOJNp571UHlMkTg8jRCR5hHLYE/Q=; b=M5xWs8rVwdIblarRHmF2Apvq5r
	Wzc+op6txDlmoZ52vCHFXICaHjOWwQk3fnnLhCMw97he3da+SNC3oVFVzJ4AId77K9A6MgIil5GBC
	vnAy2/PGbwgjvVcGNWBFHXMBUj9260JuG6a7JLJAjvQ3lpO7POtcYutEbaORn5zVeyUD+5yfnOgmN
	uzMwkbCuUfV/hcKGWfx/VQ3yG0BHIvndQo23e5iCtj0Y3ZJ4MHjwamIRjE07a1OJzOjjapnAm0q/y
	Pk1615tsxtta+vQJN5IGRzTvejJRjZ1pzEfp7mJowGZni1n7HS1PUdZoC+Ahb/Jd08rpp4Vi7i+xj
	mJw3+rAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBxm-0000000Cwpk-03Gy;
	Mon, 27 Oct 2025 01:23:58 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBxi-0000000Cwp3-49mK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PecZQr+AQLxYrOsqOJNp571UHlMkTg8jRCR5hHLYE/Q=;
	b=P++ptj8TzTHPih6xPQd3EARciOjKFvOPvZXOGZx0fJ9pujqx0vo4bSRh5YJnkW
	4qekwD1t1Pw+RmWvCpphTNPacfVki5UfCt/6fyEs5OXdrJrC8inv/j4DXZQgmOsu
	K8MLr2jOkflkwPO4kf9NCDmIcbEHSviQ9kgAV51h5v1Bc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgD3X7uMyf5o7zE7AA--.41338S3;
	Mon, 27 Oct 2025 09:23:26 +0800 (CST)
Date: Mon, 27 Oct 2025 09:23:24 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: alexandre.belloni@bootlin.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6q-evi: fix rtc compatible
Message-ID: <aP7JjJCYl119rANZ@dragon>
References: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005215146.3804629-1-alexandre.belloni@bootlin.com>
X-CM-TRANSID: Mc8vCgD3X7uMyf5o7zE7AA--.41338S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYHq2DUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA5v1Gj+yY5LJwAA3o
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_182355_340760_36088F45 
X-CRM114-Status: UNSURE (   7.37  )
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

On Sun, Oct 05, 2025 at 11:51:45PM +0200, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> The correct compatible is nxp,pcf2123
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Applied, thanks!


