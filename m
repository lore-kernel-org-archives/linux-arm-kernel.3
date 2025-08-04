Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E671C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJfPSXTo/QIZWKKEoKp4+2S+YQ10X8Upj71SefHfZQY=; b=Pyznj60bXB0QX7oZZXo4WsK+LM
	MLSg9aJ3SXI8l1+l/ANzrdfP2Kc5CFIlxvJB3jNHPLrvhMNBo9R11x+E2lgFePiaB19hfmclLCwts
	zvRyULaLEMhmszZNcR04uZHzg5tj2iNmKMQZsuQAl50mNSczXvYE0mX+wKkVpUQevs437E7MbutED
	BVWs77ubfBFVhap58p+KSqOzAHW3Bj2zw1vzDc106l7rzYqAT/SFWiKjB65+KltfPNt/Fy6184BUp
	4f/C+j/0LvtH21LYvG+wwJydK2eFUlGxHKPPKE06YR7te49YyGfZJ+NC4+h8PquIPyVGAsMNZUAaF
	A8n+9WWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqJG-00000009ude-2YyB;
	Mon, 04 Aug 2025 08:12:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq6Y-00000009sQc-2uPE;
	Mon, 04 Aug 2025 07:59:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294373;
	bh=KC1rixHGxdbuJ6JhhwdTd21+VunEANeILIsWWV3U51s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ocyNpWk5V2xjQgvWQrSjcXLjQAUfRIDPASKjtQQrqGkH8ibHdmYT7Gs9Gq1zFZ5I+
	 CAqNFSToFt6cFggIXgXvO0f7ksGy1e1pMklNPsDbvIIZQL9fJwDHM2VTwDVzwVr4rY
	 dxiaO+yoOMHFnxCn+oFJTQet0unZmLxgwXZFgmXc/IpLo/50ds2aUSKw3VG4HGW++T
	 8UBH/nzTOqndFtfkcJC5qy19xXelzaRCzFS63h5SetM83ULKsrTUjw8XGicueCQINP
	 sOhrYJGMoiIxZjHAq/SjjJ/D4e+FI0gLBhB71vJP/xrHnzn3DEazW1MKEWCv/TJq5S
	 32pAZnnJ6oDjQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2B0EA17E1110;
	Mon,  4 Aug 2025 09:59:32 +0200 (CEST)
Message-ID: <ff30c71c-f17f-46a2-9237-a92db8c3326f@collabora.com>
Date: Mon, 4 Aug 2025 09:59:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] dt-bindings: pinctrl: mediatek: mt8183: Allow
 gpio-line-names
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
 <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-7-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005934_878731_415FDA6F 
X-CRM114-Status: UNSURE (   7.95  )
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
> Add support for the 'gpio-line-names' property in the MT8183 pinctrl
> binding.
> This allows naming the GPIOs, which is already done in several
> device trees (e.g. mt8183-kukui-jacuzzi.dtsi, mt8183-kukui-kakadu.dtsi,
> mt8183-kukui-krane.dtsi), but was previously generating DT schema
> warnings.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



