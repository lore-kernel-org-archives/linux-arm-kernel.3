Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B2ED767F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFuLgNX9fkcpPMjhL7ilmrg9CYQNaS7krIOTJ2ukDpY=; b=Y9JaTEYPXi/llAxSstFJlhuOAq
	sLJQ/AP3CTTPMIfQ556nxo2fQctwJSXeT+tEFcdOphUrWsCJSo5ZYhI+dwZTbM2I8Ju28Ko4QQkAB
	4GHoeTEoONe2MRTsTyhv8d1WwRmDnvQTr8qGxFoZTlivk+nopbK6u/yyqjVVl3paQ89cvV+yuxwfb
	rLduP055/a8harj/yAXOdML3/qFMwFQlIAOwGhiEKqzA1Vxp7uMnl7Sb+g/Gs6+Bhssu4XxG3cqcY
	dHkWwnUnLCX1uNdoo6iNCrBvu4L/oXuLqJEE8DJro7yKUTyuSgcASG2tmnuDuKUQtVWtoYk4AdYz7
	0Ij7zM+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oHG-00000006SEf-0NgI;
	Fri, 01 Nov 2024 09:49:10 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oFA-00000006Rnf-2FzS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=QFuLgNX9fkcpPMjhL7ilmrg9CYQNaS7krIOTJ2ukDpY=;
	b=HviupgDXgAzd3KIuYZWn43osSUPIGJqwozopHAcfiKxR9rdFfDExPtlg4NJH0U
	+4kzbhgTZESmPbeWwaJUV5ISNHAE7SbjFqbd8anewriJVi5ig2DK8Y60oIGGI7nD
	tNJZi/folM9usJW9Hn99SPul5eCpUVPAFsk9ZxusVosUg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgA3_q9_oyRnxt5gAQ--.13557S3;
	Fri, 01 Nov 2024 17:46:41 +0800 (CST)
Date: Fri, 1 Nov 2024 17:46:39 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexander.stein@ew.tq-group.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: freescale: mba8mx: remove undocument
 'data-lanes' at panel
Message-ID: <ZySjfxOXOB4+xyZa@dragon>
References: <20241022202342.1263766-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022202342.1263766-1-Frank.Li@nxp.com>
X-CM-TRANSID: M88vCgA3_q9_oyRnxt5gAQ--.13557S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdWFUUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEguKZWckdPuMCgAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_024700_965576_EFD46498 
X-CRM114-Status: UNSURE (   5.98  )
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

On Tue, Oct 22, 2024 at 04:23:41PM -0400, Frank Li wrote:
> 'data-lanes' is port0 of lvds bridge. Needn't set it for simple panel. Fix
> below CHECK_DTBS warning:
> 
> arm64/boot/dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds-tm070jvhg33.dtb:
>    panel-lvds: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
>        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


