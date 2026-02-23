Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DABAEA4FC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fr7d7tb2OSvjYLeMmzPSFkX3IY9HuIWVM8tRYP8LeRw=; b=un4PgAd4rVrEAXY42Zp23MgQP/
	7pa6h9beVNqK1i8HR7dD6tQA81DvCId7UJF4ZKhp3IukoHvEBdUHBt+E/kELoDmAZDmL4dRbB9Rp8
	2CWTX7+kVD0W6xOM5OOc9D70WjZAsFW4aCuOdbSqcSGKmLf0OBGMw3D0OyFl81uLkpcJ/MLyf1MS0
	Gwh9tMAJ2wKetcQjJCh+QRdLkheaAQZMIgNv9I5p0SqAAC7ZQC2EPqrtWAZA2yPMyJIXnkxRTepMM
	3PZ56scjvyC5APXCOpQzOn5Pw9cdPA3am57gF4G+YUND/fQrtHSK0yP3cF9nbCuSyIc9ZkPKyt082
	iLZi+feA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWOT-00000000QA0-0KiL;
	Mon, 23 Feb 2026 13:54:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuWOP-00000000Q90-2fu4;
	Mon, 23 Feb 2026 13:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771854871;
	bh=wsxrGT9iiPD6ZitFu90+kuRPo6NfbN5RrwpeDZ7GNQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AlMRZCcNRh1z6NRy2/I17Dm2/sYYtXapstkwgNAT5JC829doMkVfCZu6bzBply4mX
	 Z5V6k4Fugil9Pbk1jTOoN/oVEeqCfAKqRT6IFKDIziyaucxhMAd41jYXXqW7jof677
	 m0mMfBerf0M5K1EAeqrIdfXRJS/x3Bi5RLQslWTpMP/myCyMmu2Sx78PopsHOkRg5o
	 H/O52ahKyojFXDNplvjDFYJUmk8ft5TTBoJujoIoALlB0oZxnqE3hsUdIzuhOftNBq
	 DfnF/yKg27joBLxmlkAJl7pPQ1DW9pvBgJOzHRgZOaVPAldn1YCSM7vOX8Bt/2/G1z
	 L2GiCzzldb9Dw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 559BF17E043F;
	Mon, 23 Feb 2026 14:54:30 +0100 (CET)
Message-ID: <8030ee40-5972-499b-b693-b26fb7ffe7e2@collabora.com>
Date: Mon, 23 Feb 2026 14:54:29 +0100
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
 <4b22e998-b38e-4452-82ce-1389d7086a04@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4b22e998-b38e-4452-82ce-1389d7086a04@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_055435_373977_5B616340 
X-CRM114-Status: GOOD (  10.63  )
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

Il 19/02/26 21:49, David Lechner ha scritto:
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
>> +	GATE_VLP_CK_FLAGS(CLK_VLP_CK_FMIPI_CSI_UP26M_CK_EN, "VLP_fmipi_csi_up26m",
> 
> Should "VLP_fmipi_csi_up26m" be all lower-case to match the style of all of
> the other clock names? i.e. "vlp_fmipi_csi_up26m"
> 

It *must*. Yes.

Regards,
Angelo

>> +			  "osc_d10", 11, CLK_IS_CRITICAL),
>> +};
>> +



