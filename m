Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C89C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 20:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHfz/XH3YitbIt7V+TouW3EtPz2ZC9CU8oNr6aba570=; b=UkC0M4LoeSrm3Gs6C5HC4I6STf
	Msb9d5YMY3vDBTqDNbnMLGLQ9nKvTvbZ2ntEv8XGZo9Vo6b0dVoPrjKv1BhG5BqKbdn1Lj2D+nvVz
	EY0uWEhX5lD9ZnmPDlhLX2xk1TPKt0sWUIdJX6hfeLsNuXm6MDCIKtah6mHn1oQ86sfZYDg6jgRg7
	feDyB3UYdsS0/HE1kWAYl6/tlGTD5OkgrymPGQD7mebb6O4/kiyAp0FE5Qpk9zyQrS0J5kRfKAYwc
	uw2qe+7vXvgVEmGTeLurxyHH9Z0dUTSm+rgZNYcZXu6s2DVGyg4H0iLe7qC0Hu7GgllfvB7dIj4Bc
	S0nOhZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzKDZ-00000002zwx-1aA4;
	Wed, 26 Aug 2026 20:27:29 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzKDX-00000002zwW-03ES;
	Wed, 26 Aug 2026 20:27:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F27701E25E0;
	Wed, 26 Aug 2026 22:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787776043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=WHfz/XH3YitbIt7V+TouW3EtPz2ZC9CU8oNr6aba570=;
	b=S+AmJYRrI2BDGneRLc4Xr40yRRcGOYvqCju3wJn8tIGW0L/mDN683PvTJ/ycfyFQ+q7roV
	8olNPruPc8pNflssh+kYlnH2lhzPkUB3G2E6JbLW0i5WZeVibig7Znn46yE17IjdyhV/+S
	IMDExSH10GkUbCnyOhYIVkOrxwjOYCUL/27kCr0BU3sWcAeyGTpDu3EREDvS+nWnjEq+LH
	JWnp118lsK+96Z2DNvAmJvmuoi/eCAxd7eaJ+ShjDwSjW/dfs61Ahd+xkYOq6wZoq89nUZ
	Q44Sa6sUQUv//XgTH93FIxmong6cy6aYdZN50U7foPy89aNr2NWpkngrgYKVWw==
Message-ID: <121a7ddc-e194-4773-9165-449d410eedfa@cjdns.fr>
Date: Wed, 26 Aug 2026 22:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: support EcoNet EN751221
 gbit SoC PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: ansuelsmth@gmail.com, netdev@vger.kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260825193456.1823985-1-cjd@cjdns.fr>
 <20260825193456.1823985-4-cjd@cjdns.fr>
 <d7d86078-8a29-4e7f-a62e-91f6b266bea1@lunn.ch>
 <a75b6b15-f86b-4cb2-934c-87583b5bb02c@cjdns.fr>
 <4d594c62-2ceb-43c1-a3d2-731b80493787@lunn.ch>
 <cd7e6b13-a712-43ce-aae6-f45da2f77ba9@cjdns.fr>
 <25195db9-c15e-449d-b792-8f5a7c0aa371@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <25195db9-c15e-449d-b792-8f5a7c0aa371@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_132727_316156_F9F4110E 
X-CRM114-Status: GOOD (  13.46  )
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


On 26/08/2026 18:50, Andrew Lunn wrote:
>> I tested my board removing the EEE disable and the MASTER line, and it seems
>> to work. I can't get any CRC errors flooding the link, and MII_STAT1000
>> reads LPA_1000LOCALRXOK | LPA_1000REMRXOK | LPA_1000FULL which suggests to
>> me that it's able to operate happily in slave mode.
>>
>>
>> So unless you or someone else thinks it's inadvisable, I'm inclined to just
>> enable these things and then wait to see if anybody finds a board that has
>> problems.
> Master/slave should sort itself out, maybe taking a little longer if
> there is an initial conflict. Where it can go wrong is when the random
> number generator in the PHY always returns 42. Put the same PHY on the
> other end and the election always fails.
>
> EEE issues can be more subtle, it depends on what the link partner is.
>
> But yes, we can start without these. But please mention this in the
> commit message, just to give a hint to anybody who ends up trying to
> debug in these areas.


Just re-sent v2, in fact after this conversation I did more testing and 
caught it sporadically failing to negotiate, so I put back the force 
master, confirmed it is fixed, and added a comment.

Thanks again for your kind review and advice.

Caleb


>
>        Andrew

