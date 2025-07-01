Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEACC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UgVcaTMaZwQKG0vFQL59Zz76XRt+0Z5vWGwWG9Mrcpw=; b=ucVupCcpacqRVdaMhnc6BLG37C
	RdLX7RsrSlbwsSm9Mafb+qiDEzoOcucRIafjSnNTPLvtf/XiLd+8u/VqrrSrsKDX1ZCY+fK2wPsUP
	TD+fT8plQFxbYKP8hHO5M68/VdveIQB7GFOb5Hp1nN8vfhjFjkxf5wXNL11XTSDv/bjRE2/dayZQL
	N5TMpdSEOrgjeiKbGA6cdSdd9x0ksQ3GcgxFpxrIjpv3rhesgrCAIqSTV92UTI2gWak/SWRFDOdYY
	AXAnOSRCxDKzt2/xoTH2rFZU8l17wspvszhtntbeqjuQCGvfSbrpwn1zPIFAQI7kKuvLZkl0EGZ8D
	UXK4xeeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdKp-00000005x2R-2ms9;
	Tue, 01 Jul 2025 15:55:51 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbk4-00000005ekJ-2kvN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UgVcaTMaZwQKG0vFQL59Zz76XRt+0Z5vWGwWG9Mrcpw=;
	b=gFuevKNRJo4o54DWHlJLiUMQBuWMzoWzwImK/JXY8XYu7CrEvAqhSaeQ8LYDTX
	50TbYpj26O6tdp9RbFri9qZ+zKFzLkXuEySPe85cbSIB2mxygYXOX9Uh2T4jnZb7
	ZbtHQDkaQPu+H898TFGKZAj/2iOFtPypm+GE5pdUFUuxA=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3l9r37GNoUbwBAA--.4338S3;
	Tue, 01 Jul 2025 22:13:13 +0800 (CST)
Date: Tue, 1 Jul 2025 22:13:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3] arm64: dts: imx8qm: add system controller watchdog
 support
Message-ID: <aGPs9wGBLKGiTdVq@dragon>
References: <20250609-imx8qm-watchdog-v3-1-5c22618606c8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-imx8qm-watchdog-v3-1-5c22618606c8@bootlin.com>
X-CM-TRANSID: M88vCgD3l9r37GNoUbwBAA--.4338S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUw-eOUUUUU
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIRls0Whj7Pkt0wAA3l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_071349_069347_6452CB17 
X-CRM114-Status: UNSURE (   6.46  )
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

On Mon, Jun 09, 2025 at 02:02:34PM +0200, Thomas Richard wrote:
> Add system controller watchdog support for i.MX8QM.
> 
> Acked-by: Oliver Graute <oliver.graute@kococonnector.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Applied, thanks!


