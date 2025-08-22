Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EECCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vk1f6oss+mpwghmtXVYnMqfDZeMdCeY2Y/KyyI4LKrw=; b=MQfneCfQEv5/fBaQr2h29ufWJG
	aay1UI1uGH2etLARZrn+Mtt1FwZPLZm2+K4qctbfNcQpmndA7jH5l5eTLTd0PZD5jnrjZygnGuArC
	7Fud+8mPrgm6CzrngkZoQdINg0iH/DBAGc3E7YNVZ9uhy93MnLFMgmJ3qCIGY/q4SV9AjtLwwuRc1
	WDLdgu88TsvbaWYh3HANJCG10W3Gd08JdlmN0w721kAXuCQAWwiYnu+Fb5Mql3S/zPddPt44XfrgJ
	rMnaG1r07VaouBlmualilh99U7MxZ28/nsXyIMF1O8ejw8PC39Po3RmU9p2gSi8JQd8JQnWPAcTwh
	neOMFjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb3-00000003X7A-2DbN;
	Fri, 22 Aug 2025 21:46:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNvj-000000021ev-3TGg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:19:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=vk1f6oss+mpwghmtXVYnMqfDZeMdCeY2Y/KyyI4LKrw=;
	b=QYvFhkISzKsktKgmLfHux2upH5Ylju7UuDJ5EQEadelatUYe8cEyNZARt4zqYV
	/PazBnHohbrnibgXyX6Ip3lJXJ+S6Ab09o+Yw8mSf42gekq01VhNwCqae0RrqR5f
	bendSOVvEkF8PMIM6UFV2GOGtV9ssbg+vlSCTkZVKVcr8=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDH_vYLNqhomVgoAw--.12962S3;
	Fri, 22 Aug 2025 17:19:09 +0800 (CST)
Date: Fri, 22 Aug 2025 17:19:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-evk: correct the phy setting for
 flexcan1/2
Message-ID: <aKg2CmgimiK1OOM_@dragon>
References: <20250819-can-dts-fix-v1-1-e43e7d98a544@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-can-dts-fix-v1-1-e43e7d98a544@nxp.com>
X-CM-TRANSID: Ms8vCgDH_vYLNqhomVgoAw--.12962S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI1IUUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA-UOmioNg-XQwAA3s
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_021928_159762_5451452B 
X-CRM114-Status: UNSURE (   8.90  )
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

On Tue, Aug 19, 2025 at 10:43:37AM +0800, Haibo Chen wrote:
> 1, the phy support up to 8Mbit/s databitrate for CAN FD.
>    refer to product data sheet:
>      https://www.nxp.com/docs/en/data-sheet/TJA1463.pdf
> 2, the standby pin of the phy is ACTIVE_LOW.
> 3, the phy of flexcan2 connect the standby/en pin to PCAL6408 on i2c4 bus.
> 
> Fixes: 02b7adb791e1 ("arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!


