Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6070EE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PSqBtSI2uQHZrjYZKEdLj4wI/WA6L2dT7HhzbgmG2Y=; b=3GF2KjBB+Aqf2zPoI9ufhfF+wa
	PPRtXg6WMJ+71AHbXmnIQrMYurMEMZjr5pyX3YwtSobUSCgv7kBL+AE8RyuE+VnPou/piH2YPGwyM
	K1U0/aKQjm7cr0wh4uA+wJB8ktulZY4QvoOJqf2Q5fOFTX9VZLPirmxjk9NnTL0fn30lpbS90ooRU
	WYs2NhMKBf/KGGrStveO0CrWNprKDIiv+QZnuNE4ElXuhtlRxGCdDvcpx9hNyO3vZuJiy2GK+wFYD
	UBYMgVqt2cqMouqk8I36wzGfkcNq7QYaLLWQIe+ciAqH8Dr2rigeIJb8ih3HIXcMzSlYnSwuyYxkK
	ytbm3Wlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefh-00000005BoT-1LKH;
	Tue, 30 Dec 2025 18:42:17 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaefe-00000005Bma-2REt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:42:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A66710CD1A;
	Tue, 30 Dec 2025 19:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120132;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=1PSqBtSI2uQHZrjYZKEdLj4wI/WA6L2dT7HhzbgmG2Y=;
	b=Z+qGxRmStmSHESEHo4MAwIl6A1vRGa6foAmnDQu9S/PiUo+DpAMWrsZzs4VDHYtHCQ+NRM
	Rey7SEyohW1dloibJJccvYOSgTo/uCrsZ/1EGCLkhGnqUvvRBW2YgZJaKtHMGcIsAg4nRR
	X0coqHHYJjLdR/3vIRQiatnjdpWq8PYG9Dmb8fNf89pkVseCmaAUAD3+AIbYwIwFniU1Sr
	N16lZSxpcLNPCs26VJKqtRvHTDP65xaX0V2tYOIT93V7btNXGZ590cjmaMM6jslgL31PJL
	/BElVExzjyvJBHRdpsOJdBg6T35GrMCAyqee6eh/u+frIRwDjrNpGmzrRVlirA==
Message-ID: <be90bafc-7900-4d73-8fd5-39cf855a0bbe@nabladev.com>
Date: Tue, 30 Dec 2025 19:42:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and
 v2
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
 Christian Eggers <ceggers@arri.de>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Markus Heidelberg <m.heidelberg@cab.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251229193706.73564-1-marex@nabladev.com>
 <20251229193706.73564-4-marex@nabladev.com>
 <e3d305ce-cdfa-4a11-bd54-9648b12a013f@lunn.ch>
 <dc29e774-07fb-4d0e-a88a-27d4ec49d060@nabladev.com>
 <51825dee-c2c9-4d94-b741-ffdc2fbfa773@lunn.ch>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <51825dee-c2c9-4d94-b741-ffdc2fbfa773@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_104214_762435_FCEE47F1 
X-CRM114-Status: GOOD (  10.31  )
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

On 12/30/25 4:35 PM, Andrew Lunn wrote:
> On Tue, Dec 30, 2025 at 02:34:14PM +0100, Marek Vasut wrote:
>> On 12/30/25 11:46 AM, Andrew Lunn wrote:
>>>> +&fec1 {
>>>> +	fsl,magic-packet;
>>>
>>> Upps, i probably cut out too much context. This FEC is connected to the Ethernet switch.
>>>
>>> WoL for a port connected to a switch? Have you tested this? Normally
>>> you would have WoL on each port of the switch, and not on the conduit
>>> interface.
>>>
>>>> +&fec1 {
>>>> +	fsl,magic-packet;
>>>
>>> Have you tested WoL?
>>>
>>>> +&fec1 {
>>>> +	fsl,magic-packet;
>>>
>>> WoL again?
>> I don't think WOL is used on this device at all. Would you suggest removing
>> the fsl,magic-packet properties ?
> 
> Yes.
Fixed in V3, thanks.

