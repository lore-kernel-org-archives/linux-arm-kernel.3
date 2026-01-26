Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBBAD13C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbr2gvvBmKr19PfRmNAsIexnBX5A6gjZiXTaUKZx1fk=; b=dW6dtCTaNJAD/ezl7JY0pb94wg
	FMJVu649FcYCi2tvzW0aBQ6uqZO067ffGR2WKlWGvZXMvQ6GGV/T/szouAuNcWuaJeE/G4Y2H2opx
	orJfmX/x8FAKV7uGsNmRgtCMh2pDja+Iapapa/nGQtx+Bt6J1ybXVuQuro7U8VI/Wypj46a6i/Uc1
	f8CkIRBLIzS3VYfTieR+J19Z0oy6Kp3v1W+nFO/zvIx4tLf2JCdJYIH7XMry2IHI/QQeh2IdbTy7+
	KQc43L8lIFo9EkvsGMZqF2dThD84k0FYpZzW+2unMeg7Qn7LBeGjeJhODvzYTiRmDsZCxaUTU42zf
	L13sr0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNxo-0000000CiwZ-0INq;
	Mon, 26 Jan 2026 14:53:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNxl-0000000Ciw4-2tfl;
	Mon, 26 Jan 2026 14:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769439184;
	bh=GT4929KDy5PqpA3gBq0fVgekZu4eZCi/voc1Cx4I1as=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=evbz8UvyEOzZnE8SFDytJikkrW3Jv2+T+Upwsc0bmWbMVnRwWI/rL4PzxBGPqGN67
	 TqgPDewslKzVt5kjkQMlif7DE78SRyG4ieTFEjvsnvrD2P3gO7TNZ2EqRZOGpN/lKT
	 a04mgYXnvWsY1w7Yp9R+ApIwHVODnC7irlYBch/EJPGoF+lyGCQl08VOvfcVdLgCcT
	 8cBFewH2kEjmq9STmuVf5zY0VkGEG428LwE0vwd2NQLuMAthnSK2UhzH8uTqiE7OZt
	 EC23/BpmiXZKrYi22uo8waLPT5IP1IZTOG8eeJ0Q03es8v55ZOlgevD+NhrWjwvZBW
	 Lk+a0XH20hbbQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50B0117E0E6C;
	Mon, 26 Jan 2026 15:53:03 +0100 (CET)
Message-ID: <0fe71377-df0a-4e8e-a787-73455eddc133@collabora.com>
Date: Mon, 26 Jan 2026 15:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 23/24] scsi: ufs: mediatek: Remove undocumented
 "clk-scale-up-vcore-min"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Chaotian Jing <Chaotian.Jing@mediatek.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20260124-mt8196-ufs-v6-0-e7c005b60028@collabora.com>
 <20260124-mt8196-ufs-v6-23-e7c005b60028@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260124-mt8196-ufs-v6-23-e7c005b60028@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_065309_895503_D11C2AC8 
X-CRM114-Status: GOOD (  12.51  )
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

Il 24/01/26 13:01, Nicolas Frattaroli ha scritto:
> The MediaTek UFS driver contains support for an undocumented,
> non-vendor-prefixed u32 property named "clk-scale-up-vcore-min".
> 
> Since it is not part of any binding, and would not pass a bindings
> review in its current form, remove it.
> 
> To return this functionality, it needs to be resubmitted in a series
> that also introduces it to the binding, and justifies what it is used
> for. Compatibility with downstream device trees is not a valid
> justification for its existence.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Not sure what this is used for, because then UFS DVFS for gears should be managed
with OPPs (either dynamic or static) anyway, so the vcore (I guess this is the scp
vcore in dvfsrc regulators) should be scaled like so, without ugly init hacks like
the one that you just removed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



