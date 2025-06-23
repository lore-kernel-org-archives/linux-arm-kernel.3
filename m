Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96218C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpTzpZ/1igZUIWQX/qHJMPcwSOtxrP0z44kuEvTyvxo=; b=m557hfUDOGs2bf/Uv5q3KTBID9
	j3L5HKISbBFLcNCzf5V5S8SJE44uzBVukNt4IvCx/jEjPxMlY5agraiZdeK/X0BDP6dcqC8aUGa2+
	rL95I4eFj/2TuIRN3Ezos0/N5HZRkRVvXhrQh26ec0TlIhRC0+vc0B3Z27tGIvGv51Fk6p7NrWNkv
	4REB852XwQER8mXc3LCbiMTjatxbRj4wQdE6hfiJrfqmZOGBlvC4gB+RngQ4Cx3lNAxbwt94FzADH
	qBWRciz+aw8SwN/9ZjOb52UFNHtvKhEdTLFCK34YhspzYxOdqRXkMSqNiXppFUognM5woTz0CDUGa
	8gwMR6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcpV-000000022zy-34AN;
	Mon, 23 Jun 2025 08:47:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTce1-0000000214g-3Fut;
	Mon, 23 Jun 2025 08:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667712;
	bh=v5c1pvEOHzUJCH0jbkI1c9f9EHNSp9tK/WU0TLJOzXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nhoxjTaw1gYtbPPeU57OIG3qpgBKd2tWiawhu9a7ldRgDKgdk6lZ9VWva82VnXC1u
	 oVjtcIiFxVGqVPT02Js2h3HK15Xn87gV5v3JILiOVA6khMozQqIm9J8qcuXwg71I36
	 HjOWwimHVG5HAVZzc8PBlj8rJ8lnejrwMP/BkAMOvAtJivyvzIHetLyQj0qKOtUTNy
	 ySLrIAeAzZPwi8GUGSpa73WhZoyicoLpuGkxoEEgdk4HdoHQmTnvOpf1sz0CKF3UES
	 mcz76TBud2bNIn2Nvc7ykSVQThUfrEr8aNUJcNVof4JYtpvqsx1ZRbch2S4t/8i5fm
	 VFcWc8anUpEfg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70D0C17E088C;
	Mon, 23 Jun 2025 10:35:11 +0200 (CEST)
Message-ID: <b56fc363-b354-473f-b6f4-77accb85069d@collabora.com>
Date: Mon, 23 Jun 2025 10:35:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] dt-bindings: vendor-prefixes: add JTY
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-5-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-5-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013513_963255_FCDF1087 
X-CRM114-Status: UNSURE (   5.74  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> JTY produced low-cost Android tablets based on various
> MediaTek MT65xx SoCs.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


