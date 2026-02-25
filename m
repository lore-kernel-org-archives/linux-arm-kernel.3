Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE3BFD375F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pt9Gg+51plmQ9qSs1GN5KvykFAGV2Slzj1PaKVZUOk=; b=AykGN4KuorL2OE7+v5BOPGHU7r
	9/rUinHNy0BdwGVLAyqbYUTtZISPjQ/5mH+3/PDE8kPptRfqNHCaEMjKaxk1I7Vd0o77YLtNeWIYw
	+9F+PWHCsz2/lQgJZRfZYR8CX2g+78WFn0jDTUiOabD2IwmJ3hdUN74ncDuWD3H0P+zZ0OiWIJKkc
	cWkHoZOyqX/Eah/BF3WkK4DTXTBh7/d3/GY7oMomjhC9zcrq35utMlx3okhuTkXqhQnMn4Gsd418f
	Lu70WxX+GzyJFlC1vte0AJkOQQqdm/YM09F9HqJsotRniXtWX2kmq+C169mNyRUsrIhDGejnUKFNm
	YNwz7L7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhR-000000043AW-3kcZ;
	Wed, 25 Feb 2026 13:13:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhL-0000000436c-3TxV;
	Wed, 25 Feb 2026 13:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025181;
	bh=/0xaQZyWpI4s5bVwNLU2o3Pf+ovfZdLHiQEKO2fUD+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CtB7luOegegOwzmuv0XXOtfg3KHaGanVCDQLIiXCW7k+avQn1VNLPIpWtKhcKEU6k
	 oru3I/07fm0bwX4VZ4lxrrkcliCrClJN8iJV0h70fBKdPjpHVdXX2EdiveE4NRiISi
	 jpCvpjyKdyy8/7822HEBA/mcAPJo2lMvSEvSTu0U5oVdWE0jrVYfExOvYnAY/2YnuE
	 iedKeHoBhldBBGcQQGOk9zjgbWEu1UkfE2YyE1NLYZWOq0EX31+8aTulmDRabekCmN
	 s/1BjzwJ7ahEKpujGXJVvxsx+XLV1SC4COv34t91z8i94FxUHrXcoUZqUIbGzrtRrL
	 f0XGPaVGa0yPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E6AAD17E0D70;
	Wed, 25 Feb 2026 14:13:00 +0100 (CET)
Message-ID: <c79f2d6e-42ac-4df6-a3bf-3a596d43fd19@collabora.com>
Date: Wed, 25 Feb 2026 14:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260225072225.3345307-1-wenst@chromium.org>
 <20260225072225.3345307-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051304_013919_106919FF 
X-CRM114-Status: UNSURE (   8.65  )
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

Il 25/02/26 08:22, Chen-Yu Tsai ha scritto:
> With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> now have a way to describe and power up WiFi/BT adapters connected
> through a PCIe or M.2 slot, or exploded onto the mainboard itself.
> 
> Integrate the PCI pwrctrl API into the PCIe driver, so that power is
> properly enabled before PCIe link training is done, allowing the
> card to successfully be detected.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



