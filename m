Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78967C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/g9QGJTU7LjHiabygo8K4O3ZYzxgGEroQTtNik/ARyg=; b=1iHY48nDsKnguQOFWmfWN3xXQI
	P84UsFSnIJO1kE/cRkeWyZE+9GDpd5mJD7S6J/nw9dJE+GqFJiURs5rkflFlVhIbHwa4cu4RtwiiU
	zbDxdc3yFCq7OHEPyPe0A7DejxiyuwrErinm/AnBBNkKGxzLYXcLN7R//uyH5qi8/+KK6sN0Zij1U
	A3Rgk6AwQfQdwaWHgvh9uqJryiRoanKCHKxnkdy3/L+ioDFeS4BgFKPi4faRknc9bKX3KtWFoYgdV
	QqKSlxiOunMQmaVS+vnUTzpV2Llj/ennEJEnS2flqTEz7q5dyBdr1qT7bgHVlVmWWW7lgRHwwjtcD
	+WxNS39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8V-000000085aM-0wrt;
	Tue, 22 Apr 2025 18:14:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7o-00000007OTx-2ALm;
	Tue, 22 Apr 2025 13:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330243;
	bh=g7WNVJHclvSj1E2AwbocpEvXvRSkv9UNMU2PgjrPJOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWo+vVJYRfk7c9rAarBXaDJbhgJAw6zdNajEpHhQtIXVfuaS7FfN3H/8FEjrycj1o
	 4FtlL+sU1iHJgH6MVb57VNzAoBQknaxje3CalTenCHPmNDe4W63jz8sUFqB2vokBC4
	 9VoeSm1aoCRsvH6+sMlU+vYFeMX/6/sQBqETv+T5srm9PLXSj1txRcLrAC+6L1S/Kt
	 42J+Wb2csC0ReauZ5w4RXI70XRlhwvRkpPxaEECnC24fBl6NBeYoYsFAKnY4zw7syr
	 Q8AaSxemKQMBcbtPlN0+0j73SyM91DU05UiZD0MJoUDAdFFHU/TMYax2dQx7BbbRQI
	 1Xfmc0eUnm2yw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8068417E157E;
	Tue, 22 Apr 2025 15:57:22 +0200 (CEST)
Message-ID: <26b9b027-b880-4880-9c12-844bd36bcd44@collabora.com>
Date: Tue, 22 Apr 2025 15:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065724_699358_38B890C9 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
> 
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



