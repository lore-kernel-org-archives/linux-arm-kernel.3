Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDAFD59F6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gfijm/RLD+lXbuyRgVfXKimTXT6rUTvCVarP1pDH3Y=; b=OFuAZwERFItFWlhpqPLkHHTWK9
	Wz28Ri3rwkXj8QF5f+Orx45OqVZoqShPxGMDb92AbwJ6fanBOB/wKYnlHRxK6b6MAZ3uw8fBHC2fm
	fQD4KOO4oiGhWpukwqF5BvSuPXtQVasyxKR5xfIeObOHckzeE07zZbsYppDVZel+E/g9FceK7D/g6
	X2EjNrYHYIbkuqP+aJ6docaBwW4NehTQtEdv77u1JsPSn/zn5zaIBtax6eX4KCSzGWQY4eq89L8/q
	7bG1AIpGY6E4GILIlMfseWT5li/waZnbx21C9J17qYwpi9usQArj3Sl7OKYgEs1FKN7ggo24ISl1r
	W7Yc9PRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lz6-00000004aNC-0XuF;
	Wed, 06 Nov 2024 19:46:32 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kqu-00000004M2a-3Onj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:34:02 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id EF3D01019FA;
	Wed,  6 Nov 2024 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1730918034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gfijm/RLD+lXbuyRgVfXKimTXT6rUTvCVarP1pDH3Y=;
	b=Y9Jzil5Av9lktyWzyjck5L5dXnYb6m0yXBzLv3pR4HmNXjiwIcJsGmIZLUOKrL6lMCt5F7
	JZRgz1b3Zbu/EXW5NJNHWy55/Zu183V1fF70x7JJF6NnVsSwvARaiXOJREA4+UE25lyXeM
	hjetEtcISGGoqhrUSt8W1UhJZejmmKo=
Received: from [127.0.0.1] (fttx-pool-217.61.145.66.bambit.de [217.61.145.66])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 2019910051E;
	Wed,  6 Nov 2024 18:33:53 +0000 (UTC)
Date: Wed, 06 Nov 2024 19:33:53 +0100
From: Frank Wunderlich <linux@fw-web.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Russell King <linux@armlinux.org.uk>
CC: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: Drop undocumented SATA phy names
User-Agent: K-9 Mail for Android
In-Reply-To: <87r07p8x12.fsf@BLaptop.bootlin.com>
References: <20241014193528.1896905-2-robh@kernel.org> <87r07p8x12.fsf@BLaptop.bootlin.com>
Message-ID: <0A5AFF77-D888-4151-9C15-15A408709857@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 84d1e7cf-5cca-47d1-bd64-002501d9a1b8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_103401_032428_311A63A4 
X-CRM114-Status: UNSURE (   9.12  )
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

Am 5=2E November 2024 17:28:57 MEZ schrieb Gregory CLEMENT <gregory=2Ecleme=
nt@bootlin=2Ecom>:
>"Rob Herring (Arm)" <robh@kernel=2Eorg> writes:
>
>> While "phy-names" is allowed for sata-port nodes, the names used aren't
>> documented and are incorrect ("sata-phy" is what's documented)=2E The n=
ame
>> for a single entry is fairly useless, so just drop the property=2E
>>
>> Signed-off-by: Rob Herring (Arm) <robh@kernel=2Eorg>
>
>Applied on mvebu/dt64
>
>Thanks,
>
>Gregory
>> ---
>> Cc: Frank Wunderlich <linux@fw-web=2Ede>
>>
>> There's also this 2 year old patch fixing other SATA errors[1] which=20
>> was never picked up=2E :(
>>
>> [1] https://lore=2Ekernel=2Eorg/linux-arm-kernel/20220311210357=2E22283=
0-3-linux@fw-web=2Ede/

Hi

How to deal with my patch pointed by rob?

regards Frank

