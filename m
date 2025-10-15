Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C373CCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYMYqpem9FeTe8SivcyvFxTUlDdQSFxSxd76rqbWE+s=; b=XzReULie8jkHRst0mTcz7hhcyt
	xugNkWBXPnuCXRMbaxl/XjevQMyVlUsP0Q0e2Zie10i0b67Yg6Faw2CZVt99gQJS3S8/zUanh0CTf
	gwwq+heObK3qw/+CQLNjMhcVyGacTdMdFdT+nJKKePldLTkQTACUEnuOdsx22MtY/tayieFqszbyQ
	wtLju6ESR8gkY/v+gWZ8wUolLmcu47xpbJiC33UajZH3jBykuHjVgitjw9gFPtWJfPMFrraPJqhvZ
	tjXQ2QNW3QOnwEQ/8EajXSXGEE76xxsgfcDjMKJqu4lweZ6HvFhOn97OPYuBcN7CMBSdTkuBMJdv6
	U0ZgpEyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wpL-00000000tqZ-1VKP;
	Wed, 15 Oct 2025 08:25:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wpJ-00000000tq4-0UqO;
	Wed, 15 Oct 2025 08:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760516738;
	bh=C5vRLQ73Rs9hSl/5ofntob1CHll5VuYEA+yisHg++58=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PU7G/s2kkMnYb46jq+l1lYGjvPgImVi99loaaI/Nwb5d0V2jEqq2zM2GBioEMhQmq
	 AgHYZ6Yn8pf4uNRhjQqrJxSLWT8qINRw0mzJlmqgxyHDA6/3P2KGezVZCRW8/TZPJW
	 ybi7fkKXcvsW2E96/N4uWJGkzX3AnUtlVEV42Rv8QB6aKNXrR3IJWDF5YsUZCr9EoV
	 JNdLli+/LB1yauQmEG8g5G1Cpkpw78EnALCMs15DDq9IGz9+vFI/UQCz0AcGJm1jAp
	 kYTFFDT1odfonbP/+ymFDg5ioWOz502ofSFrOchuxSXmHZDGPG44eKPHaqxP9OyGU0
	 P4avD0/ddtEyw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AF73F17E055D;
	Wed, 15 Oct 2025 10:25:37 +0200 (CEST)
Message-ID: <b5fe44f0-f733-46f3-9436-37aea1330aad@collabora.com>
Date: Wed, 15 Oct 2025 10:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] MediaTek UFS Cleanup and MT8196 Enablement
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 kernel@collabora.com, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251014-mt8196-ufs-v1-0-195dceb83bc8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_012541_343527_2FAA808F 
X-CRM114-Status: UNSURE (   9.26  )
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

Il 14/10/25 17:10, Nicolas Frattaroli ha scritto:
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
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

While series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

