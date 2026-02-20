Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F18DC5AD46
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 17:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdZF070E8JEKFJ0ME18+O+yF2DoTp5fyPreGsFn+SZ0=; b=mDVYnmyRqLRFX9MFexPNPssNUz
	4VkjzUNb4WCIsMZA6wNvRwz9UgekKrmU1oJNjjDu8nwY1ointiUuruCBNCgOzeG4wktJ6fTaqSgK/
	XaGpdrj7ctWo0FUoaSrFf/xfoXjz+rxTcBVBnuL83Zw2rpyr4snPRq1J9GvRssj+HCKsWX1ZS402s
	4/IK/OxFe5expfTE829caSu+8AogItmegxSL+eOlJtFLJaD06cHiUZ1hSHmhqK1FuZUY9aqXNQbF5
	Shuq2FqqHGXO2AWVq1VxIf6KYKT0mNsf4DgfM0mTylbwOYU6k0aD64C5ivdZuNyPuUIgGAr/vhmQ6
	GAGRmN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUWE-0000000FO97-3ptc;
	Fri, 20 Feb 2026 17:42:22 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtUWC-0000000FO8d-2qZ2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 17:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=vdZF070E8JEKFJ0ME18+O+yF2DoTp5fyPreGsFn+SZ0=; b=i8
	sVh473vtyNr0NN+4ABdvFxzHyvBLjizBTrtIxTnRKAjRoaWKMkWJHu463u8nW+OWkYS3tckuj74YM
	uAKLnhkU90bukc0fg8jxUzzyKyBpfRlORCLdxZN1V4t1wHtvdvuD2p6pVW1EcjeUHrr5dEJSO2EVx
	jdU0AIYbJQG9X1Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtUVx-008670-UJ; Fri, 20 Feb 2026 18:42:05 +0100
Date: Fri, 20 Feb 2026 18:42:05 +0100
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
Message-ID: <68c5f96c-124f-4d81-9dda-8e4b6bacbeab@lunn.ch>
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
 <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <PAXPR04MB918582EE33F7BD5C26259BB2896BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <7669d7dd-96a5-48a9-b051-875e9fbdad58@foss.st.com>
 <PAXPR04MB91858E7125B2A4F21DDB78FD8968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <c9d73e40-ab27-4403-9ff6-a3503568fe3d@lunn.ch>
 <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB91851BF97AEF1C5B728865448968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_094220_719397_8F6E7E94 
X-CRM114-Status: GOOD (  16.33  )
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

> > > struct msg_hdr {
> > >     u8  id;
> > >     u32 size;
> > >     u8  flags;
> > > };
> > 
> > That is just a bad design. The point of not allowing __packed is that it forces you
> > to design your structures correctly. Maybe AI has no idea of taste, but Maintainer
> > do and would not allow a u32 to be unaligned like this.
> > 
> 
> Let’s keep the discussion technical instead of taste. 😊
> 
> My point with the earlier example was simply to illustrate how layout differences can 
> happen across architectures or compilers. I’m more interested in understanding how 
> you would prefer this specific structure to be defined so that it avoids unaligned fields 
> while still maintaining a stable on‑wire format.

struct msg_hdr {
    u32 size;
    u8  id;
    u8  flags;
};

The compiler will lay this out as you expect, it won't add any padding
between the fields.

You need to be careful with sizeof(struct msg_hdr). On 8 and 16 bit
machines, it is probably 6. On 32, or 64 bit machine it is probably 8.

I would say having a 6 byte message is probably a bad design, and you
should try to make the u32 a u16 if you can. Again, not using the
__packed is making you think about the design, and probably makes the
design better as a result.

    Andrew


