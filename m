Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3E7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lQKvbPMiWALaCoaAk+3P6t7pLtJ6dozAsI8r7sGWjA=; b=CTZBEdkfIJ+15AujLdEw2Z4rMG
	npVjLrqsMCBurtoG1Gn4gK2qyk2FUGI6jHNrqFz9Uaw7LMGY/vQqB9QJj/WhlwaxOr3SEzQn0b6cQ
	HHTDVRjpHF/0QJCkdeCLauf347z/IU9m2m5ixQWuNz0/e/AhVVsy8mOke2QecFZCf802wH4LnNViP
	HULNvdfOevesDBeV40h3cXQLwPzp9FFg6gzM4PctMEalOKt8L7ZJ3/beNFcAk/d+Sbi7GxEiJi0Up
	AQLJEm2ckiSfXNR3q5ZEmzR8SkZ5YFbH2bk4YqgMmM3xi0nef3Zjg89hFwYJU1eyv4wUn2LgLL4eQ
	uHHSFiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73lb-00000005gyK-122Y;
	Tue, 22 Apr 2025 02:53:47 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73EF-00000005Zzn-0Ygt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0lQKvbPMiWALaCoaAk+3P6t7pLtJ6dozAsI8r7sGWjA=;
	b=hW/jlNO6wHxTEEgecGmNw5P9lLV307K4he+I5ZGHFKHBmp6tQk4GuqIjGF+OSK
	9tVyVLzUWHxfpDwBwbttcj9I+4jOe66ci0GeNvk9vZ+tE8CxtHep9ENX+pf6rpEW
	hi6Yz/qrJABdtTEejn170UUlX+/458HPBrTkEUDlEKYUw=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXlduS_AZoEu+7Aw--.31707S3;
	Tue, 22 Apr 2025 10:18:59 +0800 (CST)
Date: Tue, 22 Apr 2025 10:18:57 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: configure GPU and NPU clocks in
 nominal DTSI
Message-ID: <aAb8kaw+hmEMnbi0@dragon>
References: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-imx8m-clk-nominal-gpu-v1-1-78de5ea24c5d@pengutronix.de>
X-CM-TRANSID: Ms8vCgAXlduS_AZoEu+7Aw--.31707S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFW3try7ArWUAr1xCFy5twb_yoWfGFc_uF
	13W3WUCw43KrsrCwnrXws5ZFZFgw4DCF4kAF9Iqr4fKrySqFW8u34kKr9YgFy8GanIqwnI
	934DXw48XryfujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8BBT5UUUUU==
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQk3ZWgG3QyIpQABsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191919_476624_7428C352 
X-CRM114-Status: GOOD (  10.30  )
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

On Tue, Mar 11, 2025 at 08:41:12PM +0100, Ahmad Fatoum wrote:
> Commit 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive
> mode DTSI") added imx8mp-nominal.dtsi, which overrides all overdrive
> clock rates in imx8mp.dtsi to the nominal rates.
> 
> At the same time, commit 9f7595b3e5ae ("arm64: dts: imx8mp: configure
> GPU and NPU clocks to overdrive rate") went in, which changed some
> clock rates away from the nominal values.
> 
> Resolve the discrepancy by effectively reverting the changes in the
> latter commit inside imx8mp-nominal.dtsi. This is required for proper
> operation of the imx8mp-skov boards, which are currently
> imx8mp-nominal.dtsi's only users and lets all other boards that don't
> include it benefit from the new higher frequencies.
> 
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!


