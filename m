Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FDFC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 08:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3SRn6Sl+CTkGX0RbpwOkP0TA1+xuWkFfyb2rrtrVdA=; b=EQwmtbRbbxcOb0izKB8n1o4LaQ
	bnaACpkmoT4QXJMLsVV+9UW6Mg4XlvUxf6L5kuWS7uCEYvtMuNkRjE6PdrQf0/EXQZHNYJ5iOAFpt
	WQn7aS4y+sVLcXU3/hBAfsyk2cAzVNR09ydOb8SXcVThHnw1iQm7LvtEYNp5zj6dTj6lkWop1FF1I
	9PFm8yvm85Ej2EP9NkWTG97SSjrH8/4/hcsrAdz4mb+m4Tg2FVmTO1YnHNP3iPD5qtXMoBODcvE90
	6TNv+QHTIIMYR8i6h7UgJL9WWLct9Y0igPGH4KE8KlaN4NN4F6qKnfWnkjpvDWa7GWcBT2nqW1loP
	hZIUgwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDhU-0000000BAXA-2qIk;
	Tue, 06 May 2025 08:30:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDdc-0000000B9FE-404v;
	Tue, 06 May 2025 08:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520010;
	bh=5/lvtCn4OfSHJYnftDRpHjKKhmJr21mm7IievYxQBb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LLveXn7h/ttAVVmYwDGRrcsuwvaMPFlND0X+9PymIKVpGY20nEPS/SOtUWocGhMis
	 7ec5hu4g0fshcIjQPVGzrE0II1HTjZxR6Qe+ppNCOrzSQIub7nB6LuNK46YxGW+V1g
	 6Gr0sfbALi2/RauvU+s2UKJL5pXFQKItXY+SltPSNK+BJQ7/4FncvJaaRwIww4Abah
	 RB6dDSSunYddR92XjWVNOTSRdQET3BT+tLlW/a1hZd87yD7AwLE22XP3WbTAkR3RDZ
	 fwdqJGlEAscui8Rrc9a204xzE8CLP/z/w7Ra/wEHikAfyYkrAbeLEq5W6DiJxh07dD
	 f2L8HyqDzScJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 82DA017E09BE;
	Tue,  6 May 2025 10:26:49 +0200 (CEST)
Message-ID: <0fd0c066-d203-437f-940e-ca355100bbc6@collabora.com>
Date: Tue, 6 May 2025 10:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8365: Describe infracfg-nao
 as a pure syscon
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-2-e40394573f98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_012653_170913_17BF25D2 
X-CRM114-Status: GOOD (  12.80  )
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

Il 02/05/25 18:43, Nícolas F. R. A. Prado ha scritto:
> The infracfg-nao register space at 0x1020e000 has different registers
> than the infracfg space at 0x10001000, and most importantly, doesn't
> contain any clock controls. Therefore it shouldn't use the same
> compatible used for the mt8365 infracfg clocks driver:
> mediatek,mt8365-infracfg. Since it currently does, probe errors are
> reported in the kernel logs:
> 
>    [    0.245959] Failed to register clk ifr_pmic_tmr: -EEXIST
>    [    0.245998] clk-mt8365 1020e000.infracfg: probe with driver clk-mt8365 failed with error -17
> 
> This register space is used only as a syscon for bus control by the
> power domain controller, so in order to properly describe it and fix the
> errors, set its compatible to a distinct compatible used exclusively as
> a syscon, drop the clock-cells, and while at it rename the node to
> 'syscon' following the naming convention.
> 
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



