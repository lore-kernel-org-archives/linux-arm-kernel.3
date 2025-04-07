Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA51C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++KpZ5uwY1Janf+N2PmBTtktOp7tWbX3i2J7W2ip/E4=; b=IkM0YfDzodtwMSqkhU80Bj2UJI
	hSBvsfHfKJTwcaFUxck80aCPkmoazcPoutUkF/+K99z1dKKlrgZFbIFG4KqpHgZGZM3dSKtaYe7rJ
	gSgKkztbANnb+onkj2xyBuzDI10VQ/gbVPyVbj4g9DQz+XE6wZxIv6EVEq2G0+p80EiGPDJ8OsXza
	dO/Uto1Nt/9ehkjdRpUUQyzAyQtECmBDs5MzJlmMm/aHtK5zhC8VTFGhDPqsYHX9RFxSFWlkl6A2p
	c++skHAn+tOIpPx1odzP+iNTviovC18ltN1/QAJiw822e485S2y0eTu6CrFx974ZfUqINk2YDAp7H
	aW7oh3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rZd-00000001fE0-1rfs;
	Mon, 07 Apr 2025 18:51:57 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qSy-00000001OsY-1Bfm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 17:41:03 +0000
Message-ID: <ed5990bd-e671-4f96-bec8-543de3b48712@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744047656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=++KpZ5uwY1Janf+N2PmBTtktOp7tWbX3i2J7W2ip/E4=;
	b=DK9a5CGfgWrjLUaQxeq3ptm/moAts7IV3ci0gsTJzHJivLe+sJaFymatq0QIC6jWTCNwMu
	Q99N888ii24jACU37tbV8TN2AH/EV9OfsoMU0BFj8NRJZh5cUxFBUwwkPmdN5RROHGw35w
	0Rl++5YUu0v1A2j5dPo8wVs5LvznUIk=
Date: Mon, 7 Apr 2025 13:40:45 -0400
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Daniel Golle <daniel@makrotopia.org>,
 "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>,
 UNGLinuxDriver@microchip.com, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linuxppc-dev@lists.ozlabs.org
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
 <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
 <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
 <Z_QKl-4563l05WB3@makrotopia.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <Z_QKl-4563l05WB3@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_104101_196697_FC4CB43E 
X-CRM114-Status: GOOD (  15.27  )
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

On 4/7/25 13:25, Daniel Golle wrote:
> On Mon, Apr 07, 2025 at 07:21:38PM +0200, Christian Marangi (Ansuel) wrote:
>> Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
>> > I agree that a "cells" approach would require this, but
>> >
>> > - There are no in-tree examples of where this is necessary
>> > - I think this would be easy to add when necessary
>> >
>> 
>> There are no in-tree cause only now we are starting to support
>> complex configuration with multiple PCS placed outside the MAC.
>> 
>> I feel it's better to define a standard API for them now before
>> we permit even more MAC driver to implement custom property
>> and have to address tons of workaround for compatibility.
> 
> Qualcomm's PCS driver will require offering multiple phylink_pcs by a
> single device/of_node. So while it's true that there is currently no
> in-tree user for that, that very user is already knocking on our doors.
> 
> See
> https://patchwork.kernel.org/project/netdevbpf/list/?series=931658&state=*

OK, but I still think this is quite easy to add.

--Sean

