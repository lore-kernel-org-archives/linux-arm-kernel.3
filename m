Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D440AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogTeyXmoSTch7ya0UA4kCFgEAyEUHB4VR6ZsyBwApbw=; b=bBG1VSVjMpUsf8ooDFvB5VDkd1
	VHWGQmPet5HnD9IZ4lYW27AlZOQs+4BdgQCDNGS1UdTmCg32aS+DHOE6wKXzSy4j7oI9UAKsyEI4l
	CHmVB9jykyVycW99o6ojaTQreEMMGqxj4QhrnKChriiVvwrAU+4c067Sm6HJy3dgk76N5IewAunIz
	mpemWYDsACfgHzDsUx+T8KAeZiMeE1CGSBfbEdJJ57OOP1wWyUXiqur9vgezbg7gsNVR25Y1zKqUd
	iYqr2yispO8ILKSGchxN+KasT4UnRvMXUNSweLWuNcO3/QJ4mld1a+mVGxTDp+AxCMqTUjtJD2Mg1
	sXYlqUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73hv-00000005gZ3-3eYu;
	Tue, 22 Apr 2025 02:49:59 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73UL-00000005e8p-32K3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ogTeyXmoSTch7ya0UA4kCFgEAyEUHB4VR6ZsyBwApbw=;
	b=hLFzrcJG/rzJJsH0xEpswY7/MqSL5zPrsEGhsBPRw6X8KrUza5SLenNi3OQONt
	wUz55311x2ssR7OUqYuXd6zqCeDYUVXxMV+ApH8Vj836JSGvwilbIE6nABYZZGam
	D5ub2n8RZ0oU01NYuedeJZaHCMK45YzVLU9DwuRvAn+gc=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgCnT_qBAAdoUeSqAw--.61882S3;
	Tue, 22 Apr 2025 10:35:46 +0800 (CST)
Date: Tue, 22 Apr 2025 10:35:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de,
	festevam@gmail.com, kernel@pengutronix.de,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx95: Correct the range of PCIe app-reg
 region
Message-ID: <aAcAgIwdlCGIRzcB@dragon>
References: <20250314060104.390065-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314060104.390065-1-hongxing.zhu@nxp.com>
X-CM-TRANSID: Mc8vCgCnT_qBAAdoUeSqAw--.61882S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUa0tCUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERs3ZWgG8sFBngAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_193558_061389_22534C97 
X-CRM114-Status: UNSURE (   6.70  )
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

On Fri, Mar 14, 2025 at 02:01:04PM +0800, Richard Zhu wrote:
> Correct the range of PCIe app-reg region from 0x2000 to 0x4000 refer to
> SerDes_SS memory map of i.MX95 Rerference Manual.
> 
> Fixes: 3b1d5deb29ff ("arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Applied, thanks!


