Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE50CCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LgG9gPlkIJWvQG8qqwMiPTiG2WAG9DKgMroYDQ2bIs4=; b=bAAsGRDJu1LbgfRdAdF21dgBh6
	8Ervv75AwYEVUXS03yVKHTd0TbeFLhkyFCS8kIk4JdxROVdsgnCr2Cf9lpR/Bt3sOJSowIYtyjVo0
	u27KxhKy+nytyOo3wjRZqSy47Xq2OE6AZVHzLV/EQbAJb/0QWP2hJy0+0kbcrPheBbgWQjg4SsCv3
	tifJjB2svmVFno7AerPcHgmOvq3hPlpwa/36CheOrNcG+5yS0tMoEO4fVEQlPbdeuXTMyjM10984b
	3Pe520EPP0MC5pmxOA41Ij00jBEhU5HMXH/QyyQS2i+rgR0aMI7YVnhyZYprKLjLVK9ChvfSD2xgH
	jab/LvFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ5V-0000000GMfd-0Whr;
	Thu, 27 Nov 2025 10:18:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZ5S-0000000GMeX-1QgE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:18:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3209B4E4191D;
	Thu, 27 Nov 2025 10:18:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0474D6068C;
	Thu, 27 Nov 2025 10:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A079102F08C5;
	Thu, 27 Nov 2025 11:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764238730; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LgG9gPlkIJWvQG8qqwMiPTiG2WAG9DKgMroYDQ2bIs4=;
	b=YrQfQhb+6aDx5eS3gn6+AMkY79V3G5HwUWsG48DP7Ih/mZrx7WTptzXRO827bZSdUtZllW
	kEUg5cJcFYjDa8na85/pJT2Pfw/MIOpVY/Tb9RJ7joAiKOugYhzu9Lu0s6AfmFvS2aFTsd
	fTG30Dvk6BijXC7uKs901C/NK3KqDw7AG6N2qSsZ02TBvgPr2+du1ZfwHQMKHVvCHmqCy9
	nBZZsUcQmH2ycbgM3mzVBeGTtroQY9IJEREPP4Gvg+OebLRWeFj0P0btFjtvy5EyFEMoOi
	B2moEm7ez2lAOSdFt18NQ2Ek/LaVAov9so6PXi6rAOPAzdCzKX2wpoWmmimRHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Nov 2025 11:18:45 +0100
Message-Id: <DEJEFLKA9IJR.237ZLV8HBD2VS@bootlin.com>
Cc: "Kever Yang" <kever.yang@rock-chips.com>, "Minas Harutyunyan"
 <Minas.Harutyunyan@synopsys.com>, "Alan Stern" <stern@rowland.harvard.edu>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, =?utf-8?q?Herv=C3=A9_Codina?=
 <herve.codina@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-phy@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "William Wu" <wulf@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
X-Mailer: aerc 0.20.1
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com> <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com> <DEHVRC8CY12S.3LSC6UVSMU0C1@bootlin.com> <DEJD8DJZFNZO.11B1UBXJBN7MO@bootlin.com> <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
In-Reply-To: <DEJDSE73CJES.2AB8YSKLW6VE1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_021854_503407_1B4EA3FE 
X-CRM114-Status: GOOD (  16.70  )
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

Hi Th=C3=A9o,

On Thu Nov 27, 2025 at 10:48 AM CET, Th=C3=A9o Lebrun wrote:
> On Thu Nov 27, 2025 at 10:22 AM CET, Luca Ceresoli wrote:
>> On Tue Nov 25, 2025 at 4:28 PM CET, Th=C3=A9o Lebrun wrote:
>>>> The code already checks for !rport->suspended, so add a guard for VBUS=
 as
>>>> well to avoid a disconnection when a cable is connected.
>>>
>>> Your commit message was clear but I was missing one key point: what
>>> rport->suspended means. It isn't what I first thought. Instead it means
>>> phy is powered off. Naming is bad but unrelated to your series. Maybe
>>> add a comment to your commit message like the following?
>>>
>>>   The code already checks for !rport->suspended (PHY is powered on), ..=
.
>>
>> You are right. I have added a slightly longer text:
>>
>>   The code already checks for !rport->suspended (which, somewhat
>>   counter-intuitively, means the PHY is powered on), ...
>>
>> Still worth your Reviewed-by?
>
> Even more so.

Thanks, v2 on its way.

>> I also added the Cc: stable@vger.kernel.org line, which I noticed being
>> missing.
>
> I never add that Cc trailer and only rely on `Fixes:`. I thought it
> used to be documented as an alternative to that Cc trailer but it does
> not show up in `git log -p Documentation/process/stable-kernel-rules.rst`
>
> There is one indirect mention of "scripts that look for commits
> containing a 'Fixes:' tag":
> https://elixir.bootlin.com/linux/v6.17.9/source/Documentation/process/sta=
ble-kernel-rules.rst#L132-L134
>
> Anyway, you do right by explicitly tagging `Cc: stable@...`.

Theory says Cc: is needed:

> Note: Attaching a Fixes: tag does not subvert the stable kernel rules
> process nor the requirement to Cc: stable@vger.kernel.org on all stable
> patch candidates.
(https://docs.kernel.org/process/submitting-patches.html#reviewer-s-stateme=
nt-of-oversight)

But in the practice I happened to forget Cc: stable in the past, the patch
got applied and the Fixes: tag was enough for correct cherry-pick in stable
branches.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

