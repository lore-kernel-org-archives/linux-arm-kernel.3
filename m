Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323CACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nMxZyzrduqra3rZXm40NnFrsNOonRPZCrd4Yv86yAk=; b=0y6m3R16jYRp9yUZK1r0D+Tqlt
	UWxNFXuMWteXWTnvghUQzeSP03DKEcR5lZYkK509o20EPfixhZuJ1cZEve7hfWfd74hw/F1u7Lfpq
	VkI4fy/S8HlpEEtWycV74Q9pqBArWi6vn/TpDxEDQW7ZOV1bgceJb0cQqPQdagjVLNl3FGPZ7V9Di
	9bHxOZmWZ5bMAHQNrm7/VJKFo5DrE9ZZJTFzGVEt8WpFtvdQVHwMUyqoykU2AdKJMRFIA7N5ocZUK
	Riw/BllSidpVT4oAtYiBhUfC175edoQHhUEoLUHxO668+fgEnDMn2b6iIKdHZSd+QyDtTZowfryG2
	C2NC4bMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ADK-00000008FKb-2sYe;
	Fri, 10 Oct 2025 10:19:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ADI-00000008FKG-1iF3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 10:19:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A97431A127A;
	Fri, 10 Oct 2025 10:19:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F0A460667;
	Fri, 10 Oct 2025 10:19:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A517D102F220F;
	Fri, 10 Oct 2025 12:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760091541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6nMxZyzrduqra3rZXm40NnFrsNOonRPZCrd4Yv86yAk=;
	b=s2SQuA9T0Zh50gLxJQEHVyB7KWdmyxNtuvUNc6eZipNm+ayFViPOyhuYlf3eNhGcqm41ZV
	BBH1gbazPsn41Bb8Y5KbnCIuwt7cEm2Ul8RSrJngxr+sSZHLekGU/0UBgEyDNiHuKWvpI9
	vFVJWps2kudIyHLCMDb3ov13c8pLWJmArGcKk193kO8io6v6JnOB60waxbT9M4Nv4i80Cj
	GHenGF/eCzfKdbKNzPOnuzHjd2ssfKrGkklY3ceBlz9vIXRf9dDiWqwXVRXx6Zs0gGvs2m
	+cTvGadpeS46ysgBy41KBsHM5uNJ67TguV3VKYp/xnsoSAZtk2/LH3gLoEphKA==
Message-ID: <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
Date: Fri, 10 Oct 2025 12:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-3-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_031904_583284_ECBD71EF 
X-CRM114-Status: UNSURE (   8.38  )
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

Le 10/10/2025 à 10:49, Krzysztof Kozlowski a écrit :
> On 10/10/2025 10:40, Richard Genoud wrote:
>> +
>>   properties:
>>     compatible:
>>       enum:
>>         - allwinner,sun4i-a10-nand
>>         - allwinner,sun8i-a23-nand-controller
>> +      - allwinner,sun50i-h616-nand-controller
> 
> 
> Also:
> 1. missing new line - why did you remove it?
> 2. Keep existing sunxi preferred order of entries. In other platforms it
> is alphanumerical, not natural. In case sunxi uses something else, just
> be sure you use sunxi order.
ok, make sens

Thanks!

> 
> Best regards,
> Krzysztof


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

