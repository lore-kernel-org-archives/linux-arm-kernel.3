Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3FDCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+0AAq5p9n3CYb0eN2KQBzPDtI3LpH6hBvgSrfcGzKs=; b=pP9aFkiha2e87HJJwlS2khXDZ0
	6l2xWORsEmf2+hQk1FnZpmGWZiR3ZDnbwRpkOT6UwPuwcJHFG6Ywf/AAsYHx6Q4Fq5W5XVMj8qK5N
	pQEdABJXtLFYVFCCuGiSwJm4FUlGDRr/24UuVJkB0ohAcYKrE0o94Z8JoUdJS3Dcnt2fCXvBtlNU/
	h3Ywl8YozCHCe//aMXtoXJamHvdC4Q5/pBZGlpsoARvcSp1h2JpFmEt4ZO0elBs1yUsztLseBT6yT
	8a0GjKNj2Q1euW1vudt1YBfBZWNAe2rlcw2acRvBPUi0vPSbnHJq0oSVDr/Hn+ODxd4r6m2qbYRGZ
	DGQ2o8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ZA-00000001uGS-3izv;
	Wed, 15 Oct 2025 14:33:24 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92Z8-00000001uDi-10CQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:33:23 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmtqJ5ghsz9v66;
	Wed, 15 Oct 2025 16:33:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760538796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+0AAq5p9n3CYb0eN2KQBzPDtI3LpH6hBvgSrfcGzKs=;
	b=wN7lqxX9ujyaZAtI3oFJQBPbEbCEMBGULGgOFLBCY8XqGfDEy4VEj5OTv3D4U7tGelWb9+
	StMm8aoZZcvrm9F7FXK+h/dd87S4E6C0WFcCWzepB33sy+b1zj6nhGPnXO82dXsPTsYosY
	Ud7bD3DHde2xmx+/bZrhYtSKMC8zU9dnKaiJDxWRPUPpBILy98OUUUa5ep2h2dF9VVcwkk
	wAX+kTD0D090Sy7/0bIEJZArrFjR9fB9m6/3c5fgSzAghzEkE9EzMcKYN34SBzaZnjFI6N
	WUAq+FAHm7mc4pGvhu15vOKy85e1gZt88Aer8pMJnVjgGGNfjhXIup6L4LHINw==
Message-ID: <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
Date: Wed, 15 Oct 2025 12:19:33 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3bfifor4uba8rjg7sfrfhsxrmksew5w3
X-MBO-RS-ID: f82c0904535502d82ca
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073322_427981_FB28C632 
X-CRM114-Status: UNSURE (   6.77  )
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

On 10/15/25 10:59 AM, Liu Ying wrote:

Hello Liu,

>>>> @@ -90,13 +102,15 @@ patternProperties:
>>>>          compatible:
>>>>            const: fsl,imx8qxp-dc-signature
>>>>
>>>> -  "^tcon@[0-9a-f]+$":
>>>> +  "^tcon(@[0-9a-f]+)?$":
>>>
>>> why here allow no address unit tcon?
>> This might be something Liu can clarify too.
>>
>> TCON on iMX95 DPU does not seem to exist at all, or at least has no control registers. Hence no address.
> 
> i.MX95 DC hasn't got TCON so it should not be documented for i.MX95 DC.

What DT node do I attach the pixel-mapper/pixel-interleaver to then ?

-- 
Best regards,
Marek Vasut

