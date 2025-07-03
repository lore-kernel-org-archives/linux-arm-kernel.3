Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF39C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRfjg5TqBCi/KJ5DoNhO/Uetad51xuSqQDeNpXClAuE=; b=viZTG5XaPx1qUzX/635iBUOxHJ
	MEMzFX2ZUYUGBmEj0jy12g59VzCCLLc53Je2aZoMnbKSjYGTLn2iIKKYgSKyt51KmDEM/kzHTZrJH
	+GnE/PUtX98t5QBokBbm/3S6/tfcgo9hmdDK3cyLTXrsyAS2d9qhpqK6MMF3TSVmjyhzIMUkIdhll
	ItvPxYZaoC7FzUwWFQummv/W4AoTF8mn92Jlk9BhaY9frHjUZ6vAND+5xQCEMfyrS9FrKWYCxY9dG
	HniACGoxH1dvSOu1mXNeO/R2Yj3GmvdDLwt8lfBVG1Swo8xBYgyNb6EqhYS3WMW99zJRYhxuC38ac
	rKEcYw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGlj-0000000AvFW-2jjl;
	Thu, 03 Jul 2025 10:02:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGh3-0000000AuX7-3O8U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:57:27 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uXGgb-0007Za-5y; Thu, 03 Jul 2025 11:56:57 +0200
Message-ID: <8db56c73-191e-48ec-9a28-cbb0da9a8a80@pengutronix.de>
Date: Thu, 3 Jul 2025 11:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] imx8mp: add support for the IMX AIPSTZ bridge
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <3615415b-7ebd-45e5-8d7b-8a1b26ac7130@pengutronix.de>
 <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <10ef8a9a-6d23-4fb9-933f-71ab493d21c7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_025725_848527_FC5570FB 
X-CRM114-Status: GOOD (  21.35  )
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

Hello Laurentiu,

On 7/3/25 10:51, Laurentiu Mihalcea wrote:
> 
> 
> On 7/3/2025 11:11 AM, Ahmad Fatoum wrote:
>> Hello Laurentiu,
>>
>> On 10.06.25 18:01, Laurentiu Mihalcea wrote:
>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>
>>> The AIPSTZ bridge offers some security-related configurations which can
>>> be used to restrict master access to certain peripherals on the bridge.
>>>
>>> Normally, this could be done from a secure environment such as ATF before
>>> Linux boots but the configuration of AIPSTZ5 is lost each time the power
>>> domain is powered off and then powered on. Because of this, it has to be
>>> configured each time the power domain is turned on and before any master
>>> tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).
>> Sorry if this has been asked before, but I hoped the cover letter or patch
>> 3/6 would explain if it were.
>>
>> What is the default configuration for the AIPSTZ before this series?
> 
> the default configuration is the reset configuration since AIPSTZ registers go
> back to their reset values during domain power cycling.
> 
>> I assume the SAIs under AIPS5 can be accessed by SDMA already, so why was
>> changing the AIPSTZ settings needed for the DSP to work?
> 
> AFAIK SDMA transactions to peripherals don't go through AIPS5. They use SPBA, which
> is why SDMA works even w/o this series. As for the DSP: transactions to peripherals go
> through AIPS5. With the reset configuration, the DSP is not allowed to access said peripherals,
> which is why this series was needed.

I see. Thanks for tackling this issue and your explanation.

Cheers,
Ahmad

> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


