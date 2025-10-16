Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E0DCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XEkHO0Qp+G5qiHbC61D2twuNKFoICnhB602ktEQ9pg=; b=yhZa+k83p9ZOhjebp5CGMLG5Lo
	ORTdSyES+rM+j4unjj5nXv8io7b7W8RXaUjPBpnQpPIe6udsQ8JNbeIwYILUY4kUgjIZIbxvbr/J8
	aclw2gpVafLe6grONsYivesd8cwiOkc3qfHAw2PvwidK2IdyAihzo4Bi85MxF07CMRXg3fUS4InQh
	fRq3tyge8kqCSmEU3Yfx2jASfxLMRPwb9fXML4BqsllxBCrR/BQPwBXqSTzZC803PVnGNucE4dBFk
	88XUmNoQTo1ggks1c9m/WNOd4TzVtwRl6S2vChTz+x204GlsYzdxijjMu8rpxf7RoqFEa6/OKmrl/
	OXI98exQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kx7-00000004Moe-2b3Y;
	Thu, 16 Oct 2025 10:11:21 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Kx5-00000004MmO-1ZFL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 10:11:20 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cnNyT6mbXz9snK;
	Thu, 16 Oct 2025 12:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760609474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5XEkHO0Qp+G5qiHbC61D2twuNKFoICnhB602ktEQ9pg=;
	b=LQ85WnW/giG/wNYUMGjaCpnEWsvmiu3le36bj7e1dlLUvFaY5qdXIN78mHJ+zGuk3IApJ7
	dAx9mklKSK0MAA4YwN5NocvIlPI7q86NbDz86wW/5xL389vr9hCOVqmn6MMfvN+mJ/b1tr
	HSE2bhtI9wtL0aMUfA/Yvr+avuxDSzXSHxMOPN/Xb/ZkkQwBATiflC92Lo18bJBBuLnLzQ
	8kRf2J/NMOX/JyC7UxwSL7SjW5WNBG+Z24M+Nyqwuo/u+zE+pBfbRbQr8SsMHyZMrfs+9+
	C3vFDd4YGvfPv7iyPn3m/N5zME1AT9wlfITX2w3GbLiGbHQ6CcpLW0TbIK1a+A==
Message-ID: <921ac611-63b0-460b-86b5-67340eeb5dba@mailbox.org>
Date: Thu, 16 Oct 2025 11:55:19 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
 <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
 <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2392f257-2551-43a0-be7b-2e1f4a0d8c50@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 1e2d7ddbfc98dbd254b
X-MBO-RS-META: 48n3zgsbymmnn5ca9mfuipkjb6dxnd4w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_031119_571459_9E0EE09F 
X-CRM114-Status: GOOD (  17.97  )
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

On 10/16/25 10:48 AM, Matt Coster wrote:

Hello Matt,

>>> Would you mind splitting this conditional block up? We already have a
>>> constraint for 2 power-domains (see img,img-bxs-4-64), which should be
>>> applied to the entire img,img-gx6250 compatible.
>>
>> I will add a patch into V3 which splits the allOf section up such,
>> that clocks and power-domains limits are limited separately. That will
>> make this addition of GX6250 easy.
>>
>>> As for the clocks, for the currently supported GPUs, we have "mem" and
>>> "sys" clocks that are optional at integration time, so those
>>> conditionals are based on the vendor compatible strings (ti,... etc).
>>> However, these older GPUs always require all three clocks, so it
>>> probably makes sense to create the properties:clock{,-name}s:minItems:3
>>> constraint on the img,img-gx6250 compatible as well, rather than the
>>> renesas,r8... ones.
>>
>> OK
>>
>>> You shouldn't need to explicit list the power-domain descriptions at the
>>> constraint level at all; if there's a build warning that they're missing
>>> I guess the correct place to add them would be on the top-level
>>> power-domains entry, but I don't really think they contribute anything
>>> meaningful.
>> The descriptions basically emulate minItems/maxItems: 2 here. I can
>> also just set minItems:2 ?
> 
> I think that's probably much cleaner! We can add maxItems:2 back in
> later if/when we add additional power domains at the top level.

OK, will do.

>> I have one more question -- does GX6250 _always_ have two power
>> domains, i.e. the constrains always set minItems:2 for
>> "img,img-gx6250" "power-domains" property ?
> 
> Yes, that's correct. All PowerVR GPUs have the number of power domains
> defined in the IP. Even where the SoC does not expose control of these
> to the OS, the GPU still communicates with the SoC power controller
> directly to gate them on and off during normal operation.
Understood, thank you for the clarification.

