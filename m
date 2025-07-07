Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB78C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHBLCi+DIw3uUiQhPef0s/I0wx23cXQdEUx2HNS8QpA=; b=okwOHusEaLKbtViidn7+Vfs1Op
	sLSOUfhp8z4mtfRB4F5vUmCd9KJUFX51ug6Oup3g+ve48frfP6vQebaypxIqGwaMVEVTEHLkJdVpd
	1tc/tSVLY/nJ8nJ6P83LTYCDu7QcSuLQD9v/Lcoq+IZv2m0uyzcO/3WHJRKhHdruam0nxA73x+1xY
	L7qTB1PrUIsab7LZ3TlF/QN+xB7XjcRYY+j5Fm2jNB62uG86MR6pM9JMNNT9t++Gy7HlxPPKq8IN2
	TaoAgH58Agbrsv32hv/Jud8dZX1vPmRR/oqpfxDZRxkwVF3OmjCCYo8otE4irwUU3iZhIl1TOGvdJ
	moBbTPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiMF-000000021CW-34Hh;
	Mon, 07 Jul 2025 09:41:55 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYhk1-00000001vAl-3WHg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=sHBLCi+DIw3uUiQhPef0s/I0wx23cXQdEUx2HNS8QpA=;
	b=Eljto0eDL4gDa1GyStcrRd56ugcUeW2ozC1EmSo2NJY9WiDhyzsu8P8mLlV6UW
	RUvhfRh7JKgAqWqKk0r/TBbbrdLNVjHOvB13UKjnDVAq5B5lFy5l6HZmE4jqLiJx
	nd1OcXpYQRiUvFqVZQ6nYjxpfw8vK+4/IpKWg4X9JB9gE=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD37wgRjWtoZQp6AA--.22272S3;
	Mon, 07 Jul 2025 17:02:11 +0800 (CST)
Date: Mon, 7 Jul 2025 17:02:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, ping.bai@nxp.com, haibo.chen@nxp.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH V2] arm64: dts: imx94: add missing clock related
 properties to flexcan1
Message-ID: <aGuNES0DTTcm-eCm@dragon>
References: <20250702062724.2459200-1-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702062724.2459200-1-sherry.sun@nxp.com>
X-CM-TRANSID: Ms8vCgD37wgRjWtoZQp6AA--.22272S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhNcwWhrjRNGAAAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_020226_183307_C3E778D1 
X-CRM114-Status: UNSURE (   7.59  )
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

On Wed, Jul 02, 2025 at 02:27:24PM +0800, Sherry Sun wrote:
> Add missing clocks and clock-names properties for flexcan1 in
> imx94.dtsi to align with other FlexCAN instances.
> 
> Fixes: b0d011d4841b ("arm64: dts: freescale: Add basic dtsi for imx943")
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Applied, thanks!


