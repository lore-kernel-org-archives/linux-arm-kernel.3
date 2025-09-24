Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97BECAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFGMgFsmPPXzgkT16Kyz+tCCDuJTPtKgEXIM4AzH6wc=; b=QVnUuhKj9V0sr52gX/th5So9+1
	Tbp9ie8oDrbmzegXC12eAlFi1QKoWTwQo0hsyI+GUbBxWLKqBU0E2KPJn2YAu6/9fcQX9tAVaIAqE
	52VhVB5Teu1fidUDnqIvVpIm+7RfuIBrCPDNZcPRkdYUDk/fHzy+wuySwr0atng9oDR1BQKlrOuwX
	OO5eJww67UKB7ZcGNmY4LTnpgSdZVYbjxmCcvcnpxv2cbyqop8fgIHBBuEt3dUY4OS5KYtOIIoPfw
	+S1rEqez8vsz0PbUNsjTQTLo0ZrkqxWmX85kjHXlf8qrKoZJak3ssLtjvFkdL/7Z6ofMhSo2RSOCN
	mpSp4SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1McK-0000000GRkw-2GiL;
	Wed, 24 Sep 2025 10:20:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1McI-0000000GRjM-1D2g;
	Wed, 24 Sep 2025 10:20:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758709252;
	bh=Gb7PLFsKmlEYtoQ+aSKKrwMrUf84Ic9+Nei/2tc1Lxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PF3IuZuW5KjDpZZnwN7rak4k2wlBmhb3VPhdsEay7moWOSeooNtZ4NPu3lTZctsiV
	 bdf+jiRSVT+9ESuC4nzb36pg6sNIH4aSajXTTDWvKfv72/uzA91rqXtWIPSK8tM/n3
	 IE0dnzApRzsUQznDaludnVVfwARWDTpPAcJZSwduUwobSYljpkX0O5rVWsvBqpldGi
	 HYYVpko0B/4hBiCsoLkji/aT+MWkS6XsAITgkYSgJuUPQb8j19DPd/6/w8iYBv9Z9M
	 Ym0a0OxraPSziLhT2wXQNk4u58EKDse5j+HiC83paBNuRfGbY0bclNi38EOZGqbBkQ
	 lFbDUlAnuMD6w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B34717E124A;
	Wed, 24 Sep 2025 12:20:51 +0200 (CEST)
Message-ID: <76a5e9ee-b8b3-4f7f-9410-9133263358bf@collabora.com>
Date: Wed, 24 Sep 2025 12:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: en7523: Add reset-controller support for
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
References: <20250924060509.1889131-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924094112.1918444-1-mikhail.kshevetskiy@iopsys.eu>
 <20250924094112.1918444-3-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250924094112.1918444-3-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_032054_487157_068249BE 
X-CRM114-Status: UNSURE (   8.43  )
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

Il 24/09/25 11:41, Mikhail Kshevetskiy ha scritto:
> Introduce reset API support to EN7523 clock driver. EN7523 uses the
> same reset logic as EN7581, so just reuse existing code. The patch
> renames:
>   * en7581_rst_ofs to en75xx_rst_ofs,
>   * en7581_reset_register() to en75xx_reset_register()
> because they are not en7581 specific.

You ignored all of my comments (sent at v1) on this patch.

Regards,
Angelo

> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

