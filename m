Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CF2CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stZPJ4M5bQxptRayTgT6RtHDQjZgxyXiEdqip2m/sjE=; b=YvSSkmGpPasIqtaWAMCPPX+6cF
	VJ7C8tz5wYRPw2RxXqy0F2sdcTTVT0TRje8cLGhQdORAs0wGz5l7T3Yym0Iyby3x1ha6aSxToN4+3
	1ub/6bW4FHtM43/0gAzgj58Jf0FK19mugF/gynh8VEE53752kd4iev5r8TUiOzqtW3Icq8rxsszn5
	Hm8gF0Q4AMujUwkXywmphehk9jM3PNQ+wxZeIX2008U82yUOW5Zxpl/pe+6CgIw7znQPNBZP0axDF
	Z+UKb7bD2IitOgRxBER4BIzNR6J0nWV3Bx7N5dFlY0+Qcz3ZYFrk1+gNZB4df2faIUqXdHvrrJ2PC
	UgGBp10Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7qc-0000000GIW5-2u65;
	Tue, 21 Oct 2025 08:36:02 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7qZ-0000000GIV0-30AK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=stZPJ4M5bQxptRayTgT6RtHDQjZgxyXiEdqip2m/sjE=;
	b=j+3sVkH7/mAopbBYTH6PAu7sSTkSJr1IQPilH/1KWstydxQt5nMQ+nOgDLjt8I
	8y4azlN1xpwgyxcEBIOIyUbIvmU+tTQP5NgzSp0QBW/urQ5w7d60DqSpayCm5JZl
	U6gdlw77C4sR7aWUP8yMJUipBVEArrQ022eLTm0G6L9PY=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnB5LjRfdoaIdeAA--.44314S3;
	Tue, 21 Oct 2025 16:35:49 +0800 (CST)
Date: Tue, 21 Oct 2025 16:35:47 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Walle <michael@walle.cc>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: dts: imx: correct the flexspi compatible
 string to match with yaml
Message-ID: <aPdF4yR9iGFInJeV@dragon>
References: <20251017-flexspi-dts-v4-1-330fc467f489@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-flexspi-dts-v4-1-330fc467f489@nxp.com>
X-CM-TRANSID: Mc8vCgDnB5LjRfdoaIdeAA--.44314S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7Z2-UUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIQaiCGj3ReamqQAA3+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_013600_059353_939DAF03 
X-CRM114-Status: UNSURE (   7.60  )
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

On Fri, Oct 17, 2025 at 05:25:41PM +0800, Haibo Chen wrote:
> According to Documentation/devicetree/bindings/spi/spi-nxp-fspi.yaml,
> imx93/imx95 should use it's own compatible string and fallback
> compatible with imx8mm.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!


