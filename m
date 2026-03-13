Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A11103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pd3lTWjZ+5rSyJMewkwT1eT+19Jc15PppiNJcmSogXg=; b=cfHbTm0RFRMLc5oAL6LaXChQ0D
	WeR/w88ymh2xC21Ly/xOlQg1NpIifIceJYlLybmw5KRebssEE4/Uw8qEQ1WewCJYcprNhABzfAG1b
	qfoUq+P1AC6saVYXit8Nw3H015J6C4mPhv4ATM39JRoNH7ArKuhOLvtjhMfMNZ3DSJzrF56i+YEiL
	Yb82+9ib9Yw11z4gJUX4SLo0CM+Ye9TlZ6lYxiI5FXpviFj7uKmZwOkJtZ8yLxpHvq76qmemtGfD0
	hNKS8PjktIIYpFq1Ic7Wntuo/KiUe73LzuYQR871da/OpG2b7D7PyAlqmiAJ8jOoXqiCxWkwxyTOU
	7KBb3Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14jw-00000000ZoE-2J4F;
	Fri, 13 Mar 2026 15:47:52 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14js-00000000Znv-1G0I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:47:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B9B51077B0;
	Fri, 13 Mar 2026 16:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773416863;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=pd3lTWjZ+5rSyJMewkwT1eT+19Jc15PppiNJcmSogXg=;
	b=jGTeG0gcswCkMeJGtupDnz72P0d6dI51r/nmE4P4w55YUQ16dGl8KS+2sOuA0lowqveU4M
	Yxds52mkPDbMqzq6DTB3WZDzuSG/0dWwHof2IxGvZHV4JJ/Xliug9O6+v8igmgm5MkD2Kp
	Gxz45U/QfjzeY+l2EZ36wqfTrYfQoqS1WqYSpucyRaVMpHbaiuAy74k0n3Q1a5q0m4NUkW
	Mn8K1c+2PUQtjc7U0AioKQ2h+d6DPvWhJI3AjHZcn2d//VoLPJ8pco12r66m4xa87lgCPC
	adhiF49yTUnlA5A5f9GpDXCFHP+FrhOoEUyg2mcROG1PIkDsbKFx5w/XfEnM/Q==
Message-ID: <3c6d81c6-500c-4ff6-b923-9f446678a6bc@nabladev.com>
Date: Fri, 13 Mar 2026 16:47:39 +0100
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
 <30511e1e0ffd6579091fc4ed1cad084fd81b9c96.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <30511e1e0ffd6579091fc4ed1cad084fd81b9c96.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_084748_583246_8DA50799 
X-CRM114-Status: UNSURE (   7.96  )
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

On 3/13/26 4:33 PM, Philipp Zabel wrote:
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
> Applied to drm-misc-next, thanks!
Thank you

