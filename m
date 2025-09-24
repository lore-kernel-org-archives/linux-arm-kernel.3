Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CE1CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEIm8lyS7sQaZrKVJtTazECvbTd/jHB36zuW0hTZc3s=; b=tvtH0lTvP5jQdLYlS+IlydzAld
	KS4VlHz2KYRt+A/XGIaVh6Nyv+db2zfBhbrWhGQ2mvKXgxD2GyZWtv4f+pAVOQH3vfDedf5NxU4fV
	nN4SCI6lGiGl4M1msjMZJsmKiCO6nl4hewe5GEHUrYI1svmuvQ2sI2W1e9iekub+QNgMwbhW5mxMm
	ZTWHfu0MMZlTz7QHkOq9d/7xNG/2FAl9oibY+D24qy8lo/3vPLTF0+CHAxFOY3AscIrIVGGsUgs8P
	VI2sJETKWrP2ZLh4yrPZVv/vfgpMuB9JM3hyR7kfmEU385f2DPm1BmOTdAU7bq9AMcVmw0LahFQyA
	3FUGlylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NQT-0000000GorJ-2Vnn;
	Wed, 24 Sep 2025 11:12:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1NQR-0000000Goo0-0JFM;
	Wed, 24 Sep 2025 11:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758712360;
	bh=StyC/ixgTVj+aRseOXWVLm4tngSxQFzQsmw3OnQb6/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bG3AFDyiCxIWHeeIP9y3TqLPh+ah2p8jEDOEPr4JMP8G6122SPwn4qllgz38eQJbC
	 NJIAYIlQAofDbWO/z+C9wFXzc/n+Qkz9csvEEObOV59Ht73r0SZ0gbgNo0WcARmxrS
	 BFkQAdx5brvVqfNYLa27lDYaT8Fo1PAAnqwLo8qectAfa7GNCzINgQo476uUA21ruo
	 bktQadcgbpYISlRe1yFlX8D48KzLFvBTVV9xFiVElePxAIfKX2WMrYLOgMweok7fwb
	 ZcAMcaLZvNOo3QWK65EQgHSgk2w6njoqTfpeGRuZAv80eQW9xg9B0SMpmUtpDjxjAn
	 dBpx9iswOeh2g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 491C917E12C1;
	Wed, 24 Sep 2025 13:12:40 +0200 (CEST)
Message-ID: <7fef0cb3-bc8e-47b7-a8c4-28060f577d40@collabora.com>
Date: Wed, 24 Sep 2025 13:12:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: en7523: Add reset-controller support for
 EN7523 SoC
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Felix Fietkau <nbd@nbd.name>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250924094112.1918444-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924104850.1930254-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924104850.1930254-3-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924104850.1930254-3-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_041243_291281_43EB58AC 
X-CRM114-Status: UNSURE (   6.79  )
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

Il 24/09/25 12:48, Mikhail Kshevetskiy ha scritto:
> Introduce reset API support to EN7523 clock driver. EN7523 uses the
> same reset logic as EN7581, so just reuse existing code.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



