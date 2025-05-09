Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E41C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DLliCO1t/SFOSRBkUHeejJJ+CCq3T7Q5aAPydMePW8A=; b=W+0XJm3lb+DCvFV9c0CA+ZThdq
	7h3+PhS+ZrULXXmuieBFFd5nsS1IFpcFCmRhjkSrlcoH3Lm+qgK3GgefdHegAZT3KbNAdZSbSERjT
	y8oNJe+m2VTcx7G4II5CnuNm7bgRus5plrX2ZqZn8WlGj/mQDEn2gS2GmwAQQMrNUpnqkdFPI3hiL
	tSBuHxc4RvEihdb71Ufq19Si6ytuHm/z49ZfI6FfNlT5Y5aWB42UJIn5dot8EmvNpDehOQaRnoZIT
	zoVTKBh+/BVnIryWZS11tCL8lBkIQTSkb+GjETxC0ekgdE0vb63qtv5VHrDEUQ9Q1WduDSmuBfI9y
	EQoQaB0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKLW-00000003A9t-2AZu;
	Fri, 09 May 2025 09:48:46 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJZP-0000000315n-3Kmo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:59:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=DLliCO1t/SFOSRBkUHeejJJ+CCq3T7Q5aAPydMePW8A=;
	b=BHUfba6bHY10VKBkg4+2RAhj1CXxl1F83mzJaW1LHlL0XRVVYjDD7TAipEINSk
	F1Scu973CVyhBa124FB01AsQkFPOGAct7JYS26uYZmmJVeg2qzOHfiLO0hyS4J2k
	nAEXiWZJ9lXbO22xIL2gvfp0V3j6+dom9oGaDORePilEc=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXR_C5wx1oNGmpAA--.63149S3;
	Fri, 09 May 2025 16:58:35 +0800 (CST)
Date: Fri, 9 May 2025 16:58:33 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Message-ID: <aB3DuZMBIwsFXrVz@dragon>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
X-CM-TRANSID: Ms8vCgAXR_C5wx1oNGmpAA--.63149S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur18ZFWfGr15Xr1ktFWrKrg_yoW8XFyDpr
	18KFs3CFn8JFsrC3W2g3WYvwnIqFyvkFW8Xa9xu34qyasxtFsxtr4qqr15uFWDJr4fWr4F
	yrnIv347Aw4rZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UkOz3UUUUU=
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAlIZWgduuwjLgAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_015904_144736_09C1FCD5 
X-CRM114-Status: GOOD (  20.64  )
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

On Fri, May 09, 2025 at 08:42:38AM +0000, Maud Spierings | GOcontroll wrote:
> On 5/9/25 10:17, Shawn Guo wrote:
> > On Thu, Apr 17, 2025 at 12:14:04PM +0200, Maud Spierings via B4 Relay wrote:
> >> From: Maud Spierings <maudspierings@gocontroll.com>
> >>
> >> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM
> >> module bindings.
> >>
> >> This support is not officially done by Ka-Ro electronics, if they at
> >> some point will supporting mainline, this should be changed to them.
> >>
> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >> ---
> >>   MAINTAINERS | 6 ++++++
> >>   1 file changed, 6 insertions(+)
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91fb6431570045495ec23 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -12779,6 +12779,12 @@ S:	Maintained
> >>   F:	Documentation/hwmon/k8temp.rst
> >>   F:	drivers/hwmon/k8temp.c
> >>   
> >> +KA-RO TX8P COM MODULE
> >> +M:	Maud Spierings <maudspierings@gocontroll.com>
> >> +L:	imx@lists.linux.dev
> >> +S:	Maintained
> >> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> >> +
> > 
> > I'm not fond of such changes, as MAINTAINERS file could be bloated
> > quickly by individual DTS.
> 
> Is there some way you would prefer to see it? I don't really know of a better
> way. 

There was some discussion about getting ./scripts/get_maintainer.pl pick
up the Author: field (in DTS header area).  But I'm not sure where it
ended.

Shawn


