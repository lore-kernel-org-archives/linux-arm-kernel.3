Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D770E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 08:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLeO9F5Q+Njficg3yc+UmSZTCyWn6/lhNy/KSLHUNig=; b=ttW9QQCt5qKx4QeZX3r9XCFb3X
	ZEANciZDiesnP638t9XnYfCe78m9QbJ5C6hKUBLaQlpuUaKNSHRnYKsLbiv/NMCoQiSHVwdUA9o2r
	GYP8YyccQcujnau3TFn6PFA6E6bnoqlv8v8Jr2gTykYas2P6OkiFuxY36caHmiVjWd4/T6RUZu4iB
	xBWwcDxqd7i+bOuh0L6u96GGoSB3ui5HnrIO+kVnjVbeBxTZho6oGfqiePat0tQ23CEJWo6vUL/R2
	2HEDEfXZ8CU1gjj02yC0NmdDEJCLOqfgkj9jfAJBYsTjTTogXEsRQ1fYUjViH2Ixvp1MPdixT0K43
	yC+XwS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBDp-00000004on3-3r2p;
	Mon, 30 Dec 2024 08:33:57 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBCe-00000004odt-0A9K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 08:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BLeO9F5Q+Njficg3yc+UmSZTCyWn6/lhNy/KSLHUNig=;
	b=MPikmNnp9SQzEMyfR06wJUthMESw9N8wNjlTfzzXzldu38dlKjGeLjtI4HfLg0
	wg3iDDSUIGnuo/7fC6LiIJte8pX4hyrumvIOD5BCSVsHhg79cuiJi3Ao7fGAAevv
	Wm3epvDpEhXFNPBh1wL/Bbj52q9/SmNpc35QyuvLm0Y0Q=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnD9aaWnJnUNX4BQ--.60363S3;
	Mon, 30 Dec 2024 16:32:28 +0800 (CST)
Date: Mon, 30 Dec 2024 16:32:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: freescale: Enable wdog_b trigger pmic
 reset for i.MX93
Message-ID: <Z3JamnfpYpHO+UM1@dragon>
References: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
X-CM-TRANSID: M88vCgCnD9aaWnJnUNX4BQ--.60363S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUaknYUUUUU
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEg7FZWdyVMgVHgAAs+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_003244_461267_4810B73C 
X-CRM114-Status: UNSURE (   5.72  )
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

On Tue, Dec 24, 2024 at 08:33:35PM +0800, Peng Fan (OSS) wrote:
> Peng Fan (3):
>       arm64: dts: freescale: imx93-11x11-evk: enable fsl,ext-reset-output for wdog3
>       arm64: dts: freescale: imx93-14x14-evk: enable fsl,ext-reset-output for wdog3
>       arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3

Applied all, thanks!


