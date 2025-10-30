Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F94FCCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2OnpD2WuWuOWuGIqgfqicNHw4BTltmSutI+A56pjPU=; b=irhYQYKRyUT/7enxVSHjdRYjyJ
	flGWntoQ8FbU18gg58TbGNBjssAESjp/Xa9Z0mkC/fbQa+8HeT5vceKCHwzaS53PjtxW/uUmCGemP
	3HpAgyflaWjzeWSOLvBpN5/NLqrsYgWqpg7GybIT5Yqsc9dxpv8+8XzUhybyagVLJKR3gm4F53nmW
	zkLdEUMsMa3YME6ZyHtvbmj8yfw5ZMwU3m5tj87oK+5d3hQiC703bD7OLzUmAdjGsHJQ5acVjxfo5
	hFXPkDI0ucyam/bK+OLckXBRK1JLXvy4cCr2mb3kWkbgo65rzW74gFAa21PsoDFt1geIBkjFByObO
	epIE2BVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOsa-00000003qoG-0bsb;
	Thu, 30 Oct 2025 09:23:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOsU-00000003qkJ-0WH3;
	Thu, 30 Oct 2025 09:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761816208;
	bh=ya5omvxrI5mIeOveaUMXSMfKhV3/yYM0zHSY3WljRq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kYBFLJiNlf4M6aesHbmVXtHz/DCfGCs9oqyJn2bNkRpa1b6zvucxCKE8UQg1F0fTA
	 N57P5Me8Tzhwa2+t649drLhcBnY0fRQHsSuBmUCgoT+1oonjugm/TOevUP5WPZnPxO
	 saARDGa7rrFXenArqezISZsl8jr34vUJDx64DOF21T+UL7m8PtH1igmD+H5d/71Tla
	 lm9UnzY/mUy8MVP0JU+t9/pBiAlTj2sV5WCb0D4IzCQeQkGLwJ3vMNmI0+A5T740ZV
	 KK1v6IAgghfu0lp9kp4aviQ/TMz6mBjPpuJV8kGzV/hnst5B4M0fGkD4N6alMZzewL
	 k/LTLBVpuby+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8B6B917E1406;
	Thu, 30 Oct 2025 10:23:27 +0100 (CET)
Message-ID: <e5b3fc8e-c081-4067-9323-adc187b8b8a1@collabora.com>
Date: Thu, 30 Oct 2025 10:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: soc: mediatek: pwrap: Add compatible for
 MT8189 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Flora Fu <flora.fu@mediatek.com>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251029-mt8189-dt-bindings-pwrap-v1-1-d52b1aa5f5a4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022330_326745_ED1361F8 
X-CRM114-Status: UNSURE (   7.50  )
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

Il 29/10/25 14:25, Louis-Alexis Eyraud ha scritto:
> Add compatible string for the PWRAP block on MT8189 SoC, which is
> compatible with the one used on MT8195.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



