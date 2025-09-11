Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5108ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 03:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0emQFrKhNRaK9F8r9wT8+xRJD7zvWcKi6l+Zuoa3vU=; b=277xdCLDKSbosztImZhM2rQFjv
	QezFaWHZ6a+gDIvKkRTKinkprKVL27DHa8NX3EKare0YguCyI/F3R18fwWEnZZkBso1bpaXBdMB4o
	lggZt52oMUyrIjEuMLL2bPcwxnBkf5k5y/irJxg5VMAAW0sYsfUt+WUQwflZM96liPXuEUR7pw9+h
	YJPShfiPKZniK619sE11wG8dc3I4qU95jPG9eXGXcihhs2cLFNiz4w0j75mHa1QJVEN0Ek2Lx37+r
	GaFVwMXyVjOnUKZ5QxSaQd98+e5Rsl9h/tBXxm4vBXI8tXA/h239Az2rUI3gBcRfsasRSvKvnj6Bw
	Em2K4Nog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXx6-00000000aYL-0BH0;
	Thu, 11 Sep 2025 03:26:28 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwXx3-00000000aXM-3ahG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 03:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=y0emQFrKhNRaK9F8r9wT8+xRJD7zvWcKi6l+Zuoa3vU=;
	b=WmGY6S1tqjFy/BldE2CA52isqt8G20G5GJV0T5WeYkKUgwJ6DNMyfUi+jg8g9w
	sEglbfjRxxm46O72IGqWPhkx0prJDjJZzpAiiKTV5x5uIVBYCChyKzqtnhMn6RwT
	2qw0falr7x80qRxvDOCJYszSSrGW0GDVeVm0mT4N/N888=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCXnvYzQcJor49gBA--.42817S3;
	Thu, 11 Sep 2025 11:25:41 +0800 (CST)
Date: Thu, 11 Sep 2025 11:25:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Peng Fan <peng.fan@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Amit Kucheria <amit.kucheria@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Correct thermal sensor index
Message-ID: <aMJBM3GANP3NtJkK@dragon>
References: <20250905-imx8mp-thermal-v1-1-64401ac8edb0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905-imx8mp-thermal-v1-1-64401ac8edb0@nxp.com>
X-CM-TRANSID: Ms8vCgCXnvYzQcJor49gBA--.42817S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7jg4UUUUU
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgnFZWjB-SqphAAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_202626_238260_3C91F6CE 
X-CRM114-Status: UNSURE (   9.96  )
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

On Fri, Sep 05, 2025 at 11:01:09AM +0800, Peng Fan wrote:
> The TMU has two temperature measurement sites located on the chip. The
> probe 0 is located inside of the ANAMIX, while the probe 1 is located near
> the ARM core. This has been confirmed by checking with HW design team and
> checking RTL code.
> 
> So correct the {cpu,soc}-thermal sensor index.
> 
> Fixes: 30cdd62dce6b ("arm64: dts: imx8mp: Add thermal zones support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied, thanks!


