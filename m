Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQfDVNM69Axeoqptr+Z2eO9pCB200/hjmDvvGVOIXGw=; b=NG3NoKOychgELh6Z8MxF20xvhr
	U89sjgvw9CQZRG1yOrPbhS++9zPvXUqF64/vjTOGuXRATaXbM/w2WY8uL6jBe5+66YmT8vVfF+yDF
	Lp0W9aH2MFPUxN1QNEu2rNLAQ5H1qk7bzURyff7FDbIH7V8iojk2D8u7Om5SB0M343rAEzmAJaFRW
	ucDGod2ZhPKj2rxKqX2qD7pwsKB4KkAwMx9Qqr+QM/ocMW7G8FwK/2Jg0diiMtw5MxsAZmGcc9E5W
	nruNCfFFZT21ODIIFYl9ialOLZr4TB2h6TVF3CLlqPFqMo858Mnu2WOshSAgO9Kw8MWDREmVHE3Rd
	GgymXPww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuvY-000000066Mx-24jn;
	Tue, 09 Sep 2025 09:46:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtEi-00000005O16-3pm4;
	Tue, 09 Sep 2025 07:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757404675;
	bh=WfhVUdTdqrhQTMxkXedHVqfe26PZFY7f2SaOORN+FwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z8Sau7pdiFyrn5ibuoTSKtq0nezhdLxN2tk/mizBYLiNWQQnzfZEOyxuaQovbBwMo
	 K3wp+6avbUyzj8BtFCaH2R5ZSOQ0aXTIbVNqamO4dCAAEXf4o8xMzrD46maJb6Q87p
	 MGarU/7byzuNX4V/be1OPSeN4R4HNCEbQs9omDj/Rr7/DGBRFkdrixgYcjOi2fDrAT
	 UisPxWjsb0Bdg54c108LjDQcE5kwJFbwWIshKJnZc8bSVDQ/EGXcgGU3CY54B9ckNH
	 FrA9J6EIRuQUDFLpSc5jBd5868Rl+J4qXQDpwsJWKjY1vJgVnbG92JHfg0gS9KKagE
	 YAB1LsG9RQpAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 89A3117E04D6;
	Tue,  9 Sep 2025 09:57:54 +0200 (CEST)
Message-ID: <80a7339c-4742-45c1-b474-347a916b2db6@collabora.com>
Date: Tue, 9 Sep 2025 09:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] pinctrl: mediatek: Add support for eh bit
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-2-3fb78c8ab4e8@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-2-3fb78c8ab4e8@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_005757_126755_1727B702 
X-CRM114-Status: GOOD (  11.36  )
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

Il 08/09/25 21:17, Igor Belwon ha scritto:
> The eh bit is used for setting drive mode for i2c pins on recent SoCs.
> Add support for it.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Noupe, this commit is not needed at all.

I get that this may be tricky to understand... but summarizing, what the
downstream calls "EH" in upstream is "DRV_ADV" :-)

Check the comments on patch [4/4] about how to change EH to DRV_ADV.

Cheers,
Angelo

