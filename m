Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D47D21680
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 21:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8rDSBosyaMHHGMgfwL6ah/RjjEKBsK3EiEwa44oQ4A=; b=ZFBWqmPblIp2DgrOgkz987rLFj
	Fyi1bSGe0fHbd5BOcZu3SRgbUZwgix3u1wmizZ9EoS7Dst2I2cHLjaMoa+lYJJm36gMnLcAFKK1WX
	Xr7cnXK0v/SWgT75/lyKSRgVfSOVK4uLoojW3wloCAc8L2osqCjJaXsmX6OM5C/pZbephZWsiHoBE
	lPAM6c/COgKX3slD5aGCS5A0jbsbNFJeyr4vkSxw2dMoYojIUdLmyZh5xw0mw+i16PQPAczCOMibo
	c886biR27y2Mp/15AdjCYqmsy1Bu3YKB3ybfEqTXDBTZfqcUR+F+QHidlNEtF6/6mXD6FJNds6Hh+
	cA5P95IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGd8-00000008evH-1w0z;
	Thu, 04 Dec 2025 21:12:50 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRGd5-00000008eum-3sQg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 21:12:49 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 068817A0198;
	Thu,  4 Dec 2025 16:12:47 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 04 Dec 2025 16:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1764882766;
	 x=1764969166; bh=P8rDSBosyaMHHGMgfwL6ah/RjjEKBsK3EiEwa44oQ4A=; b=
	tnNdDod2Shlp8HR6zj/fS1KyLmdm8vtIybs9fREYVeI0qrnc53vaV+b6o8Ke4a+5
	eAJ+YAkXg9efah9HYUpynjwfT+4EQXHti0RLsTqjfrxX1sulIl74af2+9JnwhtKk
	jA1KIMErd4TdnsicaA8OXL3adMAfprqpGgGNtiXZvHFpOBCHQeOIBuTb9Z9DTn0r
	9NbownJt6dKEvLA7MVd3CXK/ciCgFmexBhZOr0wxwUvbIpiVd6k8rFcK/ZexNrIr
	BdQndNP+lcCL8KRTOrUsaeogPZwPJpyL9d3ZpVCD4UK/jt8Ye/u616UwbKgoJF8U
	BEo+TVPvztXm6bW/TwWSrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764882766; x=
	1764969166; bh=P8rDSBosyaMHHGMgfwL6ah/RjjEKBsK3EiEwa44oQ4A=; b=V
	GB1BI0OZpDyWm0VHuUger3MwnDZ1j32bT7Yi0F/h4KXDimEzpYzupoulvSbaE2KR
	sJmY3mMXycZKPG30VFrfgifyKisH3y6jtBIgIvxGhYr+XlIVChKX2I+nyag1n+ef
	Nk7FhxdmWG6KzaD8mpjc8ukOh1My55JQCZadTYCwM8uWgagwSbknk6TbIRgT/mwX
	b0rVL45c8rp+As72wca0D1ckgHJBh1oFlgsuo0YWi7LGRK7fAVbZzOI3EccSxnAd
	x7QeYk8k1CRduhzAeQeLCYuSh6Iqt0PNUEcJb1vnxEHuyAA/z40naGg2bP2APBFU
	MDefVJHdWXBq/z220a30g==
X-ME-Sender: <xms:TvkxaYFldMANraKuSdHexhMGbwdoW4bnhB9JEEzNZb79_GoH9FrgTQ>
    <xme:TvkxadPwkew562iZPP4Ks59LwnsG2_9H8OItIXRvYyFx_zO3x9Bd6kr56XejQ5Rew
    B20_HYIedf3nTScVYUc8FtuEWsX78gJgImOpI8DDEWG3yFEtT8bQjw>
X-ME-Received: <xmr:TvkxafI20KRqw0CFOu1jFb_unFDctGdMAkANA6IMp6j5ibVVcccpPoZJzkO6udiRsfE1pKU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeiiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeftvggsvggttggr
    ucevrhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrh
    hnpedtuedtueevtdetkedvheettdetvddviedtvdejffeuudfggedtgfevgeelgfevleen
    ucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprhgvsggvtggtrgessghsughiohdrtgho
    mhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopegrnhgurhgvfies
    tghouggvtghonhhsthhruhgtthdrtghomhdrrghupdhrtghpthhtohepuggvvhhitggvth
    hrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghr
    mhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghsphgvvggusehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Tvkxae87Tn7qOmZBCccMFcLl6nYNIIlPpaVBZ1_jqvd08Rlh3JRzFw>
    <xmx:TvkxaTF4zVvxTdJeE05vyyCUKeWTRSbh4sg0R7MlD4BLIx9X5o2JUw>
    <xmx:TvkxaR5wUi5Yhz5JCYeznU2rPldi6lpSun8sBY7Rmn5EIjttyD7GcQ>
    <xmx:TvkxaUZHB3CF_glz9kd8s0bEoLxn7ybw0qDDa0y95_lUTIfkhS98IA>
    <xmx:TvkxaWjaJWhtUVtSMSfQRmURwCcE_oaNp9jnlfiupPgKYFfrxKYnFZKz>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Dec 2025 16:12:45 -0500 (EST)
Message-ID: <4e61c405-8495-4285-b848-04398f87ac9b@bsdio.com>
Date: Thu, 4 Dec 2025 14:12:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] dt-bindings: hwmon: (aspeed,g5-pwm-tacho) Move
 info from txt to yaml
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
References: <20251204210238.40742-1-rebecca@bsdio.com>
 <20251204210238.40742-4-rebecca@bsdio.com>
Content-Language: en-US
From: Rebecca Cran <rebecca@bsdio.com>
In-Reply-To: <20251204210238.40742-4-rebecca@bsdio.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_131248_012685_C24B66DD 
X-CRM114-Status: UNSURE (   9.08  )
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

On 12/4/25 14:02, Rebecca Cran wrote:
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml
> new file mode 100644
> index 000000000000..b23c3519604b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2023 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,g5-pwm-tacho.yaml#

When I renamed the file from aspeed,g5-pwm-tacho.yaml I forgot to update 
this id line.
I'll send out a v4 patch in a couple of days to gather any other early 
feedback.

-- 
Rebecca Cran


