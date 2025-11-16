Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF6ECD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 03:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+d11/97yRmoOItITlX8hl7n6rNBG3cdfrFwI8I9S/Yo=; b=Nk/XNhSyCpm7l+/2wykfUsgXDG
	ePk2d96AMIj/uKA+LsyZ02g3FlpLlG69zbGiiI+s4Wp0/E3cpjw/LNGmx4QX3XNHFcFa3ivH95K+5
	Wdq7I8Bk6eo4M5sobN2ScRFADJx8j01drbnzKAc3X8ct/DQQNQKkkC5Ab0rW6BrxIWcGbBa9Cqe4M
	Rnj6DcbSzeArmvZ0Is+KkztpmQ5g/i+wNFDvpRyCkpC66Tz0pXADAsQwFhTtofZYVFnr0b31vSbcZ
	mVnjESDbIpOHQcCinzyKcnmz2JGT0r2IiSwG31peitJGqqUGayh3yndWsDCXbpwm0cpHD9C3gTMhj
	WaGCHydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTsW-0000000ELFS-0R33;
	Sun, 16 Nov 2025 03:56:40 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTsR-0000000ELEz-3RZC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 03:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+d11/97yRmoOItITlX8hl7n6rNBG3cdfrFwI8I9S/Yo=;
	b=NgJpJ+zBDX0MZ6JrWYa/UG5i1llDwj6bUNli3bHCZGvMo99R5xwOZwmYqvOgDp
	B/IQoge6LZBZdyAytuk8P8Ma2Ff9VQPHQJ7zk4ncADLSNXHYvhyxq/0lzmz3rBRT
	yTf36Lw6CY/ItBVsWx0NiQKC7rjGBtqEBbW6Y7z0kLpBs=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDn4UNjSxlpT8UfAg--.7837S3;
	Sun, 16 Nov 2025 11:56:21 +0800 (CST)
Date: Sun, 16 Nov 2025 11:56:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/5] arm64: dts: imx8-apalis: add additional
 functionality
Message-ID: <aRlLY_rWgeAXGEV-@dragon>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
X-CM-TRANSID: Ms8vCgDn4UNjSxlpT8UfAg--.7837S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWruF13KrW7Cw1DAr4Utwb_yoWxuFc_ur
	1YkFnrWa12gF4kKw45JF4I9FWY9F409FyIq3y7W3srW34SvF1rAr48XryF9w18tr4jkrsr
	ZFs5Zw4DXws8ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU2jg7UUUUU==
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQWM8WkZS2WKnwAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_195636_164881_79F8F23A 
X-CRM114-Status: UNSURE (   7.41  )
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

On Mon, Oct 27, 2025 at 10:30:06AM +0100, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> Cleanup the regulator used for the Wi-Fi module.
> Improve ADC node by specifing the used reference volatage.
> Add thermal nodes and cooling devices for the PMIC.
> Cleanup TODOs no longer applicable.
> 
> 
> Max Krummenacher (3):
>   arm64: dts: imx8-apalis: cleanup todo
>   arm64: dts: imx8-apalis: add thermal nodes
>   arm64: dts: imx8-apalis: specify adc reference voltage regulator
> 
> Stefan Eichenberger (2):
>   arm64: dts: imx8-apalis: rename wifi regulator
>   arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator

Applied all, thanks!


