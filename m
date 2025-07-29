Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F96C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWmhHRhAh+DgeASGyR5JJXVkf7l/5CDZChMlhoVzewA=; b=EQOSLoGh7Df61UV5DuOLBB8eMF
	lQvn9gkcPofZf5IBmF3ajhrj/4B4i9SXC+lLX3NhfEWpnn6HO14omyw5JJK7aUVzA/pilw+LxdTGK
	828UMMpt/Db3PHhG1bmad+bLPUbWLWdZ0hgUFDMQtrD4C3WeW/4ZHdKAPAF4pUlFm8upKoayYNyfc
	RZlfjcoW6T4vnX6gzHs0SRlLOBBlwb0oHtC2g+n68dahUYS0JYgFzWVgui5ln2XMCeBIlGf5i9dxP
	qzHldR4zM5Ol6FDBAHthkKf3u/i+ml6vQ1sIAb5hNylSIFAoSQbTZ2Djlm6SMeGX7rD7LQ1r+8KU6
	AuNXed3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughOr-0000000GVJg-0Fkk;
	Tue, 29 Jul 2025 10:17:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughJv-0000000GUgt-0yyL;
	Tue, 29 Jul 2025 10:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753783949;
	bh=8x7EzBU5/xt9EXl6eItG8ii6bz9gq6WiYBXMtsDNvvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WxgIlYtvUGuS0Htfhh33Igv7d740kTERjyFwu/K7elKgMIc56SfNahF71V2z3io2T
	 +yT9a5AN5RuPuo4yUiS9Ny3jgR9whKixJyH1XYeuQ1Y6sw1oWa93OUq4qKyIdrCqgX
	 1mPXjDsVbYcOPf/9tMm7mWbgaj3ythIpw5DzG+XIueNZNsk4y02gis1OVaiHsZ3JCH
	 Cpu65rA1INAVXulckVhVm4TsDfyBDaxSbN4wv4WciWLs4pPrunF87QhDnFCBxee/IQ
	 lKPyDfs33SRrgq2Lbp6i8Nx2Z/Mtj9UbigMjOI6e/1q2te5eSormXr0ouQSYBqxhCJ
	 CfwPCXwXhrDLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A608517E1293;
	Tue, 29 Jul 2025 12:12:28 +0200 (CEST)
Message-ID: <66551820-45d2-433c-b837-3a0ace37c528@collabora.com>
Date: Tue, 29 Jul 2025 12:12:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: mediatek: add device-tree for Genio
 1200 EVK UFS board
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250729093506.273337-1-macpaul.lin@mediatek.com>
 <20250729093506.273337-3-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250729093506.273337-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_031231_420037_B62E322A 
X-CRM114-Status: UNSURE (   9.92  )
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

Il 29/07/25 11:35, Macpaul Lin ha scritto:
> Add a basic device-tree (mt8395-genio-1200-evk-ufs.dts) in order to be able
> to use UFS storage as the main storage on Genio 1200 EVK board.
> 
> This board is the origin Genio 1200 EVK already mounted two main storages,
> one is eMMC, and the other is UFS. The system automatically prioritizes
> between eMMC and UFS via BROM detection, so user could not use both storage
> types simultaneously. As a result, mt8395-evk-ufs must be treated as a
> separate board.
> 
> It use mt8395-genio-common.dtsi file to use common definitions.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



