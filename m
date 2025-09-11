Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C430CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRKVgwVlrlHXeIoAjUG+Ao956AyTqlrUkOb9mlU6Ixg=; b=Yy8HxqRjd0duPi2GFsUhpDTwtB
	5fPP4dhkgOwDbuatUt55zxAyEhmLw07njATwfFx9RdwKaTUNL0bvsWKEdiV773Eo3jnldNlAUva2J
	UreEsvxJU4kwDgcQZayrlKaorWVKJttRPzg5800WDmY661LHlaQ5N8MisQTD80Aohn3mJ3Pre+fsp
	OsyDwspvQjusI2xeQeoavVAneOf4YBmd9jfVo6r47wBd1JOtjPaHU8bt5QTBVQfSiuha/X6R4g3s8
	0vPi7ZUNDREWd5Y8i+MB9NAu6S7K2K5tRVdQan1Hzk47TR+RJR/UFu+CwLjP+xTww1JdzpIqeym2d
	ot8cd/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXyw-00000000b2u-2EFF;
	Thu, 11 Sep 2025 03:28:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXyt-00000000b1u-3zQh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kRKVgwVlrlHXeIoAjUG+Ao956AyTqlrUkOb9mlU6Ixg=;
	b=Jlp7dF8EOQYNqnkO1u9td6C//tmb4qlxpPHsH/IXxv1Dt/BebJxWc0u8tGlbWa
	e9Ls9z3IWnJ49ymg76TH+VfVM9Hh85RXc8Fw8CGI7x84oZZhk2t1B4JsVWaqu6+L
	1Rrp0OpJg1nUlKsbQqE2mKmVzXfqXRHGFMnuHAe04rvT4=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3v_mdQcJoEpRgBA--.45504S3;
	Thu, 11 Sep 2025 11:27:27 +0800 (CST)
Date: Thu, 11 Sep 2025 11:27:25 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: imx93-phyboard-nash:
 Current sense via iio-hwmon
Message-ID: <aMJBnc3p08VxrkhQ@dragon>
References: <20250905065503.3022107-1-primoz.fiser@norik.com>
 <20250905065503.3022107-2-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905065503.3022107-2-primoz.fiser@norik.com>
X-CM-TRANSID: Ms8vCgD3v_mdQcJoEpRgBA--.45504S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7cdbUUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNx9Cp2jCQZ8yPAAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_202820_305184_80CB985E 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, Sep 05, 2025 at 08:55:03AM +0200, Primoz Fiser wrote:
> Commit 21179eae56de ("arm64: dts: freescale: imx93-phyboard-nash: Add
> current sense amplifier") added information about the current sensing
> circuitry found on the board. Now, lets provide current sense reading
> also via IIO-hwmon subsystem. This way, SoM current can be read directly
> via sysfs property more conveniently for the customers. No need for them
> to manually apply scaling factor calculations anymore.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>

Applied, thanks!


