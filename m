Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F5CE674B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hg2TJ/Baji1tRW8RpbjYn7MFzFn5+qm7pKjjEWt0Flg=; b=g8WyJrDsaHPIA62Kzai9ldN6cB
	+NAnL74kIOiHSKpc8wA0NsW2FUPqQmQcaHI9kGGTWhoE378/e0nAnuTtYp9sOJEVDjXiIMqHxKk0u
	Blyfk4tan/FDhZNgLQy7wFEeYw+CuO7PLhP9wYxOPQCJOYe08UYPFk4HHtEmn/lAapg6dG91wLjEV
	i/RnG5FgONPiaMvpy4uYDkYtfK88/twrzY8s0WyT3Z4niSfd61eghLTE0eHdmSyoZz83roxaf7kCJ
	A7+/Jwu+pjAUbq64kM3G/sjA3KEExeD8tFfFBQrgXmSfnYemGZ1mA854xxlMeYQbJ7886Oe94xYXk
	pAusrYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mwf-00000006FwN-0yZQ;
	Fri, 01 Nov 2024 08:23:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6mnY-00000006EAa-1XX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Hg2TJ/Baji1tRW8RpbjYn7MFzFn5+qm7pKjjEWt0Flg=;
	b=f5u/4noKj9KilTbCNFgWVQt0bGoeXfnwxuWKmDWbSN/n13pk1aLAXJgkovhzLU
	6q4JEnRL7IDFaszpuM7Q9Z7G685BnYPLkMeYTe6j6vmF0DpnMU9xY2PcFo0KXj/Q
	A4FTuluYuFo/tmOKvgqc1K5nm7Xr1KyXOwlajU7dk4bzc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3tv6xjSRn72xnAQ--.13820S3;
	Fri, 01 Nov 2024 16:13:39 +0800 (CST)
Date: Fri, 1 Nov 2024 16:13:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 02/12] ARM: dts: imx35: Align pin config nodes with
 bindings
Message-ID: <ZySNsQVp5+JmRohH@dragon>
References: <20241017211241.170861-1-marex@denx.de>
 <20241017211241.170861-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017211241.170861-2-marex@denx.de>
X-CM-TRANSID: Ms8vCgD3tv6xjSRn72xnAQ--.13820S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa-eODUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBWKZWckjIUEMAAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_011424_756135_E7B91007 
X-CRM114-Status: UNSURE (   9.44  )
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

On Thu, Oct 17, 2024 at 11:11:19PM +0200, Marek Vasut wrote:
> Bindings expect pin configuration nodes in pinctrl to match certain
> naming and not be part of another fake node:
> 
> pinctrl@30330000: '...' does not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
> 
> Drop the wrapping node and adjust the names to have "grp" prefix.
> Diff looks big but this should have no functional impact, use e.g.
> git show -w to view the diff.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied all DTS patches, thanks!


