Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1108C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFg4OMSXqyZAd4XoQGwUdaygVVdJ30SNWIcU9tJnxO4=; b=chwR6S8ByCzOjzaD0zq2DPtN0N
	RQCyoDn/cDGBhgojdpkxpdxB/VsZul2b6cf92S257VEguw5ZUS4NuVHa0yU7VwgtM+615J9LNXI2P
	UPMVY4AYV+zzlnMCdb8z+f1nS8YXDk5iLBGkqdF9zjR6VZ2g7NGA9c+HqvTgyF37Gz4FV8gtgsVQ5
	4cXdMJrzR1y6etIWZMZ48UH2T4A7OkD/J81m5KoBwJvmPQx4REpwYa+KUa0+Z6ezyi3aHADxsbSaE
	mTVXvPecM8ZTcpKxWc6CEQslXH/+JHJjqxXANHOzuIGZgdjq3SLcW4RLImgq54wHIcX34ATz3n0jh
	Eh0t7UQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYE-00000001cfD-1yRb;
	Mon, 07 Apr 2025 18:50:31 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pPr-00000001Dur-3Bpk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 16:33:46 +0000
Message-ID: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744043618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KFg4OMSXqyZAd4XoQGwUdaygVVdJ30SNWIcU9tJnxO4=;
	b=UJWGbxFqDDyMWF8b4G2fYOD53tA+BWAfWoGwac3pflGNx/7Q8PgHH198LIFtBZ+wsx8gh/
	XnnznK1WuR4pSzwX7dn9Bt8JcNWp1s5DrdqgsT/GTNhH4Vgnu+/qhtSKjA+JF6SZ4FceM1
	MRxTN0uezDbNPzPZHXbHspuUXvMOgC8=
Date: Mon, 7 Apr 2025 12:33:28 -0400
MIME-Version: 1.0
Subject: Re: [RFC net-next PATCH 00/13] Add PCS core support
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>,
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250407182738.498d96b0@kmaincent-XPS-13-7390>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_093344_636745_B6050DCA 
X-CRM114-Status: GOOD (  17.35  )
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

On 4/7/25 12:27, Kory Maincent wrote:
> On Thu,  3 Apr 2025 14:18:54 -0400
> Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> This series adds support for creating PCSs as devices on a bus with a
>> driver (patch 3). As initial users,
>> 
>> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
>> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
>> - The Cadence MACB driver is converted to support external PCSs (namely
>>   the Xilinx PCS) (patches 9-10).
>> 
>> The last few patches add device links for pcs-handle to improve boot times,
>> and add compatibles for all Lynx PCSs.
>> 
>> Care has been taken to ensure backwards-compatibility. The main source
>> of this is that many PCS devices lack compatibles and get detected as
>> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
>> the devicetree to add appropriate compatibles.
> 
> I don't dive into your patch series and I don't know if you have heard about it
> but Christian Marangi is currently working on fwnode for PCS:
> https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> 
> Maybe you should sync with him!

I saw that series and made some comments. He is CC'd on this one.

I think this approach has two advantages:

- It completely solves the problem of the PCS being unregistered while the netdev
  (or whatever) is up
- I have designed the interface to make it easy to convert existing
  drivers that may not be able to use the "standard" probing process
  (because they have to support other devicetree structures for
  backwards-compatibility).

--Sean

