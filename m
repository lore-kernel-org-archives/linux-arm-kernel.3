Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89648EC110A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 16:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXaiZuc4XbaNPexryA/QPNUm2OBlv5lDsdbuylfxvoQ=; b=WlP0wsqxw9EVsYv310uenMGaSb
	1Vut/BMqRXwqgFy7ZNKxA0phjhkAXb3oXkccpRZY7WIiDI0i0tHnkZXjFlbyolHVAFumHMRZmmfQ6
	5DJ/QAImf49h/5fzt7nJXcw9FVJqSjmw4MI0PJUNyzVSdd/g57tMBtR9F436c8VoFW6CxOHajuWgQ
	ZhdtCCuj5GMsysEFqr7TH7HqSlLGW4WM+/mFS0E33Pzp5KJlvDTDUmZ7jpfQL2ilBzupJ+AiVdxsQ
	en1CE3HPuOWEqXJKVaNxA8HLhk8U/TeCUOBZid78/i7WduZ3L+X1jyzng3JiJ5avgcWr84LEKoR4s
	sotH7Khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYyS-00000000hbB-37vo;
	Mon, 23 Feb 2026 16:39:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYyQ-00000000haS-2c2j;
	Mon, 23 Feb 2026 16:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771864791;
	bh=GU3xnXyHmn1mP9zwAI0ndO9wqT8jjc20jlPhIMyYZ3U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aGJOp4cpuNZIhOCgBm2vWH/Q7p9UCp+cYXlFkz/q+2dSREdLxaqWr/vcyPmfQi2Ak
	 v7pWlRC2cNSmfbgdWzOBQ0wM+YfKBqk1qZUufrVfYyutdcLd1Ary2uiq9SLb5JYzQd
	 VdWoMC4Yzmse2Hk7YzM34X6GNqo48+l6EZRQSGD3/M09DXhjPvVdKYjFzZxEVTyyme
	 11Hm1M7B9NHN8qKtWyCN6hbg7PViSR1LExxjoMp4SeENj7PSUm60kOLEGV3bcMVNNF
	 9uYE+VAXoaeld90Myr836VCVCFNcU7saSylxSvu5eElRSrW1fhST57q8YuKn54ivCx
	 LuH+Y+9OKKSHA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B212617E069A;
	Mon, 23 Feb 2026 17:39:50 +0100 (CET)
Message-ID: <3e0a65f8-3c65-4382-8c39-a6d30db2a52a@collabora.com>
Date: Mon, 23 Feb 2026 17:39:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/mediatek: dsi: Add compatible for mt8167-dsi
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
References: <cover.1771863641.git.l.scorcia@gmail.com>
 <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2fbf179c03c61f527e2583f9df4f97f6aaf3297a.1771863641.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_083954_839192_DE266341 
X-CRM114-Status: UNSURE (   5.55  )
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

Il 23/02/26 17:22, Luca Leonardo Scorcia ha scritto:
> The mt8167 DSI controller is fully compatible with the one found in
> mt2701. Device tree documentation is already present upstream.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



