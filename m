Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C976E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=67tvmmn9OuQWrMC+HWaoLNhCgYmT8MPFGmX2K5RtNBA=; b=b77qGxOeDMC+b7hvdsPRTuxtmO
	vmJXeCTQ0+biswMv5rBcKRpRe7/LLarWpaPp7ppO8y82VROrdxZVa2PfI7rA17pf8mNaB0YEwcE7i
	6KQq3Qpe4mBqEKreUnSNv1SRxZcNbzp4hRBZIS7rrl1HB76ZUTBzL6LJNJOUhFS2utzrzQ79ki3Sh
	bgUYS7HFNHeDTJgHxAi306/lBCRXLFMdaVJYvMNvt3dpUYvQjaDuXukp0DeYv4T7WUgVjw11gpIAV
	lkzIPSvrXj7hHK/1jIksbdR28oHmDXo5b+HPan/eIn6a/9iAFzZXtgRJBDmqaZReul26RqRgQjkAM
	+RcJsW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZou-000000073BO-3Ez9;
	Mon, 09 Dec 2024 09:12:48 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZns-000000072z5-1kbc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=67tvmmn9OuQWrMC+HWaoLNhCgYmT8MPFGmX2K5RtNBA=;
	b=MZ8/j1oE5cQRVGjm7bWOLx/KOgKTwAVpmJtNPLX8wxeoe/pbrNLSgSvhgSDtKb
	p4u1fvTJfUV4n3sxw8STx6Chu4oCFQ0XoZrpF8lfCesg2UpEWWQxXNwVjTvAOMo4
	Kkc/O2zZDuTGikxmI7/Syu0mSaJGR0tyFxvIQqyj9n/p4=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHjwUttFZnkWp7BA--.46698S3;
	Mon, 09 Dec 2024 17:11:11 +0800 (CST)
Date: Mon, 9 Dec 2024 17:11:09 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?iso-8859-1?Q?Jo=E3o?= Rodrigues <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] TQMa7x DT cleanup
Message-ID: <Z1a0Lc+N+J3PGnH7@dragon>
References: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Mc8vCgAHjwUttFZnkWp7BA--.46698S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruryxXr43WryfKFyfXr43ZFb_yoW3uFb_uw
	15Wa1DZ347Xr4fCw10gwnI9rZ5Ary5Xw4DKFy5Wa9xWr1a9F13GFyfJ34a9FyxXasIgw1D
	Jr1DZ3W7ZF9FkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0xu4UUUUUU==
X-Originating-IP: [114.218.218.187]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhOwZWdWoWNcVAAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_011144_816453_A8742895 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, Nov 08, 2024 at 02:49:18PM +0100, Alexander Stein wrote:
> Hi all,
> 
> this series fixes some DT binding check warnings as well as removing
> duplicated nodes. Eventually IRQ support for thernet PHYs was added.
> Additionally add CONFIG_JC42 to imx_v6_v7_defconfig.
> 
> Best regards,
> Alexander
> 
> Alexander Stein (8):
>   ARM: dts: imx7-mba7: remove LVDS transmitter regulator
>   ARM: dts: imx7-tqma7: Remove superfluous status="okay" property
>   ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
>   ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
>   ARM: dts: imx7-mba7: Fix SD card vmmc-supply
>   ARM: dts: imx7-mba7: Remove duplicated power supply
>   ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
>   ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

Applied all, thanks!


