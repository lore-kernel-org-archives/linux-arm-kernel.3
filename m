Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5088C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 08:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf7C3JIfy4ywsPNZ0w+h08cIa2jemMKNKRi45EogFjg=; b=foywXTnCB9IP06tYHJUCrFcwzH
	lnei0/fLoJ2vht/gzR8JWcyEmh0LRBdoJN8MRTyUc2xpmfDlNSFxlDo5BObhuizDrrBwuyC+hRpH8
	8KPk+8kI+N52jsQB0GTUHrYkU27hyNJo8c4/3FvIaD2UprF2jh1nDoP2UVylIz8oonaasG6wCmVTD
	sI/lzXze0oHbGnBT7Y2ik20EOIcvmzZMZsLindTPGNuO/ZvN4dIIRz2NmvWtnYPS3++YEoBjxA0U8
	icOMaYAH89C5xTRA+VF+HSJK+tckEmZP6MlJAWitQwqwj/lkHdEcX6zQx828tav+H1+eXXYnDoA+o
	fB/OU7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6uC-0000000Adgz-2ava;
	Sun, 23 Feb 2025 08:00:04 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm6sc-0000000AdUr-2fmg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 07:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=zf7C3JIfy4ywsPNZ0w+h08cIa2jemMKNKRi45EogFjg=;
	b=VeBopwtzBAgZy9FqVI+FAMxjeG5ieI31VYLCgb2v/zrFjuYWIIvqlauDw9+YCF
	yZEp9wPhsQtTJPHloc2sWQGyxf7AnGbYJiDwMk/v9z45cU5QyDQNM8oRE/sgj5pb
	FEA7LhpSk+mWbYxEbpiEOpzynHr7sJEepifNpCHXX9/Xo=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgBXXvcK1bpnD5KfCQ--.23112S3;
	Sun, 23 Feb 2025 15:58:04 +0800 (CST)
Date: Sun, 23 Feb 2025 15:58:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-verdin: Remove LVDS
 panel and backlight
Message-ID: <Z7rVCnypQW1wpyAW@dragon>
References: <20250214092634.12414-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214092634.12414-1-francesco@dolcini.it>
X-CM-TRANSID: Mc8vCgBXXvcK1bpnD5KfCQ--.23112S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsku4UUUUU
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhD8ZWe6kuHc6AAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_235827_052352_71E1BAD3 
X-CRM114-Status: UNSURE (   8.23  )
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

On Fri, Feb 14, 2025 at 10:26:34AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Remove LVDS panel and backlight nodes from the Verdin iMX8M Mini SoM
> dtsi file, those two hardware components are not part of the SoM,
> therefore they should not be present in this file.
> 
> This is solving a dtb checker warning about panel-lvds compatible.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Applied, thanks!


