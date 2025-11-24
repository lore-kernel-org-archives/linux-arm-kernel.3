Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77165CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i7kbUPYmlbYLzYoyHKczD8p09iy4YwPyXfH3iBm5Eas=; b=EJNmzi3ej6Xzx2Y1HcL9Fz2CEi
	TspdvsEaz51IU8z9tvzbeUOKmzdmKEBwdar6AI/KuYVDNpwqJaNzxj6Q3hJPC/oxtoDWk8LkItI8/
	VXW0Dau539489asI5jYROnalHOJA6wO232yPzgrHocEWqKVLxDVopVk0Aw8wBA+doYbYDAqHqr53k
	r/79CfPBh958KYnb+hJqu0Imux1Yii4wnp6D3jQr1lMoDaA7Vt/b8MXQkVBmNf/g004V2aOo34rMj
	ToPhstloPiSP6cbGxFs0/2F4trYAcxQMA/lN4Xxocgqp5CJYhkW/kM4WHznsJu3oBzHfdKve66VTJ
	n2f0NRWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYLf-0000000BuDh-0D66;
	Mon, 24 Nov 2025 15:19:27 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYLb-0000000BuDG-3d6e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:19:25 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vNYLM-0002Fk-6e; Mon, 24 Nov 2025 16:19:08 +0100
Message-ID: <00b6154b-cf95-463d-b46d-2944d2fef8a0@pengutronix.de>
Date: Mon, 24 Nov 2025 16:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: Update pin function file
 according to Rev.D RM
To: Aisheng Dong <aisheng.dong@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "dongas86@gmail.com" <dongas86@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Frank Li <frank.li@nxp.com>,
 "kernel@dh-electronics.com" <kernel@dh-electronics.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux@ew.tq-group.com" <linux@ew.tq-group.com>
References: <20251124095449.4027676-1-aisheng.dong@nxp.com>
 <5432a356-7694-46a5-966b-29257f37a8f5@pengutronix.de>
 <DU0PR04MB929990AF168DA048D26E993480D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
 <18901222-fa5a-4e5e-91c9-f252d6bf1a18@pengutronix.de>
 <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <DU0PR04MB9299811B113C555FD795FDC280D0A@DU0PR04MB9299.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_071923_909686_C6C2DF11 
X-CRM114-Status: GOOD (  23.16  )
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

Hello,

On 11/24/25 4:08 PM, Aisheng Dong wrote:
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Monday, November 24, 2025 9:54 PM
>>> Could you help elaborate a bit more why need keep the old defines as I
>>> saw the previous update patch also didn't keep them?
>>
>> Which previous update patch do you refer to?
>>
> 
> I mean this patch:
> 
> commit bcf7206fe9c35e048e1dc90cf62216b0f5eaf091
> Author: Anson Huang <Anson.Huang@nxp.com>
> Date:   Fri Aug 14 17:27:19 2020 +0800
> 
>     arm64: dts: imx8mp: Update pinfunc header file

2020 was the same year the file was added, so any fallout it could have
caused back then would have been minimal anyway.


>> Generally, If the defines are wrong or misleading, I am all for renaming them.
>>
>> In this case, NXP changed their mind and renamed the function in an
>> (unreleased)) reference manual.
> 
> This is not accurate. The RM with updated names has been released.

Thanks for clarifying. I had meant to add a question mark :)

>> The tradeoff here is between:
>>
>> - amount of confusion avoided when we rename USB_OTG to USB
>> - amount of overhead introduced to adapt device trees
>>
>> I think the benefit of the rename is marginal at best and not worth the
>> unnecessary breakage it would impose on countless downstream users with
>> out-of-tree board device trees.
> 
> I agree the benefit of USB renaming may be arguable.
> But how about the remain changes (drop invalid defines and adding new ones)?
> Are they still need to be fixed?

The other changes are ok, although it would be good to add a short info
to the commit message especially about the removed macros if you have
any extra information why these pad functions are no longer applicable.

Thanks,
Ahmad



> 
> Regards
> Aisheng
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


