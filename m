Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D621BCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSnBpXFr6UaDyoCUOpqPlNQbbbgbwumFKZey7Ajea30=; b=KHmmuw6MSybK77fYCGeWnmJK86
	BGGDU/mf+rITINe57M3FLhDx/bLuW2tLa3JJ1fNj7Zi4XUWpRSS63OO6boZqilbjZuT/VTyCePdlY
	i+expFO5lV5s1cPVyBTLP2+bdDfs44ZmOXCeD+tyLviUw6GOK/uCRs5hsW0Ns/fr+0ms/uJkdf3Wt
	1MsvnBUZB5hqlSo0yhvFM/weQ7N+FA+Tp333o/K8kT238kFNBd9suJSWWFVAz8xExcNFQjg7N9hz0
	m1e1Qi056PdiRHfjILgjm0/fQNYfwRmf8uJHB+lxDOvsBOw2RH54O2lXMGitunqHEkdbF5+AJ9NUC
	YKnWnMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGNb-0000000DAWR-23Jd;
	Mon, 27 Oct 2025 06:06:55 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGNX-0000000DAW4-1ex1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SSnBpXFr6UaDyoCUOpqPlNQbbbgbwumFKZey7Ajea30=;
	b=NUu4nwSvx0K7ohAoRZemwdB0PwhVz2iSweBvNEbGOCpbKNqgmn+DKtm19AQwAQ
	do3KElpdwMi6IITro1AMmKKQG7d1B85lmvJ0/u005vFc1gtzJHDtWWcU+NEbcm6f
	EEnQ+eK5nzeZgk0DpYKmfFewg+U+AfQY9A0negkNE3vHY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgCnr3jcC_9o9QE_AA--.49326S3;
	Mon, 27 Oct 2025 14:06:23 +0800 (CST)
Date: Mon, 27 Oct 2025 14:06:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@oss.nxp.com>, David Jander <david@protonic.nl>,
	Lucas Stach <l.stach@pengutronix.de>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v4 0/2] Mainline Protonic PRT8ML board
Message-ID: <aP8L3JkMGzHsVPId@dragon>
References: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-imx8mp-prt8ml-v4-0-88fed69b1af2@pengutronix.de>
X-CM-TRANSID: Mc8vCgCnr3jcC_9o9QE_AA--.49326S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8hL0UUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNh8UeWj-C98t-AAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_230651_777525_7C620799 
X-CRM114-Status: UNSURE (   6.47  )
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

On Tue, Oct 14, 2025 at 03:09:30PM +0200, Jonas Rebmann wrote:
> Jonas Rebmann (2):
>       dt-bindings: arm: fsl: Add Protonic PRT8ML
>       arm64: dts: add Protonic PRT8ML board

Applied both, thanks!


