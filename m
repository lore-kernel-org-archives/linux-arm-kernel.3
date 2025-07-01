Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CB9C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwWG8EAzKyju2ovmVpNM1zaGxigyV87GlRZT34i7jEc=; b=ii6zaDy1uH82FFXNRVXbHdRGXo
	NkZ8xFFyHOmWbbA/dm5/QyO3VCiDOB6oAO10vrfJcwVlAiUF5mdrvpQxCSmR5lMVAoFxsV51aGqwF
	U8w1nz5KRM0STLAOE4ZBclYyOeox0Q3zQAdUgo9HUxCkLp5LoFGCPuWdEh7/i3Nr2k1q9G7omEgFd
	i/VeK6/4zPm0j6uoJPB8bhdwQgEVCbfyqDLsI2oYxy5sxxTRmmqHn6gASUr4dXz91raXlMhZvVAQm
	XsO9rq8utTMCvLMNHd8PH7NF2uvLIMDViZYINi33xwYl1Y4Ytfdhea9vvHE5DJUCjM+duXr5/1QfB
	uoPyS1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY7I-00000004joI-1PlO;
	Tue, 01 Jul 2025 10:21:32 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWY3O-00000004j7b-2xXt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 10:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FwWG8EAzKyju2ovmVpNM1zaGxigyV87GlRZT34i7jEc=;
	b=OzOsME4SUejXZXRUHNAw9BNQri32GIpRd25+TV67NIkjLVWPxv2SsomPyDSX5K
	kxpPjUpQ3gNiXJq4E3SiFu0uSZ87pSKW1hYC+4Pkqs2mXXehwACEJR+etDRdImSv
	2kRllq8jQpqTEYVNx/B1Ep8yhX7SJQe/UKsPL4qXLf82A=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgD3v1pitWNoVEw9AA--.20470S3;
	Tue, 01 Jul 2025 18:16:05 +0800 (CST)
Date: Tue, 1 Jul 2025 18:16:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Frank Li <Frank.Li@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Heiko Schocher <hs@denx.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/5] Support i.MX28 Amarula rmm board
Message-ID: <aGO1YiHpGb0EmWbv@dragon>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Mc8vCgD3v1pitWNoVEw9AA--.20470S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8uc_UUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgV53mhjtWUsrgAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_031731_040506_A958C32A 
X-CRM114-Status: UNSURE (   6.67  )
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

On Fri, Jun 20, 2025 at 10:06:16AM +0200, Dario Binacchi wrote:
> Dario Binacchi (5):
>   ARM: dts: imx28: add pwm7 muxing options
>   dt-bindings: arm: fsl: add i.MX28 Amarula rmm board
>   ARM: dts: mxs: support i.MX28 Amarula rmm board
>   ARM: mxs_defconfig: Cleanup mxs_defconfig
>   ARM: mxs_defconfig: select new drivers used by imx28-amarula-rmm

Applied all, thanks!


