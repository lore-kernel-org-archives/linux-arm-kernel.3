Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4036BCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnNoai/6WE+/YlaBeq11xGUrY7PQToHaLx/C4M43Y8c=; b=G5X0Gm3oPYSI3WNJGIbuSUdwcz
	AHjMuA1OSeou4WBkifI0U/WC0pBAdigiq1ANQ/MyrPUxBOeAdk9/SHJ7SFeqBPLkt7SPYeWB2zKSS
	wptYF3MVEhd2RUXolVkRthIEV7CAduM7ncvn+jMMoFbFl+LH8mtyBajysgNrRMi7+osZbv5NHe42c
	j5l1kV3y9BEmyzEMXA3Iwc76sGOsjJOlyJs1JghFD5iINKb8xh/IWucfTMqUDUnS1tp0jn238dOQY
	U2CiHRgEEhJrygLQka0HnOkBnqXi+uqV8SM0HdeVD4FeuasA0A1N7ek0eDj+KoeZ7AEyOUtCDmQo7
	1Xix+7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTmh-000000032SL-3QLc;
	Fri, 22 Aug 2025 15:34:31 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upN76-00000001wMt-3KJ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:27:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=xnNoai/6WE+/YlaBeq11xGUrY7PQToHaLx/C4M43Y8c=;
	b=AnWz0oyJz8V/4sZx9Iaz7D0/y3nOogBQQJdsf0NZtHCIHCQjvhHFLHlGeeePh6
	owD6fhuEK+5uCgRf3JXUn+wtHRgi8D4D20Er0tyH02+421ETvx5fHyeWi2dJh5Ae
	0IroioHDWG0gcmTOv1ICe7kRNAB9+rEkKaNxsEuoohghM=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDnBYvDKahoGlEVAw--.10154S3;
	Fri, 22 Aug 2025 16:26:45 +0800 (CST)
Date: Fri, 22 Aug 2025 16:26:43 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mbrugger@suse.com, chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] Add the STM and the SWT nodes for the s32g2 and
 s32g3
Message-ID: <aKgpwzqlmK71Guio@dragon>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
X-CM-TRANSID: M88vCgDnBYvDKahoGlEVAw--.10154S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwg4SUUUUU
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNAW-JWioKcXcnAAA3H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_012709_202103_8CC218EE 
X-CRM114-Status: UNSURE (   7.03  )
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

On Thu, Jul 31, 2025 at 04:01:33PM +0200, Daniel Lezcano wrote:
> Daniel Lezcano (8):
>   arm64: dts: s32g2: Add the System Timer Module nodes
>   arm64: dts: s32g274-rd2: Enable the STM timers
>   arm64: dts: s32g3: Add the System Timer Module nodes
>   arm64: dts: s32g399a-rdb3: Enable the STM timers
>   arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
>   arm64: dts: s32g274-rd2: Enable the SWT watchdog
>   arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
>   arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

Applied all, thanks!


