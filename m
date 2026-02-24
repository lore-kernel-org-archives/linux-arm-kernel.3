Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413CAF4BB66
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0B3jcTNUQM4dYgkUTVaMAfAHtbtRMSVxu9Gvpkl5SlM=; b=2IPbHeOwUrBHpWKpatu3nyhVw4
	J8vl0t6+IHaHvlVT0uMF4/kNPmoiGvBM5+p0gmuijOnYb/l2D6qfV2r328To3NIRG2RXio2g8XTdz
	1xnghvaX8G8A3nmEe2PJ6dTWmICX0RG29ZzSf2mj6HHGZCu/+1qwKm0Uh3cid8+nUf7KAy1xTk7lv
	B6C1PRn+XIVnn0xa4o8AzKYt6TFZDWsESD0dsZbwTkelWflQvWbE0ih/H/OCzbIlp3/FV/Zdxf6vC
	udRJ7kpa3BWUzl/KAUZUf1U/6oW4NwQ1AfAV8c+3UMm7Ei9E+UzUDWB8kG3CpN0h3M+nz45UeSO3X
	0bmoYBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwG8-00000002Ulb-1Myc;
	Tue, 24 Feb 2026 17:31:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwG6-00000002Uko-15Xd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=0B3jcTNUQM4dYgkUTVaMAfAHtbtRMSVxu9Gvpkl5SlM=; b=mJ
	OKozCogVPMZiP3rAW+cNmMDp/bx1jxiidjm/0T1emzMGXkyvjcbPuG7xbf1irH4tyZi5C/H1186zj
	3v3vUGoMw3yAK/uybiMfdAFagVF/FGPYDZBSwntv45jfu+UQoVmWE78v4zcslAvbV2rJjehE1ydmC
	EMd07yKG45mshgI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vuwFr-008dOV-Dl; Tue, 24 Feb 2026 18:31:27 +0100
Date: Tue, 24 Feb 2026 18:31:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Message-ID: <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
References: <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_093142_297260_981CAD8F 
X-CRM114-Status: GOOD (  11.93  )
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

> Hi Arnaud,
> Glad to hear you find this approach reasonable.
> To be more specific, I’m proposing to do the following modifications for the protocol:
> 
>   - remove the “id” field (Message ID Code)
>   - remove the “reserved[5]” field
>   - and also reorder the fields so that port_idx appears before pin_idx
> 
> If you think additional fields should be removed or adjusted, please let me know.

I would squash head and body into one. Remove vendor and version. Do
we need both cmd and type? It seems like they can be combined. And is
port_idx needed? Don't you just instantiate more instances of the
device, one per port. That is how you would do it with MMIO GPIOs.

struct gpio_rpmsg_packet {
	u8 cmd;
	u8 pin;
	union {
		u8 event;
		u8 retcode;
		u8 value;
	} out;
	union {
		u8 wakeup;
		u8 value;
	} in;
}

4 bytes, a nice size.

#define GPIO_RPMSG_CMD_DIR_INPUT 	1
#define GPIO_RPMSG_CMD_DIR_OUTPUT 	2
#define GPIO_RPMSG_CMD_GET_DIR		3
#define GPIO_RPMSG_CMD_GET		4
#define GPIO_RPMSG_CMD_SET		5

These map onto the gpio_chip ops. And i leave space for the _multiple
ops if they are needed in the future.

#define GPIO_PRMSG_CMD_INTR_CONFIG	32
#define GPIO_PRMSG_CMD_INTR_EVENT	33

And then interrupt handling. These are less obvious, struct irq_chip
has a lot more ops, so i'm not very confident this is sufficient.

	Andrew

