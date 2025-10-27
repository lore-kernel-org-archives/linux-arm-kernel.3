Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B47CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 07:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tZIQZIIeKrKNFriv/H4pggndEajGwOKWlQTygtfGwg=; b=J/WK0mLJNTth1rZyYhzFUfwXtW
	6vCvnbkB9YEAZkC1T2dGv7a72q/NdNklNmhJQZ3woSpMRpt5w9YFH1MyLe1D5hzeRz/+Gx9wequ3x
	VjK2k8POD7mFjhzybiMaF1kW8WxEx+mg4HnJp+NOLC7hrJ2WVqzcTyr3Axw1axLJlM8pVeI6yWHCL
	hBzTeeC3ilTP5eVp+ToLgk5GAzu3ERJhh4ArBxeSSiwU04DacAdHuiiwl7+S/3Akg0ijlItBFqprB
	jRaI3Sci31aIpzNXEiZMFZko/SFRmtfV6Xv1t5+2UcHkHooEqrVlCXKxtkQmurcQGP7WJfwFvGE+H
	OQ3Lg5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHDl-0000000DF0e-0AwG;
	Mon, 27 Oct 2025 07:00:49 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDHDd-0000000DEzo-494A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 07:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5tZIQZIIeKrKNFriv/H4pggndEajGwOKWlQTygtfGwg=;
	b=Bo0hZqsCtcvx/tAbBboZVSQAtpf5EMIGUbTCfJZbYL6hOBE25YYs4xdcT7qSCJ
	7k3rPqtv8OdTEM/7JBxRoejk0CMJeLz26XxdhKln7U0SMEhYVOuy6DjUja1ejMhE
	9mcswDBNY96eglR7J7By+oWK/byiZ9yq3bYy0EpbCxEJE=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBX5g97GP9o2cG6AA--.5331S3;
	Mon, 27 Oct 2025 15:00:12 +0800 (CST)
Date: Mon, 27 Oct 2025 15:00:10 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@dh-electronics.com
Subject: Re: [PATCH v2 0/9] ARM: dtb: imx6 DTB WARNING cleanup 2
Message-ID: <aP8YerA8CtXE-P_u@dragon>
References: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
X-CM-TRANSID: M88vCgBX5g97GP9o2cG6AA--.5331S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU5l1vUUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxPzZWj-BIhL-gAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_000045_699189_A0295158 
X-CRM114-Status: UNSURE (   6.66  )
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

On Mon, Oct 20, 2025 at 05:06:34PM -0400, Frank Li wrote:
> Frank Li (9):
>       ARM: dts: imx: add power-supply for lcd panel
>       ARM: dts: imx6ull-dhcom-pdk2: rename power-supply to vcc-supply for touchscreen
>       ARM: dts: imx: remove redundant linux,phandle
>       ARM: dts: imx6qdl-skov-cpu fix typo interrupt
>       ARM: dts: imx6q-cm-fx6.dts: add supplies for wm8731
>       ARM: dts: Add bus type for parallel ov5640
>       ARM: dts: add device_type for memory node
>       ARM: dts: remove undocumented clock-names for ov5642
>       ARM: dts: imx7ulp: remove bias-pull-up

Applied, thanks!


