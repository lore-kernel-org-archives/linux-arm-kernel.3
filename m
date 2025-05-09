Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0413C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztpen9DuNRABAlryqI4gdvEyhar1spaRR9YZP2KvAT4=; b=RVtsf7D0rBHVmSwEUqxNL34nQn
	29xE9N9rfbliS16CbMW+Higsuu+14L6vO+a78n36a+K1g3vnwuiXoabnsX0FXWmCSg+7Hd3dFz3eO
	g7+afQK5SczNySdgf21TcenS095BJU1W0ac6p81w4mEpeavlO+llmzG5lr+qOvOVPaRktXxPnKB9W
	51gCWJEuK9lz8U1I2F6g8GW5nVp9bMDSOgPmLzMylXB6FGw6Z+RPQzRHIE94qkb/kda/y4YOdOh/n
	yv6afvoAfoa/cxMzYMXitVNHcT/5RIZBAnsQw7qQewnvy8o3dqZwIyzLgnIVrrBKUpGTa4/V2KdAt
	Sjyztb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDL9w-00000003JhG-44GD;
	Fri, 09 May 2025 10:40:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKTk-00000003BAe-0oWa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ztpen9DuNRABAlryqI4gdvEyhar1spaRR9YZP2KvAT4=;
	b=AA6tle6TmM7PdJ4gi8I9yRrcBcdwBcfjsw+8LLrbPNdMruSNojxEqqbLzyrZHS
	In63wY6UU9QQENgkE8pG+WDACIZiOUlg1EMVCfDSJUkGVcXafB4L/F1mwqi4Y7Ul
	0AAtRIzN4Eowa/wGUvyGf/Z4+2zsvNFYYpl7maGgPYNh4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHD_Fg0R1o046lAA--.20888S3;
	Fri, 09 May 2025 17:56:50 +0800 (CST)
Date: Fri, 9 May 2025 17:56:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive
 mode
Message-ID: <aB3RYMONiB4RQdjk@dragon>
References: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
X-CM-TRANSID: M88vCgBHD_Fg0R1o046lAA--.20888S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrCF1fGr45uF4DZw1UXw4kCrg_yoWxXrc_ur
	W8WwnrAw1kWr17u34qk3y5Za4fWw4UCF1SgasxXan2qFyfXrZ3Z3s7X3s5XF1UGrWjqwsr
	AF1DXw48JFy2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzVbPUUUUU==
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARxIZWgduGdhEQAAsq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_025716_549439_2B3D7126 
X-CRM114-Status: GOOD (  10.56  )
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

On Tue, Apr 22, 2025 at 09:12:35AM +0200, Ahmad Fatoum wrote:
> When running in nominal drive mode, the maximum allowed frequency for
> the NoC is 800MHz, but the OPP table for the i.MX8MP interconnect device
> listed the 1GHz operating point for the NoC, regardless of the active
> mode.
> 
> The newly introduced imx8mp-nominal.dtsi header reconfigures the clock
> controller to observe nominal drive mode limits, so have it modify the
> maximum NoC OPP as well.
> 
> Fixes: 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive mode DTSI")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!


