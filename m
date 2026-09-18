Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAE6C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFXPRkcvIArOupySeAX0TcSgTELR2YOuovnW88kaN4E=; b=BU1XM/gmKBQimsgZkPI0q0FywX
	gR9i2XO9oJo+hT+pHqRibwXdBBJNrvjmg7o6ox1b5J1whfQoNKxwETzNSBd5XtrKGAoU9nE5kkCcz
	onIhECVR6uIZpkKEg469KHManxopOCkMQhChQMNyZbNWVoVH4/qbC/y1WlB4FX7xVCViHzLninzOT
	rVYGYDjRtK6yGPu/yI/NW8kdNgsWe7B3jjznThil3rAsyxF0vB6TIx+G1drcoOdKmq2oR6/Ctd6MA
	FgVVFyXFIdyh+TsiOvifV1pqGfXB7mbW4+uPr3PWhXmnxgHYG5JrvKMQLbsEbokis5uzLuad7SGZf
	vXmfp/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sdy-0000000Ddny-19wA;
	Fri, 18 Sep 2026 07:04:22 +0000
Received: from m16.mail.126.com ([220.197.31.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Sds-0000000Ddll-3DkV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 07:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=TFXPRkcvIArOupySeAX0TcSgTELR2YOuovnW88kaN4E=;
	b=OaNWEyykQ2H3a9b9taiUfs0Ct8uJtuvU2o8mfGSjo5l5wGLXXEokbkyHrUexzg
	4lSzZe4p7bL2fG3DTUZrDQ5Xt6Pj5aku8XuiL9kWrqmw8PtojtrLJ2JrR13ez3SL
	QCJ8LmUP/PlQnQebRWrUlQaM+wDtEQW0wBexYGNi6vVKg=
Message-ID: <cf1a87f3-acd5-4959-bd42-b88b25f48311@126.com>
Date: Fri, 18 Sep 2026 15:03:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: ethtool: validate TX coalesce before
 reprogramming RX
To: Andrew Lunn <andrew@lunn.ch>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
References: <20260917131235.1360959-1-xiaolinkui@126.com>
 <15b8cbc2-f3ca-4845-9a93-7fff6c5aede6@lunn.ch>
Content-Language: en-US
From: Linkui Xiao <xiaolinkui@126.com>
In-Reply-To: <15b8cbc2-f3ca-4845-9a93-7fff6c5aede6@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wD33wE24qxqKV86Bg--.60104S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJw45Wr43Zw4UtFWkKFWkCrg_yoW5GrWUpr
	Z5Ga4YkryDtr4Iqwn3Xa10qFyYq34xtFZ8Gr18tryfWrs8GF9Yqryaqr4rW3W7CrW0qrya
	qF4Duas7uan8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UcBMNUUUUU=
X-CM-SenderInfo: p0ld0z5lqn3xa6rslhhfrp/xtbBlBiMY2qs4jhZZwAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_000417_885458_055B1CC8 
X-CRM114-Status: GOOD (  18.93  )
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

Hi Andrew,

On 2026/9/17 23:05, Andrew Lunn wrote:
> On Thu, Sep 17, 2026 at 09:12:35PM +0800, Linkui Xiao wrote:
>> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>>
>> __stmmac_set_coalesce() applies the RX part of the request first and
>> only afterwards checks the TX parameters. The RX path already calls
>> stmmac_rx_watchdog() and stores rx_riwt[] and rx_coal_frames[], so when
>> the TX check rejects the request the driver returns -EINVAL after having
>> silently changed the hardware. A following ethtool -c then reports the
>> new RX values even though the command failed.
>>
>> This became easy to hit once the per-queue interface was added.
>> __stmmac_get_coalesce() reports tx-usecs and tx-frames as 0 for a queue
>> index that is RX-only, and ethtool applies per-queue coalesce by reading
>> the current values first and sending them straight back. The next set is
>> therefore guaranteed to trip the test for both TX fields being zero,
>> right after the RX watchdog has been reprogrammed.
>>
>> Move both TX checks in front of the RX block so a request is either
>> applied completely or rejected without touching the device.
>>
>> Fixes: db2f2842e6f5 ("net: stmmac: add per-queue TX & RX coalesce ethtool support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
>> ---
>>   .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 21 ++++++++++++-------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> index 154cc0c7623d..325db062f72a 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
>> @@ -850,6 +850,19 @@ static int __stmmac_set_coalesce(struct net_device *dev,
>>   	else if (queue >= max_cnt)
>>   		return -EINVAL;
>>   
>> +	/* Check the TX parameters before anything is applied: the RX part
>> +	 * below already writes to the hardware, so rejecting the request
>> +	 * afterwards would leave the device with only half of the settings
>> +	 * the caller asked for while reporting a failure.
>> +	 */
> 
> Why such a verbose comment? Look at the rest of the code and make your
> comments similar in verbosity.
Thanks for the review. You're right, the comment is far more verbose
than the surrounding code, and the rationale is already covered by the
commit message.

I'll shorten it to a single line in v2 and send it shortly.

Thanks,
Linkui
> 
>      Andrew
> 
> ---
> pw-bot: cr
> 


