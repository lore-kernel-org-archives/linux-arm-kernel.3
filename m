Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728FAC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCz/kzh7eBLyLzFa+58h0vRaC8FWr+4esYSbxDc+mTE=; b=V4i/wDnHHPJKYKcI5XnDF+UCiS
	pg+5r11IinEkByAV+mYJv1ew+StPBBvu9oPKMQabgysepm6L79lqrMXrXzsp6mCEHj/PUNd++PklA
	T7f4/ypLX1WIZxd1Sf+4BJm/i1Y2gmuUJf1uGSK91Motn4gs87zOKP435fQjAfboB5mROJqoEm/e7
	ECFNtkimuR8TSvdAIpUgVWQtpI9E9NQDyiHSA/2g4Ddi0t0RNNFArOuzBhUWJlhNAnKDPYcIhX4AV
	xNB76JIwd1+PwRzEmN6FYJUoPj398teGLj+wBwLKLZP0WJh/esgOLvBayhEE9KV4JsOzSvax+BBOn
	3HLfwCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCvt-0000000FO8D-0eht;
	Wed, 14 May 2025 14:18:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCOs-0000000FERp-2bnE;
	Wed, 14 May 2025 13:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747230237;
	bh=jhvYh/l6FiXcGjp04Rwh3X1CLo9llYiEmQf5JBD/Kf4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RlY0MAC16U67eamGI5lpVkLGVIjqsUpw9q7ecO3jcwQw2aExIhcaen14DlGvFdR01
	 oroEDNOK1JaRGBIqz+l8x2ZFdxUu+ytw3oT7h3DjeNQx3QRnl4n84ezpEEmzUd14je
	 MjuSRwAj6OL4IO2bUaUqaqN5s8sEZpoW2fGUhG/zmFhG6e4rO2t3Z18Qfb4nh9jyX0
	 Kl8JBQGVCiMifSDe07wa4In7HUrWCWpfrbvTD21WuAV7rwkx33xK5orSGX8bGdZXUh
	 lU9PAlao3Tw09FF94MjtAKpM3ozVmjy3Lihmb0naFMYNQa3obHTEoX0J/JVyDtUxv3
	 QAWD64rvgX3xg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C17F17E07C9;
	Wed, 14 May 2025 15:43:56 +0200 (CEST)
Message-ID: <6fc2027b-2afc-433f-a9af-c458221c96ce@collabora.com>
Date: Wed, 14 May 2025 15:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: mt6359: Rename RTC node to match
 binding expectations
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
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
 <20250514-mt8395-dtb-errors-v2-3-d67b9077c59a@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250514-mt8395-dtb-errors-v2-3-d67b9077c59a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064358_810956_866721AE 
X-CRM114-Status: UNSURE (   7.77  )
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

Il 14/05/25 10:19, Julien Massot ha scritto:
> Rename the node 'mt6359rtc' to 'rtc', as required by the binding.
> 
> Fix the following dtb-check error:
> 
> mediatek/mt8395-radxa-nio-12l.dtb: pmic: 'mt6359rtc' do not match
> any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: 3b7d143be4b7 ("arm64: dts: mt6359: add PMIC MT6359 related nodes")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



