Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D551CE6814E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TFoEeBvEiw2mcUXJTpEuTBWk2bC/zU7gWLotEnC9Dc=; b=4uzI386mpTVqaATR/eDr+KPwVV
	C7ntcreHNF9C9MREKZteLs7sr/60FepiaDxK1aoSlUM82ZIK4Ma7Tu2/zwDjO+1ik8ltrC8G6x6v7
	I3wd45uiUt1E8VUtE4t3iTHQHd5Bgg1AQ8WN2Cho/rlbcWtJLdwqWeOnTIV7z8pnkOD320sbHvycl
	lC9RnKLtxOH322GUxci8aXte6j8mH4AU3cHu4J17ypEfS8cCI2qiySuviUkiOOT1qDRAzYplRQp06
	tzBckYL+1zvFd4QOxl+KdhHWUvw5Hh48juYiKNo/v6BayTWNsx8mn4OnIPgJeGEgZ7LSW1KzjaE8e
	FqoUpxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH1h-00000007uJP-3Ad8;
	Tue, 17 Feb 2026 09:05:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsH1c-00000007uIY-0efI;
	Tue, 17 Feb 2026 09:05:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771319141;
	bh=w2BE5Q8cKth9ANkhgEdztnALDSfiP3B4NObm0vMv9O8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KJ9Uds9fP9txb+XUDXpbGXb2lGbuYwBxK7Ej8XJMLsaOnvD6klPqfnC8sp8rjMkqv
	 DU/s5n+e3LbSuFgmf54DN9utT+ef5Wili+GqcnP2WhFo9YJ3e1SOJiwXEHlyPpFmnI
	 qq8XHEKxLbStTpTyc3lywjXf+tVt9UivahP2YqpMZ+i4dK95LM9IEyfpada2qOEC9A
	 iSg0LhBORyjAdrVxJtoFW4Au6zeU/PvrYDKS4RW08eW960LSSjFfoyI0nBchQbRHfC
	 /emOQif9djeciNZUq4iV8eZoU0IGPJYspXZtMRYIU1BDx2SOu2hp5zHxN9LcpC0rfF
	 s1Z4ZVIMaPRmQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8BA2717E04DC;
	Tue, 17 Feb 2026 10:05:40 +0100 (CET)
Message-ID: <13e4446b-ce84-4511-80ff-e223ac8c6aad@collabora.com>
Date: Tue, 17 Feb 2026 10:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] gpu: drm: mediatek: ovl: add specific entry for
 mt8167
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <cover.1771258407.git.l.scorcia@gmail.com>
 <ee6bb10f8beb4a9d0d2bf49d5b053c7395ad6b50.1771258407.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ee6bb10f8beb4a9d0d2bf49d5b053c7395ad6b50.1771258407.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_010544_376775_F8D43998 
X-CRM114-Status: UNSURE (   8.07  )
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

Il 16/02/26 17:22, Luca Leonardo Scorcia ha scritto:
> From: Val Packett <val@packett.cool>
> 
> From: Val Packett <val@packett.cool>

Whoops, for some reason, you got the From line twice here.
Something to note for the next time.

> 
> While this configuration is otherwise identical to mt8173, according
> to Android kernel sources, this SoC does need smi_id_en.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cheers,
Angelo

