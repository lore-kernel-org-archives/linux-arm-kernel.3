Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE7BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvGhJj32wuPYb2i1PPC1s1WU4owZebYrMuxvlEvmjyQ=; b=E1uxMK5a/l5Ne+0Wboxath1Gm6
	/L3aUDCHPwQr0yG4KDZ9BRyfv5ErBtZ890o/xuz3Ftuab1iLrFp8zJt7ldjvl7X05pJfn0l0VAJyo
	RP5Y3mCqoyDCHxfMx+aJbQNzcmzwwSxl1p1e960He6VTQg8ur+LEQCZ4gN26D5UBeyMijA+oJVvQx
	LVYkMyYCOh+QHJxfgrOXYuS3XSOVEf2kBllXwz5do3sjBGzD+EeJnpJosBpGdxq9WBxGxK1Cikd/w
	XnLEE4+nDF0V6tNZqZJ0qbDFn9MPMHNhA0DC+kUoS4PcNo7jaUqY19nPORtIgG29cJjCewRdNg0yn
	anFXKHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Mah-0000000Ceq3-3aJU;
	Thu, 17 Apr 2025 10:35:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MM5-0000000CcGg-10lA;
	Thu, 17 Apr 2025 10:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885223;
	bh=t8QO5inibbVaRdLTebeM3EUSRTdUneDCopbPlpjTzXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bYGpjKZlLu2/A25093yupLUcTmoCdR8nVXkwXcRfZSylhLJKpDwHJCXAQ31AhoxS6
	 OLewrKh7aX0HPKQoxDrUBdXFVjvPm6t621rGZ+J7w015FGa3r0HsznL47Y92JAXHST
	 r5WZiPhCr0MZCvmlAzgUnNosf8O8w9/9P5QcQ/tQvVr7TK0ZLf5KQjdo3rPXTdDm9Q
	 sGn7Scgp4HqgcDRgefl9zpSp01d/+bqyxZeL10CnR2LXWBmL2Z8uIlGrUhR4o/0DfJ
	 5PXGJsyVVZJtxf2lHbF6oO6/+GNogZfWmzR9VAZKqgmR1LnSvDnt2uftfMVt1J6tpq
	 PNL1JkofZTA+A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB24B17E08E3;
	Thu, 17 Apr 2025 12:20:22 +0200 (CEST)
Message-ID: <af336ed5-2c8f-4da7-9497-6f23a6959883@collabora.com>
Date: Thu, 17 Apr 2025 12:20:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: dt-bindings: mt8195: add missing audio routing
 and link-name
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-5-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-5-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032025_428754_FBBFEAE6 
X-CRM114-Status: UNSURE (   5.71  )
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

Il 17/04/25 10:44, Julien Massot ha scritto:
> Add missing DL_SRC_BE link,as well as Headphone L/R that are
> provided by mt6359.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


