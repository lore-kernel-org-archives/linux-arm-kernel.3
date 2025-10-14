Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D24CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 21:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U61MB9VOfRt1hj0ITPF6ydM4MPZpZPPkRsvW+GJ1Gcg=; b=tydlbUqLB6uqKRjcx8uLRMS4ub
	Go3/ThnDCPwnLP+yEjE+Tq3K5gMVEOoBP3Ld7znvPOlLZ5fTVORgCl6RAcF3Y2s4ZeEARemGQLdGP
	ZrB8SbBTOOdqj+DhWLrqNw/6/YuYz8j67oNBjnIsK55ebPdHRPMzJulO+Or6dX+V4NtlTBeyjydnX
	htjsO9svBtMx97Akw4rrAOVKa/AUi2F0bu14/zOmncv4BxNciCHifOHIwfonik6EKYms2SwU99C2I
	dAN0f2tXfyRteWKcRFZPv5z/HEoFHbe4KNKQ7KG537rS/qUcRj9rtTqW0i/f0XAMF1UkEeaojlz+5
	NqCcqu2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mle-0000000HT3o-2ROF;
	Tue, 14 Oct 2025 21:41:14 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8mlb-0000000HT3M-2G7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 21:41:13 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmSMR2cX5z9sGX;
	Tue, 14 Oct 2025 23:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760478067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U61MB9VOfRt1hj0ITPF6ydM4MPZpZPPkRsvW+GJ1Gcg=;
	b=oDxqF2ezQEDRXUOLaKjBEiBY8hSFA2g6J3hJShxaP3bw1zSVuZukyAkiDTqMQNbyaof9tc
	66nmb4HF8qfjX7hwR8YWD19gvLkILD0j0wucY422JjJlAAl1Lbv/69h2DGu1BgUgpyLx7q
	PyC4BhIck6SfmBIQmsxsRZI4WTpCygNSMfqNG68UgIulJe9KPppp7Jz98xjH42YUo9n6tY
	T3NDrobVMzqEqsw0anHBYBMvbO71aRaNRUFBJvoeMzsIdJDE9giUm78si/zLZHG8TgwDbQ
	hMc7Jxfy4/nRhj+33zqHnZv6Ua1KN4/1OebsKhnFkxgyf4myy/AVQ6QyPSMv1A==
Message-ID: <da68db17-d1de-40eb-8598-b4957f4ba5c0@mailbox.org>
Date: Tue, 14 Oct 2025 23:41:03 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 21/39] drm/imx: dc: crtc: Do not check disabled CRTCs
To: Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-22-marek.vasut@mailbox.org>
 <aO1J8QX5hJ/+CZut@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aO1J8QX5hJ/+CZut@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: e8265c260b39673e666
X-MBO-RS-META: j7xyy7b5irpu47k37jk9r5thhebyfj8q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_144111_741769_043BD4E4 
X-CRM114-Status: GOOD (  11.82  )
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

On 10/13/25 8:50 PM, Frank Li wrote:
> On Sat, Oct 11, 2025 at 06:51:36PM +0200, Marek Vasut wrote:
>> If the CRTC is disabled, do not check it, as the check will fail.
>> Skip over the disabled CRTC.
> 
> sorry, I have not understand what means.

It means that on inactive CRTC, the atomic check below will fail because 
there is no valid mode, and the check itself makes no sense.

>> @@ -156,6 +156,10 @@ dc_crtc_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>   	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>   	enum drm_mode_status status;
>>
>> +	/* If we are not active we don't care */
>> +	if (!new_crtc_state->active)
>> +		return 0;
>> +
>>   	status = dc_crtc_check_clock(dc_crtc, adj->clock);
>>   	if (status != MODE_OK)
>>   		return -EINVAL;


