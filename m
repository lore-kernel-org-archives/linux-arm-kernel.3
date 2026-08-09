Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40B6C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARwVcPLvnx7EkBM0oPgr55fHOYd6QKrvM3EwPl17m8k=; b=y10v8/9FhXEFqQkeSuBhdVj/HH
	JwIdxA+0bKinMON+VUGbA7aTYyCpB77E6kG8E0s/esyvqDqxj/MU7bbSBGNvAz3pjbQbZzlnQZVI6
	67vFIR21dZCgHwAbCQV1C+4ROcyJL1XfeZRq8hP2NOIx9iDxQUB+SKKVqPu0wiQfOiIfBi05oChLj
	Hnf7eobmnCqJWuJO0EWAI34ZD+styVyun/FSfcjaipFhSOxnas/O3qdMQrX85mYmihZt+aTDbx/5/
	YaUCDWdyEyUEKxM+cG+UWboqJg0+BCor5VXP47WCUf8JIisamq/GLmFuph+yNCv2JGbErZm5kHdc0
	3oySITlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt5Jp-0000000ARQY-478S;
	Sun, 09 Aug 2026 15:20:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt5Jn-0000000ARQK-3g9b
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:20:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E5E6A60008;
	Sun,  9 Aug 2026 15:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF1E1F000E9;
	Sun,  9 Aug 2026 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786288806;
	bh=ARwVcPLvnx7EkBM0oPgr55fHOYd6QKrvM3EwPl17m8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T5+PUNx1uB/QZ7ynQ1OX2My7q3Mg/COzWAg/qjZitiPRL4X48qX5QoB+r3v9On6KQ
	 ryv5GhMQf0PwrX6i0Zv38z9DHFbHo3i4AjCn52JYnzfdLnMIKfrMZfsQmK42Veefuj
	 bDiRNrUWylkAS11Af6u1eYsRLSEVfvP9kcMiS0C+Ho1nHP/gY+CaHBYMoJUPm72jxA
	 N3ox/ksDvb8C4g+2Zeq8tHya2rOw0vQvzdhGPM/ybnV7nNRulePqLfw2+2EA6hjvzI
	 yvCf685ZDeIftkztcUUZmg+Zt1iYMRsQ+pRM8DFm8XH4ibLSGa0akYRTaWvyuBygpu
	 o9rOC9C5W+niA==
Message-ID: <7a170485-b349-4502-adb1-3ce6217bc435@kernel.org>
Date: Sun, 9 Aug 2026 17:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
 <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 09.08.26 16:30, Joshua Peisach wrote:
> On Sun Aug 9, 2026 at 8:16 AM EDT, Sven Peter wrote:
>> Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
>> Apple Silicon SoCs which has to be deasserted before their
>> co-processor can be booted. On t8103 each port comes with a dedicated
>> register page while t600x uses a single register with one request bit
>> per port shared by all ports of a die inside the PMGR MMIO region.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>  MAINTAINERS                     |   1 +
>>  drivers/reset/Kconfig           |  10 +++
>>  drivers/reset/Makefile          |   1 +
>>  drivers/reset/reset-apple-cio.c | 182 +++++++++++++++++++++++++++++++ 
>> +++++++++
>>  4 files changed, 194 insertions(+)
> 
>> +
>> +static int apple_cio_reset_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct apple_cio_reset *priv;
>> +    int ret;
>> +
>> +    priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    priv->variant = of_device_get_match_data(dev);
> 
> Might be a dumb question, but does priv->variant also need to be
> checked? Because later priv->variant->pmgr_child is and I *think*
> it could return NULL.
> 
> (Or is this not necessary since in theory the device should only run
> this if detected... so this should never be an issue?)

You might be able to get this driver to probe without a device tree node 
by manually forcing it with sysfs but well... play stupid games, win 
stupid prizes.
Adding the check is just two lines and doesn't hurt though.



Best,


Sven



