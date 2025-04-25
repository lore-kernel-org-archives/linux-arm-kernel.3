Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29662C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 03:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxiKMycuA/S/b4aduDKHTJVt95lznX3mP7Vus3psjjw=; b=CWrA/AmfpfnOETZcjuF/eHD4eq
	RcOb5KcvX/3Gf2HGxP6qp197gLIyOKlnH9sgDXQlgWYdO9E3bOECM7hk/jSM2tiYbY8LBGVaoXDS4
	FwKvivfF3WW68nbT8hdONVeQZuMu8yA+tHCSOxQlb05VFV8b28hxTAUu/chrnchS1QigY96iHJ2F9
	GpEx8JYBH9FnZVsCoh6U3Vvbo63l4BRjm1qWTUNAsSzf8bFAOsn5xljNMzGekNmCCwMdOGSNVwx1h
	8HyJ8IxwnGPW2RxcoV6dNooGw64lkodzFroolrIGqai6l3UZa25y4iDuBP8izugwfHn/4ow5z36oe
	21XZmlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89Nj-0000000Fpow-2Po0;
	Fri, 25 Apr 2025 03:05:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u89Lr-0000000FpgT-1Dpx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 03:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qxiKMycuA/S/b4aduDKHTJVt95lznX3mP7Vus3psjjw=;
	b=VvxJ+dhMu6cRjtBkTzfZ+9gf0j6+3tBsuLq/z85fsYxjPQtBrikxTqdRjlaAri
	E27qhrS9dWDA2Fy36ElNxP+fB3I/aLI0C96hOTSwR29LWDMxkd8j0lnDjyTR51fd
	GylpjBrEnGjkmhVbR8POr+R5wE1dY0PYyP2FRHHqW3UrI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAna+J2+wpoIiTtAw--.35636S3;
	Fri, 25 Apr 2025 11:03:19 +0800 (CST)
Date: Fri, 25 Apr 2025 11:03:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: max.oss.09@gmail.com
Cc: max.krummenacher@toradex.com, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Add PCIe and SATA support
Message-ID: <aAr7dQH5O3VY7+N3@dragon>
References: <20250416151353.1692373-1-max.oss.09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416151353.1692373-1-max.oss.09@gmail.com>
X-CM-TRANSID: Ms8vCgAna+J2+wpoIiTtAw--.35636S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUx7PEUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBQ6ZWgK1S+unQAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_200343_641243_5F6A11FC 
X-CRM114-Status: UNSURE (   9.80  )
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

On Wed, Apr 16, 2025 at 05:13:41PM +0200, max.oss.09@gmail.com wrote:
> From: Max Krummenacher <max.krummenacher@toradex.com>
> 
> The needed drivers to support PCIe and SATA for i.MX 8QM have been
> added.
> Configure them for the Apalis iMX8 SoM.
> 
> The pciea and pcieb blocks each get a single PCIe lane, pciea is
> available on the carrier boards while pcieb is connected to the
> on module Wi-Fi/BT module.
> The SATA lane is available on the carrier boards.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Applied, thanks!


