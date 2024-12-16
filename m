Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368D3E77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 14:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4HEJRNkJsMuZWEEvbh3kE/ls8GrPrXfh0AAgq+OuT4=; b=aZjXiCO29PIV729LzXXCwg6KDA
	5EzXIlOtW1e3l6T8nPL4PhB1KgBsFqojSxvfYWfpEdq7qvriEtXC1VbrWq77q00DN21+E//zQUNDH
	vIEJHGkabT1EjGD2DDs7xQZhLrNWoN+3osSaEU6CkBf8ESLyqjWzrb8ZrtOZ/P4KpDphs3Ch+N2fP
	kyLvLZQF+HihxIEhmS9BBRoBLuV176xuDX+4PFtbNJz3OSXg55Z2VvSBLe8uRrpqnvZcy4b7eDRvP
	sSeZmuzLtaEmP1sBh5+UQ2IL+ABlhR9g+Gn6oYtZzjm/b6wpsW7LJgT0lHFt6KOGMvm+Y3mw07+fU
	zurT41aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBsD-0000000ACmR-1oBH;
	Mon, 16 Dec 2024 14:15:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNBnr-0000000ABJM-0jBN;
	Mon, 16 Dec 2024 14:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734358229;
	bh=9BMq611RSXimAJ+Nd4yXmLpN4KwHNrEW5UBvFhxngaA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=i4O2T5f16Dzv3jt1OKIrqbLlsFrA/yJsbYUxcbwErnPLRe80ecZsKlAuc42QcgSMy
	 +GKqIL01nWFrc13rtnwYAsRsUk8thykoy0lbq5mZg0jNl659bPmx+J7eMArQEEpSq4
	 gP4EwqnzSJO4ZJJCO7gupib3RP+iLHo9bEF2Ytgfi8jJZ/F/UKE/sXB20teCxJMMsj
	 P/VQgbn1fFp3nSsIrgMclakVUBWm8jl4KzIt+EMCkTIRPPbxlfysPgfQf5DwYWF5pQ
	 WrwFS1YQG70NrzMUQpxU9HCUmWr+Fp/HxOK7WKyGjPOrpTB9CKzqc9p5lZVPC33S8c
	 xffdNCYAxpK8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E32B617E3782;
	Mon, 16 Dec 2024 15:10:28 +0100 (CET)
Message-ID: <f816383a-0409-44c3-973d-8e0dcd786b68@collabora.com>
Date: Mon, 16 Dec 2024 15:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: mediatek: mt2701-bdp: add missing dummy clk
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, John Crispin <john@phrozen.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
 <b8526c882a50f2b158df0eccb4a165956fd8fa13.1734300668.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b8526c882a50f2b158df0eccb4a165956fd8fa13.1734300668.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_061031_352798_342E9646 
X-CRM114-Status: UNSURE (   6.59  )
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

Il 15/12/24 23:14, Daniel Golle ha scritto:
> Add dummy clk for index 0 which was missed during the conversion to
> mtk_clk_simple_probe().
> 
> Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


