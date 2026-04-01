Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E3410F6FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yfl/w1ij3MgpyEqu5acDmeSHKzp1JdcGMEvJsVUioeI=; b=l6bnNbAvX0UHilgkvXkesk8WRe
	Sm+1GKdXNiRuHoA1SI3mnyTuGM+FNEobJor9Z2G1wnZAQCCIDtIsbyRXYi4ULnAYjEazNmDeL8UEC
	7W19iN3jaSeN1U7m27jP4UYrMkuT0YMsJkpdocKs46jRLLjrH8u9u+/chic9Mf5ThZY30p5Lnu4iX
	SC8N+lLfst6kzFI20mURVw55vYuFTDsLeqBULxx2bl65RFNKQRIVH5a6ErVvOYCmt2pym4Skk3Rpn
	jdoNLhTAHL5B9VIb+VrHMxRaiTOfSCnYktXzqR14u1JqlSXNxHj0ugWPLQ1puNutiN3VmiYDFjZvp
	pJ6FBJdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x8z-0000000FaOl-3Cbb;
	Wed, 01 Apr 2026 15:06:09 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7x8x-0000000FaLs-3oxX;
	Wed, 01 Apr 2026 15:06:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To
	:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Yfl/w1ij3MgpyEqu5acDmeSHKzp1JdcGMEvJsVUioeI=; b=dTapjwhlsakHuG9/ro3lz63N01
	XdRqX6PAtHDsv/Hqx89CpF904TiwsjZnD8ckUY/929k3Kqh6zJWEV/bZwHUToTvKGf9yVJ6uGH3ls
	8Kwrz9WhU0B/zKeitP6JlW0f7htpsvS6bhNBxQXHc1qf9f77rtkXHumMFFi0polKAmpE1zRkNzspa
	fHCxnwx+tD75qpHwxRukvdgbcqzqhSja9xlzKE8/AnrpaVpvoBqytXXymP5r5Ao7xRd6gc1mYVTR8
	2QTy+ybeTSBCzaSl9bns7x65+O5sMF5eXEPOAWZiSq47yrUdD32xbkhLxziC+Rkra+/azUmpQMB6A
	ZJ/I/QVg==;
Received: from d100-78.icpnet.pl ([77.65.100.78] helo=[192.168.0.120])
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1w7x8q-0000000Ajrx-2VZg;
	Wed, 01 Apr 2026 17:06:00 +0200
Message-ID: <5e9f5f0c-1ff0-4b6c-ad2d-ccf6fafbef30@szczodrzynski.pl>
Date: Wed, 1 Apr 2026 17:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: Parthiban <parthiban@linumiz.com>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, paulk@sys-base.io
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
 <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <a5f6aeb1-b038-462e-8989-c4da65966134@linumiz.com>
 <1027afd7-dec6-4ff3-85eb-2d9a1646ada6@linumiz.com>
Content-Language: pl
From: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Autocrypt: addr=kuba@szczodrzynski.pl; keydata=
 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
In-Reply-To: <1027afd7-dec6-4ff3-85eb-2d9a1646ada6@linumiz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_080608_158536_D964482F 
X-CRM114-Status: UNSURE (   9.99  )
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

Hi,

W dniu 2026-04-01 o 10:39:42, Parthiban pisze:

> Dear Kuba,
>
> On 2/7/26 2:34 PM, Parthiban wrote:
>> On 11/16/25 2:46 PM, Kuba Szczodrzyński wrote:
>>> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
>>> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
>>> PD0..PD9 pins are used for either DSI or LVDS.
>>>
>>> Other than having to use the combo D-PHY, LVDS output is configured in
>>> the same way as on older chips.
>>>
>>> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
>>> is then configured by the LCD TCON, which allows connecting a
>>> single-link LVDS display panel.
> Now I also have the MIPI and LVDS working together on A133. Can I pick your
> changes and post a combined series for the display support for A133? This will
> also address D1s/T114 as well.

I guess it's been waiting for too long anyway - so yes, if you know how 
to push it further, then please do so.

Regards Kuba

> --
> Thanks,
> Parthiban
> https://linumiz.com
> https://www.linkedin.com/company/linumiz

