Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9280DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 16:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKCU0a4Gib42r/5CyDu2TNzbIsw8Xf5ifqCr/aVFd/I=; b=vecWyA1mkVbV/JJwa+2T/xEizw
	ymxl8T06EIxNACOgRRJj30HBai8QKdGlZU6CqOPVrZKGx3mvaQeDUjcsAuZPbnWYS6mbBAST9UDra
	d89jJ7wE2x6So/n+MuAsGBrQppXVscKcqzrCJ0e1Ful0gIu5XKsYCFutKHCLh42GKnt6D5oLZRIu2
	1tpy2MoPVst4nWlNFM6Btz+2RP7dPYhMHGMB9N/rX+Y4aGULemRqv76zgUcPI3/ibiv8cM8keVNfp
	T8rkmfAeTJpjCztpdNha+qSH6Qqef1xXXVKKY1MmN4tUApYckutZxeZp4/FktQXZ1euyRRLGTe9r9
	hmT1pj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6jo-00000008U5y-0UJy;
	Wed, 29 Jul 2026 16:02:32 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6jc-00000008U3A-22e6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 16:02:21 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1952284AAE;
	Wed, 29 Jul 2026 18:02:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sVqEWKgVOWu; Wed, 29 Jul 2026 18:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785340937; bh=mW4q1NUpWiZCtA2BHmN6n4ewmtio2UFy6U3OYjBYq3k=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=fbemAMEpCEuzSp6l7MlvZxIvXqjI0OpY12HyLxWBxvbxW7sTkP9txcddyPZ3oRWbk
	 4Dc79ENZpDmLQOqsiuLXfvURzWO/9JJQC2NsI0TcvuyxAPsI/WbInNOrprIJBYanP4
	 zrh4FpHt3gt9fafCQUkGbc8gGWc4lkhAWNBKecaXIHe/kaYqgdK79b03y5XXbJynmQ
	 HgE833B9eQ47qYVBlCBCK11la17aSos8P2+ugFZ0SdqEqMc5qPY8h+SQ01jBfq2gmG
	 RvbnS7UJC/epu638bmrZWPDGxJofRmksfcUXaqwncNbZzfsK27S3UnNDOFLYbPLHXE
	 COBMfsGCFsscA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 21:32:00 +0530
Message-Id: <DKB6JC2T38OQ.11ELUOPIMUJ15@disroot.org>
Subject: Re: [PATCH 2/5] Input: zinitix - do not ignore non-moving fingers
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Michael Srba"
 <Michael.Srba@seznam.cz>, "Linus Walleij" <linusw@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-input@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>
 <amO1AWyjGltjO0lZ@google.com> <DKB6545IAUEM.31XPRNO2FNBPM@disroot.org>
In-Reply-To: <DKB6545IAUEM.31XPRNO2FNBPM@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090220_673155_C9CBCFEC 
X-CRM114-Status: GOOD (  22.47  )
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

On 2026-07-29 21:13 +05:30, Kaustabh Chakraborty wrote:
> On 2026-07-24 12:24 -07:00, Dmitry Torokhov wrote:
>> Hi Kaustabh,
>>
>> On Fri, Jul 24, 2026 at 12:54:04AM +0530, Kaustabh Chakraborty wrote:
>>> With the ZT7548 touchscreen present in the Galaxy J6, multitouch does n=
ot
>>> work reliably. This is due to the fact that the driver reports fingers
>>> only when their state is changed, so it's either placed against the
>>> scren, moved, or drawn away from the screen.
>>>=20
>>> The function which is responsible for this is zinitix_report_finger().
>>> This function is called from the IRQ handler, under the following
>>> condition:
>>>=20
>>> 		if (p->sub_status & SUB_BIT_EXIST)
>>> 			zinitix_report_finger(bt541, i, p);
>>>=20
>>> This implies and ensures that every valid finger must have the
>>> SUB_BIT_EXIST flag.
>>>=20
>>> However, at the beginning of the function, it refuses to recognize any
>>> finger if it has none of SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE. This
>>> excludes fingers in reports which do not move from the position since
>>> the previous interrupt. Add SUB_BIT_EXIST to the list of valid bits.
>>
>> This makes the check basically a no-op as SUB_BIT_EXIST would always be
>> set when we reach this function. It may very well be that we want to
>> delete this check altogether, or maybe we need to add SUB_BIT_UPDATE and
>> SUB_BIT_WAIT. I am curious what status bits you see when this condition
>> (original) triggers for you...
>
> I see 0x03 [EXIST | DOWN] when the finger touches the screen, and 0x05
> [EXIST | MOVE] when it moves. When it stays in the same place (this is
> triggered in multitouch where one finger moves generating an event but
> the other is stagnant) it reports 0x01 [EXIST]. When it's lifted up it
> reports 0x08 [UP].
>
> It looks like report_finger() is meant to be called when the finger is
> up but it isn't because EXIST is not set during the UP event. So I guess
> the solution is to remove the guard in the IRQ func and call
> report_finger() unconditionally.

Actually no, interrupts are also called with 0x00 which should not be
used for reporting instead. So:

		if (p->sub_status)
			zinitix_report_finger(bt541, i, p);

>>>=20
>>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>>> ---
>>>  drivers/input/touchscreen/zinitix.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchs=
creen/zinitix.c
>>> index 3421b8ffb19b..fdcb80f52c91 100644
>>> --- a/drivers/input/touchscreen/zinitix.c
>>> +++ b/drivers/input/touchscreen/zinitix.c
>>> @@ -406,7 +406,7 @@ static void zinitix_report_finger(struct bt541_ts_d=
ata *bt541, int slot,
>>>  	u16 x, y;
>>> =20
>>>  	if (unlikely(!(p->sub_status &
>>> -		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
>>> +		       (SUB_BIT_EXIST | SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE))))=
 {
>>>  		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
>>>  			p->sub_status);
>>>  		return;
>>>=20
>>
>> Thanks.


