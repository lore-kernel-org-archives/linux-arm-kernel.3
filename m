Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8489CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCS4Peea+QwDxxv2INYOTDMSnN32Ds0EesZfQ/Pzh3I=; b=T4PZXiJCWIxjfAZKWkRZ6QmQgK
	OYKLFGpMjlPKhV3qVSZwrOm4pAhLng3bf8cMYfiA+ZxRBZgkkAYAN5YasAGMrKwverzlLgfLZqXMu
	7B0W9Jf4cfFG5lGIiAmNfCtUnzYGzoXA0ZKJxm8ZjNUr4aSPDVCWsOo5Ac4oG3YJgFt3ZI4Csiwh2
	5uBvQPfD9RglBtNNkc9poIjkfJBx7kXgUGzGR77FMvJYbZH/mOPOCHTEpZLFvk0bWWKoNCtxprE1m
	qUZ1D6mkvt+yqcWvElXY+NmX6nTKWUDACLGtK7h+AIMt/IAu0r/bhPo+PMk6XXI27U8Hc0BWJL5jf
	JZpyqdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfbB-00000004Va5-2rC5;
	Wed, 20 May 2026 12:00:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfb3-00000004VXK-25Zf;
	Wed, 20 May 2026 12:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779278419;
	bh=eJsuDBXfnaLF6D4L64VZ7eXC4sIgQoPF5eqTtmWx8Jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GRbOucsc41oNXB0ryPbPdUww1z5RLcy+IyWV8gdDwv/8Yy199DwMA0af/U82OGGh7
	 Xh9zXt4vPXzlGXshDmO8aNp/1nGmg59owY4N4gplKajyYpGy4z/WTciYNewTLIo/Rc
	 svMl3kdArJSDfEZgo5kyYb/yKX5f8iC4ZDyaQB5PK1e6QwEZtM/d48fAazN/6qUY+6
	 iBo1EkyYhtImgtooFfFuG7IspmgB2/tqzlqL09IitdoDlwccSl/iX9mrlKfqDkG/5S
	 SA+h2w+r7mmREq+ZzDkFehk997GqeRDyCahuI2gTWmkNTuv0vKCqUobB21eDKMwqYs
	 jJ1HXK+B/ZXMQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72C2B17E05B5;
	Wed, 20 May 2026 14:00:18 +0200 (CEST)
Message-ID: <e70c509d-121e-40a8-81eb-95649d6d988a@collabora.com>
Date: Wed, 20 May 2026 14:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
To: Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <agKBkUBVM81Y6MUk@sirena.co.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <agKBkUBVM81Y6MUk@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_050021_682610_2FF4F87B 
X-CRM114-Status: UNSURE (   9.42  )
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

On 5/12/26 03:25, Mark Brown wrote:
> On Mon, May 11, 2026 at 12:13:50PM +0200, AngeloGioacchino Del Regno wrote:
>> Changes in v12:
>>   - This is a partial resend. MT6373 regulators and MFD patches were not picked.
>>   - Rebased over next-20260508
> 
> Is there a reason why this is a single patch series, are there any
> interdependencies here?

Just showing the full picture. Nothing else.

Btw, seen your feedback on the other patches, will fix as soon as I can - thanks!

Cheers,
Angelo

