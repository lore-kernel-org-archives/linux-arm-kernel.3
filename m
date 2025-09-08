Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CF4CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 13:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq4vjYo7YcelX0/RK0WL7DXyeRoGs5LrE1Jo/dSt16g=; b=2PZzCPKPLEClMHIN1WGaoTtkEZ
	/FGX1dgmStyn9qD0Nlx/vhRMevw4z/LRojuX9HD3vme0VaZ0h5SX+vQca9AsfzYa8wpKtK3tL1cNU
	3uzBT5AKdC1unulKnR16INX5qE5DbqPwJ7ZXLwHyOUCIvWZJUKMPsdkIx9MKoy3yS8XJr4+V/nRp6
	FUpMYNnqZuWfSQqpi5okljH8RCyQnaBjtDJ6wYPnYRPx/468slu2hFJavJs7yKm5DTpVumy2xPAc7
	kId7o4FzhaJKpaaLSyeFN1e/yJk8uePrpHUPkPHbT4cdppMZ0GUFcMRUKSmjUxHieMxaGqrvv48tv
	RRPdkhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbar-0000000HGCH-1MUF;
	Mon, 08 Sep 2025 13:07:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvab6-0000000Gpxf-0jFw;
	Mon, 08 Sep 2025 12:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757333025;
	bh=XIocrUvf1jmeevgA41TfeHrwokbPV3UwDRYwfQCSDcQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=K7+WZ+SDW3VIBMxsMciwOS4OXqOnKsFWdYtlQ6rWm2l4yIOEI+HPn2yLD5NP0B9eU
	 XyCWtvX5iMqLSBBWNyIWgavYSiTJMYXfFA9NUSg09G5e1v8rEv4UfJEIo1/zrcZmvm
	 kaL9KaYABQhB0dJYdHWC5FwVi91p87FeApP6ZQeOw4mIC4t72iJ+UhWPX2XZScgfCr
	 KLUnf6u1wQWuDPSKZSJIJQ2t1AkKmWpctGofzAfANIQ0pI+M6fxnOW+U1pSvGJPgU7
	 CS9678m7/glziZl6YUOEo9833O9IU1Jlr83K1WESK9aDffIFrwqrgH8icHn5DTaG2k
	 z10JtANyTSlMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86C4817E0C96;
	Mon,  8 Sep 2025 14:03:45 +0200 (CEST)
Message-ID: <a0a8a8b6-906f-4a4b-8666-fd323238b52c@collabora.com>
Date: Mon, 8 Sep 2025 14:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/1] arm64: dts: mediatek: add thermal sensor support
 on mt7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250907111742.23195-1-olek2@wp.pl>
 <20250907111742.23195-2-olek2@wp.pl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250907111742.23195-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_050348_379072_01CED438 
X-CRM114-Status: UNSURE (   6.36  )
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

Il 07/09/25 13:15, Aleksander Jan Bajkowski ha scritto:
> The temperature sensor in the MT7981 is same as in the MT7986.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



