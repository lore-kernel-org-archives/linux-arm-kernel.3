Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE36DC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kze5h2h8k5Lwn+zJ0PPawJ/lXrKJAnhMldQ/t7GAho4=; b=FcIYFeFYns+NdDgSNP/hocT9Sb
	YvW8MIMMod5A1JYdML3BHZApyOYf025nfXlIldpDgL6vKq6RWIrX/v94KjzdcZ6/AxUv7OpH2LrAv
	50oXooWUivWcJK9wnAejOJRw35t1n/xV/DH6UlCsj7shU40tKCw8nwsK3858bzdDjeVwocBAWVWmT
	1z9ta3u+/1JSm/wDOHdhmOhxSH8Dp5cdAD0Bp7OjiLY9RpVCZXC4IwrqMmASDBlu9zJCUPgjvfozW
	YE8/VHtTweRt3uVqrIIupnNvavSJcss+egpq19E362cewWChHRL5KF41BFPZ0Z2lp5j44HSqZziaM
	YB/Fd98w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLRM-00000003MNm-07NK;
	Fri, 09 May 2025 10:58:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKj5-00000003Dog-3pKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 10:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Kze5h2h8k5Lwn+zJ0PPawJ/lXrKJAnhMldQ/t7GAho4=;
	b=SwAlCaBP9h8HzTJ+rkN9kQAdcr9cesJouIrJL/OQUnI2sWb4c7LFkfo2iTPO71
	cIiskaZwkRrysvrtWzCk5QQs/brJpTlAoZZ9V32z/PJdEzys4xUKuheRZhUMs5sk
	dab8ZaIZT07kX0bdv/28nkjbRON7kaqJH95TYHnROCYyo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD35_4l1R1oPKqnAA--.56775S3;
	Fri, 09 May 2025 18:12:54 +0800 (CST)
Date: Fri, 9 May 2025 18:12:52 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: max.krummenacher@toradex.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-colibri: Add PCIe support
Message-ID: <aB3VJOWagJEF2xbB@dragon>
References: <20250422115051.1867349-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422115051.1867349-1-max.oss.09@gmail.com>
X-CM-TRANSID: Mc8vCgD35_4l1R1oPKqnAA--.56775S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUza9aUUUUU
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAR9IZWgduGdwKwAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_031308_259169_0E7BC551 
X-CRM114-Status: UNSURE (   9.09  )
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

On Tue, Apr 22, 2025 at 01:50:49PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The needed drivers to support PCIe for i.MX 8QXP have been
> added.
> Configure PCIe for the Colibri iMX8X SoM.
> 
> The pcieb block is connected to the on module Wi-Fi/BT module.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!


