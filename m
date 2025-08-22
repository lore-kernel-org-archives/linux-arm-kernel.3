Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C23CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBzQOvbLKOrZCDGuj3oPGBAjjn0+n8NN80uKEiiCKd0=; b=IH2tJtW2G5CtHEzbZdDp5swicj
	00P8/QcltM6BRvaxSl4z/VQfRCsKsMOjTH/mTA3SLeFNJ7iwUeZmLcLoEe0PvHwHOurreDT3jrGrb
	og1SLK+9q5brhDLqzzx5qLgXoVR0wd9inGlggkKRkgqjhkbXUl5roBmzd8bg+z34u3Ibe8cvnmKVy
	l8q1DjI7kJKaQxV/8vuCJODYHWrqBIm5u4tyh5xS+undNBnQjt1looII2hIDpFLq6PrSydl37Zu9m
	Wu4E/IRh8B5XY9fMGQ/eJRTinvLaO4gccsvpodweesw/4qQzwOWYvxMq212szZBQjw1heM6AsVnze
	l4q/eZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb2-00000003X5C-1RYV;
	Fri, 22 Aug 2025 21:46:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNtn-000000021Ul-1FYW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=oBzQOvbLKOrZCDGuj3oPGBAjjn0+n8NN80uKEiiCKd0=;
	b=M/KtJtvMplcZe67IU8qz2DXQAIi8h2Hr3C2+F7wj7rv+hKf1k0kUCwvX+53YEA
	OQyQYvL7SSQvu1HyXuVnK5KPC++zpFYrQVDHwGHVyLg8JFJVl77IN0UT70J6osEe
	xBiCmgWCbUHgM89J+71Ho4NpYeG56wl2nP2PalGdCQBHU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA39W6YNahoQtcVAw--.16293S3;
	Fri, 22 Aug 2025 17:17:14 +0800 (CST)
Date: Fri, 22 Aug 2025 17:17:12 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joy Zou <joy.zou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Luke Wang <ziniu.wang_1@nxp.com>
Subject: Re: [PATCH v2 00/11] arm64: dts: imx95: various updates
Message-ID: <aKg1mJSZq6Qcrq_r@dragon>
References: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818-imx9-dts-v2-0-8ba787fb5280@nxp.com>
X-CM-TRANSID: M88vCgA39W6YNahoQtcVAw--.16293S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1DXFyftr45Wr17tFyxXwb_yoWxZwb_uF
	4rW3WUXw48tF4fA345Aan29FWjqF10yr9rWry5Wwn5Xw13AF1Yy397ZryrGr4rGrnI9r9x
	A3WUXw42qF45WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj58n5UUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNxq3HWioNZqYHgAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_021727_638894_09AEAF9F 
X-CRM114-Status: UNSURE (   6.63  )
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

On Mon, Aug 18, 2025 at 09:25:30AM +0800, Peng Fan wrote:
> Joy Zou (1):
>       arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid
> 
> Luke Wang (1):
>       arm64: dts: imx95-15x15-evk: Change pinctrl settings for usdhc2
> 
> Peng Fan (8):
>       arm64: dts: imx95: Add System Counter node
>       arm64: dts: imx95: Add LMM/CPU nodes
>       arm64: dts: imx95: Add more V2X MUs
>       arm64: dts: imx95: Add OCOTP node
>       arm64: dts: imx95: Add coresight nodes
>       arm64: dts: imx95-evk: Update alias
>       arm64: dts: imx95-19x19-evk: Add pca9632 node
>       arm64: dts: imx95-19x19-evk: Add pf09 and pf53 thermal zones
> 
> Richard Zhu (1):
>       arm64: dts: imx95-19x19-evk: Add Tsettle delay in m2 regulator

Applied all, thanks!


