Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CF9C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/DgbOfP1IdRTM5HoiVEqljYL3hyYS7PGHH9Q3ggrIY=; b=xgUaryJ48pqyvElobBLCveuOvq
	W/s9nBlWl6AGuDddqhGe8+BGgrQScgGRsJS6FvPzTxFtR0+E8vjTQVIJlqC9f2x9SsV+bPeWKa1Y8
	PGdILEXJGX7sVPNVds9/inIJjFJrKhPqiUZTCrcCvDyvMZQCHvepc/xKX+5uXZa8MdkQ/aFxT622d
	ux9ThW/rcdXpbf9aHQx69QT+Jb8M8FlrC/kbRYflHse4SPG0U75LbFwjkOAW0TVkF/uvnXLjUip2s
	BVhuLBLrSMiiH8fR/jwSrHfU4VYuU4W7pghYgTe3kwMuE7sj6Rv1fnXZPdawbXx1WUmLMbCPkLaOL
	uFjPwyaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCts-0000000FNoS-3LL2;
	Wed, 14 May 2025 14:16:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCNq-0000000FEHT-1J0u;
	Wed, 14 May 2025 13:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747230172;
	bh=zGDHISwiklmAPNsLhUlC8G4oLC3Tw+fvyfAEuP5U/EU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Snorc9S/rqdNvQgdHb9V1D8LQrEyTbwW0N58KtKNqtTrl9MjGZYGdCyO8nBmBq8LK
	 d3salbJWhRQOlp7NZ/m3fvJyiy9vVVMdEUEwKuH/7o+miJ9Vt7LCG34qJ/Evz07713
	 DcRk0PQwEZ9auJEOD8zXzQ7oPr6NGNDf8SDGWMr5IOppq8uLPmEoeN2QBMUzh0nDyk
	 4HChRMAWbb/wOZNPH3ph43rkYUuV1+dMilL/lU3NE1M/Zv55NBfUjLQXjEuGzNLisq
	 rAtqfI8gUxPazjNqwoP/mBgYqoz+DW615rHRL+6JBkup86Gx8om016eO8u0i41oCA+
	 1Jvn1vgAVCkXg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EEFF17E07C9;
	Wed, 14 May 2025 15:42:51 +0200 (CEST)
Message-ID: <2734351a-7214-4c60-b61f-432aace5a040@collabora.com>
Date: Wed, 14 May 2025 15:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: Simplify
 mediatek,clk-provider
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064254_501923_16B61225 
X-CRM114-Status: UNSURE (   6.84  )
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

Il 14/05/25 12:57, Krzysztof Kozlowski ha scritto:
> "mediatek,clk-provider" property is a string, not an string array, thus
> "items" is not really correct.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



