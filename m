Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7DEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwGZbiweMs5EjvNB4ryH1GeG13sCDZR+1XlYad2d8x0=; b=dnLrlxfm57ApeAQ+IYyVUYOeGd
	pdkKJn5u7m2bqoX4EkeXE8VpKJO1SoYffwvZH6/5HzfD2sqVOQUiblPzO+u4Ckefyg8ezZV56EvkA
	V5dnYabMcTYlzJAxP/7ExlYN6u6T2VBga9gZv2PxpS7tE+N5K90gUXW2xK6P92w9qMkinXdxAJXou
	VzJ+14CpTohMpFWNf7+44iTmS05NvpoS6708lgvRHnx/gozyVWcPFjSraecMbncjzat+RfVR01ji7
	3waCi19heb+S4d5R4qFmk7XVSTQpq7kW0IHRte5yacuWufaJ9eiZ/Pb+5bw3bjI7QFtGl6qjCwdBM
	hrez1AmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe58-00000008558-1rCr;
	Tue, 14 Jan 2025 10:23:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe2g-000000084Sj-36jo;
	Tue, 14 Jan 2025 10:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850058;
	bh=IYlbVe5DU6XQUgd5tARuIdrrDgjuvb0HCtEJqBoglO0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M1KJbA90IXJClB1WqW8CYk3B0ZU1vGxNvXqpLbbsxD9fW8K+o7yNtfC/VbjPkGaoA
	 CyiEESYqixdHhKQEEK7inZM4EpaefCgQINHreQvaG0nX1TGIm+yQN5bYXjMBPa/ND3
	 siTrIIlM7MNksaekrqN60GkfwDuvRxbrTuMRtoA+pytBNN6wq9TaVAHCUlXDIjttvg
	 HTvOSvKkURI9TeoC0WIjLJzmmX+REKokjk6DQCfFnszz3qg0rKFuYv3+xiasLrKihw
	 CjFX5ucDsl+KyuN4PDyPrMMQOgtDPNGrDXEJ2nZIyFgdTgXuMsk3+p4Rmm8pv+Oscp
	 RpinaVRm7UMRw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B3AA17E0239;
	Tue, 14 Jan 2025 11:20:58 +0100 (CET)
Message-ID: <60f4e08d-240e-4a06-b825-fbe04086c43b@collabora.com>
Date: Tue, 14 Jan 2025 11:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: mediatek: mtk-socinfo: Add entry for
 MT8390AV/AZA Genio 700
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
 <20250113-mtk-socinfo_genio-510-700-v1-2-cf5112b325b7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250113-mtk-socinfo_genio-510-700-v1-2-cf5112b325b7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_022102_952097_3A3A3A63 
X-CRM114-Status: UNSURE (   5.09  )
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

Il 13/01/25 17:13, Louis-Alexis Eyraud ha scritto:
> Add an entry for the MT8390 SoC with commercial name Genio 700.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



