Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C81C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0x+PsBO2oGdGI0uTLs5pC1K76Rc89ljaAuHphOM+T4=; b=GgwTgs5l9Hy6gaz92xgshlHRu9
	FMwvpVspqliSRgLhfrNYYftw021fLN9CzJ7Qrn08jlHF98jOSJXexFx5YNexbMZXvel2PQKRRNp0Q
	6QNsZlYs4CXor5pqI112QXKZU+TeFX9a4Z32hvcltyy8/EjhYtDTbL5yMYWqr7Tchk9guyuD4bps/
	aKJkOGXIP6Fe32Dj91L2oMblJxYn7QygjFOVXSzoCGvg7ULnBVJg6R0p2jyjrUvj5rGVah335CKr4
	JKH9nXGEVF+RvZbz7hvhycamX82uwHw3iNRPHcS6q6dZu0je9pc6SvS8WIqNS9LUzTWHxUPV88y94
	HJpPeghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgof-00000009uSh-1u8w;
	Wed, 19 Aug 2026 13:58:53 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwgob-00000009uRv-2Ls7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 13:58:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2695A4E412D6;
	Wed, 19 Aug 2026 13:58:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED2235FF42;
	Wed, 19 Aug 2026 13:58:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8798E11C7573B;
	Wed, 19 Aug 2026 15:58:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787147924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=h0x+PsBO2oGdGI0uTLs5pC1K76Rc89ljaAuHphOM+T4=;
	b=YW31FqtoNx1v0+ylpaV19edkzvCvqtMyy0NX6qF7rA1eVNNXf4YxtjoWleRwbGW5PX2iiw
	GT87LaQdo4z6GgdwsXBObjXyDF0SJaYRFxL60iR6/t06mzkrbCJPIJd+eiixFccG6RJh/7
	asLCK5nLtYvBGdaEJUGYx7rYT6aERChSdREbRkRmxEFaBURZTEW1AtV24fQ6ERe/IIUB6w
	z7luYO2DwXA/u+EIM2ZWT9DAwA7219JYZwdgJIBkYpc8C8fKqLRu8baH/kegnzaXD0qKqM
	spMsm5Yukes/AjOldIeTcg2Rk6DxOgnqlUuOdf2CWpMURMXvoz6f41if2vR+0w==
Message-ID: <ba9f69a4-3ddb-4f64-b031-02c0d2de0f1c@bootlin.com>
Date: Wed, 19 Aug 2026 15:58:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM
 memory region
To: "Rob Herring (Arm)" <robh@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Beleswar Padhi <b-padhi@ti.com>,
 Conor Dooley <conor+dt@kernel.org>, Abhash Kumar <a-kumar2@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Thomas Richard <thomas.richard@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260703143717.177362-1-richard.genoud@bootlin.com>
 <20260703143717.177362-2-richard.genoud@bootlin.com>
 <178423118332.1182230.16969278384286286126.robh@kernel.org>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <178423118332.1182230.16969278384286286126.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_065849_744179_3347AC55 
X-CRM114-Status: GOOD (  15.09  )
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

Le 16/07/2026 à 21:48, Rob Herring (Arm) a écrit :
> 
> On Fri, 03 Jul 2026 16:37:12 +0200, Richard Genoud (TI) wrote:
>> Declare a carveout memory region to store LPM metadata on Jacinto
>> devices.
>>
>> For Jacinto devices, this memory region is needed for saving ATF context
>> and the certificate information of ATF and OPTEE and DM image. This LPM
>> metadata area is firewalled to be accessed only by TIFS.
>>
>> U-Boot R5 SPL/TIFS will use this area to save and restore:
>> - ATF context
>> - ATF certificate information
>> - OPTEE certificate information
>> - DM image (which has been copied in memory at boot time by U-Boot
>> R5-SPL)
>>
>> At resume, U-Boot R5 SPL is executed and detects that the board is
>> resuming (with a flag set in the PMIC), then it:
>> - brings out of retention the DDR
>> - retrieves the LPM memory region from DTS
>> - authenticates certificates from LPM memory region and applies firewalls
>> - asks TIFS to restore TFA and its own minimal context
>> - starts TFA on remote proc
>> - loads back DM image from memory and jumps to DM
>>
>> https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr
>>
>> NB: This memory region is not part of DM memory (which is not retained
>> at suspend)
>>
>> Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
>> ---
>>   .../bindings/remoteproc/ti,k3-r5f-rproc.yaml   | 18 +++++++++++++++---
>>   1 file changed, 15 insertions(+), 3 deletions(-)
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Seems like sashiko raises a legit issue, but that's a kernel issue and
> not my problem if your board crashes.
Thanks for raising this.

Indeed, Sashiko is right.
Using no-map; doesn't prevent from direct mapping through 
devm_ioremap_resource_wc().

Nishanth: Would it be acceptable for Sitara if we skip 
devm_ioremap_resource_wc() for lpm-metadata?
Or should we use a different name for Jacinto, like
firewalled-lpm-metadata?

Regards,
Richard

> 
> Rob


