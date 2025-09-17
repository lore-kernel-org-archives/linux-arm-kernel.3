Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A96CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayZD/xeK1R0FMXkhBxlT7c0TUc0a8mE1ym41qnwh1uA=; b=fX8CzE9BVqQx8btd71FxxR2tGb
	e/4nSnZzuMCdFd+cSdqrBMSOAlj0YXENJbe91LTvlHX866etr0lvn7Yq5r3apsVPfc9WCwp5tlg4R
	hGmVwpQUD9hzPg2AsSDt9jm46nvUpH4U6H5QWpGfqZChKtFaRGlPGza+pS5huTDxlnIwJ3xVbqgJq
	zyN4cNuLS70vSTKmIZ6IOrMUt2uBs+mNESOK6C/nuhlDQUTLMMnbtFJ6EncJXTU1hNwQl3PbEiM+b
	7qhMc3BQXrqASogI54mGDO8pkCJkGjtp1zCEK8TGZsnArJPiRSzVCGrIZP7hyR356MXGdFeahS8a3
	qI3rFhdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrWO-0000000BOCo-3IAi;
	Wed, 17 Sep 2025 12:44:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrWN-0000000BOBZ-0RYn;
	Wed, 17 Sep 2025 12:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758113065;
	bh=q/Y6LU1/0Tlr24LP7xTr0Py6bHWN+pDK01NRDaUO/+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oPTwi+UgoDysY0Ojh4Rgw3WQjm/OKI2BKEgkdR4/DCrHK28tf+mnrCIfxv2M0puJL
	 oL/1kM+aUfz9LmE1BFm3N0a7ldZmW00H1Tw1x5jjnlV+qBsklCJ6LDEiMTkXB0qYwJ
	 NLEnKGsWrDU0XcAgHnlY6UoVidvQBSzwpIH3/CkyrSW4ZG2Rlfh9CY3wsAmf/L15jM
	 W5bI6uEFskh8Dm7CGMf+pYv5yATptSUxbLWzBgxLBNhZFaExeygPEebb6jl5HwdnqR
	 Pb3CbHn4R+51C8ft6kAve2CNMQeZ08sfSNzJ2YpLbSsKtMR6kM8YesDdAsYCHj8ppq
	 lsFVIFuRt/smg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A2F617E090E;
	Wed, 17 Sep 2025 14:44:24 +0200 (CEST)
Message-ID: <ec3352cf-c089-4cd6-bfec-ffe02542917a@collabora.com>
Date: Wed, 17 Sep 2025 14:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] dt-bindings: sram: Add compatible for
 mediatek,mt8196-gpufreq-sram
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <20250917-mt8196-gpufreq-v3-3-c4ede4b4399e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250917-mt8196-gpufreq-v3-3-c4ede4b4399e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_054427_294406_ACE54DA9 
X-CRM114-Status: UNSURE (   8.45  )
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

Il 17/09/25 14:22, Nicolas Frattaroli ha scritto:
> This compatible is used for an SRAM section that's shared between the
> MT8196's application processor cores and the embedded GPUEB MCU that
> controls the GPU frequency.
> 
> Through this SRAM section, things about the GPU frequency controller
> like the OPP table can be read.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



