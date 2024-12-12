Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F3EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QdErZE/U0A5NJ8wu7BZcupDWoeWBCM/jKlJ40ExJqQ=; b=JDWjb5VYbwgdbVvoSJspKIdD8D
	Rb6jYronSIqsn8uRNZVTdNVGrEZ/+phdiZ9nKAQnZN4wMJ7hGilg5mYDSMBtL6Y9CaO6lF2I8gJsj
	uRgLBywLql15ekqwr3Xp1QYpt+taTASAXQCNHQ7xWYCiTm0xUYxJlCZRSvsOqiWXNKiebecPhZZA0
	YuxckCUnASg8dRsYxHtcQcLbR8RlLlA6rH4lew3/5SVvAiN3gAnPlNBpTTz+J6qK3S0nIFMwbglwX
	FZATw4angiUUuTkjSrPtT74Jydit4EaYtT901kjZlPWSeZ77MQA6bksEgkPy07K6R7jtmqU/b0Z2I
	z7zCXFkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfya-0000000HZl8-0oEw;
	Thu, 12 Dec 2024 09:59:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfwi-0000000HZSg-3Y3W;
	Thu, 12 Dec 2024 09:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733997441;
	bh=jgNmKoBjTrYcC0lC0JbKpXcDmXqGerA6jmuEIOLfzzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bPLGh9GvJ4KdKt2xWeUL6EPjJlJAwUaiDg0gNo3w6R9Z7pq9GQOTdEPGFdZScntVr
	 TCO6IBuQ0BbQiDLZ1U0zyeVxHrJS5XqGogFXZ1e5TYXDh9sClAALz1Vd4HwZjpf6bK
	 xGApa+l62/VmLqAF75bezZyfh2avOowupF3i2M7RhalAMTMYnrUspR3chn+uqQqIWS
	 tsxUs9O/1k4fR4H6s4Cr49uLOke3kix20KxqDNLd8nmwZUpT/YkY3eEG72r81HrtnL
	 OmUJTrv3RwUmSdzLxilj+yblAJx70arRm9QfPu93QTXPn60yqeWY5FAHeTVqKa/7qA
	 phqglwm+fI3Nw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B7A3217E35F0;
	Thu, 12 Dec 2024 10:57:20 +0100 (CET)
Message-ID: <b75520cf-1377-4436-9ad4-ef5be4b372e7@collabora.com>
Date: Thu, 12 Dec 2024 10:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] regulator: dt-bindings: mt6315: Drop
 regulator-compatible property
To: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241211052427.4178367-1-wenst@chromium.org>
 <20241211052427.4178367-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241211052427.4178367-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_015725_049957_21A08B35 
X-CRM114-Status: UNSURE (   8.78  )
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

Il 11/12/24 06:24, Chen-Yu Tsai ha scritto:
> The "regulator-compatible" property has been deprecated since 2012 in
> commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
> property"), which is so old it's not even mentioned in the converted
> regulator bindings YAML file. It should not have been used for new
> submissions such as the MT6315.
> 
> Drop the property from the MT6315 regulator binding and its examples.
> 
> Fixes: 977fb5b58469 ("regulator: document binding for MT6315 regulator")
> Fixes: 6d435a94ba5b ("regulator: mt6315: Enforce regulator-compatible, not name")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


