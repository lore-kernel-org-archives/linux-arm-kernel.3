Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA12BC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85V6AxDobuh7+s/NLZ3B1iJeX8fNAbX7eyVc144CvSY=; b=B3AqjCDWY026pXOL1uptYmqdZA
	1oMiCq4BeI+weQ7Z0sIjYkXwfBs6P+Zlu+ipR0NKP8dUfELq3WMIc5Ul8bNmUG3dLmBbSXIDo4x/8
	C3k2JqSS0fqMwPt34QbIJ5H9HRg6d9g8VkFtGvvubFpA1DX9BToQXgJwDdTdy02hlXlgK1+u9m8O4
	wWvDKq16vALWOZrYd2ELDVnpQVDyTNWaTFxFsv7x27/8KivsUraWNfD5EopACKkTmuSJpheWROaEu
	wN5ASCgvd9erdcQMUrdgwcR6jTwPRWULEPvj5xW/QhS3OsENeBh8W4cH25ncpWelRFhAzcgJj7DIT
	23h1btIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4akJ-0000000DpRo-1cUO;
	Thu, 10 Sep 2026 09:07:03 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4akG-0000000DpRC-4C62;
	Thu, 10 Sep 2026 09:07:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4A8FA404F10;
	Thu, 10 Sep 2026 11:06:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789031217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=85V6AxDobuh7+s/NLZ3B1iJeX8fNAbX7eyVc144CvSY=;
	b=hrdsPiDpzVbRlzWKtPLqK536p0zGK3+mvHhW3oTJlnHDJ28PlphioJqxtLOWZTM57E8TLb
	7OtJz3WbW10CztsvjxiQG6+gBXTPke3CmhOxDrTtiFf5mQQfPLVeqfK1/+SMFhkMaY4CtK
	cJPjALlZFoznPBY/YhKCt9Nd8bAy/RXwYPud72HviN942TfT63vmfHMn8BDMVA9pRXNF/i
	yLp9b2L/TQpdyR5jSoq0qcM4HKuPPJ61ZtUQG8y9b8wVRKpBWEV1QeO5f5GgjOvj5YRmKx
	k3uxb0WOsNEpj9XEerlHhSSvs66ibzR+eBh2ettq7oaSM9Yx2vgq17AG+joeHg==
Message-ID: <de010064-a574-4da7-8307-30bd6359e506@cjdns.fr>
Date: Thu, 10 Sep 2026 11:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: econet: add EN751221
 ethernet
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 vadim.fedorenko@linux.dev, maxime.chevallier@bootlin.com, dong100@mucse.com,
 wangruikang@iscas.ac.cn, 25181214217@stu.xidian.edu.cn,
 hkallweit1@gmail.com, han.junyang@zte.com.cn, xuanzhuo@linux.alibaba.com,
 enelsonmoore@gmail.com, jes@trained-monkey.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
References: <20260909212146.3184077-1-cjd@cjdns.fr>
 <20260909212146.3184077-2-cjd@cjdns.fr>
 <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <a9eac625-f0f3-47db-ac2c-26c7df66f52a@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_020701_244865_FE178F5B 
X-CRM114-Status: UNSURE (   8.46  )
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


On 10/09/2026 04:11, Andrew Lunn wrote:
>> +        gmac1: mac@1 {
>> +          compatible = "econet,eth-mac";
>> +          reg = <1>;
>> +          status = "disabled";
>> +          phy-mode = "rgmii-rxid";
> That is a very unusual phy-mode. Is there a reason this is used in the
> example?


Mac 1 connects to an xPON or xDSL subsystem depending on chip package. 
The phy-mode is not used by the driver and when the driver was written 6 
months ago this was the best guess about the electrical protocol, left 
for documentation purposes.

Your question made me re-investigate this, and I now note that both the 
xPON and xDSL "upper halves" as well as the switch on gmac0 are all 
on-die, so I think phy-mode = "internal" is more appropriate and I will 
re-send as such, and with some light documentation about what this 
ethernet connects to - since it's on the die so it'll always be the same.


Thanks,

Caleb


>
> 	Andrew

