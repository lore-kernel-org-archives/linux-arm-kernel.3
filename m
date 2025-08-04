Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBDFC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnLm5RdOSTXSfHYWyK+/EmgdKnjaGarRzvmsGKeGTHw=; b=0RhTpwQsnsSFDF1ONBleDvdamT
	G2PosWPlnGH6J4lonkkXU52cQbAZ2/J/PczeF5fsJbOrK3M4ZVV9u2iAiOL3BN0vSbJMlA5OY6CNc
	Y1F7r3dAiwY7ugVOCTe79JHQWkPm3Vdnu990Ns6q51ZI/8dnGhDegkgpImmum0z96HO3fM1mtXTE1
	fDe+yC/71ltkZ9rV9+yTa5nN31FTTPu5aJUA/wW1mIqfA4+26hzgx3BjS6Sttxuimoznh94a2IU+R
	czlrMOm90E52jT1hPw3za899aP1RCxSDnX0olgupGw/NjK06wv5ncFYGmV8KAMQodQb4GO1Vo7SVe
	SMtoKklw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqEC-00000009u0i-02SD;
	Mon, 04 Aug 2025 08:07:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq6S-00000009sP4-0phU;
	Mon, 04 Aug 2025 07:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294366;
	bh=l22hdRool1+i8p3XtMz4/jHHCxV/g1CG6Ymfm7j6uhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SpVluudi4lBqunLHi8HQiiXBax2fQlve98/g7D0la8NIo5TYsMcrlEWpZWRh7+BxO
	 ndOQdUzGtFOGq1Z1hFgGw+aoD+sX0nr9OetcnWiW6r+ml8E4ClH9J1xEsfMj7AGB/Z
	 YxIseIBysZNp00Y/TlAHGHbeSI9IOq++IXvt0mlLtgKiRJ6NiIBvMbQ63GDhdyBv2H
	 ppvWaBgeGBBoyKNAe+G59R88h1/ZsJd7/l3Y/yV+iK8N4zRQBL6tTKm5rbOdwSWzNm
	 1fxYe04yoePQu+cA/2o7UfQnDxQC4CH2CTyOdR1gyylkZpidnQGAoQ3Mizici/AnSd
	 YspMiodgfYfGg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E2FF17E1274;
	Mon,  4 Aug 2025 09:59:25 +0200 (CEST)
Message-ID: <a260336d-57e2-4e45-8df5-8330328eb224@collabora.com>
Date: Mon, 4 Aug 2025 09:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] ASoC: dt-binding: Convert MediaTek mt8183-mt6358
 bindings to YAML
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
 <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-6-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005928_417090_7ED35123 
X-CRM114-Status: UNSURE (   7.02  )
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

Il 01/08/25 13:18, Julien Massot ha scritto:
> Convert the existing text-based DT binding for MT8183 sound cards using
> MT6358 and various other codecs to a YAML schema.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



