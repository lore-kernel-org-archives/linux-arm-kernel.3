Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1CBC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEd/6hB2T8zQhpEq6xj4O1aKrG447Wn2lWxg2RtW4+k=; b=lj6mZXNHPPDvJuBbboqeX9mYCa
	YUswVHmQM2JzWCGwbs7B5IyIQGBRiJ/V0oD8lKH1Zl5/pGxlQmYzmlAO3EFfGaEOyJMxLhnZGRQxS
	5o/Rc4lZliLS6AAXTERL5d7G2X5FZ5yBbdAmy1xiuUT8e1sqYxyQQmgRmG+tacw60SZwbcKiftCsg
	L2mfS4hb6HzVdQl57YC2RpdaCLd6cwRmkHhSwX4ne8q7kn4eUImDInMLDpxd2wqiINTlccrVne7ch
	JDN8/Ht0KWY7PDrTBso2VksWpmc+UgY0NFGEYhnpqcmehbUl11sWZr9+F1mTKRjmaba6Q1dPQ6FOM
	yhclgp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOmp-00000003wfW-1jDa;
	Tue, 04 Mar 2025 09:42:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOgZ-00000003uum-3BAv;
	Tue, 04 Mar 2025 09:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741080933;
	bh=5J3RCvW8I/AvYVkLawf1nfGsr7tulDAIHBWxPLYvq1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=owCgTfZuYvHdiCtMekSe4va90H4jc/rJkzQnWkBlm3uAn8SpeyTuN9tRrZvUR2nU8
	 2smnVSWVBc0Eki9A7tT5rcg78qn85Hn7hb+JBdN2+p/34LEpPkm4R83k14lXPqhAQe
	 I+R4CFLdvVN+owGce33sePsnqHwTaZrZ3Zo9C0JO85T5LGb+ziDCQD7SgDj6eXQAEN
	 i05nACIW9LxJDMR72jUixCt8G27A3/hYnhBz5sBsKNqcRohgDua1l7ZOgYfZLptC5J
	 asqXkAUT7/7Ex0KPX1JMwYcpRLSH2qh4BnJIg5F9BefxtqmsakhzPmrlytPNxDRyft
	 z+DOsT2m25NGA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 22C2317E0607;
	Tue,  4 Mar 2025 10:35:32 +0100 (CET)
Message-ID: <581fc075-25d8-4104-a4ee-8c97e1a017e6@collabora.com>
Date: Tue, 4 Mar 2025 10:35:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] soc: mediatek: mtk-cmdq: Add pa_base parsing for
 unsupported subsys ID hardware
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
 <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218054405.2017918-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_013535_975542_566B325A 
X-CRM114-Status: GOOD (  12.64  )
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

Il 18/02/25 06:41, Jason-JH Lin ha scritto:
> When GCE executes instructions, the corresponding hardware register
> can be found through the subsys ID. For hardware that does not support
> subsys ID, its subsys ID will be set to invalid value and its physical
> address needs to be used to generate GCE instructions.
> 
> This commit adds a pa_base parsing flow to the cmdq_client_reg structure
> for these unsupported subsys ID hardware.
> 

Does this work only for the MMINFRA located GCEs, or does this work also for
the legacy ones in MT8173/83/88/92/95 // MT6795/6893/etc?

In order to actually review and decide, I do need to know :-)

Thanks,
Angelo



