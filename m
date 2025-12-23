Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B095DE6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvoXd0olczu9y6nMznlZ+Q9E5vlmItS5Dhf1dTQ+L50=; b=l1+y/A6mxoSWBfkYYp/OpUw2fK
	2uVbRIwbFi62LOGGVf9cv72vZbsGar3E/jXcqphuqOllQ2sUZL6QgXy9OHgn0MtHbM+H/v0Zldz82
	BalPLwC0eods6Rwe4J6sr85sH4RC5RJxhoXhlbox5SAI7FEqN89GhAhNXxqUhEt92dEo0HL51rDYm
	dhWfTQJMRvyK2WrbtHN1aT7g1uLkLmzAbEYq0jMORNGDaUkQImhWrCQlRtFKVxoRXo2TPqKd8tEbs
	rz7sh2FG0FoR7CYCJRDpmpFmzjLXR+TwCdSaAhuWkqliNmtSvZpuU1rfy+6CvcDp17ctTePr34w8L
	6qhusN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1CZ-0000000FOgx-24Rj;
	Tue, 23 Dec 2025 12:09:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY18U-0000000FJcs-1qOS;
	Tue, 23 Dec 2025 12:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vvoXd0olczu9y6nMznlZ+Q9E5vlmItS5Dhf1dTQ+L50=; b=U+KYDNaEUHfrGNKfImMM68nv/n
	Vo1S8cVJV+qHh8OOpg7c3D6dPEdlYkYKBkKsDPr70d1pG9l2vbp4weelAki3vtF3v1tC5FQ8pfgt5
	HuQ6zZ0j2a6ehjymkyfvuyl1+BRDnq25mfdBI+GGax6w8dRE6ExGAKIJntamm69Q8vtnxKb/H3Opc
	wanwb4u3mCs6t+kb8t2iMG1uNrjwYhp9hnrK5vuNB4C6dF7XN+Hh1xXJVAq5ewKSSqtVlDp5LCBiJ
	rJ/yeVW7a3LqcsWkldSxFLT2UJ8Qo+ct6n5N0hNvV0w7L6SO/SS6ZkqiaPCsS8yB/uhzL/nhm0oT7
	0JVk61Kg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Gy-0000000GgzE-0aQ0;
	Tue, 23 Dec 2025 11:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766491495;
	bh=YBuvzt/NhTYWhzP+XmcIESOEGPy6LMoYjTaUBOofg0o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jEOrOCkFycldj1VQlKzLPZ2QbJwhvQDjQ9yat1fYpn21EmGho3vxEKzrBIKqTYatI
	 wqSjnv9K40+cNzQB2bqONNJEB6cXB3g1My5TnMbmFuLkROFSqxxBBrj+gu2GFpbOEd
	 9b2U3/U8XN1BWup+cbV00mXqXJ+BuSgZQLsiO4nRgjgtErolMNBK0Dyxbunhor64GA
	 aXFyXyDhtJjKVOofDnRzC32Xfl9P8s3gEeUJ/5Hr2UtVtwcgef74+C7j2/SYcLJlRU
	 +/un8LadHThntKUc7/SgNGBZKMt7ceYLm4eWpDWFg759Rtk9W0IaDBOZ+/KQZ/D73o
	 6d6/oofkxuPkQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D93B617E0125;
	Tue, 23 Dec 2025 13:04:53 +0100 (CET)
Message-ID: <ddff4617-884d-4ac2-bc24-28f669104b2e@collabora.com>
Date: Tue, 23 Dec 2025 13:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/25] MediaTek UFS Cleanup and MT8196 Enablement
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
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_110948_312948_4D1BE512 
X-CRM114-Status: GOOD (  24.83  )
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

Il 18/12/25 13:54, Nicolas Frattaroli ha scritto:
> In this series, the existing MediaTek UFS binding is expanded and
> completed to correctly describe not just the existing compatibles, but
> also to introduce a new compatible in the from of the MT8196 SoC.
> 
> The resets, which until now were completely absent from both the UFS
> host controller binding and the UFS PHY binding, are introduced to both.
> This also means the driver's undocumented and, in mainline, unused reset
> logic is reworked. In particular, the PHY reset is no longer a reset of
> the host controller node, but of the PHY node.
> 
> This means the host controller can reset the PHY through the common PHY
> framework.
> 
> The resets remain optional.
> 
> Additionally, a massive number of driver cleanups are introduced. These
> were prompted by me inspecting the driver more closely as I was
> adjusting it to correspond to the binding.
> 
> The driver still implements vendor properties that are undocumented in
> the binding. I did not touch most of those, as I neither want to
> convince the bindings maintainers that they are needed without knowing
> precisely what they're for, nor do I want to argue with the driver
> authors when removing them.
> 
> Due to the "Marie Kondo with a chainsaw" nature of the driver cleanup
> patches, I humbly request that reviewers do not comment on displeasing
> code they see in the context portion of a patch before they've read the
> whole patch series, as that displeasing code may in fact be reworked in
> a subsequent patch of this series. Please keep comments focused on the
> changed lines of the diff; I know there's more that can be done, but it
> doesn't necessarily need to be part of this series.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> Changes in v4:
> - bindings: Redo the supply situation, as the avdd pins don't describe
>    the vcc(q2) card supplies.
> - bindings: format clock in mt8196 example more tersely.
> - phy: use devm_reset_control_get_optional_exclusive directly
> - driver: get and enable/disable the aforementioned avdd supplies.
> - Link to v3: https://lore.kernel.org/r/20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com
> 
> Changes in v3:
> - Split mediatek,ufs bindings change into two patches, one for
>    completing the existing binding, one for the MT8196
> - Add over a dozen driver cleanup patches
> - Add explicit support for the MT8196 compatible to the driver
> - Note: next-20251023, on which I based this, currently has a broken
>    build due to an unrelated OPP core change that was merged with no
>    build testing. I can't use next-20251022 either, as that lacks the
>    recent mediatek UFS changes. It is what it is.
> - Link to v2: https://lore.kernel.org/r/20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com
> 
> Changes in v2:
> - Reorder define in mtk_sip_svc.h
> - Use bulk reset APIs in UFS host driver
> - Link to v1: https://lore.kernel.org/r/20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com
> 

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



