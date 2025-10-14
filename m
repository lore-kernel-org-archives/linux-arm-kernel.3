Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7A3CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIxf1/4W8b4if0tFBzh4U5BnvAEvdOXSo62yxEFwEXw=; b=reig2xJbhTtYn2hQMpDHXBDNxH
	1fZz0rCkZ7fCjmKgFGC3jMecaZY/2oPojB69R3borsK54gwj/08+zn2g4bVPM/585RogcTIPkcK9K
	LaZS42L8AMune6Wa0HwdHIqp91T23vNQdCnFl4Jr4o2JaIZJvcdqCA/kLt9+5VS+13uJ3aAiE8PTk
	S4NztXjtXCE4j95Y8A3baeLsDb5mSD1ZhkM/+D8iqaGUVSHNtMVpBSqXUXTTZksvPpTZBfz7HbPdB
	4IRmN6yiefvYX9oT9aRPbvUbkQH++MrkMB/h9BVnkFajt2D3XjRHK9a9gM5SRiI4ZoUdatWA32r1+
	L1i8Mkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nD2-0000000HWmD-236g;
	Tue, 14 Oct 2025 22:09:32 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nD0-0000000HWls-27SJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:09:31 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmT063mGpz9stY;
	Wed, 15 Oct 2025 00:09:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760479766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIxf1/4W8b4if0tFBzh4U5BnvAEvdOXSo62yxEFwEXw=;
	b=wRFL0mRrJT2CfJS4ItX0KWMGyP3Gd6aS+1DYz2MHvDq7l3O06LdxC5IfzJXNCA2M51hrbq
	1d6Z9j8iX/LlZhdjawnfU6FkCRo01vWKAqQZ3fzGVq+nWSWF08jMUGuT/3E/G68WDlUHaJ
	trmYmANaird7rtZRuyXC8KEne49qggfwm8AZp4x4MvwYmLM1lkyBOLfsgIIWzIdUG2dZeR
	v8/cIHOXbp/zMIH433gJFELVOTnIsWxeADBs0I6YYAQcr7KnOVmxlWonIjl4pn0i2RdR7L
	LTPsWK8zHA21GJf1mjTDKo3hjdejYGsVkXpSURd1uA4Q54Kc8hIqF2/NmIC15g==
Message-ID: <bf451620-c917-4d4a-999d-32148fbcf11b@mailbox.org>
Date: Wed, 15 Oct 2025 00:09:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <2a22c45e-5de4-49ee-af3e-002941a7e2d0@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: dfgywskta81h96wyddskwwoj8dxm9e8x
X-MBO-RS-ID: 547d559a5ba5a68b3f8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_150930_690140_88CFD064 
X-CRM114-Status: GOOD (  11.61  )
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

On 10/14/25 11:13 AM, Liu Ying wrote:
> On 10/11/2025, Marek Vasut wrote:
>> DPU is added into DC driver
> 
> This has conflicts with my in-flight patch series for adding i.MX8QXP DC
> prefetch engine support(though i.MX95 SoC doesn't embed any display controller
> prefetch engine).  You probably want to take a look at it, just a heads up.
> 
> https://lore.kernel.org/all/20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com/

Thank you for sharing that.

Would it make sense to send 4 and 5 separately , so the fixes can land 
faster?

Also, could you please try and avoid the SCU dependency on patch 7 , and 
more in that direction , can the PRG be made a bit more optional, so the 
iMX95 can still be supported by the DC driver ?

-- 
Best regards,
Marek Vasut

