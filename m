Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7838DC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvvP4rpQmheHpawyW9b/taUAJMSVCliYAz/q4RktaaI=; b=GTZVU6G777clObAShUmhRLjMY1
	N/6MUrfXajK5dCQY3GrJ6G1h8PeusRUHQeO8E1WcqY/vjDhwE/Gvz/8YMhi08R2USkM4yXBN5d8fZ
	uTIIJGu/rFXHLTa5aYklrengeEMkOkBjuYNwDtw8lzvsyyyZ5+PVpsW3fVTHb71ebjtqERzwa0R2a
	HQQHDtzuVWy7lnl6hZvGclA4mpbo6V2AWR3xmZL1nncf1hJzuLiixZsQ4I27v5r3+4PIMllJE8JgQ
	DLnRyjiU37yNdMux1aNkYpL+4LIyHHCjlSDnLOozfTLvbQChKKLzmCp1SucGoEv+978iBceRYOwRG
	XF1p75uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqLo-00000009uxX-2Arg;
	Mon, 04 Aug 2025 08:15:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq6a-00000009sRW-2Rgv;
	Mon, 04 Aug 2025 07:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294375;
	bh=mrssKrIR8oW9ZUMovsji6QqwAFu2XtWWgavRe+usC4s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZpZqGDK97dJdLVRO6Uyp41Q1jlqbmrkzwWKQirBabTcrqBVk5oAiSQ+F4ZHaJpiQX
	 fEEw8CkXPLM9FJv2Tq0FTgm+PG/QnM8JeNgV8+x+lGTGF7eC+fSj8tqsas3jaA8XlQ
	 bPrR2GPGfIDfWlGdnVVd6xVO3gRK6flIePNA66C59+0sgZuQ4JCPYlhYCiWjAiUkhG
	 qFyqOLiXIBMYYGmvFv++ViKeZ5amlE0NmWrw8RgBKNGc9eF6oqxCzYXuy+XcTMWULX
	 gdo/zKf62gTQrRiLhvjcosJF4pO6+UZ5qomJhYX0ux4n9UTa+Dnn3ZFjhS0RFXShtT
	 uH+plK7osWWbA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1753017E0DD0;
	Mon,  4 Aug 2025 09:59:34 +0200 (CEST)
Message-ID: <8e43a498-8a08-4f94-aac1-65868b8651f1@collabora.com>
Date: Mon, 4 Aug 2025 09:59:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] dt-bindings: sound: Convert MT8183 DA7219 sound card
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
 <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005936_776627_E160AD4E 
X-CRM114-Status: UNSURE (   8.02  )
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
> Convert the Device Tree binding for MT8183-based boards using the
> DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> amplifiers from the legacy .txt format to YAML schema.
> 
> This improves binding validation and removes DT schema warnings
> for boards using these audio components.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


