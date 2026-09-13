Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605D3C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/FolRGNwV32g+HDDqmcEuEqeqSAhKnzy/VVhQSphPs=; b=UyiOmbj3SXAQ3dYS16xmRxDXui
	d4I7F2ni6yUdaOx3m47MrbmMHcQewa+FlpE2xCHHVbUjkZ10yCnxDasJYbe+ZZHrmcmhvp9UnLFX+
	pQmsRXjUjXh19RZ6pxfTVKIR5JgoK+EyreD+FTfzl4OGG1YWnfRd7HX7nmZYKUGqdHKqfFADt9CXU
	LDtIFqGF82mD/qgrtCMiXCnYD8wKRUi+zE2u18MrXpDTSGgMOg4uf6qy4XKpRgK54BSwzSPj6d54E
	zM9wnoqRpkmlGRY4Sf6/xRCYAcoCf5ng5fYjPAF0YtZ6yz7TtRJg1EdPnDegPpDuxWfRW4HgKmtBK
	speL1AVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5krS-00000001hkx-24m1;
	Sun, 13 Sep 2026 14:07:14 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5krP-00000001hkX-1WNH;
	Sun, 13 Sep 2026 14:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789308422; bh=d/FolRGNwV32g+HDDqmcEuE
	qeqSAhKnzy/VVhQSphPs=; b=Dfq0amYD7lqUXWfFx93w4ioc3qhc+HEuljkNQpRBpXb4Ixfms3
	yqh/Sdety5Q+OHNvY8dPP+DRbzt4j9INnUML2CM4vPlMJuCw01bbtbHbRyJci5PiAfteBa9o480
	f/J/BaAlSabfFZdDsPOgQ4jZdWGSjuo5ES8rgYzc1CGcLiPIf3tTh4agQKoCQy4AbqQ4qZkdruG
	ZFj4n2zEHkibItCLSVFcfd+QPWgqHGS/wXnKLvDyii2oLo6bX8z2elT/UgJOMsPmw7oRVZs9wey
	HWoCnsOaPABY+GaajFK/AShljO1TAVrRwtfCRcR8MZof9uXZt6/fFs+1+r4/Mx8OyyQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1789308422; bh=d/FolRGNwV32g+HDDqmcEuE
	qeqSAhKnzy/VVhQSphPs=; b=XvtL4TNdgfsTIiFHDl2M1wEhabYb8ybL7dnap4Ui7FyTxyTJWE
	e7DggnBYSjnYrV0PgOAaTNI8N7/xVUTAKYBw==;
Message-ID: <0c8527cc-2ed9-444f-b113-223f117e635b@mainlining.org>
Date: Sun, 13 Sep 2026 17:07:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
To: Ryan Brue <ryanbrue.dev@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_070711_571393_3302CB31 
X-CRM114-Status: GOOD (  14.51  )
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


12.09.2026 21:22, Ryan Brue wrote:
> This series depends on the following series:
> [PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
> https://lore.kernel.org/all/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org/
>
> The BOE TV101WUM-NM0 is a 10.1" panel present in the Amazon Fire HD 10
> (2017) tablet. It differs from the BOE panels in the dependent series in
> key ways:
>
> - The pin count is 51 instead of 46
> - The vendor asks for SYNC_EVENT_VDO_MODE with cont_clock=1 instead of
> burst mode.
> - Different timings and flags expected.
>
> The init sequence, flags and timings are mostly adapted straight from
> Amazon's vendor kernel.
>
> Tested on the Amazon Fire HD 10 (2017) driven by mediatek-drm: 1200x1920
> at 62.5 Hz across a cold boot, display off and on cycles and a
> suspend/resume, with the MIPI TX PLL reading back at the intended rate
> every time.
>
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Ryan Brue (2):
>        dt-bindings: display: panel: add the BOE TV101WUM-NM0
>        drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
>
>   .../bindings/display/panel/novatek,nt51021.yaml    |  1 +
>   drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 66 +++++++++++++++++++++-
>   2 files changed, 65 insertions(+), 2 deletions(-)
> ---
> base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
> change-id: 20260912-add-boe-tv101wum-nm0-da01c4474db6
> prerequisite-message-id: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
> prerequisite-patch-id: d8b58f07dc5c9e1fcf7c51a14b48eddca2e09090
> prerequisite-patch-id: 79dfdac7b7fa79f7d05a5f3849909c9a7f956398
> prerequisite-patch-id: 79c01de4e67563772dde152cd4c4d0c568b14d17
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
I will incorporate this series into my series and add Co-developed-by to 
the patches and your name and email to maintainers.

-- 
Best regards,
Nickolay

