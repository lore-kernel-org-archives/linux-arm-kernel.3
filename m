Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C90EC369DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqGy6AGDXmPuhmrNaiPoFm++SOCSCkQPmn450Ps2+rs=; b=XvB15+IMNbPjNVInyOgAZqFbZs
	teCLEzU8uZo5n8WqyFXkdrNIer69PdhH1Yp8U1tzroWPD9UbLuspSjMorOtfl2oi2w+DY02eugYub
	W89eOEihoXjRY0Onmcwt0649P/jooqZDyu88liuY7C1iUWogootnW9Xm/3COu6m3tgslYSFJJw0RU
	lryXyP3BwTqOGbVYcapWCEpp+RVYdMyapjpjgcPV1qYei681Ebg/VuD6mTzilWklNDCXO40vOvUyX
	7g4TLBwqDr2ah6ePacJIY/C/zRQoG/fLCGphvvnW8bWPDPjbtAtqXlXpQ8KIGBdukknUxFyeZSOsa
	RFh73olA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t1C-0000000DWfe-0Ayh;
	Thu, 24 Apr 2025 09:37:18 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qtW-0000000D85W-2tpX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:17 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 796CA1F90C;
	Thu, 24 Apr 2025 09:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745479270;
	bh=HqGy6AGDXmPuhmrNaiPoFm++SOCSCkQPmn450Ps2+rs=;
	h=Received:From:To:Subject;
	b=K39LRWInL/zLuHS7xqUi2Z4R893ZAMsKsXwhk/xaRss5Vvks9u4dJeQcaLYBzQvcO
	 3T0sORXKADxL0FBKCj8djdaGm1E7TQCG5mUFdGwnstblB+mUKfXQWf2zN/8md06x0u
	 CAtWUE0SAXjzxl4ltaa+slMv9xQD5fpH8B8MrjjCWtPMW2uldiE2EUoIa65PI7pp6U
	 zSOyGTV3csQxE2HVOui1Yggs/wudjvVGToz+tFVLlIPYEXHcGKxoxalZ4PPEG9xLU8
	 fPUYRiY+FqHmya/Tq3Z8DWZMsaoNXQ+1ucMBjGPWFpw6ta37dJ5DEgzzEYGkXweCrR
	 LG2OlWVZCoG3A==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 25D517F934; Thu, 24 Apr 2025 09:21:10 +0200 (CEST)
Date: Thu, 24 Apr 2025 09:21:10 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
Cc: Philippe Schenker <philippe.schenker@impulsing.ch>,
	Francesco Dolcini <francesco@dolcini.it>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: EXTERNAL - [PATCH v3] arm64: dts: imx8mm-verdin: Link
 reg_usdhc2_vqmmc to usdhc2
Message-ID: <aAnmZkpuaMOU0n2J@gaggiata.pivistrello.it>
References: <20250422140200.819405-1-Wojciech.Dubowik@mt.com>
 <20250423095309.GA93156@francesco-nb>
 <222ce25ee0bb1545583ad7a04f621bac2617893c.camel@impulsing.ch>
 <aAi_PPaZRF26pv_d@gaggiata.pivistrello.it>
 <9eb7b15068eb8a4337ad0ea2512d02141afd491c.camel@impulsing.ch>
 <aAnXK0sAXqfTNaXg@mt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAnXK0sAXqfTNaXg@mt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002115_654552_98798C5F 
X-CRM114-Status: GOOD (  24.61  )
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

On Thu, Apr 24, 2025 at 08:16:11AM +0200, Wojciech Dubowik wrote:
> On Wed, Apr 23, 2025 at 11:23:09AM +0000, Philippe Schenker wrote:
> > On Wed, 2025-04-23 at 12:21 +0200, Francesco Dolcini wrote:
> > > > > 
> > > > > I would backport this to also older kernel, so to me
> > > > > 
> > > > > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support
> > > > > for
> > > > > verdin imx8m mini")
> > > > 
> > > > NACK for the proposed Fixes, this introduces a new Kconfig which
> > > > could
> > > > have side-effects in users of current stable kernels.
> > > 
> > > The driver for "regulator-gpio" compatible? I do not agree with your
> > > argument,
> > > sorry. 
> > > 
> > > The previous description was not correct. There was an unused
> > > regulator in the DT that was not switched off just by chance.
> > > 
> > > Francesco
> > > 
> > My previous reasoning about the driver is one point. The other is that
> > the initial implementation in 6a57f224f734 ("arm64: dts: freescale: add
> > initial support for verdin imx8m mini") was not wrong at all it was
> > just different.
> > 
> > My concern is for existing users of stable kernels that you change the
> > underlying implementation of how the SD voltage gets switched. And
> > adding the tag
> > 
> > 
> > Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for
> > verdin imx8m mini")
> > 
> > to this patch would get this new implementation also to stable kernels
> > not affected by the issue introduced in f5aab0438ef1 ("regulator:
> > pca9450: Fix enable register for LDO5")
> 
> I will wait a day and send V4 with what I beleive was result of this
> discussion.

My opinion is that we should backport this fix. The DT description was
wrong, that change on the PMIC driver just made the issue visible,
the DT is about the HW description.

FWIW, I tested this change with both v6.1 and v6.6 and it works correctly, as
expected.

Francesco


