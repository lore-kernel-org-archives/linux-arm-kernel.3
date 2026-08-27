Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A287DC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8Lb9EpS1n5E/7Txoa3cXFqqHf8Sd+dWZbPtUZWn3Zk=; b=eQRpJAOn0MFcW4kj36uB5AUd45
	lT36SVkwCSOEkSOt9Ohj69uqMBNKBH54adEqEaJPVLBwg5Roey5ysZ4CaGRbz8k1UJYTKCITfDww4
	Vch7XBi9c8ZZEwZMxvG1k6fDGe4GisAoLyELqwVTdAnrXoJXGTOWE3BTiU+pTT4nlYGYUIvd2RezL
	5W8i/whkHSP0O/5FP5juym0ZvvYb7q6seeYicgNPQ87gGXklWJi363Gy+A1CH+abSM6l8Fdhardiq
	mwQUg9cO/uqMgDm51XNEsUs5x15izvwG0T20UXPTT0l7VVJsd+HoeYFWA5f2R05/XkS9/c+hHOeSr
	XV2WbfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgWl-00000004kwv-0ubc;
	Thu, 27 Aug 2026 20:16:47 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgWh-00000004kwB-3Pv6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 20:16:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5C7E01A1882;
	Thu, 27 Aug 2026 20:16:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2DBCE5FFF4;
	Thu, 27 Aug 2026 20:16:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3387511C78023;
	Thu, 27 Aug 2026 22:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787861793; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l8Lb9EpS1n5E/7Txoa3cXFqqHf8Sd+dWZbPtUZWn3Zk=;
	b=EdMfxSPyWxbI2AQWv3TYspGuKbE84V7XGBlgs3TP6Gp5cHlGZwkz94opAB5K1gudbg8NnK
	9dyR03jjpXLWmWJpLrRaSa1KAO7m483P6YKubAz4cS6xAA6sjTlqZG9ca6j82bA1fgyUmW
	vWZajRlLOLp8CUvXaHZn54riA//zny5AmGjVtsE6X+lkplivrmYBys6ZbtsBO0xL5DF6J6
	07Rw8e1Qv9uU81Ep211hQ7f/XDroBsXgkMingHwLwCyzxHnjdn3zJZc4AHNhBGFdOtEh1u
	n2INjTbMbOWQy+eQCiGEc6RHh27+RV6w/UefQcF7wb29q6B/1sYkeL872VnHIg==
Message-ID: <5ad6cfc0-94df-4528-b2af-8a190c1eee7a@bootlin.com>
Date: Thu, 27 Aug 2026 22:16:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 0/6] net: stmmac: More selftest related fixes
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
 <20260827105312.34f58822@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260827105312.34f58822@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_131644_014153_0C378C97 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Jakub,

On 8/27/26 19:53, Jakub Kicinski wrote:
> On Wed, 26 Aug 2026 16:04:52 +0200 Maxime Chevallier wrote:
>> This series addresses some (but not all) issues found while running the
>> ethtool selftest on various stmmac platforms. As a reminder, ethtool
>> selftest are run with 'ethtool -t ethX', and for stmmac the goal is to test
>> hardware features and bugs from the IP integration in the platform.
> 
> LGTM, please double check if any of the Clashiko complaints are
> worthwhile, and if so - follow up:
> 
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260826140500.616466-2-maxime.chevallier@bootlin.com

Thanks, the things raised by AI reviews are correct, and I indeed am working
on addressing that. That's follow-up material indeed.

The main thing AI points points about the UC filter is "but won't we hit UC
promisc sooner ?" and the answer is yes absolutely, but it's the right thing
to do.

I've got some information from Synopsys on a way to discover the US filter
list, and the followup is on its way to get proper unicast filtering on
dwmac4, stay tuned :)

Maxime

