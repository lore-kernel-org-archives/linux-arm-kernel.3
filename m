Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC1CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 04:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzECtJsIWw4uXwE207Uew56sWP/Hi8jDptmOvx0q6Rc=; b=P3V8eZDVZWO08sFZFz03+RQNUD
	mwu4YoBjN6cZYxhzHtufgAB8uqwBHnkLgnYnySuqpn7mx+VgxUEeC/g/l8g8qdTwSqs1KgG2SDIa9
	UQqOjP/Ci+724Jf1WhnX/aegxwwfojHP4aSDK3W7IPupYYZsXRua5E0qlTdyYHdIJWsvlmKjIx+LI
	PbvzSxll/fRZSKEqmcAIpayyBd0OJ4i8I1ocsJcJtEO7+nhkEKJCQbU5BuXLGxgi+j+kHbrepKThT
	otAr/56W1GNYENtwbE7jiWKR3gpwKE+lCzRAxO+SWqCYov//mlnx1j4dstrL08iw5p34smIHOXaRH
	x+lmF+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTzW-0000000ELf9-0QO2;
	Sun, 16 Nov 2025 04:03:54 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKTzT-0000000ELeg-2ebP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 04:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=SzECtJsIWw4uXwE207Uew56sWP/Hi8jDptmOvx0q6Rc=;
	b=ChXMptBtzotGwu9WczLRdZ1I9cBfwNwr+3Tjt932mnVvxSWKoRxCitSitQoc65
	HjQj36I71NvU9ew6GP1w+iOj6dmnBUw2d5MyEwapujYfCbu2TNCuvOIjX5gwUPyN
	FnLI30+SPmOKeOKYSjzOcDtQz3ViqXXZ58rfGdG0VuQ10=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnS5gQTRlpbiE2AQ--.7844S3;
	Sun, 16 Nov 2025 12:03:30 +0800 (CST)
Date: Sun, 16 Nov 2025 12:03:28 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com, Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] ARM: dts: imx28-amarula-rmm: add I2S audio
Message-ID: <aRlNEJLVvFpEwf4o@dragon>
References: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: Mc8vCgDnS5gQTRlpbiE2AQ--.7844S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU7YiiDUUUU
X-Originating-IP: [117.82.150.42]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhL3XWkZTRJ-8wAA35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_200352_298680_650345EC 
X-CRM114-Status: UNSURE (   8.00  )
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

On Mon, Oct 27, 2025 at 05:10:23PM +0100, Dario Binacchi wrote:
> Add support for I2S audio on Amarula rmm board. Audio codec
> TLV320AIC3X is connected as slave to SAIF0, which provides
> bitclock, frame and MCLK.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied both, thanks!


