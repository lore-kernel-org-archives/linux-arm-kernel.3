Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5637C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DA0WJK1alYM5IkMkXcbrZdgEnQ3XRkqytNqm6G2Awio=; b=iCcmKkcnPWK3PkkpuarUcowX48
	+JEa4PCmO4V2DGaGu58SyXxB6HsHDW9bwtIAJv0p35BjzYodOXrrcyos1CLYOCNpMKPSPOaCTgXV5
	VXMCf+eFaCwVxX7uT9rAmoUBqv3ElQjvr+kOXYQ8roS2d1cqdomwKyCl+kmf2/a2/CfLuvA+1B+v9
	NXEbg7oPlohe8RC64ynqnL4P4a+BHuI4ES8ABYNgLweINw1c+HjbPONC72Xdq534qHOTS7GuXnJSt
	dsHPM5XbC7+5eBQsGpBEuL4HhRq2y1m62d5266dmNkD8jTsnReddZrT4GKogcKN4sJFV3hzGWLnBL
	CQ7P9uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b4u-00000001eKu-1XMs;
	Mon, 21 Sep 2026 10:16:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b4o-00000001eJl-2Vur;
	Mon, 21 Sep 2026 10:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789985804;
	bh=DVHjoDLlRZ8xarvRTXy+GeqFMaFzqMyhGQvV2Jvh3ms=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fGkWIRlUpT3FUMIocCMnGjrfqk3tG23xRw/lOgpYwLSIUor1o7zDXMvYSjiBQHNje
	 82q2pjNI7OynoPk06TSzBBrp2dFXlzZJ4U6C3AGpPNpR9ZYLcK4qwKlTVHi75zdaaF
	 yxAyEzpnnqnNLNy/9LyacTq82h6slOISlpYVfTRz7ZXjsNUqhN3xVCQRpVTpfKWuI/
	 Xi8rM57Wyh23iVTXAgSB6eWB3V+uQCykH1qiO5scVgRlgHLYTwOmUD9fLvHVmfNuY1
	 oHZ5XJ4uUW9kAf4GNCjQmGig2kFW/MHcvJRcFpZt+8W2JV61c/CvnGuPm+I8wCElPG
	 yzCW6NZE2gZtg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 070DF17E047B;
	Mon, 21 Sep 2026 12:16:43 +0200 (CEST)
Message-ID: <fc0fcb6d-a935-4795-91fb-f3ee17ced650@collabora.com>
Date: Mon, 21 Sep 2026 12:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
To: Ryan Brue <ryanbrue.dev@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev,
 Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-0-c00edacbee64@gmail.com>
 <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260920-rbrue-suez-upstreaming-mt6397-auxadc-v3-3-c00edacbee64@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031647_005987_2E3D22BA 
X-CRM114-Status: UNSURE (   7.78  )
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

On 9/20/26 07:31, Ryan Brue wrote:
> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.
> 
> Assisted-by: LLM
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


