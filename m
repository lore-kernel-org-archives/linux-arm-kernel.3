Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCE6CD5858
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nODDuMXFKqZht8eNmH6d/BBUc5AtU0qzb10jmhM0kIs=; b=H8scVp1xwrCOEq3ZIIOgPAnclA
	uG/Ffje0MjrBOaiB883fEABDIbxV8bIxtUP4+2N8uE1yygBksNaEi0+HMyvwxOlL8bri2F+e0m2xf
	80SndLpn8WnIvmworIJjj9A1gc2KPzPHOpO+pdxCm84WizdI/R86PpD+0oBSRf1PRqDnx9oyEfApV
	AtVi2qOaXl6l+Mo/vXnMRiKqJyyw4G8Lp9E9Dak+H0/tRIHn7OBvIjcibL4/XKvA98NSdxKU7WWNm
	mmYKCaL2yCzVi5jcDT8hwCfjVLPMgAcolULU3pSwjdF40EYrPKlRzFdM2Czfks76lRXPnWxePc3pD
	PKa2jOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTb-0000000EnPV-2PyD;
	Wed, 07 Jan 2026 11:13:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRTK-0000000En6u-3Atm;
	Wed, 07 Jan 2026 11:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767784379;
	bh=tRXiOfA7dWZ+z0O68giSqWYtkx5S1jkN9DmnV3vzdbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T7Ip54GUBPEchIoObBEd3RD5bp27C7PVo9puP+fCDWsihgk74uvlFkRHbA3KDRXZr
	 jkUswTcYI7H09p0FDjzBGX2VTMuBowqvTQFY7EWCdfMkgvQ+BvTOymUHv1XBx1u21P
	 vvj5D4wXqiYEuC/ByCtxMK0AQvFh65yDIr6+YjTmDtOwEma5wOCpK4CMdrUSjg2rzS
	 fMYRtE0HCwRgUAi5L/c1U6ztaGgCaCwg5WqhfaL1yo0IOR+kGAx7AlXypFtvnaevOo
	 51wn+wMj7a7HJMFbIkABid6rTJSw077ivNkdkwpbRrSkhm1lfbKDJAGBYTf2dP/2S/
	 T8mcaolYV4edQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C045517E1534;
	Wed,  7 Jan 2026 12:12:58 +0100 (CET)
Message-ID: <c3a8ab2d-5c38-4e1c-b13b-b34517c337fc@collabora.com>
Date: Wed, 7 Jan 2026 12:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: Drop __initconst from gates
To: Sjoerd Simons <sjoerd@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Laura Nao <laura.nao@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
References: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031302_965473_F7440C92 
X-CRM114-Status: UNSURE (   5.72  )
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

Il 23/12/25 12:05, Sjoerd Simons ha scritto:
> Since commit 8ceff24a754a ("clk: mediatek: clk-gate: Refactor
> mtk_clk_register_gate to use mtk_gate struct") the mtk_gate structs
> are no longer just used for initialization/registration, but also at
> runtime. So drop __initconst annotations.
> 
> Fixes: 8ceff24a754a ("clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct")
> Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


