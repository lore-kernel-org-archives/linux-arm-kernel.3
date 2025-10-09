Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE20CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JN1daK9KHKQhqhlBM6qWbsrZ0fPAiEs+TwHbV5THUI=; b=JoL5kOOnDW3dqoqtSLGXl8qEz0
	AJiuRc+p+CWvmq0biCCwz2cf2OEVI5ThG8RHPeglP+09pvJ0RKU41/jS4FAiKBqez5Vxy9OArZsiX
	rrA9T6+l+yNmryc8qYysWARsQtjSavmAaggMYt1f+AiV77m53hFKFbsXZWnxXp827aEhn+rXp6jpG
	HGswMlRVNTpMpAXU+i7/ziqUXFfpNVJQmkZ+0+U+lhDHKpTQljPwP89t+PsqaTOSfqcjY369Ks9l1
	gFRYcMJBCjYWOPgZLoFXyi4Z1VLaH9L/SMOme2uHGmWhPlduL6CVf9J6MoKziPG1vhgBqm1U8Xwel
	1prLM1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pG1-000000062Xn-07ln;
	Thu, 09 Oct 2025 11:56:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pFz-000000062X4-1Lli;
	Thu, 09 Oct 2025 11:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760010985;
	bh=6gUz+9JoOYVGPpIwvEyu26OypnA//W1aFpeDtPUjxaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqBTzWtIwjw7fCRFp/gWpyyfyqCXm/UzYttMnMyC/r1TKf7qGYKGgn5yqtrInqUHl
	 Jid+rfe2P65rn6jVjolgn1z4JPa4Iofyy3x4l2K3zZBEfCwIxJIo826gYYL/OJin01
	 mH0fV0lG135kAvX+eScECWBYLLZyS22U5sPhorLN/DPseuEWedVJTLYA3LunjwBp8q
	 D45/YX7uTqKi+Jb/tJsQsI7pnjqpt7qc+lhKEKmnHUtFoYmPgZQmhecXl2oeedGZvB
	 MU3RPYN33wgluOO2P9LeoepkZ2WfYOxBtpEDxnoQ0OrwjqPjoiktUY8wIIfmRBg0f5
	 JfX8GTG6naTxQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 70DDE17E0125;
	Thu,  9 Oct 2025 13:56:24 +0200 (CEST)
Message-ID: <9abaae2b-8e66-4e28-99c3-14cf3de13c8c@collabora.com>
Date: Thu, 9 Oct 2025 13:56:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] soc: mediatek: mtk-cmdq: Remove shift_pa
 parameter from cmdq_pkt_jump()
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 Sirius Wang <sirius.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Chen-yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-17-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_045627_517895_69A97BC9 
X-CRM114-Status: UNSURE (   7.32  )
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

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> Since shift_pa will be stored in the cmdq_mbox_priv structure within
> cmdq_pkt, all shift_pa parameters in CMDQ helper APIs can be removed.
> 
> Remove the shift_pa parameters from cmdq_pkt_jump(), cmdq_pkt_jump_abs(),
> and cmdq_pkt_jump_rel().
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")

Drop those fixes tags, they're not pointing to any upstream commit, and then, those
are not fixes per-se, as you are performing migration, not fixing anything.

Cheers,
Angelo



