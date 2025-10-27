Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB125CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=551Y0v0A1o0aoP7KQKW2C4ibdjJ4FOICqXnj3ewFFF8=; b=OcMsNamtq0rp6G18k04xsT9y5l
	YPc37LGmsxRb0xp5mCz7pAVWEWRTzYbsE5Re0yVUq32xyiFrHs40IUbXCjpJ+zds3T1h6T5/tlIRw
	oNUy4olOa43MV2iNENyYoIfJnrUh98tVqB3gQPzvDS6Hi+5CROMNWRrmipYX1UMhACq9n9nOZzIMn
	hU3vWnnXsNZxpipeU5d7KoTh9rDCeXnK2yC6cqUpODpRKDu3LwELA1Xx8iDu6Em/DU/dBRrf0DGkH
	xdKe0yGLrkaNePMh98g2LbRrZ5X8y0K2XnqLAYCiyDC+TWWo8jsBz3qcAQcxSEEBWy3ur8jLvPWvx
	wvNdTW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDH0M-0000000DDd2-1XS4;
	Mon, 27 Oct 2025 06:46:58 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDH0K-0000000DDcj-0V2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=551Y0v0A1o0aoP7KQKW2C4ibdjJ4FOICqXnj3ewFFF8=;
	b=qVfXX4rBeLJN0ings7Be1Q3eF2slGrTx6sTbjvp9PVatYv8DCe8beRSrrmW1KS
	Fgi8TYY6KNi0zaBPOZACoqrTR2aQh5XYwnWPrATqCHdL+XONAA5CZQW1m3BanhpB
	l6QjSq9MGLzrboCneaBotGd7pjyDeZJR573lh5tcnbQDE=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with UTF8SMTPSA id Mc8vCgDHnlZUFf9oEY8_AA--.44029S3;
	Mon, 27 Oct 2025 14:46:46 +0800 (CST)
Date: Mon, 27 Oct 2025 14:46:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx95: Fix MSI mapping for PCIe endpoint
 nodes
Message-ID: <aP8VVMFRTeQILNuq@dragon>
References: <20251017203947.2749779-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017203947.2749779-1-Frank.Li@nxp.com>
X-CM-TRANSID: Mc8vCgDHnlZUFf9oEY8_AA--.44029S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUO7KIDUUUU
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBZ02Wj-FVZDEAAA3I
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_234656_502400_F7043087 
X-CRM114-Status: UNSURE (   6.95  )
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

On Fri, Oct 17, 2025 at 04:39:46PM -0400, Frank Li wrote:
> The msi-map property was incorrectly applied to pcie0-ep instead of
> pcie1-ep. Correct the msi-map for both pcie0-ep and pcie1-ep nodes.
> 
> Fixes: bbe4b2f7d6533 ("arm64: dts: imx95: Add msi-map for pci-ep device")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


