Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4D4C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm6mpexl8UNvAjXlAw9B3yDJMgzV4getqht/eJlGdTU=; b=ggRyE+3+LiP7KsLQfc+nGxhOeh
	U3Vk00vp5otwhtDCZuGvXUaHVjNqnp22fFfWxV5TaGt4tLoiJIXJe8lr0dsbP0FvsxrY+U/9vZ6Ba
	drYlbEFyU7JY4k/OUFuoQvXSubeKaSqpXSlJcjXhtkSRDrfYXP2kQIRChGZplk42Y9pbGJg1BcOGp
	65n0brZgALqavYyO1GMGubznP7V78CX86BhVsdZFngMliwleFDTt6YPNP0cKBDJbj3dM0Y2StqDMX
	FS3Qjp28QrQuLmev65rMZ9mRF8SEluJh+wOAZqCLJWo645Do+/5vDt2SD17mw0D1qWew0jtIO4m+l
	lZ+nMbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXG1x-0000000An8Z-0UrX;
	Thu, 03 Jul 2025 09:14:57 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXFza-0000000Amn9-4BAj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 09:12:32 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id A3E5AA00F5;
	Thu,  3 Jul 2025 11:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=zm6mpexl8UNvAjXlAw9B
	3yDJMgzV4getqht/eJlGdTU=; b=nW4ZO1C9dH+SbeS8/4Gjs/GLK94t2Kd0hSk7
	NDetXaEeXgHogmX1TJ7MxvPr9WuDZxN0RXJ4kSrLHwGSUwTDaSXrlw0yl6Iz9exK
	RyXID1x9yeeX9gt6XN1e4Iqp3zCDF26QfL81CSs3LWrN+u+t2Xx2HJNNgcLzV3Ea
	HlJ/FM3ytcwSclbWhajwxzb52++jQGwG7Qi2gvBhckV0+WbGrJY+qu6ioW3gH1V5
	s9PdIUij4Ykl79HaK9/cuiOPPOyB487cvUzFKt4xKr02FF9m21U3kxH4rHzOircl
	t9PXh/Bhv45WghYc1LTw3jS5fcaCTzIJav3V1pQrWsF2Csg2FfFdiG0xiuZiQtP/
	o3X7aYvBJTnAtu8PhRrxe+ztWDfAF2hPXp+ApyeuIIxCaHMqipowPr5Ix9C2Wvl4
	ZFTZG4CeB3SQkQ97b1solAzknwey/f667c3KVBtn62xfVy+ouyR82O7HGnAjH+Xg
	2NcFq70guUC5705CEOSrLAF96evFjQsdiGVclubWHsMtNi0BdgiPt4YiztIPpDYA
	eDE0sLQd6AMZN1usHfTvrvyrhWdVTKZ363vdvTImIeiQvx0OhAUt3hydn8sYXatJ
	svYcbRlQ2Ut2TU7KGYMuqH9kEbz0sAOAh7l843ISreMOVUYLs5WCbtKlFtCTdx/G
	LW998iU=
Message-ID: <828b473b-c5a5-4c5f-9f7c-200f307cd629@prolan.hu>
Date: Thu, 3 Jul 2025 11:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: DT: imx6-sr-som: Replace license text comment with
 SPDX identifier
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250702-sr-som-dts-lic-v1-1-2e8584e6c837@prolan.hu>
 <aGWqIzNvSVw4olz5@shell.armlinux.org.uk>
 <2f628251-5b67-47e0-8038-6c1aeee1ef91@prolan.hu>
 <aGY5bx1Qpx_7Dqea@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <aGY5bx1Qpx_7Dqea@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A296767155D6C726A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_021231_191507_571B1481 
X-CRM114-Status: UNSURE (   5.69  )
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

Hi,

On 2025. 07. 03. 10:03, Russell King (Oracle) wrote:
>>> As Florian has already mentioned, the preferred format for the summary
>>> for arch/arm is "ARM: ... " and by extension for arch/arm/boot/dts,
>>> it's "ARM: dts: ...", not "arm: DT: ..."
>>
>> Ohh, I misread it, I thought it was just about `imx6: board:` ->
>> `imx6-board:`... Ok, I will re-format it for v2.
> 
> Note that it applies to _all_ patches to arch/arm/boot/dts.

Naturally. I will do that for all the v2s I will submit from now on. I 
hope the current format I've been using today is correct now.

Bence


