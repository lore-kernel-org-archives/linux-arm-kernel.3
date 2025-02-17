Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA8AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLolwAPvGVxT6aAEjL3uBdU5olsoXzQXTlC8GliVIF4=; b=bwYPrLnN+TaDqODa0yelCTbc9V
	qqyxX0j3VuXoRPYlz3Z6sniwBV/AGbvh6fL3rGshdY3RmbXT7BI2pGQeYxXY7dN55jxyXZXVFggEC
	xjcAbgyX0IJTahmvlvwj7TZ23gZOi3zKQNhyn6tYV4fw6jY4t2GlWt97s7xFw5zYZJAnX5S0NBfMD
	DpS50WY6HBe1ZjVY3ty5fbsJ8y1OQBosy+2TIQt8ncjI6jAIBrVmJ3vRYyqU1AOwVwX7zwPUMq7El
	xQe0oYDMN0VKqT42HdJXxlrikHLP0DJCiKFNmx0NMqw4kkly1CJ7DItyGhXvLjShfTx1+QqpfQ+KU
	jF2U/BXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykd-00000004AgC-16YA;
	Mon, 17 Feb 2025 10:53:23 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjy1M-0000000439I-2mRP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=jLolwAPvGVxT6aAEjL3uBdU5olsoXzQXTlC8GliVIF4=;
	b=hORx4vwoIpdqKgJlUC3/ma9uoQDd0rMVBbSndCHQr2X9D+MakWX6BD+LBIbW8G
	P4qnO8OdzRgydsARR56PTkD5kxBOVFq5mGG/cgs1UwQSkxXxYmCopfxETjCOX4ye
	2w4He0t2ffaNutgVbo7wr8qS/S5RsouKfSUv5uOX9mu/M=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHTzUQCrNn4KomCQ--.17144S3;
	Mon, 17 Feb 2025 18:06:10 +0800 (CST)
Date: Mon, 17 Feb 2025 18:06:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v11 2/3] dt-bindings: arm: Document the btt3 i.MX28 based
 board
Message-ID: <Z7MKEBkiBatFl54o@dragon>
References: <20241107085705.490940-1-lukma@denx.de>
 <20241107085705.490940-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107085705.490940-2-lukma@denx.de>
X-CM-TRANSID: Mc8vCgAHTzUQCrNn4KomCQ--.17144S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4Xo2UUUUU
X-Originating-IP: [114.218.218.231]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERn2ZWey2VbYUgAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_020636_999600_F2E7B933 
X-CRM114-Status: UNSURE (   6.33  )
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

On Thu, Nov 07, 2024 at 09:57:04AM +0100, Lukasz Majewski wrote:
> The imx287 based btt3 board is very similar to xea in terms of used SOM
> module.
> 
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied 2/3 and 3/3, thanks!


