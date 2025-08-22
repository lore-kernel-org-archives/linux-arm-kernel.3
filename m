Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D0ECA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pq5FIUVbk41Ll/76FA3FSDCaWx/FphWlFTXL1AII6Jk=; b=suAovJRUKzLuzdFH8TT87I4T0+
	bwya9Tmx4ANCu2+i++UrQWvek02Tm6AdBsmeI0jf6FhXtm5xBWHcj/GpyO9v5i+YN3mPypUDS3DT0
	vsJNLv6U4xx/nve/joJYFNbghM2GEMPnx2PgZv14TcvqYqNPcQePJX+XpFR8s06/6jnL6OtoqnDYj
	4lGgkwcUG7J8IKyOM1AurK8fAPlEbwjDShOF4p6+xLf3bAbB06sV/p0LJoJhrK/Xxn1dgMxIK8hZM
	oE01Re2UJ4bbKGp+4VCJWMDkHI+Luw/45d0PQkiyxPTiyhkYfkla26U3Q4ZqFEH08emqyzyiq0FoE
	QMOkuS+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb1-00000003X4P-1Tre;
	Fri, 22 Aug 2025 21:46:51 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNlC-000000020t6-0OFC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Pq5FIUVbk41Ll/76FA3FSDCaWx/FphWlFTXL1AII6Jk=;
	b=Pchf78SewR9yVH/4I3ViAbKvx71tObGe5nO5njKpURzIBpJEBfC1caRw2jy/Vi
	L/NwcAPbNAHe98ktwWpogq6Wn3vbd7r6xaExL0w3nrUfRubrgaNM+tNg1p6xWpY7
	a4yU5jiqLxcdsItELiVlIqFevVEYHHHh3hldooBQFQwiI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXDveBM6hoij0oAw--.7939S3;
	Fri, 22 Aug 2025 17:08:18 +0800 (CST)
Date: Fri, 22 Aug 2025 17:08:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 resend] arm64: dts: freescale: Switch to hp-det-gpios
Message-ID: <aKgzgMMFvofPi_Tz@dragon>
References: <65670a9983c47919317e02557f072dbe0426f48a.1755099817.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65670a9983c47919317e02557f072dbe0426f48a.1755099817.git.geert+renesas@glider.be>
X-CM-TRANSID: Ms8vCgDXDveBM6hoij0oAw--.7939S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5VyxDUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQMxlmioM4OlFgAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_020834_429945_67BBBD39 
X-CRM114-Status: UNSURE (   7.07  )
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

On Wed, Aug 13, 2025 at 05:44:46PM +0200, Geert Uytterhoeven wrote:
> Replace the deprecated "hp-det-gpio" property by "hp-det-gpios" in
> Freescale Generic ASoC Sound Card device nodes.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!


