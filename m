Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90D7E9410B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OUWXPe11/x8BD2MqUD+Z+GZ8DLN3/QOQxR6PexDgCI=; b=Q+wCbvovHzkppE5mZzxEhyrg5q
	7VgLrgS0DQFarRbIaWRwOS3Us3eSmz2kXdygNp7Y8oBErDXHx/dtUs/rRs2yOxHJrWlednxlQ3T0+
	hVTpv271buF9b8+k5fAKyxYDLWbVrznE6DR8ddo3/PgvlpPQ0v4tzOSNDsx5T8YtKhk7uZ6Kw/zEM
	hHu5KxqiHSpft8t4+hUFgaNRzbX6PzWDn07iQhrSZ99rJ48ZrR5sSgzmPFAOzxUxxXug99aeoBAGq
	KV3qS4Sof+GvNkFK+poDIqvR3CsMd3gpqnIDlDbYmixdJTxaawGn4JEUD+PZO/oq3LExSLlPXLv/D
	tm+nOz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbYz-000000081eo-40OC;
	Fri, 02 Jan 2026 09:35:17 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbbYx-000000081eK-2BfS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 09:35:16 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 39F47EC00BC;
	Fri,  2 Jan 2026 04:35:14 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 02 Jan 2026 04:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767346514;
	 x=1767432914; bh=1OUWXPe11/x8BD2MqUD+Z+GZ8DLN3/QOQxR6PexDgCI=; b=
	PqCcxRbFy1GQibYM3hsjMxW3Cp8zuJ30v4Zg+i+Ul89eB6AL/kl7BbepVOOULIlA
	BfxrtmW6ySi9s8d/zsRsg+XyxVz/uXAx+EeveXHXL4o5dr2UtGCU2CEyM3DuWaFi
	u6Yg+CN9Rzgqz2AahJlLAF2Dn9BUnvlYat4aKdtoUdLcNTojE/VzMSfCHWLl83zN
	fCzxBs129pjRg8YI7p0CWZD5sAo7/91ogF5J9rol7ClQa1CBMDrHMs8gtWbHmbaY
	0Hqna2nB99YJNWbxD4N0J60D8CShh+AK1rdqOB5krT1KvexCIZSS+UlUmkz8gqMS
	7Kx0tZvrPrDup6QsTaBl5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767346514; x=
	1767432914; bh=1OUWXPe11/x8BD2MqUD+Z+GZ8DLN3/QOQxR6PexDgCI=; b=B
	vY4CSj6bCfjlaBYPKPxjSG6zHL/H/i3yyQJSCuxaWmno0KBriPDiFupQ46TsO3FN
	i2sAU8BJmOjyBQp6wE+fo6QtaEqaMbKGqUK/HdgQqL/LsW9pyvOfNPe/p3+fiubU
	SD27HLiMWtiwh9nx6sl3/yKGZnyQxlMNpl2UksTG9bAqjUOwgnOCPFDl+snmYSb7
	z4mlBtpk5dvXlrl1oQEdduFxcc8341y2w5GA5SHmTYcJp3FOlMtgaWy7o0eK8QQ1
	yVyPaX0wmpC/06ZSuac9EsPVJSWk7aaS4/i78aZR1Wm1QSBUhY5ihPBgrowLBFWJ
	BRmJ6ZzgW0hsH15YHheZg==
X-ME-Sender: <xms:UpFXafhYQPdfzh8KvEiyDdqu5yENuKOZOQRpXxqGCaEoE1WsUO7xNA>
    <xme:UpFXaW2FgwaJY-Am8tSXKtrgWkYFOl6VfU3iyjVJUw4FQRxIDkoS1lr5ezR6qc5DG
    wbbOkScSZOrlrDGkA-W58P8ZPPXRtil3jtqcx1F9KBE4x7msBIGmfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekkeefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepvhiisehmlhgvihgrrdgtohhmpdhrtghpthhtohepphhiohhtrhdrfihojhhtrg
    hsiigtiiihkhesthhimhgvshihshdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UpFXaevtOyC-7TMs9Ig8pvt2vMXUNicVKY-YeV-Kdwi9xgJXwuhvDQ>
    <xmx:UpFXacbI5bM3EroQOh_-kHMpACSqIhXY-xiwmPDpwHCLN1cQ-bFUOg>
    <xmx:UpFXaVWo-StzhN3foIHgJ2QdVHED0EHtpV9aUSfVjbRcLlkGBpS4hw>
    <xmx:UpFXaZRLVuK3bCSKTtNfisyFZDn5-vivx9w5G1VVNGnsNIQQUpwBBQ>
    <xmx:UpFXadrPqN1mrQjjcIbGMMwUrHXchpzsy5ecz8KPCzRu0W4M90mCZ4EP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E32EE700065; Fri,  2 Jan 2026 04:35:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AHOPZfDIHKu7
Date: Fri, 02 Jan 2026 10:34:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vladimir Zapolskiy" <vz@mleia.com>
Cc: "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <78c18978-5c25-4931-8532-b7f7895d5a34@app.fastmail.com>
In-Reply-To: <20260101235647.2411062-3-vz@mleia.com>
References: <20260101235647.2411062-1-vz@mleia.com>
 <20260101235647.2411062-3-vz@mleia.com>
Subject: Re: [PATCH 2/2] soc: nxp: Add a simple NXP LPC32xx socinfo driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_013515_653344_FE4D6FA1 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Jan 2, 2026, at 00:56, Vladimir Zapolskiy wrote:
> Add NXP LPC32xx specific driver to get unique SoC ID from System Control
> Block registers and export it to userspace.
>
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

This looks fine to me overall

> +static int lpc32xx_soc_probe(struct platform_device *pdev)
> +{
> +	struct soc_device_attribute *soc_dev_attr;
> +	struct device *dev = &pdev->dev;
> +	struct soc_device *soc_dev;
> +	struct regmap *scb;
> +	u32 serial_id[4];
> +	int ret;
> +
> +	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
> +	if (!soc_dev_attr)
> +		return -ENOMEM;
> +
> +	soc_dev_attr->family = "NXP LPC32xx";
> +
> +	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
> +	if (ret)
> +		return ret;
> +
> +	scb = syscon_regmap_lookup_by_compatible("nxp,lpc3220-scb");

It seems a bit odd to register a fake platform_device and then
get the registers from another device.

I think with the current iteration of syscon since 26769582bf35
("mfd: syscon: Remove the platform driver support"), you should be
able to just register the driver as a module_platform_driver
for the "nxp,lpc3220-scb" compatible value. Have you tried that?

If for some reason that doesn't work, I would drop the custom
platform_device here and just merge the probe function into
the module init.

       Arnd

