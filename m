Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ABCC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHyV/WRwUv1kc9If1CcGgcM8T4Tys11MVuriFi/9dms=; b=sRKHXEEeK2G29trinZpZ5bSq+5
	OsxZDsPdCsntcF3uMhbPkadtPkuBNlp3zYAt2AFfmvHXxxoXatSsvYs4fbUf96zMKwWOptdrGLYlY
	azevdwfJdHocVFep+IqE0KP8hnPGj5mnCYfDz9/wx11Dic0nogVUKSGwVFsrWZRw3HVCQaEidgnaK
	8NCgU6JMqAS3cLNGvJiZiexzqqPXyG4sdZkXhKkfMdVR7lBDafUD9P3DkPHYAuxT9y9QaeJTwObH/
	FrYGPQqOPwU2taxxFX6zV8/6jXgTkpGZ4YUNGST7Yg/vl13a+g8oLz1w5EL/zjc9PDkmcc9hl8Aq1
	n5KwfSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqOL-00000009vGc-0bqT;
	Mon, 04 Aug 2025 08:17:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq6c-00000009sSV-1CWa;
	Mon, 04 Aug 2025 07:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294376;
	bh=Wb0/PwjqRVNZZEx4HaUyk/C9PottFAx2KXPeqXxgZ4k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a8RMqx2fxWamIp5II5pBCC/u32HYVhwbQOAzhBNHdNJHV+DpTUxGRahlVAsHv2Di6
	 iW0/mWuwCVyPxUueoBQUDD9fchOgdz1/AXcWSOyZw/Jb3Yo5h9DLbwxtMSv/hKcwDQ
	 mxZdXKKAesO1R+zwa59KVmYKDiQfvmSAbh00hR6aN6uG0a8Ht3ebCPXC3jXA3bdTzs
	 Cpj7WlEYGOgp/Sy0qHjEbOwlV68orvKIfczG/viHrbUKfhV0R4zeogXB5pemE2kWs7
	 XlGFD1GsKbtugYUKxxsRyxasbCC/j62Q3ZMfvPb85Yp4MvzIM/3XeFLnzlfXKg4Vyl
	 0X22RaNKfr8gg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D536917E1274;
	Mon,  4 Aug 2025 09:59:35 +0200 (CEST)
Message-ID: <c3b94078-db1a-4ee0-a0f2-d667de03f4ba@collabora.com>
Date: Mon, 4 Aug 2025 09:59:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] arm64: dts: mt8183: Rename nodes to match audiosys
 binding schema
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
 <20250801-mtk-dtb-warnings-v1-3-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-3-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005938_475921_DE52870D 
X-CRM114-Status: UNSURE (   7.48  )
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
> The binding for "mediatek,mt8183-audiosys" expects an audio-controller
> node inside the audiosys block. Rename the nested AFE node from
> "mt8183-afe-pcm" to "audio-controller" accordingly.
> 
> Also rename the audiosys node itself from "audio-controller" to
> "clock-controller" to better reflect its function.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



