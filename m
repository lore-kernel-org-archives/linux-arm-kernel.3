Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE43C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flnw4YFK4nn1JRtl3vh2WWZ6rVH7arDpTg03KSn5OIQ=; b=yu0Mv+qv+UUvt08HJgZ33t/ySg
	qOG+E6Xb5zrt+kde2nYwGiFg2O7WAVZ6H4aNHoYit7lHKIM7ZzuUktg+GGZcZOkgOPhKOsfWgUYlQ
	73CxAIE/cJfzZJ9K33XYrqk1UcZKvQEb0skaAys5QMSy4QqUpDOR0bINnEKnMBPLafSLPBy5DPLPS
	m2fd4osbhIq2YKARbCK0z/EAmGaGCgl0tHrRnEL4Bvp0nWftYqDrKsBOfLK1PEG1uTWyKf0dufXhJ
	VccMJFHLPbdbHl3FTpzzIpzr12b89tt9GXDTTxReP0J4UxwBHrBFU11cPksqTge0fE48rFl6KY3JR
	RwhDWmoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzKAb-00000002zl3-3HVp;
	Wed, 26 Aug 2026 20:24:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzKAZ-00000002zkg-303X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 20:24:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1ADF51A183B;
	Wed, 26 Aug 2026 20:24:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB7F0604EC;
	Wed, 26 Aug 2026 20:24:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04A9C11C78051;
	Wed, 26 Aug 2026 22:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787775856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=flnw4YFK4nn1JRtl3vh2WWZ6rVH7arDpTg03KSn5OIQ=;
	b=VlA5J1cHVpEd9kEiVxwJcKflxfDypdppGrggNcyw7rxRmJ+AuLAA/6+uCm6wCFeE82DX4E
	kDnlPG4inybAFRsrNfmE/1Ix8AujGPlJ+RTMkKQq2p43da649RnlSQOgL9uNEmCPkbxQQJ
	7d/zY4Uc0VmfqcRptLfFR3idsbbIO4/EyP9oxhtnJ/b0bN/UBAyUHczkC/ymMpdEMXL4dO
	WYLRpDkGTYbxLS5ArRO0VHNuQcdoBZPUVj0qn0yRmEbmQfs+agENzVSo+wmmKaTwWGuJhT
	Q80sLBcnc6zRLhS/5i4cVtwi6v+HgZ3qiGWg9bKOmlQ4NoWWzIpCKVSrLzN5sw==
Message-ID: <5bf8b713-55aa-4dd6-ad8c-afaa96c787dc@bootlin.com>
Date: Wed, 26 Aug 2026 22:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/6] net: stmmac: selftests: Check multiple MMC
 counters
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
 <20260826140500.616466-2-maxime.chevallier@bootlin.com>
 <3d6e75eb-be26-47a2-96de-d29c0b634bfc@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <3d6e75eb-be26-47a2-96de-d29c0b634bfc@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_132423_899864_5526F219 
X-CRM114-Status: GOOD (  14.94  )
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

On 8/26/26 19:14, Andrew Lunn wrote:
> On Wed, Aug 26, 2026 at 04:04:53PM +0200, Maxime Chevallier wrote:
>> The MMC counters report MAC statistics. Multiple counters can be
>> enabled when the IP is integrated, however there's no way to know
>> exactly which ones. Un-implemented counters seem to report 0.
>>
>> It was found that on StarFive JH7110 and Amlogic SM1, the counter that's
>> used by the selftest (mmc_tx_framecount_g) isn't implemented, triggering
>> an MMC selftest failure.
>>
>> Both the above SoCs seem to implement mmc_rx_framecount_gb, let's use
>> this counter as well for MMC counter validation.
>>
>> Note that this doesn't guarantee that we won't encounter the same issue
>> again if another IP implements yet another set of counters that don't
>> include that new one.
>>
>> If the game of whack-a-mole with implemented counters becomes too hard to
>> maintain, we may simply consider removing the MMC selftest entirely.
>>
>> Fixes: 091810dbded9 ("net: stmmac: Introduce selftests support")
>> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Seems sensible.
> 
> If more moles need whacking, we could consider the value of 0 as
> success.

We'd need to see what the values are on platforms that don't implement MMC
counters at all, what the registers read in that case.

Another approach is to bruteforce the selftest and look at all the MMC counters,
passing if any of them changes during the test.

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

Thank you :)

Maxime

