Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A95ACCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+vUWpJtVmzOn5MTORlZ3b/sdwMlGIAQws10+cLlGxQ=; b=XTGrWR/foVgrd/pQsV/jyDkZwT
	aKAm6mbUAyLMN1/KRnxIgPPvtFWAcb5J0StSJ1idhRw7V9BAtZRcrT/0B1RdrH3u557mKblKjVpQq
	n4t1dufHjgVQjKJM+gFkcbCg/MYIAMOvx8CUaGFPgtCd2Tkf6Kl55QBNbUoa3KVH8rTxvaPFWv2/x
	dv+r7AX7jzDl1CKO7jWPxa6Jkua7rPf6jDOtJcs0izV/oduiJ1EleyrUr9SsfUUjrNFDjImxBoJNH
	JTsLrTL9Lg++0/n7YrkehjSRxNNK6h9jZuV0GWFWSG/cbClRMXAViNT/SWLGBS1sO4EzuP1rveU5Y
	xpcP6mkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJB6V-00000008rXJ-0du0;
	Wed, 12 Nov 2025 13:41:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJB6R-00000008rWt-0ZtO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 13:41:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R+vUWpJtVmzOn5MTORlZ3b/sdwMlGIAQws10+cLlGxQ=; b=ACMQ03cCbAnsPU6sBkJXhbIgOq
	mEJdROqQbkotw5sR7Ju16UitwLqSNDMbrJx1T2LdTNQFt5vZ10u60Gv1t2kJck6bmgFdpGgatkxvH
	MtKrAtOy035ybPOc/OeXEz/0bcsE3twKCQoKGNZSsibTSFrr7Z67JsPW7zKywAtTqPPg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJB6I-00Dke3-O3; Wed, 12 Nov 2025 14:41:30 +0100
Date: Wed, 12 Nov 2025 14:41:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
Message-ID: <9bcd63d2-f75f-4cb6-a81f-eefc983a99bb@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
 <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB9176F105B09FF939B22B85E589CFA@AS8PR04MB9176.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_054139_183839_17CF6A7E 
X-CRM114-Status: GOOD (  13.99  )
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

> Hi Linus,
> 
> Thank you very much for the review and suggestions.
> 
> Would it be feasible to use the reserved field for this purpose? This approach would maintain 
> compatibility with the existing system.

Since this has not been merged yet, there are no existing systems.

It is well known that what gets merged into mainline is often
different to the initial out of tree version. You just need to deal
with it. One option you have is to set the vendor byte to 1, so
indicating NXP. If Linux uses vendor 0, it might be your out of tree
vendor driver, not the in kernel driver. Just document in the
specification vendor 0 is reserved.

You are going to have to modify your firmware anyway, level interrupts
are broken. And this is an example of why quirks are needed.

	Andrew

