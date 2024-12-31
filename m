Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 08:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlM/NP3xYa1CCftw7RmDoXhl44I9JpoyMC4lEvZdKI8=; b=tXBLX/y1WeSO8PfuO15Y78gNaV
	DCifz2m6LAhVKc7+2Enc1e3mKjJPWDScOwTXF3THF/XTCJ5qt7xnsg77+BLwuQyS0bLnsJ9p++CuN
	EXKgkxUpTzmQng3453x27y5clua/dinHAUg7q1vAj03Srlv33VRMRZv2mjdO3mcogZJY0KA0AaGpJ
	L6WzRei8iV5Ty9qsNsWjMlVRhKmnWIb9Mo2TZei9NAwd1yRnSkHf741OGqfEyow7EtFNHiHvRpUaa
	ofXBwcLbiMgXpZVTMK74MGn+voAx1GCAjK0zuZrkOcly16eBXB+SUb+AMxZE9KPe41NLwZo2CT/78
	auR1eZ6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXZl-00000006osD-3pR0;
	Tue, 31 Dec 2024 08:26:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSXYN-00000006oev-0b1A;
	Tue, 31 Dec 2024 08:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBAC6A400C2;
	Tue, 31 Dec 2024 08:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE4BC4CED6;
	Tue, 31 Dec 2024 08:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735633478;
	bh=j76t3o2w5ZiwLWVPj3IcWXPcINfLohhzaK78/qTi5SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cMf7k1i88qw2NxaNJhKFgeYpFJhlWn4PgoVrjNQkoVWZVpO7R0v18vETeAHy4BaMH
	 mdbf6RKrhyy1M3X9zWCyIpb/tmmZWU7w5RNdQJSIJOCYuoscw702wXd26xTfC1Dl9X
	 vEtsYtOsYnA0ePZDjd1YTrG3Hm/fmaSuyG8S/jxcSlobhTI+UKSSO32yuNAMSwR+eP
	 HWXElkb9KeQVknMgE5V1HYXWnmPKNydklT4T00XznMp9RrHMNWmmjjOFYHmX+LWVse
	 fnGHK4DtsDu+6WwK5K6sC7dGq3Jnb3AU6so3d+i5EunZ+yb/zCQet0LiuSLA/38Pli
	 EGCrglUZDlw2g==
Date: Tue, 31 Dec 2024 09:24:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Karl.Li" <karl.li@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Chungying Lu <chungying.lu@mediatek.com>, Chien-Chih Tseng <Chien-Chih.Tseng@mediatek.com>, 
	Andy Teng <Andy.Teng@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 0/3] Add MediaTek APU Mailbox Support For MT8196
Message-ID: <xkzx34xl6rpb5bxdlsmfxogu26unsof3wupfs7se53wl6jhko5@qeepska2kalu>
References: <20241230034446.1195728-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241230034446.1195728-1-karl.li@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_002439_248153_142609A5 
X-CRM114-Status: GOOD (  10.46  )
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

On Mon, Dec 30, 2024 at 11:43:34AM +0800, Karl.Li wrote:
> From: Karl Li <karl.li@mediatek.com>
> 
> Based on tag: next-20241220, linux-next/master
> 
> Hello,
> 
> This patch series introduces support for the MediaTek APU (AI Processing Unit) mailbox, a crucial component for facilitating communication between the APU and other system processors within MediaTek platforms. The APU subsystem relies on a message-passing mechanism built atop the mailbox infrastructure, necessitating enhancements to the existing mailbox framework to accommodate the APU's communication requirements.
> 


Wrap your patch descriptions.

https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof


