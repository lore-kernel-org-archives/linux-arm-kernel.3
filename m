Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D677CFD3758
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQNUXJ6GmWWxJ3bUpT7gKbfrhxMsatlQqDmulwkWAT0=; b=0RMptdoSKWvvmIpoxP/QpycA7i
	EYXL2WgXju887VpUx1cPZGgAS4auzYeJRqVABig5gnCUuWjOyXPqWiu0DqVuNZVS0tJY6DRPX/69k
	Zyg8SL0BpV2Kxz2jsxCFhrfAdy5HlW/TWij442XZAsp62wN60JO4QPAcXCsfJDxbhJzlId+4jvPg/
	uMGulXkjJJ6Sa9qtWzms+UzzABlF0eJoFXt+A0XFpb50VyHcvC/akJaj45qFI7qtYB6W3JCUmG5qJ
	+gbcdluTnPm/0C3+1Xbe6PXWLK3czsX7GG/AEh1Nh4wpbRwUgskZVIhc3CVgVCuuD6LhSPeOxBxih
	WaZAhW+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhL-0000000436l-2Df9;
	Wed, 25 Feb 2026 13:13:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhI-00000004360-1Evj;
	Wed, 25 Feb 2026 13:13:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025177;
	bh=FURIk3aseyFyJaGwGgDxMAOqs3YY9zpxQ3vrYQIHYfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q+5NqmAzQvHozXqGBeH2ASIE1F3xAaw3gdqCz1RJhbupNkkwp40gvupKietBnfXRU
	 w48T3D4ONbdLJgYi/A3IK/7pDAuOGM4Yug8bNLXvKGs5g4nvakB8DbtIwdRZ1t16hS
	 +k2eROhY+liO7mEIpqorYnGnsXTaTz/6mQ6GH/HxJrfgxXZZVvuPm+JNcsJh3YoFqC
	 I/MRz8ZXRzd66Q+sMfNgGbNqiVWg8XANSZJV7cSSYOY5fQt0+GwH2ZDe2xyyEBtpng
	 O+h9by7O2nOUAlC42TCHaGBLCLNZ+B3N3Oztg7burf9GRfBKpl/zHEzIX45N35XfHI
	 6wlLx5tg8feDQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC61817E0959;
	Wed, 25 Feb 2026 14:12:56 +0100 (CET)
Message-ID: <353afba5-9ee1-4359-b91c-115f51bcf675@collabora.com>
Date: Wed, 25 Feb 2026 14:12:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: mediatek: mt8195-cherry-dojo: Describe
 M.2 M-key NVMe slot
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
 <20260225072225.3345307-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051300_498611_DA191DF2 
X-CRM114-Status: UNSURE (   8.71  )
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
> The Dojo device has a M.2 M-key slot for an included NVMe on some
> models.
> 
> Add a proper device tree description based on the new M.2 M-key binding.
> Power for the slot is controlled by the embedded controller. As far as
> the main SoC is concerned, it is always on.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

The M.2 connector description that you're adding here is pure awesomeness.
Sunglasses on.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



