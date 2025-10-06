Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A383ECAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CsNh1QO9LTfhssYldvjQJa9MLvQe0v6qstw3MRTV2U=; b=CFCn9esVsBZx8vwVr3AE+tJQhM
	LqnpnxUEzA4nSxh4RgnvKUWkEAaz/lHbLz/Fxv+yWdYPglU0/M1M6BWzATAxejL6E+bf4oWwuh3vO
	3sA7OHP30rPS+actPNQPiJYAhK/P45M5xePMmZYtsK0b7EGJ21IBuqJnNGhfBirZHUXrN9tI+ErQh
	wTK4wgDTh8tp5pJ3oZJOx2bM3KRz+LA9dl66RJgDJyPeZclblyMcr48sTz38Z3LCbp/pmw08bCf/j
	TiD5Z7dMQhkYBG0tfAprdHYRnWsuxbGGIbOObz77lYB5t2h8+W50cNOoa5cWaVDxmd6oXtK9lxn/A
	//9iChKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hdh-0000000HFUU-40c6;
	Mon, 06 Oct 2025 09:36:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hde-0000000HFSy-3t8z;
	Mon, 06 Oct 2025 09:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759743371;
	bh=Xp3by8t0maP1Vb90Nju6hz9/zSoF5Ht9B7xI4C7ASrY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oqea8QCyl47tPr2p/I2JBWilB27/dytrdw7oUiy72JMtI+hZdP+/GK6bMH2b1ME3U
	 tBJTqozUMuhy57OsKjw9xE+X2Mn2TK0KFsoxYVqVEPoT8sm3MhgeDQnLL6eHT8KN6P
	 yfxg1uwEWuCeR7B/NKGiy645OImZrboJpCg5VUzChTWyElKansn6MrrDbbzT3Pbmvi
	 9myQ4DYvltdcxXoVbXZM5kIIDecRP7QVtSNFTJLIZLEzNBlbFZt6m1c0TsshyPYifc
	 Vmb1J6wn5DEuCDQG3hAdm9SOVs6Mcb42/H3Wtw/ACt0oshGypbrkCRrFxmkYeUq1J0
	 TbpwM/i587E1Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C34CF17E0FC2;
	Mon,  6 Oct 2025 11:36:10 +0200 (CEST)
Message-ID: <137811e2-f28e-4605-a6b2-935a0a8b463b@collabora.com>
Date: Mon, 6 Oct 2025 11:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] dt-bindings: power: Add MT8196 GPU frequency
 control binding
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251003-mt8196-gpufreq-v6-0-76498ad61d9e@collabora.com>
 <20251003-mt8196-gpufreq-v6-2-76498ad61d9e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251003-mt8196-gpufreq-v6-2-76498ad61d9e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_023615_141829_72F7FB36 
X-CRM114-Status: GOOD (  10.56  )
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

Il 03/10/25 22:15, Nicolas Frattaroli ha scritto:
> On the MT8196 and MT6991 SoCs, the GPU power and frequency is controlled
> by some integration logic, referred to as "MFlexGraphics" by MediaTek,
> which comes in the form of an embedded controller running
> special-purpose firmware.
> 
> This controller takes care of the regulators and PLL clock frequencies
> to squeeze the maximum amount of power out of the silicon.
> 
> Add a binding which models it as a power domain.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



