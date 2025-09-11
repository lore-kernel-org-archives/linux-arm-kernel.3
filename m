Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925C2CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 02:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbGufTgC4Ea0k5Wg/viciM/Ro45OFwFdqd/nvP2O0m4=; b=w4PgTmwLTvR5TCQd3+eSRw/mOG
	GMm/fKLazKDEf3YJPBY216VPzk+SgkIY5veT2b4FLSexiQk1ayYABiGSH1zg30rItVvfnEDpy2h3r
	D2cra6BozDl3NrI2g2bhiPfO2QuHaZ4JPsezIwcjSgHJkz4g6YUqWqvtbCQe4JgguBPOMSSJRI8pP
	LzGdvAtgrAmJQVebEJ5S17tk3TEaNnCpiiEHOMYgga+uoRg0l+hyDqpZtodaT0a2B40aDOwp2XbF9
	ni3VjMj9Zg40EeLu/2AGb+Q8TjcnIzv/nn2li0qBuq4PFWY11YkPV9tGLnT3MR5POqILZpfMpYPnm
	4U7uY3mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwX63-00000000OiF-1peg;
	Thu, 11 Sep 2025 02:31:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwX60-00000000Ofq-39Gc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 02:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=tbGufTgC4Ea0k5Wg/viciM/Ro45OFwFdqd/nvP2O0m4=;
	b=Rk/1L1kidUFupjgqkvtTPvK8Rsu7o7N0+j9R+zXwCY13H464HodSXrC3UHQ1sF
	goS/+VeSZuV1rDljT6JPeAvK0/ZbaHf1OqMXFbOBN0YDGuCJlp/2l0sDRgsyVkbh
	4CwXlT6yacVHPgDSg4hQlQnARDecPnvTq8W7HYkLOlJm4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_548NMJosrZGBA--.64549S3;
	Thu, 11 Sep 2025 10:30:23 +0800 (CST)
Date: Thu, 11 Sep 2025 10:30:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Joy Zou <joy.zou@nxp.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, richardcochran@gmail.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, frieder.schrempf@kontron.de,
	primoz.fiser@norik.com, othacehe@gnu.org,
	Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, netdev@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Frank.Li@nxp.com
Subject: Re: [PATCH v10 0/6] Add i.MX91 platform support
Message-ID: <aMI0PJtHJyPom68X@dragon>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
 <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
X-CM-TRANSID: M88vCgD3_548NMJosrZGBA--.64549S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4DJF1DWFWDWr1rtF47Jwb_yoW8GFyfpa
	yUCrZ8CrykXr1kXwsFgry2ga4YgwsrJF4YgFyUXrZ7urW5uF18WF1S9ayF9ry7Xr1fZw1Y
	y3W7t340va4ruaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jenQUUUUUU=
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgfFZWjB-SqFCQAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_193137_126523_F4984D2B 
X-CRM114-Status: GOOD (  15.21  )
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

On Wed, Sep 03, 2025 at 11:40:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to netdev/net-next.git (main)
> by Jakub Kicinski <kuba@kernel.org>:

Jakub,

Can you stop applying DTS changes via net tree?

Shawn

> On Mon,  1 Sep 2025 18:36:26 +0800 you wrote:
> > The design of i.MX91 platform is very similar to i.MX93.
> > Extracts the common parts in order to reuse code.
> > 
> > The mainly difference between i.MX91 and i.MX93 is as follows:
> > - i.MX91 removed some clocks and modified the names of some clocks.
> > - i.MX91 only has one A core.
> > - i.MX91 has different pinmux.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [v10,1/6] arm64: dts: freescale: move aliases from imx93.dtsi to board dts
>     (no matching commit)
>   - [v10,2/6] arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and modify them
>     (no matching commit)
>   - [v10,3/6] arm64: dts: imx91: add i.MX91 dtsi support
>     (no matching commit)
>   - [v10,4/6] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
>     (no matching commit)
>   - [v10,5/6] arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
>     (no matching commit)
>   - [v10,6/6] net: stmmac: imx: add i.MX91 support
>     https://git.kernel.org/netdev/net-next/c/59aec9138f30
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
> 


