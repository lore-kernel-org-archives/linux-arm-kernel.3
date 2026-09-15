Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D47C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6tqAcnKMATccMeJAtItTA1TzHzXFuF+as57JTYCMrY=; b=b+TbqWcfxNU4CZTNhu+YgOG7SV
	8UZIi9mFEuaJ0hPK2ajmuc7n1d/ksk1AAPEVdpWZQrfGF53Fsu75hJ7zraQ5HIwB5K2dSyOIUofPU
	K/7Il/FrYqtuis46MWkwkhtQs4KxVf7XnM+81COrxdsbYA3NIACCyy7zfZvVVsmRnvqjFG4uaN8aD
	IShF2YGGsk8Uidd/uei1K0FdNofTDkKA18lIp3R4WJKpdkUcLT00lnyu2p9j5/JDIeGMiTF5twyd5
	NrvhAR4czZM9FlH4Nzlw1b2K1SwZ7AVVAauKPSEC+OuAZtvFLPSXOfWHgjhgn1cpl0oaEbSS3JoL7
	J1MVXWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6JoG-00000005754-0WqQ;
	Tue, 15 Sep 2026 03:26:16 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6JoD-0000000574F-33nD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 03:26:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9C4D10428C;
	Tue, 15 Sep 2026 05:26:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789442772;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y6tqAcnKMATccMeJAtItTA1TzHzXFuF+as57JTYCMrY=;
	b=Mxmu37keQlI/dIMcUxL8Din1jzxvVUOgHgmJg9Sv3NJVVH3QNgIaKn/ToCRGFs4tZMcirq
	SSqSKNPAmzdj5TW9iEXxZOb/r4xgqWy3UL8DEj5KYEFBLrVOr/W/HpaN/idH9X/wwWu9fl
	uM5wEyx+KIC6Jh9Lxp7a0UUGQsiT4XLZUXQGa/boBGRsu4v5fDSvrpIcmvSnpiQQSZAAES
	/U9Ev1SDKKuHZY+cdkRzX8avWNq+94c9bMpSX8PnaMG9lOV9CLxUZm3fWPjYkEvzQSu7e5
	DycDPkfFZ9iJnHdzIQB333vtWGNhuLW7c32N86L6Zlu+3xjzpwXpAUMnfBCKJQ==
Message-ID: <76db8193-6144-4460-acaa-f3d11fddba44@nabladev.com>
Date: Tue, 15 Sep 2026 02:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: xilinx: Document ifm ZynqMP
 VHIP6 EvalBoard
To: Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260909182641.165383-1-marex@nabladev.com>
 <082df9b0-0517-4580-8ba8-cf6f4d3e0713@amd.com>
 <1c39be54-c931-40a2-a806-fa963b2188ec@nabladev.com>
 <e305b607-76ca-489c-b27f-bf45b6fdb59c@amd.com>
 <7b957072-df73-4fab-91ba-9835285ff8c5@nabladev.com>
 <a0d23fc9-6f7b-4c19-9f6f-9cc0c7cce3f5@amd.com>
 <f80845ae-9ab8-474e-89b2-80ac3fbd184c@nabladev.com>
 <656ae6e2-608a-4839-bcfe-941dfffdca11@amd.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <656ae6e2-608a-4839-bcfe-941dfffdca11@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_202613_922687_6ED2E17D 
X-CRM114-Status: GOOD (  13.05  )
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

On 9/14/26 8:29 AM, Michal Simek wrote:

[...]
>>>>> There will be thousands of similar boards out there and I am 
>>>>> definitely not going to have all of them in the tree.
>>>> Why not ? There are users who benefit from having their board 
>>>> support upstream. This is what other SoC vendors do as well, it does 
>>>> not seem to be a problem, rather it is a good indicator that the SoC 
>>>> has users who care about it and about upstream.
>>>
>>> If there is public documentation about it I don't have any problem 
>>> with it.
>>
>> I do not think there is, but no public documentation is the case with 
>> many boards/DTs that are upstream, and it does not diminish their 
>> usefulness to their users.
>>
>> What do you need to know ?
> 
> All these SOC based boards are created not because of hard block (PS 
> part) but because of programmable logic which is not described in any 
> upstream project DT. It means no matter what manufacturer has to 
> maintain PL description separately.
> 
> I don't really mind if other maintainers are fine with dealing with 
> these kind of boards without any public documentation. There is no way 
> to check if even your description is correct.
> I am not going to take any responsibility for maintaining them.
I can help with maintaining this board, it's a non-issue.

