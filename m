Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757D0C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evTi0Ta0/t2vLOLK8aiNDRtAht/xsLMKAsZmpxNHgh0=; b=FcAkgHMcwHekKkiceIOrpum8w2
	Z7nabFM5oMWEJHZthenwkzFt7jEM0sikiJaXhVQdcT6eAS1xmArts0TyDZAy3LttEJtImQ2hE36m7
	b3sfQrPzt14EbfVjXn/g4858ds8m5IsxQdhS1VQhsXNaSqFS6DeMZOyUgt1+/bFscISwbC8wGcVpa
	cGdfXbUP4bQ1+FD6f5TOCpUOI9nJ/T01k/2FTGkGqK6CBJuDoVZE/ecJiuP54822mA47brUeMQPTR
	jgrDQGc7OPNyJfGhC2Jlm/v+ZsXQLlYLEt7GKRajpR2DPdHhLZ1HpzcIGYGGNwWVG4L9FN7H/jidJ
	1Lbes7bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEjg-0000000C4OM-3hzA;
	Thu, 20 Mar 2025 12:10:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvEX9-0000000C1VS-3D5z;
	Thu, 20 Mar 2025 11:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742471878;
	bh=4PB17PpPoG0IB+JwIOSpazM8zXzkgKRzyjbFPrS6N4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V9E8hfOmOcegz8AS8ZmFpWuT0hKAtsYT4h9BpYToZyUX7o9OCMsD41AtNfhWZUGer
	 G1xJxuezSeHEKfYv0kccscdNODkN//OKWNQHnqr6mFyrPf7xLM0oE1l3YAwAerc+6i
	 OzpBBJ7IQZhImyBUx1ac5BggqaPwbnOaMgXFlvbCHMt0DTX0pMRZFNwzSAZfOPB3i0
	 Pc2M0Y3fISWYgYUCQB+TUA+i1R1tFjLyxbbaydWHRL5irINXSdipNGAUdfAfapWs2k
	 6F4odB/xbnRAsNqHAz6j3etKM2n4MVE99k8JxGU1HIidde13NcQLMJ6P4afosdvCJ6
	 sTSuSBwo1Oi3Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D67917E017D;
	Thu, 20 Mar 2025 12:57:57 +0100 (CET)
Message-ID: <816dd6ea-0e5f-4d8f-a5eb-99d0670e0d43@collabora.com>
Date: Thu, 20 Mar 2025 12:57:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: SOF: MediaTek: Add mt8196 hardware support
To: "hailong.fan" <hailong.fan@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Jjian.Zhou@mediatek.com,
 Xiangzhi.Tang@mediatek.com
References: <20250320031753.13669-1-hailong.fan@mediatek.com>
 <20250320031753.13669-2-hailong.fan@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250320031753.13669-2-hailong.fan@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_045759_969501_C78B5961 
X-CRM114-Status: UNSURE (   9.56  )
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

Il 20/03/25 04:17, hailong.fan ha scritto:
> Add support of SOF on MediaTek mt8196 SoC.
> MT8196 has a Cadence HiFi-5 DSP core that is responsible for running the
> operating system and application programs. The IPC communication between
> the AP and DSP is based on shared DRAM and mailbox interrupt.
> 
> Signed-off-by: hailong.fan <hailong.fan@mediatek.com>

Hello Hailong,

after seeing this series, I acknowledged that the functions that were duplicated
between MT8188 and MT8195 are, in reality, common between more than just those,
as they are the same in your submission for MT8196.

Therefore, I've send a commit that commonizes those, reducing useless code
duplication.

Can you please rebase your series on top of [1]?

Thanks,
Angelo

[1]: 
https://lore.kernel.org/all/20250320115300.137410-1-angelogioacchino.delregno@collabora.com/


