Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EF5C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9pv9SMUYZxYtOR54qIKr4ZEfmnQ4N8zEKpjbxfSE8XM=; b=FpRcu2lBZuRG7mBvAl+OkEDM0Y
	x8LoBwDv0ARDl5ipk2DHzPThYK52DsiUcdkjZQYYci3KKkszkZhhaPblbXrSAHHD6hIru3CiV4Szm
	jwRmGbduqJp/jVvpA8eWKNeebu1BsffAmhZjlgy54CR01g3U+FIud7IpicDdXVHqsceWSSdj/ts/1
	j5LJTjOdA2FysZeGUsIZAcdShAkgoPGyNLCYKzdhCx+wIbUFwalsKCVslYvOVLwQxOtCMW0dhQPjd
	F58NM1r8ZejZzMNHM0eGcOZHbMtVU7mEWLFy34Hc1oGzsywESEQU9ZPh/nhwdErNyPsc6zM1uL0e0
	vFUKVn5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDlc-00000009zPi-1QGW;
	Tue, 21 Jul 2026 16:56:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDlZ-00000009zP7-1NJY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:56:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED20D1A1144;
	Tue, 21 Jul 2026 16:56:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B802A60368;
	Tue, 21 Jul 2026 16:56:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC35411BD065D;
	Tue, 21 Jul 2026 18:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784652980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9pv9SMUYZxYtOR54qIKr4ZEfmnQ4N8zEKpjbxfSE8XM=;
	b=SZ6IIp9OeT2QQW04KZo5K/cLsCO29ps0O0TO7dJJaps4fqZ6Vz+PBPWebQJGcSeZySX4i5
	5v+pt7vNhwwnXW6zoeOFbQhzSqkcc92LHGwuHmmttAVueTHb1cuSRf0VNcIkpd5jvIv9Xl
	wz+/N6SUByqtABcYZ0JwF8UrtRODFHjEbv/wrmuEvQlwWc68hUPLwz67nCuSqm1t2aaFLN
	bAe8vGYEFpkIMANeWc3W4RZlu1VyCtkEtnJvV7rKtjJ7Wq/5oxVnNaJHbLPjxzed8RHJIq
	YQPtSdteRz/OAl67qEULSSbwM1QtmBWTEoTFQmcmucUdAsgpBYWPxlOpzY5qkA==
Message-ID: <83806c45-ebec-456d-9a48-76bed6bde8eb@bootlin.com>
Date: Tue, 21 Jul 2026 18:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
 <20260721094245.1b6aab2d@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260721094245.1b6aab2d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_095625_529815_BEC474CC 
X-CRM114-Status: UNSURE (   9.41  )
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

Hi Jakub,

On 7/21/26 18:42, Jakub Kicinski wrote:
> On Sat, 18 Jul 2026 16:38:47 +0200 Maxime Chevallier wrote:
>> Now that timestamping is controlled through an NDO, we can simply
>> call phylink_mii_ioctl() to handle ioctls.
>>
>> The only functional difference is that phylink_mii_ioctl() ->
>> phy_mii_ioctl() can handle SIOCSHWTSTAMP, but this no longer happens
>> as this ioctl is not longer dispatched to the ndo_eth_ioctl().
> 
> To double check - the discussion is orthogonal and this patch can be
> applied as is?

Indeed yes, the patch itself doesn't introduce any behaviour change.

That's actually when I noticed that it doesn't introduce behaviour changes
(as the SIOCSHWTSTAMP ioctl is masked and doesn't reach the .ndo_ioctl() in
the first place) that I added the small comment that started this discussion :)

Maxime

