Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B464CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXO05a3tbtvVOFCuHHunnofM/pGIQslOFGgwOkWai1c=; b=Rfo6YeGTLITUaDIxGZZtTRFGj1
	wJ/vqNbUr5S7GECbnyxIpDJHMA1Z1+aILjPeexl/4kD4pXPf7V9a6ZbM4Zo6/GDYWHFDWsnUmtWQW
	ec6eIxFkbtEdV+a9X4cUJ27G1xZOtk19nfaWvxVytJ91gqYrpg85/klyYymKOgo8YkKg7Ke5viFnR
	3Wj4kuG1inxdcVBoDN7MHrUirqnh4Mi8rQggFo22R5jlDtb5HiwrGzphUtb/ivRsxmVmqTgAtp29I
	QUqGvXXJx7z0XWsNNxqFShIGiCmXAUKvN7UOQMtKJqyLdtCMcaRhF+hSEdtHt7RPSOT70JsFJooX/
	qYMFV0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6d8-00000003jCc-11lt;
	Mon, 15 Sep 2025 10:40:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6cz-00000003j53-3hxe;
	Mon, 15 Sep 2025 10:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932807;
	bh=YfkNuWF0UuUzo2fQZWy8bT5EoNrUHLsiRs9VwUk1PVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YzdGMv13sKiTswHck44V3ric1FZYkJiJTvgve65QXha4jYGt9hur1sohBLvRw0Q6d
	 E7cPUW2OgwYuNcBeu07dxzDV2GaAOyfn/VRwFehODtrjSA+LV0NsPkkUS9DwbjEh/v
	 E1S2on0kSEQoKTsfXC+wSE3Hi8YMX3vu6d0TgLtGQ2qy4v0HAE7ggUtCJNj0pn4plC
	 H9wDqYtuYxodOe475HwPK5i9n/s8J8vCLufyWZ3G6agnp27ToTtojhhO9Cohwo/HI4
	 mdBXhLWLU5Ehpskiw/GsyB7n9ZxMlWSAWh98uFSKhFl+StoPtK1K2YAZhVdjGBx0Hz
	 27qVpPuLEgLhg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DFB5517E124A;
	Mon, 15 Sep 2025 12:40:06 +0200 (CEST)
Message-ID: <dc4a1cc1-da1c-40d5-a873-ba041038de2a@collabora.com>
Date: Mon, 15 Sep 2025 12:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] media: mediatek: vcodec: add decoder compatible to
 support MT8189
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
References: <20250915091958.31509-1-kyrie.wu@mediatek.com>
 <20250915091958.31509-3-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250915091958.31509-3-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_034010_106520_257219A2 
X-CRM114-Status: UNSURE (   6.72  )
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

Il 15/09/25 11:19, Kyrie Wu ha scritto:
> MT8189 is pure single core architecture. Support its compatible and
> use `mtk_vdec_single_core_pdata` to initialize platform data.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



