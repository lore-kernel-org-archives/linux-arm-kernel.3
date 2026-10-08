Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F22CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KrY5bcaWM/iCHC3nc2lc6IZhhlnFZhRjcHEfSOffhc=; b=Q4Jq81aDc/ErNzWsCNNiw8nUIJ
	mAeHpWSgaj7CrscZITvcM4fGc4ioEsNtkrn0MfR98mw4Lhi8tERJzYSu9kZnLoBuae+cjKx9gZpGq
	KW0DArRThxcszu2PlOoRKL01IvGoqc9Osv+1/uAWRp22Y7lZWu+H77o/RYhE1prIQCCgb2rmyWaAZ
	KqN1OdDix2DO2LpaNg77NdVa3IXJADNxjqwtlLspo1m9Ck7NHMfDQyoeRyM+SDqwiy773jhsduROT
	XhEQr61wY1u80oBb0JlWegQQdgF5QAX+mrkR8CdCkanyo8456c4AZ1d6tYQkHj+neHIqVfXLhFa9S
	DOrYbNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEk3i-00000003xqo-2TnN;
	Thu, 08 Oct 2026 09:05:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEk3f-00000003xnv-1jMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 09:05:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2752B1A1198;
	Thu,  8 Oct 2026 09:04:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB0F760341;
	Thu,  8 Oct 2026 09:04:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDD0810333858;
	Thu,  8 Oct 2026 11:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791450294; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2KrY5bcaWM/iCHC3nc2lc6IZhhlnFZhRjcHEfSOffhc=;
	b=e/czsAjf0rWzErVAmI2j6y8uq37jJSsLiC+dsdxFX5ON5yK894Fr5LVcPHY47YqppBGR6H
	3qWeyYIZO+5xQTXNBGH0RM+8KKIObTrW/ygaWeafdTmnkunWv4CPau1Rv+0VInm+nWGVR2
	bhS9+uH19X1f9rnCTqEfbAaE+4vEo8RTU7gOkWEwc9mxqt9JU+122iRny4aXhRxTwlDJt7
	usPWQv5XeutXFW3nCt86T2mE1m3Rucnjg5eiSHn0UczmsXTJ2pyKEnaCMKL49hvFfZOSZQ
	InFMxm7YBFPSQ+C3XJ5dFvHVBPDg5YHptUUEaiYDNENh/E3oVAFOe6sZAra7Wg==
Message-ID: <bfc0027a-932e-42f3-93b3-49ab5474abd6@bootlin.com>
Date: Thu, 8 Oct 2026 11:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: rss: Require indir table size or
 hash key size to support RSS
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 horms@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 linux@armlinux.org.uk, lorenzo.bianconi@oss.qualcomm.com, nb@tipi-net.de,
 jitendra.vegiraju@broadcom.com, thomas.petazzoni@bootlin.com,
 alexis.lothore@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, pbrobinson@gmail.com, joe@dama.to
References: <20261002142806.1299041-2-maxime.chevallier@bootlin.com>
 <179121059086.434549.5364767976780818051@kernel.org>
 <d6e61c8b-cd3d-43fe-b4ac-19ff5d790b0f@bootlin.com>
 <20261006163349.61c738e8@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261006163349.61c738e8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_020459_601827_9D57BB2E 
X-CRM114-Status: GOOD (  11.26  )
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

On 10/7/26 01:33, Jakub Kicinski wrote:
> On Tue, 6 Oct 2026 09:59:29 +0200 Maxime Chevallier wrote:
>>> [Severity: Medium]
>>> rss_get_data_alloc() is shared by RSS_GET, RSS_SET and RSS_CREATE. Does
>>> this drop flow-hash reporting for devices that have ->get_rxfh but report
>>> 0/0 sizes?  
>>
>> Yes it does, that's the intended behaviour here. RSS bits are all optional,
>> but does it make sense to report hashing params when the indirection table
>> is size 0 and key len is 0 ?
> 
> Not sure if there's an implementation in the tree but 
> it's possible to implement poor man's RSS on strict
> power-of-2 queue set with some hashing built into the
> Rx engine, without a key. We'd still want to control
> which fields are hashed in this case.
> 
> In the Netlink API we combine the two so we'd break this?

Hmm I wasn't aware of that :( I guess the safe choice is to check on -EOPNOTSUPP
for .get_rxfh() + 0-len indir table / 0-size key and skip the device during the
dump instead of returning early ?

Maxime

