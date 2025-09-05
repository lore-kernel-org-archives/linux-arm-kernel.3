Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F848CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 09:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyPlNd55CkHvdkXUPw7m6CaGKtqeaO4UdJmxjPWlG3E=; b=o7OeIgMv3wo+v17EGA5iXgd65+
	NQgViYxpjQ/xVSX8rU76uGeF62l8E7K02EPO8Q3+c1t7LOoUJWM/K7wbKNitRGDe1o/Q/LPcebdHf
	R0lJqNkkV1H1kDUjRnw9eN04I1TuwO9Qo6EDmQZkL6/4EHxk4T6612jjQp6dhtJPST1Hp4l+gUqf4
	1nPB3MVHiZCPDA7GAio62YdU4FVraaBdTixQS/2N7r6CNCliiJHtgMrWXJxfaWeumPN9BjSset6S3
	JiEHd1zOpXliNGKVHWr2BwiJ/tqH6nE5un4eRFP5zVA0LfbxLQOTScwBaMobAAA7W9cebfVxgwsgM
	ZSXRlJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSiN-00000000ji9-0CuQ;
	Fri, 05 Sep 2025 09:26:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRY4-00000000GZ8-15PW;
	Fri, 05 Sep 2025 08:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757059914;
	bh=UIitS/BrAV5TC2kzay8yvqoEA1Xou313F2oKC/IdHNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cou6lLEcxEINkpQGfimSKKIWWcAbo+MdxXQjYZFPNNR2yIAlRw8uyMHj4oWSylfiN
	 28Pn9kh9sOM4k5PVEtEa7zx5p7NgEAImXzEplalngZKZuHAeS8jaPeeG6NrxMj2fJk
	 CzuIrGyAxM5Izl1GrzQoctTgWFQCaGU6JFjd1WaBJvX2d+NI5/ptpaOQemXGLGbVUt
	 smiqE15JQ+xrl+PDad4IWGoYdXS15vco7rK8mtto8oSTjj0YaI9QsAj6QNFdAZpA8f
	 vATYKCAkU+G6Xz6HRV84OFT1Iqs64MFkA802+usc8pAI+O2HPnq+p3xNMCUFNc+LIm
	 bFpry9LDd9K5g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D5FB17E12B9;
	Fri,  5 Sep 2025 10:11:53 +0200 (CEST)
Message-ID: <2c681013-ca03-4f0f-8fe9-44475a97dfef@collabora.com>
Date: Fri, 5 Sep 2025 10:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/27] clk: mediatek: Add MT8196 peripheral clock
 support
To: Chen-Yu Tsai <wenst@chromium.org>, Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, richardcochran@gmail.com,
 guangjie.song@mediatek.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, kernel@collabora.com
References: <20250829091913.131528-1-laura.nao@collabora.com>
 <20250829091913.131528-15-laura.nao@collabora.com>
 <CAGXv+5Fj9Hwmk2y_bZhGX0EUEY42tm3t0nTrjtV-sYhD_B-xVg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5Fj9Hwmk2y_bZhGX0EUEY42tm3t0nTrjtV-sYhD_B-xVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_011156_474818_2C99BF52 
X-CRM114-Status: GOOD (  11.68  )
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

Il 05/09/25 07:05, Chen-Yu Tsai ha scritto:
> On Fri, Aug 29, 2025 at 5:21 PM Laura Nao <laura.nao@collabora.com> wrote:
>>
>> Add support for the MT8196 peripheral clock controller, which provides
>> clock gate control for dma/flashif/msdc/pwm/spi/uart.
>>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> 
> Not sure why CLK_OPS_PARENT_ENABLE was removed, but it does seem like the
> right thing to do, since this block is always on and doesn't require a
> clock to be enabled before accessing the registers.
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE change
> 
> Note that I did not go through the bit definitions. I assume the other
> Collabora folks did a good job of reviewing those.

Yes, I did :-)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

