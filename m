Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FF8106ACFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 23:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4U67KyPuip0+4wF0EN2QGlBhdOHlDVkwPXiAqd3gVI=; b=BCe2HcPvRcSeEC26/nXDWvoBB3
	i7qaUlStGCkULgj1uVwBx+7YxmNxkIz2e9wkT1szzV/hNSGKBXDYcIDgz5PZw+QE9XDTDRo0N0wxi
	vmjnlIuyYhFhrtC+vgmpBgK3IHapwkTF6YC2NYL/qfLF12HW4Ps8Jrhm0sKf+x4uT2BBY1c0wOf7k
	Gxr0i+wn1cIwUCqPt++y/sbphY12o/XvLI6PwVp5lBr4iInw97ynGB66RqLq8+sPaohtZIuv9r2rH
	8wtdktgiHgIbWi8534souLolRBjocks89mBQtdWRA/C/r3VSb8O/mA5J1s4o5t2Yh5PQ+3XrYFMgD
	OvvLd+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pRv-0000000FmTU-3iG6;
	Thu, 12 Mar 2026 23:28:15 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pRt-0000000FmTB-0Zb2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 23:28:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDC8E107870;
	Fri, 13 Mar 2026 00:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773358090;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=D4U67KyPuip0+4wF0EN2QGlBhdOHlDVkwPXiAqd3gVI=;
	b=Bqq3AcVngYY1S2QMommyl6BcmySjmlHZQjknGYE5eo30yFZ9fhuzWw20+bAw4jHQ/xo767
	6QDoVskFY99f6xcCyru7yQ7xty/qhoZ8NuIFqCywcwgFirhIBkYWq7kbwA1FwlVa1vtDcB
	MbUp0DeQkUud1rl1Sh7nvSqPel4k8bVN9okOynihllrdVUCHeJNdIYIBkFfXxJWZ5f+kov
	QNMTEAtYM2bdeI34/pCoY35hm3G3+xZWxvSTrkWzd6cA5U6wXmPAre56Um8ZOCygsFM/rm
	61DDY2ylIlwfD4DpDHKLWtf7F6ahOBrxYvZF3eeIRJOryMg2nulAoThfVJUruA==
Message-ID: <d320187b-0770-4d9c-bafd-119d99ff453f@nabladev.com>
Date: Fri, 13 Mar 2026 00:28:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: parallel-display: Prefer bus format set via
 legacy "interface-pix-fmt" DT property
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260110171510.692666-1-marex@nabladev.com>
 <0d3a41526ba02eee28457fafc95f5152a9c7bb4b.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <0d3a41526ba02eee28457fafc95f5152a9c7bb4b.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_162813_328725_EFBFB443 
X-CRM114-Status: UNSURE (   8.90  )
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

On 1/13/26 12:31 PM, Philipp Zabel wrote:
> On Sa, 2026-01-10 at 18:14 +0100, Marek Vasut wrote:
>> Prefer bus format set via legacy "interface-pix-fmt" DT property
>> over panel bus format. This is necessary to retain support for
>> DTs which configure the IPUv3 parallel output as 24bit DPI, but
>> connect 18bit DPI panels to it with hardware swizzling.
>>
>> This used to work up to Linux 6.12, but stopped working in 6.13,
>> reinstate the behavior to support old DTs.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 5f6e56d3319d ("drm/imx: parallel-display: switch to drm_panel_bridge")
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
If there are no objections, would it be OK to apply this ?

