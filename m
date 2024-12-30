Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F1FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbAGOV1h5XzJc+x6qKEPvwu+pAupe3fETtmFrAGVrxA=; b=jIUeLT9Lt2n7nwa9+6uA7LLbqH
	hlmE8sNC6/zMNX/v7WKn+sdEJktyipDXC/0sIk93K00pr1HMAZ1Rxw08jHQ+wEnh9QD43XFsmqCIZ
	Xrp1mWhUww2xqm6w74KzaRoHAx8a+MZnhaQ84HIqw8mht3gItSu6GjMdQHLkKPz+3UQUd2GOxhEl3
	9fTd4Puo+zJ85wKvIu6+MDHvHSGbuU2VhMkgYR68bl2LTFquMyoNcXWRmFw6YGhXb9Y+cA95HN55T
	WHQ+ES6uRnB1H9OmKQZ/gvkRofTvZheGY6xtfMgCwWh/upIooDWXnLPviLS3GnsinB9vi5CGrplXK
	4At1ZVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7S4-00000004VxK-3Jm7;
	Mon, 30 Dec 2024 04:32:24 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7Qw-00000004VrW-2Q5f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 04:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=VbAGOV1h5XzJc+x6qKEPvwu+pAupe3fETtmFrAGVrxA=;
	b=RjAJ31d78vZcDdlRrRgjQf+2wiTSfxVUxoUic1o4ISibgs3x9si75KTsJDrpsn
	Wnn3aKWpFDJfVbPUlzfs/Dzoq2qTEc4eQkis5XXMo6jquTXuOSNm2mNeFlS4WwiL
	nuOYY7BsXIRq6aPQY5WcWTBnxGGn8ldUhtM9nenFJg9pk=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBnjrn2IXJn8c4DBg--.60875S3;
	Mon, 30 Dec 2024 12:30:48 +0800 (CST)
Date: Mon, 30 Dec 2024 12:30:45 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dt: imx93-tqma9352-mba93xxca: enable Open
 Drain for MDIO
Message-ID: <Z3Ih9eG7TqKGonkx@dragon>
References: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205150730.3132807-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgBnjrn2IXJn8c4DBg--.60875S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQ-FZWdyDppGaQABsR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_203114_921265_A1B7E9C8 
X-CRM114-Status: UNSURE (   9.60  )
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

On Thu, Dec 05, 2024 at 04:07:28PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The board has a pull-up resistor for MDIO pin per PHY design guide.
> When MDIO is idle, it needs to be high and open drain is better
> to be used here for power saving.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, with s/dt/dts in subject.


