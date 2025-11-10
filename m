Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BB4CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6EdUrtGOgPUXIy8ofOhog5nFCSibC5nE5AJRWXwH2A=; b=LKQkwIz183Vde45CZ7VISKg8v3
	Y0bC9aoyxsquFMiEfNne7oLKRy5hVbyhzS7DcB7RaoqATHVfGMtt8JlP4QucZIg9kbJCCzssYJc07
	NpkiSdn4Q99I34Rcx/IwyVE1F48//W0ZNSs78szXKlpTmnBPA/IkyKb5hXQi64aZdgCkwQnYcOdND
	/j6995nVdcKI8WJOsA7F7RY468M6K2I+EjTmx7R2imHBDr+0J2C4hYOhqfRQLu8G3ggRjvKjAM7eU
	ecltIdOnUYt7iRPOKuvyLKuprS4JM+j5ElJhDSJIE7cXoSt+aAahnmkK4NGNdn58Cv9YTy3PUBJUt
	uC0zXThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUIs-00000005kXa-3gLl;
	Mon, 10 Nov 2025 15:59:38 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUIq-00000005kXA-1Kbq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=u6EdUrtGOgPUXIy8ofOhog5nFCSibC5nE5AJRWXwH2A=; b=Ox6XwAOdURwqkScwgJ8DNjCjRY
	uWzTHKNjxNlzagA73QE5DzDgE+I3YQNw8jLQXx8sVaoeAcu6ArCpjXL4xvTysJSHI2/p8mNzXXdsW
	SKEl0LDR4mbTNZ1yaiDeTWJHVEv3JIRxKO2422IJC/vGyvhb8wT6G7K5J0YYMNcHRa88=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIUIh-00DXM5-90; Mon, 10 Nov 2025 16:59:27 +0100
Date: Mon, 10 Nov 2025 16:59:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Message-ID: <638dac3d-ddcb-4d53-b06d-e0bd3d9077c3@lunn.ch>
References: <20251104203315.85706-1-shenwei.wang@nxp.com>
 <20251104203315.85706-4-shenwei.wang@nxp.com>
 <9fd8ccd9-560a-43b4-a48d-f7a3eaa07eb1@lunn.ch>
 <PAXPR04MB9185C4A4B91F863CFD49718E89C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0be8c911-3c31-40da-b431-e5a24339c0f9@lunn.ch>
 <PAXPR04MB9185D9EBE8F46715FD114A2989C2A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <cadcbbc7-2024-413a-8e9b-bde5fa233df5@lunn.ch>
 <PAXPR04MB9185E2C3E50D365F64F10E3A89C3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0980eb35-b3fd-4383-af86-433769a4fd97@lunn.ch>
 <PAXPR04MB9185156672C7B334E717F11789CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB9185156672C7B334E717F11789CEA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_075936_377983_AE15E1D2 
X-CRM114-Status: GOOD (  16.18  )
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

> The remote firmware does not need to know whether Linux is asleep. The GPIO is not used 
> to wake Linux directly; instead, it serves as a wake-up source for the remote firmware if configured 
> accordingly. Once the remote firmware is awake, it sends a notification message to Linux. This 
> notification is the actual event that wakes Linux.
> 
> This works because there is always a physical interface connecting Linux and the remote firmware. 
> On i.MX platforms, this interface is the MU block. When the remoteproc driver is running, the MU 
> block is automatically configured as a wake-up source for Linux by default. As a result, the notification 
> message can wake the Linux system if it is asleep.

You need to add a lot more documentation to the specification to make
this clear. As you said, the firmware and Linux have different
sleep/wake life cycles. How does the firmware know it is safe to go to
sleep, if it has no idea Linux is running or suspended?

	Andrew

