Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB5AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWvBvJY/V1Stch0H93wsamiErQGrI0aoePeCBYg4NqA=; b=NLCZoUJ0Saqm/YWRf3snFB813y
	Kb5Rhss54JnQHiW4L+dY+bPkfkYhIqR+eGGsdM0n2I8x2bnQk1o0VSLExNGY3HH5n5zGKPjwa+l0l
	7dFSKuBAXgMzWvcLczMkGFbl/sUbIhMJvp5jUChKm+o/54SviT0Ez1YQtywmYtSVdJnWP4afnFqzp
	lbYzgLIQkePFr6YghGy+pz09AEKaTSrf7c+hUkS5r/8RCWuCTIl0heQoq7YkkQ59d0pIi5R691r/w
	nReyn6RznSDwmaVP7Xv8Irc2PeTbX3CjN+AVFCYu3Tal0M9nRkkBYJ45++9gpj2bYPLFiy0hfXJuL
	9wpYvs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyka-00000004Ac7-2wY1;
	Mon, 17 Feb 2025 10:53:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxwj-0000000424g-3k5b
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 10:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cWvBvJY/V1Stch0H93wsamiErQGrI0aoePeCBYg4NqA=; b=bMoGSCq44Xw5BapazfqIzAhugN
	aurHEomPdhtzoGZV2kDgad04nExnxlMOkPSYwRUqqtf4stdEP+S9CL4ghc9l4enUjvpy60v4VCCwr
	NraZSPBM4zS1RrPnab7NQbF2cTOSXcC7WxKJ7h2MMX1wMK+Fvkev/hvvDNTtoZa11dGTijsKd5xeo
	CbS8K4RPlTubXhpKkIOdBaBONNUm1gU9wNuTizo/33FPllks2bW3GZwx+3PzkJlDXp2GsWNvwVk/B
	kSEKyp8sCTIO0KwWy6dlaW1VZ+O2rZKAQrpXU4nzBKcqn0LCDXIm2QwlJV2YiZJnzgs9EFEIGA6eq
	tfgU267Q==;
Received: from mail-m16.yeah.net ([1.95.21.14])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjxwf-00000001la9-3xZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=cWvBvJY/V1Stch0H93wsamiErQGrI0aoePeCBYg4NqA=;
	b=UTFWmIGpiWYlPHdNS4u/Y1OSiMDcjea6jJG5r6XMeLCd5gWcxzFzvpodReDC5t
	p0CStdUGEBRMCJUzAKh/NHr1q/6WWp+Du/cPe5qtNMMOrTGECnAdoK/xfw5UTdbJ
	aYIh10M9KSkqJVySYW0O2WAIZoqrihbiXSb5MVuzAXQkY=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgC38fbyCLNnJaVNCQ--.19260S3;
	Mon, 17 Feb 2025 18:01:23 +0800 (CST)
Date: Mon, 17 Feb 2025 18:01:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mq-librem5: remove undocument
 property 'extcon' for usb-pd@3f
Message-ID: <Z7MI8UuBconRVEyL@dragon>
References: <20241023220252.1392585-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023220252.1392585-1-Frank.Li@nxp.com>
X-CM-TRANSID: Ms8vCgC38fbyCLNnJaVNCQ--.19260S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUIxpnUUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAh-2ZWey3iu+2gAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_100146_580032_EC0C8542 
X-CRM114-Status: UNSURE (   6.55  )
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

On Wed, Oct 23, 2024 at 06:02:52PM -0400, Frank Li wrote:
> Remove undocment property 'extcon' for usb-pd@3f to fix below CHECK_DTBS
> warnings:
> arch/arm64/boot/dts/freescale/imx8mq-librem5-r2.dtb: usb-pd@3f: 'extcon' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/usb/ti,tps6598x.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


