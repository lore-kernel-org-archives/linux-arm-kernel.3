Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFBFCAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 09:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dH9nHaS4B52f2Ty1WjrWRsgtAsT8zLM7ML9L5CEJn6M=; b=WOQqJP+H0274cHSlVUalapFvTe
	AK9Ku7DqrBzTRgQHy1jXK86lUu4ELbp004Lka1RdfzTu4PsHrUO1a583nEz+TtQeM/EbzTtRA8ZYE
	yuKTh5+tj1xYlaOBkNCTawx0DH7c/zPxC6XrKgRyZvv+EIPja+XlS8Lvmx/5hjcbTIjjtZHCXiCCb
	1KoEcDaFGlqB5XOrgd5ygm90ip1xL0+0g9vj1ST3lA5s6w9xzk+cLCHQkTUfyyn7e3cpWVDjvHsCU
	GQOnDSzDUxacfqF0FZrts8gIRKgKEmOkqXOMxWmaYdGnAeCjLQCqscSoeEW5dRHcjPPzsn80AYLvM
	8qwoqfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hgL-0000000HFwX-1Z54;
	Mon, 06 Oct 2025 09:39:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hgI-0000000HFtq-2WLf;
	Mon, 06 Oct 2025 09:38:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759743536;
	bh=VGWfaj8Jc+RJr6PNFRH8ZLLpOaLe5dnDc71A2t0YLZE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nNR4zdDkBV58C6+8qKwLmWWiFLn1XSz0SkCndjLNlz6jYxdICDJHXVsEVLcxcwx84
	 qZHg2HM/NSoffFxRJtdvTkqQqWScAOoorSA80U26A+gQx+kwxay4CkxNP9o2qACHkA
	 9k5kjW5dfLEJ9nOzcqqKwKrhZf4X562iWCkfjdx7VyVZBC59fPMrhQ8Qa54pN+veha
	 GL081DkvsbJ3xdCIh165w+OUTX6qnz1uqwKSANz3yAmnDwOePzAmYmxNhBa2SKMt8b
	 vEPg7qHVMFAi1J6E1ttI33LLC3/k9yfK6SEODctsC+IvmBR0F6qioj7oyiX96qqB+I
	 xQqMiPsmxK3UA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B014817E009B;
	Mon,  6 Oct 2025 11:38:55 +0200 (CEST)
Message-ID: <a1d9a470-c6fe-4c8d-b36a-c4952c4d3494@collabora.com>
Date: Mon, 6 Oct 2025 11:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: mt8189: align register base names to
 dt-bindings ones
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-fix-mt8189-pinctrl-regnames-v1-1-408a2531b127@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_023858_820191_5CC0B8BD 
X-CRM114-Status: UNSURE (   8.23  )
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

Il 03/10/25 15:48, Louis-Alexis Eyraud ha scritto:
> The mt8189-pinctrl driver requires to probe that a device tree uses
> in the device node the same names than mt8189_pinctrl_register_base_names
> array. But they are not matching the required ones in the
> "mediatek,mt8189-pinctrl" dt-bindings, leading to possible dtbs check
> issues. The mt8189_pinctrl_register_base_names entry order is also
> different.
> So, align all mt8189_pinctrl_register_base_names entry names and order
> on dt-bindings.
> 
> Fixes: a3fe1324c3c5 ("pinctrl: mediatek: Add pinctrl driver for mt8189")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



