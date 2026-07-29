Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B830C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 15:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIdQn+KrP8xhzMtMyHhZVHmc0uawbm7W95bgy7yOljI=; b=K0Il6Nh4WFT1AFbN4b4osT3zbL
	UIBk7jMoT3sqqvmn+PtJBso++O2ByB5t7y7LzbJT52cE66Ms92yEJsIHZ6krruYMFqC0oFI8b4iXw
	F8uAERD/8XfMzT6L12woj6NouWbvMlI+glR/cIzAmwXOIodWxoHHWUPPgzNeada0yfWCuo0Ddv9NV
	hRnoHYsxNQreq+LPm9E4QVcQmdSLmFqV3LKjdr1l7ILtoOgcOx4YbzvR+iBNrxYXyZX04Ls4aSM8Q
	g0K0bNiDDn3S/OsR9mwYj11aTu8iFXtX2LyyYryBCum2syOiDwmHlSrNPTWiEdaW9YwNh7zkpuRw1
	bGuD9rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Rf-00000008RKC-3XGr;
	Wed, 29 Jul 2026 15:43:47 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6Rc-00000008RJN-3U6F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 15:43:46 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 068578616C;
	Wed, 29 Jul 2026 17:43:40 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLk8gZc0mQH4; Wed, 29 Jul 2026 17:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785339819; bh=2A7Ua+gGboyx9Qu3yZUlx+cQ5spqoldtu1knNnc9JE8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=OXN1/If7d5tooCBw/+/V1NtXl87ApdLG3jJbzBj6rNm3+Gq7Y0gRW0ofxXcM9bMLH
	 eoAJaw3Eow8cecVoB32hOUHGBqRgY75c8I1nssgg+iFEmJY0qzesY1VAGRN/2nN9OO
	 BBs0Jl6MYPyVH/OL1b7byvp51FdMxTD2m3RCSTRDXY/nkjC9y6Gxzumlo4FyIucevI
	 n94SRroFoA2HZhrBUiR9w4A4PcMr6oXhXiC1PSTmjBKPUpa7SU44KE5sOyaTzTegpO
	 cndn471sxcIw1kfdMxsYG3WYpbp8RnL+Dle9bxNeN3EVSdesxWxSWyJmq2mV3UDG7d
	 lDFOZ44ktr+MA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 21:13:25 +0530
Message-Id: <DKB6545IAUEM.31XPRNO2FNBPM@disroot.org>
Subject: Re: [PATCH 2/5] Input: zinitix - do not ignore non-moving fingers
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Michael Srba"
 <Michael.Srba@seznam.cz>, "Linus Walleij" <linusw@kernel.org>, "Peter
 Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, <linux-input@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
 <20260724-zinitix-modes-v1-2-f6df7d86a878@disroot.org>
 <amO1AWyjGltjO0lZ@google.com>
In-Reply-To: <amO1AWyjGltjO0lZ@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084345_296113_6E4ADD5A 
X-CRM114-Status: GOOD (  23.69  )
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

On 2026-07-24 12:24 -07:00, Dmitry Torokhov wrote:
> Hi Kaustabh,
>
> On Fri, Jul 24, 2026 at 12:54:04AM +0530, Kaustabh Chakraborty wrote:
>> With the ZT7548 touchscreen present in the Galaxy J6, multitouch does no=
t
>> work reliably. This is due to the fact that the driver reports fingers
>> only when their state is changed, so it's either placed against the
>> scren, moved, or drawn away from the screen.
>>=20
>> The function which is responsible for this is zinitix_report_finger().
>> This function is called from the IRQ handler, under the following
>> condition:
>>=20
>> 		if (p->sub_status & SUB_BIT_EXIST)
>> 			zinitix_report_finger(bt541, i, p);
>>=20
>> This implies and ensures that every valid finger must have the
>> SUB_BIT_EXIST flag.
>>=20
>> However, at the beginning of the function, it refuses to recognize any
>> finger if it has none of SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE. This
>> excludes fingers in reports which do not move from the position since
>> the previous interrupt. Add SUB_BIT_EXIST to the list of valid bits.
>
> This makes the check basically a no-op as SUB_BIT_EXIST would always be
> set when we reach this function. It may very well be that we want to
> delete this check altogether, or maybe we need to add SUB_BIT_UPDATE and
> SUB_BIT_WAIT. I am curious what status bits you see when this condition
> (original) triggers for you...

I see 0x03 [EXIST | DOWN] when the finger touches the screen, and 0x05
[EXIST | MOVE] when it moves. When it stays in the same place (this is
triggered in multitouch where one finger moves generating an event but
the other is stagnant) it reports 0x01 [EXIST]. When it's lifted up it
reports 0x08 [UP].

It looks like report_finger() is meant to be called when the finger is
up but it isn't because EXIST is not set during the UP event. So I guess
the solution is to remove the guard in the IRQ func and call
report_finger() unconditionally.

>>=20
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  drivers/input/touchscreen/zinitix.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchsc=
reen/zinitix.c
>> index 3421b8ffb19b..fdcb80f52c91 100644
>> --- a/drivers/input/touchscreen/zinitix.c
>> +++ b/drivers/input/touchscreen/zinitix.c
>> @@ -406,7 +406,7 @@ static void zinitix_report_finger(struct bt541_ts_da=
ta *bt541, int slot,
>>  	u16 x, y;
>> =20
>>  	if (unlikely(!(p->sub_status &
>> -		       (SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) {
>> +		       (SUB_BIT_EXIST | SUB_BIT_UP | SUB_BIT_DOWN | SUB_BIT_MOVE)))) =
{
>>  		dev_dbg(&bt541->client->dev, "unknown finger event %#02x\n",
>>  			p->sub_status);
>>  		return;
>>=20
>
> Thanks.


