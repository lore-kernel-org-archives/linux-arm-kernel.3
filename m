Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BFCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odgOqe40gevHX7TOy4G4ANCX1tEWENZUggkRKCH0dd4=; b=fJ4wBNE+79cH/LbW1iCjxrxrjb
	enqc+nSGQt3KQw/xEryv6FZHiowm8F2qcF5SpPyD4Ecm9C5/WMTz2RFmIpgYau5h6mriGbhP3MNaG
	7OCPdNIPCYvgs106NQRiOL65xOSyUuEJcaxh8uce1puB4bGm7KJgqOI6Miw4N679+qxcbZVtA24hL
	+qMej9JWeiibXleAXz/ZYp/p1MvRYl30VV8Zh1T8rVumfbFkIOEB/7jPeEKMUBkbTegR+rYDKXsDN
	KJX4xmHQCOc5jRX8AUWzeQ9A4c/XNfyWaYWBYW06CpF9HVJcENJxEPgciKj/dgzEYbcwlD9arNXYd
	EbuMfS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTITZ-0000000A9Oi-37GU;
	Thu, 02 Jan 2025 10:30:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIOx-0000000A8Zl-1e0G;
	Thu, 02 Jan 2025 10:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813560;
	bh=UrA0wl2qAaU7cN7qmWg2X9V+D+uY4VtCKM156+Ohq6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fwb850jDkO/T5St9QFlcSuaPEgZ+VZIrw8WO9TCWTBYP1kheL7Zx8FSPIEU+A1OBA
	 xeEhOz0T+s6ViP9xwekM5mcR8UwcrPCChPOmVYdTIwsulq4t+fYUwOYOVlAf4szaoE
	 VhyKMPKhJv4UNExQNGnjQpFbYjS+WSwD/iOc5gSkvcFsKpnniHvO+LDte5YbfEnr2D
	 /xXDpG6rbJxOTQ7SQ+9fbsnS1qrTeX2/DmMmBF0uzOG0woOKGB+Fx57dODbp0lAwsO
	 +jQP6BdKr/3GLPUEvv2Db8CuSluGtzBb6jQJbf6hLP5c69qYO+OpUYe3nLYSywHYHO
	 xEinuB4Od5clA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F076D17E1551;
	Thu,  2 Jan 2025 11:25:58 +0100 (CET)
Message-ID: <b7d54b9a-9cea-45f2-b410-09306b113d45@collabora.com>
Date: Thu, 2 Jan 2025 11:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] regulator: mt6392: Add support for MT6392 regulator
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-7-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-7-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022603_612225_CE676195 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 26/12/24 05:58, Val Packett ha scritto:
> From: Fabien Parent <parent.f@gmail.com>
> 
> The MT6392 is a regulator found on boards based on the MediaTek
> MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
> connects as a slave to a SoC using SPI, wrapped inside PWRAP.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


