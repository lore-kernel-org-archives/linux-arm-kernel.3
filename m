Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D66FC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 14:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX+tMFaCzvvKyDuPIH5qtVrR4baLqMZlhImy0DNhZjc=; b=DyaI/10n30ScrsIcAhHOtGxKgQ
	u3QKmuY1rxe80ez4v6OaLiiIwPKtYN29l5wTEdYn6xO7fk8y9dWb0RppYnCI6NzthOT6WyrhzEHtG
	DSKQAjzAuEd4r6lfDYUn4MCnRAH7sbO+Vi/D+tscdl6VuTpZkpKI/cPCobOQFRO6iKLdFvDqk/wpl
	U7z/PG501WL4SJPJcpl49C157ATnIFiVx0u9sWUxkjTpYsIZUWibRi+AWijHTEXrYCGRQAi4kLmAo
	lAc9kJqYQZnnxwU7WHWYQslXj0id4CGz0/llPusyzHHzQHxz8vp/lfcvTK3Avx2ENeuVc4exQk/DM
	OMZe8L9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treNu-00000002yDu-2WH5;
	Mon, 10 Mar 2025 14:45:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcpe-00000002jFT-29mX;
	Mon, 10 Mar 2025 13:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741611968;
	bh=TConZA4h3MGEat4fRP5rb7inM0iZmfBZr+fmrbt6mgI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ItHs6/kJh/VJL1tEPWVRwaYpEbI8VEgZxNzU/Ymp5lcuMRtc6nyK+4TdzfedOxzPq
	 IDe4lSwPFbR/NO9nW9Oyz95Xe/i2ZeKAY7hjIUD60FPFCNNwITXfK1HwiLCwN/+whU
	 BZdoYgJ8BIAVmWWxFA8UF80pDKUKuUhCMAXPmX7xLIE9I1WPSW194FEwQJxhFLXfuD
	 w8WWoTHvXI/U32h2zS9wjUNeVTh4IbYE5YBCwug0pX18I/XnmuyaXqAqDSkPDE3rnu
	 K3BEjJ3waSSbv5aFhb6zbuQ7rAtEE9L+FlNBVd+W0b1eK1syDpdzzCOSR1FLhVOP9b
	 ZQsuJc/YZ9TcA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC0EC17E087E;
	Mon, 10 Mar 2025 14:06:07 +0100 (CET)
Message-ID: <6295bee6-326e-4eee-9636-1d3b41a59e30@collabora.com>
Date: Mon, 10 Mar 2025 14:06:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: mtk-smi: Add ostd setting for mt8192
To: Xueqi Zhang <xueqi.zhang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307054515.23455-1-xueqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_060610_717345_2AACE8AD 
X-CRM114-Status: UNSURE (   5.52  )
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

Il 07/03/25 06:45, Xueqi Zhang ha scritto:
> Add initial ostd setting for mt8192. All the settings come from DE.
> These settings help adjust Multimedia HW's bandwidth limits to achieve
> a balanced bandwidth requirement.
> Without this, the VENC HW work abnormal while stress testing.
> 
> Fixes: 02c02ddce427 ("memory: mtk-smi: Add mt8192 support")
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



