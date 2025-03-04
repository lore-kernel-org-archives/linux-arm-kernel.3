Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB80C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoq9GShGtfW6mjxTRJ5meZvXO2XcF6XTHlYK4aSF+bE=; b=So/gFtSABzuGWT/PRn4tXveoO2
	KcoGQyayGmfyc7ZH47tBgQzVUYvFHx95wVFqaLtFS3UbQpC4XalTeoM8ew/bgnhi9DOnoLUDqbmmx
	bunS79Z69yt371AoLd9+sNpuXs0GxxveSff6NbugVX3pyFIHZeiSdkSEu9ns6Kytb5pi0KdbAYtsh
	raXJU8MH5XBVXlwIEqE63648V2NgXCQQu5a7im0wXqGW4vqGRSAyTmryEALoy2NCQr6T1I8L4YvEd
	oDxVuWwFQcVepltCN2hz38tc38NUkbSKkNgWO5ADR8qe7onm2lY5K0R1+7RokO7kTU/hjuMNOaqHD
	Mrz6a8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSyA-00000004vO3-1tsD;
	Tue, 04 Mar 2025 14:10:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSvm-00000004uaU-0Vyn;
	Tue, 04 Mar 2025 14:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741097252;
	bh=pRXLJIV29hRFaxj1bkkHZMot55RLvo+ihLUTWEz9PAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3dRob200QcQQafgHekyUUKiLWs3hgyFl2ipLbqTO94oC21URoBb0aq5Hw7DOWZF1
	 Jh8qWfcQVjM7mmOa2q5dug9zjRJy+WLZN/Z8fvQRiHrQS0zflI/nuDlwARdhI6bKpl
	 K3nXtr8v/1nLKAOxO5jRZU/nZXLFKywdyGXpv5L2pJQ9E3lwnVyb9cLikB9wBa16aj
	 2plexkmfRomFz61fVFIoJa/NN/GeyRuT6xvgWHMrWfLAnaIWZtLkgphdy9UacKYsFZ
	 wchPxbvQAwhr455Aa1BweELauv4U8wzWjgWBUCch5wM6WlC1/9Xme0vQWE2r+adR4I
	 ZdsGk30eYKg/Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0A7A17E07F8;
	Tue,  4 Mar 2025 15:07:31 +0100 (CET)
Message-ID: <287cff19-a95f-47c0-8e06-9d12b9e7a093@collabora.com>
Date: Tue, 4 Mar 2025 15:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8395-radxa-nio-12l: Add
 Radxa 8 HD panel
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
 <20250304-radxa-panel-overlay-v2-2-3ee6797d3f86@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-radxa-panel-overlay-v2-2-3ee6797d3f86@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_060734_313123_2322D253 
X-CRM114-Status: UNSURE (   7.69  )
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

Il 04/03/25 15:01, Julien Massot ha scritto:
> The Radxa 8 HD touchscreen can be used with various Radxa board
> and is sold appart from the Radxa NIO 12L development kit.
> 
> Add a DTS overlay for this panel.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



