Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8150C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBCj5KCtd0YSw2+jeSI15O55rXmA7O2x9Co1/dUd/sc=; b=WH8p5VABPuh7pFYq1lNMsFcvtD
	5jJs7oHEpOxYIQroPZc0xbygwiQyVScXlBrLa7TXKonPr6HIBHVh9kLI91NX5bOghQy0CyyVv4CEh
	g1eJ5Ye0gWkKmmejQtNwptsyenE0CFJvJQI0HYUVKNmYh9Yrnq0Mn5l6KNJhBjdQrhCQQFFtOhfTw
	sLtBSoWnRrQXBtuPFOxPA64ubwocZhiaMpr9TWpim1/cJ6VrtccLCofNczHx5PD7XIyAT4ixChp0z
	dvYY1NAxc4UDYzfbRVEj701CY0WD/Qyx7/EKPHgJspHbQ/TunRWAwZuUH7xLu2gA3Ku9LdTnJF9sz
	LYK8+VLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv0O-00000007zqA-10Qm;
	Wed, 02 Jul 2025 10:47:56 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWu8I-00000007qok-21fQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 09:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=aBCj5KCtd0YSw2+jeSI15O55rXmA7O2x9Co1/dUd/sc=;
	b=hGA4ZzeSjGnd+cybXPReqSh4PH2pwX4u9pKlm/oeOv8yq86qURfz/Xt1IbIZyB
	Wug27aAY1vskf6a32jw0WDNJ5T9BCynkbthhLJXmD+bMtuBff73qOYOmn4ZtmoUU
	FZPkgcuFdhBZ68eC8rvxcrf73iB7XMs/T8+kH/XsNtOuM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDXfxAkAWVoRbopAA--.51920S3;
	Wed, 02 Jul 2025 17:51:33 +0800 (CST)
Date: Wed, 2 Jul 2025 17:51:31 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	m.felsch@pengutronix.de, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/4] Increase i.MX8MP VPU
Message-ID: <aGUBIz1lYIkhMCWr@dragon>
References: <20250612003924.178251-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
X-CM-TRANSID: Ms8vCgDXfxAkAWVoRbopAA--.51920S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF43CFyUCFy5Kr4UZFWkJFb_yoW3urc_C3
	4a9F1xCwn8KFs7Kw4DGan8Z3yDK3y2yr4DZa42qF4fZF1fZF4rZ340gr9avF18GF9akw1q
	vF98Xw4xAry3CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj7DGUUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQa8ImhlASaNiAAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_025202_840060_9B4F8F87 
X-CRM114-Status: UNSURE (   9.95  )
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

On Wed, Jun 11, 2025 at 07:39:18PM -0500, Adam Ford wrote:
> Some of the VPU clocks are under rated, even for nominal ratings.
> Fix the nominial VPU clocks and clock parents, then introduce
> the overdrive clock rates.  The fluster scores don't change,
> but they do go faster.
> 
> This series was adapted from an RFC from Marco Felsch which
> was setup to introduce the VC8000E encoder and extacted the
> parts that affect the existing infrastructure.
> 
> V2:  The only change is 4/4.  Patches 1-3 are all unchanged.
> 
> Adam Ford (2):
>   arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
>   arm64: dts: imx8mp: Configure VPU clocks for overdrive
> 
> Marco Felsch (2):
>   arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
>   arm64: dts: imx8mp: fix VPU_BUS clock setting

Applied all, thanks!


