Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1810C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5ywGT/pDAanbQKr465UBrLKOGA6cl4mLq8HMV6siIE=; b=eWUeE5jTrrPeY2r3tVJVt7fhoT
	s7FzAm5e8Yu5UO4OhmGbbaU2j1z3HTnemHwUYNtqIOy1Nrip2sCL3TYDM/b/SgWl6GSVZTYTqqmxb
	wJv3yLzOneEXe6V5/3mSPisNdRaMU+r7tgNFdVGrm0nq7SEFkRPAV9SZKRb+IZt6DYO2u5po2fbt9
	yQLQkpILHQ/oBYP9XcFuqUR3tKyT1PfE677kacB4VKLOQKiBXziVGWAdFJNy55c2iBcNHn57uEOOo
	rxSE8wB+t7T3AvIcJHjyQ3+J2DGSF6xWHFPmaT2A/FCZ3m25qHuLZCTcJRryKipQv6NwCZ3be2xzH
	aywqNrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hJQ-0000000Gskn-1AjU;
	Mon, 07 Apr 2025 07:54:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gsE-0000000GlSq-23VN;
	Mon, 07 Apr 2025 07:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744010784;
	bh=uotZ2ajR6KptfuV3oT6wTBp1RVUk+IvL3zT0lx2wKpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LIWoajLTEfejZcuREwXBH6mdfSpGRFFynXj2vc5bGixWs3YzYWguX3USmOAnw3weO
	 ogF/Roidm6YrAND3tdYit/eISsUekVRP9F/tFsnYixrAqePKxs2ODzs1kwvMYG5r4o
	 aIylv0/o3EgxPGnmLPlYLYyCjgmYiE6LHfggoFDSrSkg02ZR1/QyEVBKZxFDU8ltg9
	 DWD1H1mUwoMSSS+6ucKLaKeTo4NGJ72GC/t93/lgwqukC2uWJCG4ICymW7UBWJ9u/d
	 ZAouRKJhq4RGIyqQCdsWEo90iWgkayYQ5BF9jVGkkZIsnzmEFDj3s6lJPVAXGx1apf
	 raP4qMAad8bYw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC22317E07F3;
	Mon,  7 Apr 2025 09:26:23 +0200 (CEST)
Message-ID: <8880595f-4178-45ef-8543-0d69c0b9054c@collabora.com>
Date: Mon, 7 Apr 2025 09:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp
 firmware-name
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
 <20250404-mt8395-scp-fw-v1-2-bb8f20cd399d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404-mt8395-scp-fw-v1-2-bb8f20cd399d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002626_678578_C51A75A9 
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
> Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



