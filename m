Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0B9C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 09:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmIUZAwCHzwTdhWDS2twG5oCkr5y9XEcGBzF7d7eRZ4=; b=olJIlEMWiT33pGw7cDZstuBnMy
	vxmsDRkN3V04BaYF669MPuvC4qTkbNuQulP0CBiyXWfPq5SpKMEr6gGkmrhtmX3pK6A5uG8HUOQdg
	ulxBtMKjNEbErI4Fwf62Fka3Yl1wII2xyfKzLGVvYRCFyY08S1WPKJhpwd7wgKs1Bx4FBfvr76gcl
	a6w9SdeOHeoHzwrquV1V6oB7iuXz8uQ2+FUu23WNGruG4zlm8QrvGJAcG8kNKP4t/zhtaSVxWYECb
	Dy8kS755OaPPspJ5gkdTliqAPK04oe4YM2yEQGteizCjuCQPWpTcBW+Rxkwx1NdZ/NZTROAUHJqFI
	OOb2wF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCENN-0000000BJLO-0B2O;
	Tue, 06 May 2025 09:14:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCDlm-0000000BBOk-44Eg;
	Tue, 06 May 2025 08:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520517;
	bh=HZLhd08WX2+ReeodcLqzcq1Sex8u/kBBo5ZNER/2NWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qoQQgfWRIoHfUByG+ocpa0yYxuBh9MU+OmHRov39eBMy8q/Z8K4pR7y/9Y+shUDR3
	 jnu8+JQNgCEh7P1xGFUWKGEDFazhn3zXzCFi7r6JG8QkVUenc7+So7BHfeE8Usnhqc
	 Cg1LMhIm7bDT3E53IIP7DFmfSwZ5aTkFZfBjU8s59Lf532RAYIWJcDv0/ZFrXz27Rw
	 4PJSxK34Nh0DyhZ4Hv4qG8NB89Y0MQXKzBEmIKyMevM4C/gmgJiaJG0eLdJX8LMegK
	 KrQwmEo9aLxyV76Fl4zrP0ZF22zdZ9zvRxZkWKVYw1o23X4XhrF+pLQd4ScA5DKgeL
	 UfQK8q29KiCtg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EC9817E078A;
	Tue,  6 May 2025 10:35:16 +0200 (CEST)
Message-ID: <b0a1ecb5-4a45-498b-8632-368383a10679@collabora.com>
Date: Tue, 6 May 2025 10:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mt6359: Add missing 'compatible' property
 to regulators node
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>, Hui Liu <hui.liu@mediatek.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
 <20250505-mt8395-dtb-errors-v1-3-9c4714dcdcdb@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250505-mt8395-dtb-errors-v1-3-9c4714dcdcdb@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_013519_188965_5A6E695B 
X-CRM114-Status: UNSURE (   7.96  )
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

Il 05/05/25 15:23, Julien Massot ha scritto:
> The 'compatible' property is required by the
> 'mfd/mediatek,mt6397.yaml' binding. Add it to fix the following
> dtb-check error:
> mediatek/mt8395-radxa-nio-12l.dtb: pmic: regulators:
> 'compatible' is a required property
> 
> Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


