Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5DDCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMSfqTFOOxz3BI5gxHBbzrsmx6UX56DPc5IdGmMbF48=; b=QwFFswfL8XjkKioohqMfDp63wY
	9gY0rTN3C13NXuG2hksifjApaVIxUE/YUnxVCIveiTWm2xOhGJ5uk6JbbWVzBYggO6oNahw0wfjZq
	HD5r4PIfqAn/apt3mq5IKGyDr0+YE4BcUp/sdtqpR0MyF9SNqxt1OClqQJMjZFTx9Og18T5hgyiHO
	zJFvgEPyi1JBOmLrbC+jjscIVxxy7yh9bu/Wc6gn1mFPUAElUJENKztEueoMc3pLMjTqzUMJnI0sD
	1tvrJuti2c382/lmiNdIN/N2fYehP7AHG+YxT5gWh+q9stZzfLTfZKKFSEMq6nVZ7loxZJpgxmhdb
	PZ4dQGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96cz-00000002fCU-0ZsP;
	Wed, 15 Oct 2025 18:53:37 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96cw-00000002fBQ-3T0b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:53:36 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cn0Gk6R2wz9tcL;
	Wed, 15 Oct 2025 20:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760553534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMSfqTFOOxz3BI5gxHBbzrsmx6UX56DPc5IdGmMbF48=;
	b=L0YA6qK/+qwqyGzdmlgNk9FFQ/Hnb30IjR7tRRMximVvgg8VhA4sTDV6Nci0YOF699BdSC
	HDytgme2wZ2JXtAD9NWTiMd86orRY8X7a/nrqGilUlGTMrbetzClPpeW6qKoMQrB2A6hD+
	Ucr6cRe6ObD5btBmRxX/k1fdxaXR/Ij3a/fAkQH393hfKW36BvNqG8GyD2vCikswdNPLdC
	AjJIyxzmVw2UQ+N3ajYT0E7IYyqFOhiO1F3HXrOfSMKOo51THGMQ6iGkY0br+JrGsABUrd
	uB/ICQVefSai09vHfMT5dHwfGsn+BHAdMV7LoXlXFucGwyFSUCDlpVi40PZvTg==
Message-ID: <cf7ebf8a-01e5-44fb-920b-5e21c05e568a@mailbox.org>
Date: Wed, 15 Oct 2025 20:38:47 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <807d4d4d-f1dd-4776-9543-2e8d997071e1@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: bx97qrbn6yau3qh7ddkjtc6pytrq343p
X-MBO-RS-ID: 98685ba3c8924c321a2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_115335_008167_A6881990 
X-CRM114-Status: GOOD (  15.82  )
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

On 10/15/25 6:50 PM, Matt Coster wrote:

Hello Matt,

> Would you mind splitting this conditional block up? We already have a
> constraint for 2 power-domains (see img,img-bxs-4-64), which should be
> applied to the entire img,img-gx6250 compatible.

I will add a patch into V3 which splits the allOf section up such, that 
clocks and power-domains limits are limited separately. That will make 
this addition of GX6250 easy.

> As for the clocks, for the currently supported GPUs, we have "mem" and
> "sys" clocks that are optional at integration time, so those
> conditionals are based on the vendor compatible strings (ti,... etc).
> However, these older GPUs always require all three clocks, so it
> probably makes sense to create the properties:clock{,-name}s:minItems:3
> constraint on the img,img-gx6250 compatible as well, rather than the
> renesas,r8... ones.

OK

> You shouldn't need to explicit list the power-domain descriptions at the
> constraint level at all; if there's a build warning that they're missing
> I guess the correct place to add them would be on the top-level
> power-domains entry, but I don't really think they contribute anything
> meaningful.
The descriptions basically emulate minItems/maxItems: 2 here. I can also 
just set minItems:2 ?

I have one more question -- does GX6250 _always_ have two power domains, 
i.e. the constrains always set minItems:2 for "img,img-gx6250" 
"power-domains" property ?

