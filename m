Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6039FFD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzRFkUjz8A+doU3DPWV2hr94seAl+7WPzCcqpKOBI7A=; b=4O6EF53yU+V6qrnsNmVQPc3M5d
	l/l4ZdIfxz42WMDR5MjrhNzEuvkM2tH91ZRoyI/5u1LJEykeR4kpNzl7OVHvVubrPLWNTXTxJ+wph
	3ftZ6q7oO4IY2n+OOvDa12fvt8BMnpTZgoql8ejtsup73eWGRRM9/gEHHdvbmlQNbgYmBto1YZgpR
	ajQ3ezqLuknUtNHTXYH14Pp22K1kPWz4OJOaD6IcKBfKsfjdDSfHcdVCRg5p30SaQd039TzvsuvSJ
	d/PdShKrbQ6O0Ae6GAuOeDSMAYfzU1HKz5sdI7bk3lNPukQp2hPkiFHXiT9AInIOuLNs5Vh+pHfTR
	TmOoB0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhQ-0000000439K-0PEM;
	Wed, 25 Feb 2026 13:13:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhJ-0000000436D-40nZ;
	Wed, 25 Feb 2026 13:13:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025178;
	bh=fKTvk2bdlGxigaQUePLcxKAmdx7qaMnBZz5+BH6D6G8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FGDO428/tIvDRv7dhzqQd3crpd+yl0iAcRp7IXOB6120WPyLjyy5eBiXvNcTjSigx
	 uUXx+1EZLYv1hNPKEXg6V6eNO2rELN8ek5VM3+EgiLlxVVIYWdweoURkQV7ZTSUIP5
	 fxmqnT9bYUbf2SjH2KYIOOm22sW6J8gZ8ru04Hm9nLAPJN1YPumMBMVsfvrNjiwkdC
	 rO4fxm2o7wZwTB6Od+u5TPP7568UvLmNt8OqznccIubwDZbS6BjWLfLUkidHNgRbzO
	 jvYkPzOFi41KCA4FAKvtqC6GybgaZGs/V34hNWTV3zYjrnalNdtF/Xgumw7KsqcLse
	 Mmy7OGBkVT5JQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2D29617E0D50;
	Wed, 25 Feb 2026 14:12:58 +0100 (CET)
Message-ID: <552bdc40-aef4-4ce5-8cdb-3f87f1a5b75e@collabora.com>
Date: Wed, 25 Feb 2026 14:12:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: mediatek: mt8195-cherry: add WiFi PCIe
 and BT USB power supplies
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
 <20260225072225.3345307-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051302_142259_8970BA55 
X-CRM114-Status: GOOD (  11.66  )
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
> The MT8195 Cherry design features an M.2 E-key slot wired up with PCIe
> and USB for a WiFi+BT adapter. Previously the power was just enabled
> all the time with a default pinctrl setting that set the GPIO pin high.
> 
> With the PCIe slot description DT binding in place, the power supplies
> can at least be added and tied to the PCIe and USB hosts. Once the
> M.2 E-key binding is merged, this description can be further converted
> to an M.2 E-key.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Eh, the binding is a little confusing (as in, I'd call the node "pcie-class" or
"pcie-port", but it's not your fault. Let's just go with this for now.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Thanks for the `status` cleanups too!

