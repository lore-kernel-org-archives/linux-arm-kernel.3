Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413D4C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGJ4IMk/2S17LDkhvq63xf3GveG7JHLPRsDkZ58UWfU=; b=FrIT+4keAB6GD56ZyXiBKiMT3P
	3Xu1nWdOsRnALEgctFVxc1p5InyA/eZpRNyFlw9bIOsWTmGLKHi/fYTNM13esUSknGljLKtQdAoFJ
	jgqInJ3Sb4GMWcZnV9R51k2DjEQueHvg/CzXFbbTolujLE7Ree3xPG7xN62wA7kKYYP4s3vmCUFD9
	6rKAxMVzFChpVgeM0k5YWA6F8PKtV095g5Sks7vLIafLz62QU0yI+uAQ8Wi/NbU3mRlE6KhFGgMkK
	fDdePT7YOm7mjm1HLVebZV6TjxgZbwj3nlk9gBdaA/j64AUGKgJWIai++KiczisyQLmZsdD3DzTFl
	NVMkgF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to47t-0000000Bx69-2gfy;
	Fri, 28 Feb 2025 17:26:17 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to46J-0000000Bwhj-2Mjl;
	Fri, 28 Feb 2025 17:24:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B205A44293;
	Fri, 28 Feb 2025 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740763476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lGJ4IMk/2S17LDkhvq63xf3GveG7JHLPRsDkZ58UWfU=;
	b=ZjHYKfuReiCginek0gxRtQpQEORyx0FtOFMEQHOOGYi5/rLgqlO2nBEWF2MPHmLLDJf67q
	doZ39uHef9kpzhrR07JLduVxaUly0YgJVndRcmHGl9wVHS5oezVNffdfBI2eOj9jatCRM3
	fppR4sBcN8+RCWtfldFGmCF3cUt4+ZApNx9qlWs0Br/yG67bntPHFsKy5F4wR3Hug2+BA9
	5qImyp03z9QovpbndR6K9UKlOlPC9JCSJueFHqftlrraGU02psiazdb3ign77W+G7KV2gu
	s4DfRorOuC8ghThvxbt4rHMR1A1lYdJcpfW7DbdDZXhI27GKP5eKgoVvsuk0ZQ==
Message-ID: <249cb614-5b4d-4bf2-b3ee-58534f4d7852@bootlin.com>
Date: Fri, 28 Feb 2025 18:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Describe the cameras in the PinePhone Pro dts
To: Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, oren@taumoda.com, Ondrej Jirman <megi@xff.cz>
References: <20250228-camera-v1-0-c51869f94e97@bootlin.com>
 <0338826971bfdd5b771bc1c6ada795eb@manjaro.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <0338826971bfdd5b771bc1c6ada795eb@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeltdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpefqlhhivhhivghruceuvghnjhgrmhhinhcuoeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeijeeiheffvefgleetjeehudfgvdejiedvtdegveeljeevheejkeekvefhudeunecuffhomhgrihhnpegtohguvggsvghrghdrohhrghdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiedphhgvlhhopeglkffrggeimedvrgdtudemvgefgeemvggtfeekmedvgegvtdemfhehtggvmehffeegvdemieehkeejmehfieehiegnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegushhim
 hhitgesmhgrnhhjrghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_092440_054990_54C86F4C 
X-CRM114-Status: GOOD (  16.51  )
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



On 2/28/25 16:46, Dragan Simic wrote:
> Hello Olivier,
> 
Hello Dragan,

> On 2025-02-28 16:19, Olivier Benjamin wrote:
>> This series adds support for the Pine64 PinePhone Pro's rear and front
>> cameras in Device Tree.
>> This is based on some of Ondrej Jirman's patches hosted in his tree at
>> https://codeberg.org/megi/linux, but I have also fully reviewed and
>> re-written the code from the RK3399 datasheet, the PinePhone Pro
>> schematic, and the IMX258-0AQH5 software reference manual.
>>
>> I have tested these changes on my PinePhone Pro and am able to take
>> photos from both cameras using libcamera's cam.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
> 
> I'm afraid that you haven't addressed the notes from the feedback
> you received earlier? [*]  Also, this should be the v2 of the series,
> which should contain "PATCH v2" in the patch subjects, and provide
> a summary of changes in the cover letter.
> 
> Or, did you just resend the v1 by mistake?
>
I somehow missed Heiko's feedback in my email, and therefore intended to 
resend v1, but b4 would not let me simply resend.
My most sincere apologies for the noise, I'll address the feedback and 
send a v2!

> [*] https://lore.kernel.org/linux-rockchip/5127541.31r3eYUQgx@phil/
> 
>> ---
>> Olivier Benjamin (2):
>>       arm64: dts: PinePhone Pro: describe I2c Bus 1 and IMX258 world 
>> camera
>>       arm64: dts: PinePhone Pro: describe the OV8858 user camera
>>
>>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 138 ++++++++++++ 
>> +++++++++
>>  1 file changed, 138 insertions(+)
>> ---

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


