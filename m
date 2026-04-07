Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5050FF510C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSVMEHy+2VPwoXf30TYIoz6VOcftXc6BuQHtDhinmfY=; b=RRMHXH1r+Bj5Ql1LrWFtrn1fBR
	p+G1eurc7+hMmi7+Rcp1oYj968DI3khuh/gLU0UIosFxRxLNZxzmkxVUFgoW1Z/1exDXzFvdfWG7z
	KJxR0anzdnHJOTcWlAIQm1ixE/jF/zMaBIITFiPlwOCbzm3FOcNfJK4RZeN0TMGH5nCOrJ7789ndT
	FMtgJl53DoD1dURgx7FOdth03q8Y9bzp5ElvctN97ItSTddyYejwClURq0I2+sCRL0JQo2fF0tKeE
	1Aeda509JpsL1lgjYEAnADKnC49xPWy+GGkwaxwVJkJS3eE/MW9QtAUBq95qXJC9/N65+cnWZ2Amh
	Ln77vKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA90B-00000006lzY-16WS;
	Tue, 07 Apr 2026 16:10:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA90A-00000006lzO-201T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 16:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9A71600AC;
	Tue,  7 Apr 2026 16:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67838C116C6;
	Tue,  7 Apr 2026 16:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578205;
	bh=+LzdHSeVHiMH4ZZcTEUvseGkknSG0WWsqny03v1gLto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eNUbY+H53sWRWGY+ZkRJU0Pngf2NVkOSP1tMr1Fht6gdcC9vtciJYT6kEcS5ZXTcK
	 aaCdOc/QX/dmIWkNcaGmy9F6iR4TJ8GqO2UTNlakS6NwKu68o716Enl2CRClzOPvXa
	 z9SwM3QZ7eZpCcdE46XlhpLz8yjevDOAl9lwR0iRhaN0YhKlU59PbHiDT1PnoRMJYP
	 bnwTU0Yr7LV6LkcIAROPhjOpCFMuv3SKZW2E2IG3QD1Y8HzJasypv7/7kiewMJ51v7
	 Tnoij7H3XA3707V/hILVc4egCWKZ8MtubR0p5y5/6c5yv0qlsdrbKRYJIMBEwsI6uo
	 AIHAoBwN39D4A==
Date: Tue, 7 Apr 2026 11:10:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Guenter Roeck <linux@roeck-us.net>,
	Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>,
	linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sven Peter <sven@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 8/9] dt-bindings: arm: apple: Add M3 based devices
Message-ID: <177557820303.2666031.1709190779045353584.robh@kernel.org>
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
 <20260320-apple-m3-initial-devicetrees-v1-8-5842e1e393a8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-8-5842e1e393a8@jannau.net>
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


On Fri, 20 Mar 2026 13:23:26 +0100, Janne Grunau wrote:
> The Apple devices with the t8122 SoC (M3) are very similar to their M1
> and M2 predecessors.
> Only the 13-inch Macbook Pro is replaced by a 14-inch version based on
> the design of the 14-inch Macbook Pro with (M1/M2 Pro/Max). The Mac mini
> was not offered with M3.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/apple.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


