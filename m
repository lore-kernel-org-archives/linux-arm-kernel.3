Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F93AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GJuoWYQzDE1NRtCyW1LcfgF9O6bpX8to9ln1fn3ixIc=; b=DQAxNVooXPwDWuIedj5on7JqIR
	RgDMG6678E+oebZEUn63J0ua00w0lsCCPI9xUdeJAOkru+h+TnfzBmf2VrqAq6np7WCmiRdT7Ozxg
	3mYBcVaQilPQF2dsLrf+APde3I1dIeEL7Wcdj3WNbn4L41PRiK3UT4nE0BihXlGxSngOZYSXcEgaM
	2A1x9hqTkb2bfbImqf5ANZCP5k9TxLB00njY7gpQQobbn4GwHDQokTuI8xrw4iz8FwoJQFepDmSAa
	9baxj0AQIV+LX98FMEW9tSANbADiwE8gMDJcMoz5euO56pYEX9/Royp07XPOImZJjgnSd0utP+XCe
	aduhZXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KQn-0000000BMwr-0CS2;
	Tue, 01 Sep 2026 09:05:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1KQk-0000000BMvr-1pD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:05:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA9FB1A1925;
	Tue,  1 Sep 2026 09:05:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA94C6053C;
	Tue,  1 Sep 2026 09:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 196BE11C79250;
	Tue,  1 Sep 2026 11:05:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788253519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GJuoWYQzDE1NRtCyW1LcfgF9O6bpX8to9ln1fn3ixIc=;
	b=eJcvPQIc8DGkcHhHoXhV1UzWfmBDlgzHp9/jTqCqe21bTmqgyBkFg7hq0V17idFcuc3ylq
	tYkYzAzaDvVxhe3hniX6FwBMU7WL8ZKUm3SdhBjZYNuYhPi5g11gPca17rViw+Rf2eaDLF
	JvKViPoBLhHKMr6Fo1EGBavxqpeGAJjTEaw4NSvpUYZgs2VbHGqA4wz08gscIHeeMe1tZc
	NDSrVuDX1xThOCioQxK1wngqAq2OedyhyoMtZuHGA3QyRw0/wDCmPTlVH4YlZi2+w1Giu6
	CkGQXpOO2FI7xCRLjqYDb1RmAO15Xu1IywWDolfrgHxz/gkA3asWBvCaJcFS8A==
Message-ID: <e4050d49-29cc-4fc7-aec5-53c8dd9dbc97@bootlin.com>
Date: Tue, 1 Sep 2026 11:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
 <49620860-9bd5-48fb-bbaf-55da377e9018@bootlin.com>
 <178825152454.3900827.17398212265347300430.b4-reply@b4>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <178825152454.3900827.17398212265347300430.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_020522_617295_0D2C7A8C 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

On 9/1/26 10:32, Jia Wang wrote:
> On 2026-09-01 09:29 +0200, Maxime Chevallier wrote:
>> Hello,
>>
>> On 9/1/26 03:27, Jia Wang wrote:
>>> The DP1000 GMAC integration provides fixed TX and RX RGMII clock delays
>>> that cannot be disabled. For boards without PCB delays, "rgmii-id"
>>> describes the link, but passing that mode unchanged to the PHY would enable
>>> a second set of delays.
>>>
>>> Use phy_fix_phy_mode_for_mac_delays() to translate "rgmii-id" to "rgmii"
>>> before attaching the PHY. Reject other RGMII modes because the fixed MAC
>>> delays cannot be combined with them without duplicating or omitting a
>>> delay.
[...]
> 
> Thanks. I enabled CONFIG_STMMAC_SELFTESTS and ran the test on the Milk-V
> Titan with the new glue driver:
> 
>  1. MAC Loopback                 0
>  2. MMC Counters                 0
>  3. EEE                          -95
>  4. Hash Filter MC               0
>  5. Perfect Filter UC            -95
>  6. MC Filter                    -95
>  7. UC Filter                    -95
>  8. Flow Control                 0
>  9. RSS                          -95
> 10. VLAN Filtering               -110
> 11. VLAN Filtering (perf)        -110
> 12. Double VLAN Filter           -110
> 13. Double VLAN Filter (perf)    -110
> 14. Flexible RX Parser           -95
> 15. SA Insertion (desc)          0
> 16. SA Replacement (desc)        0
> 17. SA Insertion (reg)           0
> 18. SA Replacement (reg)         0
> 19. VLAN TX Insertion            -110
> 20. SVLAN TX Insertion           -110
> 21. L3 DA Filtering              -95
> 22. L3 SA Filtering              -95
> 23. L4 DA TCP Filtering          -95
> 24. L4 SA TCP Filtering          -95
> 25. L4 DA UDP Filtering          -95
> 26. L4 SA UDP Filtering          -95
> 27. ARP Offload                  -110
> 28. Jumbo Frame                  0
> 29. Multichannel Jumbo           -95
> 30. Split Header                 0
> 31. TBS (ETF Scheduler)          -95

Awesome, that's pretty-much what I expected, nothing too bad stands out :)

Code itself looks good, no obvious error, so

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

