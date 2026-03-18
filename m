Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B61A103E171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcZmgfXecF34Yr0f+3vUPZnDdwyLX+j01jKKACurfK0=; b=1VmIwiQfEu84SIGT0f3C/eLr/s
	iVnPSq+fussOKVBhNgz12/oFXgRxY36FqQlmKwQmIXXhKPUyTqQgJA3MKO/Yj/LhYfiqT5YqSTPgS
	iMqg2+eqj5ctWVai0lRCbe2Hiur32B+J3+J4vlgdhivN5MXxb0nHmQOKAmM8JhCU/3Yee9VCQOMZt
	sZgwNKxJ7bpBOY5/TJGLXS9GIf5lj/4JQnZilduVjZiqzkax6EZIzGC3nj6ZDtv4+7Y/GdJpIvYFG
	F70FlsM5n6vW5vghHFOgvdmVFH0Scss6gUts/bD/mFsItY3rXuW2TsBvzUE02NYmlmqfq430zI3tH
	XyGKmycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qAz-00000008Oxd-2eH9;
	Wed, 18 Mar 2026 12:39:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qAx-00000008Owr-3DXV;
	Wed, 18 Mar 2026 12:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837541;
	bh=9U/iI1CXl529Xk+OEnXPc2Xt3E+s6tig40NUgGlPaVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R0+02u9TojARPQ+E5Kf3P1hkkLKNy565zJXac5uxMtSFgN0YKGU0/Ctm1RYa/Ipph
	 +V6OS9FtrZldm++HTHrUHnmZXdg/uKE42eDGla2UsgjP5jhIarReqOCkl2Ut4b9ud3
	 EmonEj9hO3isxcoUvX7bEsqiXgWIWTcdT6GMykc1Bp8wvvvwC4WqF+AVC2dPax2EUH
	 jPIzhp9qy0AfzzHIxNHjeTYfV3JKvo/f0wlIGYz/xhd2DOZBh1JcPbIbkqsJOAZLYf
	 znPjnqBRLYzsSo1u1o6g1OAYoxn/eTAEP2vynI0sMhy9ptI6M9KXH2X/OGdjtM7TZa
	 VTbCi9Ze06KTw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1AA8217E0FFA;
	Wed, 18 Mar 2026 13:39:00 +0100 (CET)
Message-ID: <3ddf39e3-3d41-4393-b410-a1335be625ba@collabora.com>
Date: Wed, 18 Mar 2026 13:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] pinctrl: mediatek: mt6397: Add support for MT6392
 variant
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Gary Bisson <bisson.gary@gmail.com>,
 Julien Massot <julien.massot@collabora.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-9-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-9-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053903_967985_30457D4E 
X-CRM114-Status: UNSURE (   9.86  )
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

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> Add support for the MT6392 pinctrl device, which is very similar to
> MT6397 with a handful of different property values and its own pins
> definition.
> 
> Update the MT6397 driver to retrieve device data from the match table and
> use it for driver init.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


