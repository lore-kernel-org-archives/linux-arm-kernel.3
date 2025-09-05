Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB0CCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3VB7emdAFLHC0eM76ZMMw9WwkL4dIdt0kXDPpgUZlw=; b=dMuTH7VcNCymodR3e1O1D6+KHN
	UMR9LHlejJmDL8Psz5zFBIRrFoP0HcFkf2xnR2ebCBK4SvIBty+Awoy6MC+PO591nu/6wWFUVnk90
	bVzhFDQt3uEYDzqy90kvsWttUzla7SoPlklR8HfLA54mX2tH31TFtL0KdjUH3BetTZ3Nx+aaA3pKz
	Oxf04tWn+MLQwCJdcN4sPjzHuS/2PwhpfTPszMMIuFaKI0ia5qTI91xkfGz2ILwHpoCL/lSxlO+P+
	US78yIG8qo/NhHfdQNwlMxN+gVKbQ5twS52KemmqzDakwdLnQlXLvia/HPRMTjMQTGsnqFXD/nzco
	jYlL5zqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuTa5-000000011OI-2WjK;
	Fri, 05 Sep 2025 10:22:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRza-00000000R0B-1iXO;
	Fri, 05 Sep 2025 08:40:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757061620;
	bh=3m+oHss1dKrtRtNm486Neak4ylKeTSNpjIilPQVti1U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iYjYyqiBw3VN83ZDXH0u7pPq2RjuqgaHuV2aLml3n+Abym3tZvm34XbcHvIrjFC7n
	 bz1P6HCVIHHnZb5zGSQM7vw9I0hidUrgJ7ZLTY2nfKpRArfUzDkPA96/IbYNP3AOhS
	 1iz1ciE0htqvuhGs1QsnQPSKDmMsFOEGdLwXbcWgaYFw1Zfiqu70STZ2YizK2OmHPV
	 WuS5mKUbs526qegmqr8uco9wm/95zmypPFblo9YMZYryuA8KfNwx1JxIs7eDsDjXDY
	 1Cd4p5CMrQXteBA88tFstDk8bDQHXYa2qiss3CaOnr+HvLCfxLkjFYPTGpQsrhRWwI
	 WRcZkAxG3KGow==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3615217E0E20;
	Fri,  5 Sep 2025 10:40:20 +0200 (CEST)
Message-ID: <c044f5af-5087-41fc-b459-08f0a954678f@collabora.com>
Date: Fri, 5 Sep 2025 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/27] clk: mediatek: Add MT8196 disp1 clock support
To: Laura Nao <laura.nao@collabora.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, richardcochran@gmail.com
Cc: guangjie.song@mediatek.com, wenst@chromium.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 kernel@collabora.com
References: <20250829091913.131528-1-laura.nao@collabora.com>
 <20250829091913.131528-23-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250829091913.131528-23-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_014022_600587_098230C9 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 29/08/25 11:19, Laura Nao ha scritto:
> Add support for the MT8196 disp1 clock controller, which provides clock
> gate control for the display system. It is integrated with the mtk-mmsys
> driver, which registers the disp1 clock driver via
> platform_device_register_data().
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



