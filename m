Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C68BC3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9lhrqFj+zTxv4mjLFJPL2FVDZ/HuM/6FAsRpA7t9aM=; b=AcLNUF7vJ6MqsOQe89zJNJRp9X
	Z8ETMvuJSbHlK0NyF4mD1BMmVlWdsPv/xvFesnqJS4sY7wR/dO0jY2OYHhBrHJIOv42CgyBDUM+N+
	ij9tfsJSX2GnFjam4k7i/8cCMsusy4GUT4pG5Aeo8EMAg+bgVlJMq7S0q9EhTYKqFcz0MSxrdq4bn
	KhMIV741lNEbc1boqBSsH0mk/qTxhnqHdPZlH16+R9VubzjwnXmbVwoYTAFPYbe4fFA2oGymHcKcl
	i6eDjWI+D+0U8hAsgjnipOAsuo4FwjwVaGIy0Pt+Q8wDIvTcwMRsHaY8fXYBgqkeSiePtjKeW3CzB
	i4Rn/wYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hL8-0000000Gt5Y-2ap4;
	Mon, 07 Apr 2025 07:56:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gsH-0000000GlTx-211v;
	Mon, 07 Apr 2025 07:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744010788;
	bh=scrnhWy6rMUlkpUpOweP3I5fA6E5KfGFiyvMFOn9mn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=USsmhKH6wjFeUKz++3U5jar4ryLBzBg/8KQNbXR5VJRu2VnDNyuVrqH+2Jx2zogT+
	 B7qwPw34h5WHQAtkonY/ZFb/g1pWSxd5RVdvsLExVka9X9JhGeeupsmid7pSAEDG3T
	 k2dns+2USd0dQSS7KB1keIqYoG0Onid5kfqKNiYKGLEwJ5HMc6s46Dboc9dyoDmLNd
	 L8TSR2VROM8zw7xnJWyU6U2OewadfgdM4XucDPTB7Ql2Gxa8wsRxmyM027bHvqzqZs
	 iRV6NvUInGUvHRqz9jNfVaSgqbaZME5BffHybfPWxhnABmFrYoJiwEKFQGIPSccaJZ
	 F+176LzuwrdnQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60C9317E0CBE;
	Mon,  7 Apr 2025 09:26:27 +0200 (CEST)
Message-ID: <6d2462ee-1303-4325-a244-6d3408f4d749@collabora.com>
Date: Mon, 7 Apr 2025 09:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8395-nio-12l: Add scp
 firmware-name
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
 <20250404-mt8395-scp-fw-v1-1-bb8f20cd399d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404-mt8395-scp-fw-v1-1-bb8f20cd399d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002629_667480_4BA95A69 
X-CRM114-Status: UNSURE (   6.38  )
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

Il 04/04/25 15:53, Julien Massot ha scritto:
> Set the scp firmware name to the default location.
> 
> Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



