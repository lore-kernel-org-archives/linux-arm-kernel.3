Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD739C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FfDREsi3mNWIRIpqGWEiUTSXvr2L7Np1B2V7LTx2MY=; b=VpVIts2Op9A9Vhk/IGiLGnsy9T
	CM0gLHN+EvqTQrXvBQWtBKPnW5P9hAr5KlCy1XtY0AtLSBVVHFSAdZ69dCxLXNu3DyiocIcj/I1Lf
	fgZEP3RxxoPTLioAG+g9WuUeuUTOXTEJ0nL0zB+tq/XPmHe4E7wMvDlIZAOxk1GJCXKrwtXFQuIz3
	s8dCQS9NgP6xjATW8ZWuopuwcpUB/3r2HhY0HkQREgHS07WmaKSyW6V15k/K3W05uEHc3i9HQ/ejk
	fe9wp0mpIMYa17/6hFqfoUz1CvgXRcvZJB1XcrIN/CQ0mpLBO478Pe6YVjrkd5Z+0ZsfAJ1uS2rKk
	9Pugyw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZRN-0000000E5z1-3gy9;
	Mon, 24 Feb 2025 14:28:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ16-0000000E0Au-0UyE;
	Mon, 24 Feb 2025 14:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740405662;
	bh=dbw6dXg5TQeVowkeoYcRgmEHG8zpRcSKiLa7Cj4uv/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M1GG7ZIv7rz7MMMQd7tgm39CzSeYcobCtvKgXQKcjGYpZvW6Vx7EjKpZqjbfa1oo7
	 cmDcS9wSJMxNz+GekADGFyfAS6s+p7ksVtm7nn9L9fw3PbkRSKH8MvLiPk1VqjxWTZ
	 nxIRVhlWiwhG79GGEYgn2wKaJliYaJZYXIWgrDh2wHA1tzRTdC4u7D/Gm0LI1l9vUI
	 Z41UoW8xIACcsKDa18+jjKpPo2S9ldrSVj/iPKUBy37eqQnBW+3882xcqYJELo//Cx
	 VGFsAaHfERb/OHLKTmNdVscSwxwc8efuE49Uc7/mm7T+apJQQ86FkPlYy3CB35KGC+
	 3zHOq3n3fQ3Vg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A97B17E0DFB;
	Mon, 24 Feb 2025 15:01:01 +0100 (CET)
Message-ID: <7dfa6548-c2ad-4492-832d-87dea1ececf5@collabora.com>
Date: Mon, 24 Feb 2025 15:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>,
 Xavier Chang <xavier.chang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250224105414.3576243-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_060104_350642_CC9D9B1E 
X-CRM114-Status: UNSURE (   7.71  )
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

Il 24/02/25 11:50, Jason-JH Lin ha scritto:
> Add cmdq_gctl_value_toggle() to configure GCE_CTRL_BY_SW and GCE_DDR_EN
> together in the same GCE_GCTL_VALUE register.
> 
> For the SoCs whose GCE is located in MMINFRA and uses MMINFRA_AO power,
> this allows it to be written without enabling the clocks. Otherwise, all
> GCE registers should be written after the GCE clocks are enabled.
> Move this function into cmdq_runtime_resume() and cmdq_runtime_suspend()
> to ensure it is called when the GCE clock is enabled.
> 
> Fixes: 7abd037aa581 ("mailbox: mtk-cmdq: add gce ddr enable support flow")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



