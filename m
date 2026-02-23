Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C336EEA4FC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oS/sLxpW2QkgK7+gNEbXfb4danus6m6ITx2G8ctTYEk=; b=krSb1h+hWJlhxQ4NhlB6wPkn/w
	IReS88WiuXhxd1ATwYmCeohEHoRuOMLN2dXlbwyKZUOGYQb/bslXZZQIpQhaxuprUDpzdfbCLlpoP
	pl0fnEg9PGVqHN8HZFd06hTvtz88OY41nyBz1G2YlYj7N50b3W51lV7qO78jwyGJfSOPVANmxZFDB
	uftmNrRDWIKxvATWAdAwlAcYtW8KhSIrLEK362ZfjohHQm9DsiEsY97DQz1R3ygbTjxrtlUsEjzIZ
	VBFvy73L8s36l2hUe9oKw4m5jmdXZdStB4CrLfdg27I+rxaof3BXdadqZS8cQkFVmF/yHjNOclThj
	WsbTgVmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWO4-00000000Q2L-0uhd;
	Mon, 23 Feb 2026 13:54:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWO2-00000000Q1Z-1HBg;
	Mon, 23 Feb 2026 13:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771854847;
	bh=OIrW2x18OBe7MtWg9i3mOOyaUsL/tDgUO70shj0Bbso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m93/wLHBj5MojNg8x/3XhD7n67KrTfMf1tReVhaLtzoyPsAfLd3DUg3IFTsTKNLDM
	 FvvMR4KQM5z3f5HzguS8dhxp6Mp56AQ1GgQYisThGW4yn3jVk0wHSOcuiPGymEOG7r
	 /o+NnKlgY7xGBlX9dvNqg56q6sDH1Sxv8Tr1HhHO+piyXdYJVRz39Cf9HePb/lTdei
	 4HSn9lyT4cUBG+YEjGQHSb92jmqAkyc18+SfSuHs585OOv+un1CLjsYMyGphVD1vSn
	 oiFBhp/mMf/npegCu0Eu9VddNTyh7ekPKcWgq7PE8OxDNCcnqVs9z+2q0zt7BVehdf
	 S8hI9PPpSwoxA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C91D17E04D4;
	Mon, 23 Feb 2026 14:54:06 +0100 (CET)
Message-ID: <864fe00a-1b4c-4ba0-8f42-c1b04f2999ad@collabora.com>
Date: Mon, 23 Feb 2026 14:54:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/18] clk: mediatek: Add MT8189 vlpckgen clock support
To: David Lechner <dlechner@baylibre.com>,
 "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-6-irving-ch.lin@mediatek.com>
 <e0b39f90-f4a4-46c5-90ff-54a261c075b4@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e0b39f90-f4a4-46c5-90ff-54a261c075b4@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_055410_490398_6AFFC0AB 
X-CRM114-Status: GOOD (  12.05  )
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

Il 19/02/26 22:10, David Lechner ha scritto:
> On 2/2/26 12:28 AM, irving.ch.lin wrote:
>> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>>
>> Add support for the MT8189 vlpckgen clock controller, which provides
>> muxes and dividers for clock selection in vlp domain for other IP blocks.
>>
>> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
>> ---
> 
> ...
> 
>> +static const struct mtk_gate vlp_ck_clks[] = {
>> +	GATE_VLP_CK(CLK_VLP_CK_VADSYS_VLP_26M_EN, "vlp_vadsys_vlp_26m", "clk26m", 1),
> 
> In mediatek,mt8189-clk.h, we have:
> 
> #define CLK_VLP_CK_VADSYS_VLP_26M_EN			24
> #define CLK_VLP_CK_SEJ_13M_EN				25
> #define CLK_VLP_CK_SEJ_26M_EN				26
> #define CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN		27
> 
> Are we missing the middle two clocks here?
> 
> Or should the be omitted from the header file?
> 

The arrays must match bindings, and since the two clocks are missing, this means
that this is completely broken.

Regards,
Angelo

>> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",
>> +			  "osc_d10", 11, CLK_IS_CRITICAL),
>> +};
>> +


