Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E55D111B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N38imsf5cp7S0lOP1h1HxtPzgaChkTFKnOWU1LwG/Rs=; b=HWhKY77lCSRfR1LpSkf2lX3wcW
	1V8tcBeV3DjfophI57JChXcqgPE5ig6rrsBsPsp3W13EPzcepmLt9hsh+R+jKuemJYn5sMqARmHIy
	cu7aIptCL0fm5GbWJNS+DejYxkRa3UVGCMs9hvWGQoleJzPSGid06vYwotpZjp9TNP5N4sttXQrf1
	noCMvisxdR7JJLGrF2xf9q1p7aaYNwItACY2+8P44TsK63k1v5QqK0VIsdV4qlsBphW+BMlP4ba5s
	iBQcNRz6lpg16G9S8lm1zCmkYY1bx/njyFSTfsx7VUYzKzt6p4qqUQ762nishvleqxwCdDPpyTeVQ
	soQJOaEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rJ9-0000000Cpld-2WDB;
	Mon, 04 Nov 2024 07:15:27 +0000
Received: from [1.95.21.16] (helo=mail-m16.yeah.net)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rHR-0000000CpVj-46Vx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=N38imsf5cp7S0lOP1h1HxtPzgaChkTFKnOWU1LwG/Rs=;
	b=XvRRJCLJT1VocPWDAzaWvfoBMjG1x9on01zL9kQTaoVWwzGsWLafs9dbh4QiYQ
	Li46IFRSLI1DJ10+ktYsSiU+1lR6xgAE6wCnjl6WiEGgpokbAbHmDI+YFSmgqHhT
	ECC2K9DDyQemrK/Gs7MuccKaS72iLXGCbr5q8je04Onik=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHCagCdChnUC2mAQ--.16752S3;
	Mon, 04 Nov 2024 15:13:08 +0800 (CST)
Date: Mon, 4 Nov 2024 15:13:06 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Heiko Schocher <hs@denx.de>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Message-ID: <Zyh0AgJZh1//17Te@dragon>
References: <20241031151238.67753-1-hs@denx.de>
 <20241031151238.67753-4-hs@denx.de>
 <ZydFO6b6oe9widaa@dragon>
 <5340fb82-bda0-d22f-23df-de620c8d61c3@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5340fb82-bda0-d22f-23df-de620c8d61c3@denx.de>
X-CM-TRANSID: Mc8vCgDHCagCdChnUC2mAQ--.16752S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUc89NDUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBCNZWcoXw4+BAAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_231342_647615_6C157671 
X-CRM114-Status: UNSURE (   9.13  )
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

On Mon, Nov 04, 2024 at 06:33:55AM +0100, Heiko Schocher wrote:
> > > +
> > > +		semtech,probe-reset;
> > > +		gpio-controller;
> > > +		interrupt-controller;
> > > +
> > > +		interrupt-parent = <&gpio1>;
> > > +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> > > +	};
> 
> Should I remove newlines here too?... but looking into the example from
> 
> Documentation/devicetree/bindings/pinctrl/semtech,sx1501q.yaml
> 
> there are this newlines ... so I let this lines in... or?

Not having newlines in middle of property list is just a style that
I prefer for IMX device trees.

Shawn


