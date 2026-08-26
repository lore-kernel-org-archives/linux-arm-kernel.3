Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E84C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdpTyq69Boh4sfFI0ncdXQ0Jc3N1BIqYeosTDp1ugnc=; b=Gg3JdKtzs2giha/NKjGFySi3RZ
	mrgUaTxy4MGY/8oKOiLfxfTY3Z15K0Y/7Bk1xSWktuYUYIMEWsN2cfHCy2olCCoc7H7JlITkKuiVd
	ylW2b3yvtGaFCSfBVd/84wnkzjTpt8ThIOPL/ZntePZv+XKn1tbR3v622gYoHkiETCwGHkrqyv1f/
	3FyCWM2hWnmyGdd0QOnos9atJW1jNtpIFTg3Bj/UTc5vMCAcSLj7aZG0dBIXLLmdaZfI66HhKHcxR
	7cb4yZ64rneaSlVUjIXibpQJ6yFXALyNwGN95Cjy3MwPpy/ChhEBjSSGwsmiDj4VyCr7FF88UOx91
	u2lExuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7u-00000002zDL-2MTh;
	Wed, 26 Aug 2026 20:21:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzK7n-00000002z7v-0KRg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:21:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7AC9E1A1855;
	Wed, 26 Aug 2026 20:21:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D138604EC;
	Wed, 26 Aug 2026 20:21:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C4E11C78051;
	Wed, 26 Aug 2026 22:21:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787775681; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WdpTyq69Boh4sfFI0ncdXQ0Jc3N1BIqYeosTDp1ugnc=;
	b=mPQO1TWFVonLXpi0pQFbfd2oAeWDjfgTtSna+jJbEtB0qfjCq9ygGB96uYAe4VqdPrgcJD
	LjbjxOCNREvLUNpsYzqKJco7ckDkuXEnqXUNDylTU157UtSlanTFKfXOAIqXWZqSCUMpEQ
	GJJd9XXSRPBFtQpK5QQOJ2VFIpzU8vGHwtF/iSUR8VBq2v+BbMr5218qozparMVyt3C09Z
	c5zk1jkJ9QEFJprtezFXGHM6z8zUQ9W1k4dKDgi/W+FeyycNDyYLehyv84IQjxY7qg2zo+
	qLrBiZ/KX7SNgVjjnR0EF+g0mjte0Gmp6cZMthWyt+4L4jDFgN8tobfJbVZJmw==
Message-ID: <94fa6385-45ff-43d9-bed7-4bbc8b12088a@bootlin.com>
Date: Wed, 26 Aug 2026 22:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 5/6] net: stmmac: selftests: Account for the UC filter
 list for filtering tests
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
 <20260826140500.616466-6-maxime.chevallier@bootlin.com>
 <0a27797f-f7de-4e56-81d5-72571846c3ec@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <0a27797f-f7de-4e56-81d5-72571846c3ec@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_132131_263129_CA1DAD7A 
X-CRM114-Status: GOOD (  17.56  )
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

Hi,

On 8/26/26 20:25, Andrew Lunn wrote:
> On Wed, Aug 26, 2026 at 04:04:57PM +0200, Maxime Chevallier wrote:
>> On dwmac, one of the Unicast filter entries is used to store the local
>> HW addr. This means that we have to use promisc mode for any kind of
>> unicast filtering if we only have one slot in our unicast filter.
>>
>> The number of slots available depends on how the IP is integrated, and
>> we can't autodiscover how many of these slots we have available, so
>> the DT property snps,perfect-filter-entries can be used to specify how
>> many are available.
>>
>> Most IP variants default to 1 if this isn't specified, which is the case
>> for the amlogic variants (in this case, S905X3).
> 
> Do you have this hardware? Did you try increasing the DT property to
> find out how many slots it actually has?

I do have the HW, but I haven't tried figuring the actual number of slots,
there's the same issues on lots of devices actually.

The platform I'm using for that is the Banana Pi M5, not too expensive
(that is, if we compare that with other SBCs)

> Maybe a nice little project for a newbie which has some stmmac
> hardware. Write some code which adds MAC addresses and reads them back
> again. Determine at runtime how many slots there actually are.

Exactly, that thought also crossed my mind, that would be fairly easy to
implement and with a net benefit :)

> 
>> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

Thanks for reviewing all of this,

Maxime


