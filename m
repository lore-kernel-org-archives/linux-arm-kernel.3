Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD99CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq5wo//6bi0o+PvvKwUwOqRVQd5EVBmZwltJnl1N460=; b=hcVseF6ovJuEUFpxCiHkNMYpc7
	gHh1DI31fOVskWt93cQSvdtR7l8vfasN3aJh9a5N2CbLiM0ruWLR2MM/3QLdJNmP+glYrGcw0t9UG
	cs/Bym1TOmkGHbSz70ETj98wQD9uNUShsATtuFNRN42Zg40TZJM2SZlxCgs/8B9TQA9PAyrBJZ42g
	tv2Rl5evZn76gwu97Bf+yCCso/y4CzqTjypE+N1QTt6P1KtVXOFzt4IBzRcxH007REnPF90NJCiRm
	et7g1khuVK+0fCw9zTHmDX1oJyv8HmPHZ/Cx4xXjQktGZFbvDZT2H2VSMDSByiWEp7xElO1Y0NYrc
	T2OykiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bRR-00000009ZUG-3AbU;
	Mon, 22 Sep 2025 07:58:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bRP-00000009ZT0-22dc;
	Mon, 22 Sep 2025 07:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758527909;
	bh=8prAEjWiaIxuhpvbka12E01qTmGrcc+1Ik4AmS/ME0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b5d7EVlUHQdN2AF0SXwMm4ZQ8Cu4k5AEEp0o7tYGfyA2lZ+UnVAFjn4gyXQmzr29L
	 G7tazT37GcCi+JWj6chdYu54wRR7iNjrf2ESHQAL3gpxgTlHLDQeZrcfJ1b7U9Z3Pk
	 WSQW5DT5I4n3Y2KLN2SzIqrT+LGizeLnQCgzRFvHQdregu7OmRbK5bWggbFR1dNpW9
	 7548ERovKVc+HmAnNz0Nrzff2QCNFkUKRvHW14vA9pD4WExqrWXVrH6i0tTkWDlcwt
	 GfN/Y0X+7ppGbk1xC03+k271jPVvKoX22lStPWe3wuigMlIQ4+wlIDRQW13QolOn7a
	 hTr/RLOGFbwkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEB8E17E00A3;
	Mon, 22 Sep 2025 09:58:28 +0200 (CEST)
Message-ID: <0e45f5bc-837c-448c-952e-6fbd16c738ed@collabora.com>
Date: Mon, 22 Sep 2025 09:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-mt65xx: Document MediaTek MT6878
 I2C
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6878-i2c-bringup-v2-1-70a951f10be9@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_005831_703273_1029E193 
X-CRM114-Status: UNSURE (   8.55  )
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

Il 20/09/25 19:22, Igor Belwon ha scritto:
> Document the I2C controllers found in the MediaTek MT6878 SoC, by adding
> a new compatible string for the controllers. Their design is compatible
> with the design from the MediaTek MT8188 SoC.
> 

Heh, I have seen that one just after reviewing the first version.

Happy to see that you already pushed a fix for whatever I would be complaining
about :))))

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



