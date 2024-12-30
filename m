Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B20E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 04:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OX/rFN2ToZOmzEtAbDTU/7yu2ExFG98z9SCi/hu5y6s=; b=4N7pXEMxqyGX+mIatbarJbwDEN
	KbG+gZV6WA8JBsC3s1mI7MFs637RfcCviNHUjYKqX/3SD1cBZYEsx6uLoR1JDKjuEbEwqsFYuP7M8
	EhoiforvT5Vc4d37Y4i9RygXiSYjEU/nlFc9WQPmPUu9eIJL2NCRmdQDBJC61ME7GpH3s5mfQsH4a
	+/nnAoxfYgtrHw+4Pl7MaLq/yPyl0yhmTH9H0Zv1UeIPUa4080LYgwVfy16BVQ6vV97RwY5Aq4d91
	V1fWklpvGZpqDLtYKXj84dwUoiZ5wTy35I2rKcRBsfAviWMm84qmQIp/EB0fZyr1/kyECASwFSVji
	dnQBSm9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS72Z-00000004U8o-464a;
	Mon, 30 Dec 2024 04:06:03 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS71Q-00000004U2i-1FJQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 04:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=OX/rFN2ToZOmzEtAbDTU/7yu2ExFG98z9SCi/hu5y6s=;
	b=clyx2ISeKZvpsx4/Q0hsEBdY8F0aZEnH0jhUk505EoZSMzEGx1CAhAftHIu8aq
	x/hhy1Reucjb0w0OTlBbC1as1oFOFznbWOYvI3T/bR4e13vZyH5HCIeb5uD0EBRW
	8qIWIRSjGSa9lSgN2PpXRaouQ5xvkp2xaf5BgYNqCo3o8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCH28jQG3JnIsD1BQ--.59947S3;
	Mon, 30 Dec 2024 12:04:34 +0800 (CST)
Date: Mon, 30 Dec 2024 12:04:32 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: imx: add phy-3p0-supply for i.MX6 series
Message-ID: <Z3Ib0FYfgMxQuePa@dragon>
References: <20241126-v6-12-topic-imx-3p0-regulator-v1-0-c618ed111c75@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-v6-12-topic-imx-3p0-regulator-v1-0-c618ed111c75@pengutronix.de>
X-CM-TRANSID: M88vCgCH28jQG3JnIsD1BQ--.59947S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUea0PUUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgzFZWdyDiU6ZAAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_200452_670313_FB3170CB 
X-CRM114-Status: UNSURE (   6.27  )
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

On Tue, Nov 26, 2024 at 10:22:12AM +0100, Stefan Kerkmann wrote:
> Stefan Kerkmann (3):
>       ARM: dts: imx6qdl: add phy-3p0-supply to usb phys
>       ARM: dts: imx6sl: add phy-3p0-supply to usb phys
>       ARM: dts: imx6sx: add phy-3p0-supply to usb phys

Applied all, thanks!


