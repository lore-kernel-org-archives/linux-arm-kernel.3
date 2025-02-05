Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00003C02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PqUWMMxEgUq4qMqfgFJmZSv2HcAIcVMS6CuRs7PzEC8=; b=Jx+vjIqJK/0xVmp8nnx6UNKvsW
	HTeCUalFWiO9UJUqJmhIu0rnaC/aj4SpIP2GhFZyZO94GfSPBXNDI8g/2Eedn3N+FLf+/UPgCPQG4
	jyOvNACjEzYYofXBvK1dQbUVWSf+4Ru1VBHvaeYokq8YhrgwTRHarwUpH07NOV2WvBGoGhVZtiw6N
	Jqq4H4Dlw03jHTiwPk6U3N2I66Kr4KV1AvGs/Tzk+JNrn1f0D1xrGmIfY15Ybr0JvGgK/+3+lon+9
	nvpDmc/PFSuzCvjB/4iqNg2cPPHUTI/zC+8w/kLk04rpMGFbzLP0QhXA7WLcWzR97fte2k3WwWcfS
	VACYr16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgKU-00000003Wvi-1ysx;
	Wed, 05 Feb 2025 14:24:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgHp-00000003WSr-06JK;
	Wed, 05 Feb 2025 14:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765310;
	bh=awJw8hGERuh9EYSPZmSq+mZgDVBmZ4HItMI82GEM1j4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CPD6pYws5GH58wZmmVdEdySatarUOHrKHeTC2l1n3A68FTjz5kfJxN+4qo+f0mbkr
	 oFN4XTl4ZBXoid2+Lk42UiHVw7pAaw7SA92CI1Bjdw+VbmfIEV87Mc3W8awEVKjEUT
	 km326l2LhKzJRXlfZyvzI+RDKwcjOoAW6sMcmeIwpCG6E6UhVWE43o73x3xOe9MkEB
	 SskzzkU03iFjp60QSvJRrxhZz2Q0+MqsV9DNJxyXhdmfZeeYAslUXfOnsvhH0zb/TQ
	 a6Km8YNjj/tCxePXhB4ehrm2thGvLBkrJrImx7f66XNAf52JHWk3usXh99HbXKeoMq
	 uucXNxt/e5P2A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D543217E1539;
	Wed,  5 Feb 2025 15:21:49 +0100 (CET)
Message-ID: <9f936145-87e9-4a02-9dcb-800659c08a17@collabora.com>
Date: Wed, 5 Feb 2025 15:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: add support for MT8370 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-2-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-2-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_062153_215558_EFC8F8EE 
X-CRM114-Status: GOOD (  11.36  )
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

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> This commit adds the support of the Mediatek MT8370 SoC.
> It is a less powerful variant of MT8390 SoC and their
> main differences are:
> - Arm Cortex-A55 cores number (4 vs 6)
> - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
> - Arm Mali-G57 GPU core number (2 vs 3)
> 
> Like MT8390, MT8370 hardware register maps are identical to MT8188.
> 
> Note:
> In this commit, the mt8370.dtsi does not contain the needed overrides
> to support the Mali GPU (to be done in a future commit).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Please don't say "this commit does this".

Example:
Add support for the MediaTek MT8370 SoC, a less powerful variant of....

and then [....]

Note:
The devicetree for MT8370 does not currently contain the needed overrides
to support the Mali GPU integrated into this SoC. This is scheduled to be
done with a later change.

Please fix the commit description, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



