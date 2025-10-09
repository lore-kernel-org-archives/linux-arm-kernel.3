Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E060CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEJ+V7psqGNaoFEovZsMQt2KfB28raRGxEv7Sc28xv0=; b=HU2T2eUDnMG9wfmSV7TsEAc33q
	ZAZIRVOsqPtpxlXU75RuyKR+Fzq3XG97cQSk4kc/vFVb/8LynKOOOXlbm4CeC/erBCjX+lUtD1Yak
	SW59WBdh33Asty6PuIa1IRMzUuV7FOsYQrUvSfGOdx8bB1Fp+5pc9YW60nJ6b2PUcCaH/k6grXFHv
	qavuttchfgc6HGuPDEiLM5xKG9uighyWXCVrJX1Qz3rdljrl52C3ao/NIPOZMHBjWgacUjarpeOzw
	62rkrT8DPhawvf5+NGbTe8IXGY+dq7Gfw4Y2bJesh5tnXg68Iv/2HCKT+Hx9RfzOIxs49c4EWc3DJ
	YGGLoAmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oqr-00000005z9I-18rD;
	Thu, 09 Oct 2025 11:30:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oqp-00000005z7h-05jD;
	Thu, 09 Oct 2025 11:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009425;
	bh=wkr+BbTt8ZNajYUzJRj7OVCp+ZUk0tcmtntRu+lp7sk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N329Svei5Ag7vKH4/YNBrb5lKtrWlj26RCd3ev9qO+Her1rs7PA0RdOd0s2+OtvCV
	 oXH7HkOBckPuvY5/o0pMEM7PoZAbI18Mo0WNeIEp/vTpc2DwUOk7O4+j0JbEB3d7Fw
	 +WAru50p6h2Vbx/QyDBZbofEx41SNy8OKW9Uk0rioDYu8Gcn0bkI3RIEky9DBo5uAS
	 IGr+e0cD3xZZpqsPzsLJWTaFaJWrRA2sXYhzNyHCQwfB6upYVR3t6NX7wF7M8kcffb
	 nWH/FZj4nTwDspa6pChC4CCzhmv8Fb2lje3QPvbSt4BLZS3Htrmp9Z6Fc91F9WjF5K
	 mBaQ7du3GhzKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DE5717E12DA;
	Thu,  9 Oct 2025 13:30:24 +0200 (CEST)
Message-ID: <12fea2f5-997a-477c-bdd6-f40ff2baa17b@collabora.com>
Date: Thu, 9 Oct 2025 13:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/20] soc: mediatek: mtk-cmdq: Add new APIs to replace
 cmdq_pkt_write() and cmdq_pkt_write_mask()
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
 <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-11-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_043027_214496_5D8E57C7 
X-CRM114-Status: UNSURE (   8.90  )
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
> To support generating GCE write instructions using both pa_base and
> subsys, the original cmdq_pkt_write() and cmdq_pkt_write_mask() have
> been expanded into four new APIs:
> - Replaced cmdq_pkt_write() to cmdq_pkt_write_pa() and
>    cmdq_pkt_write_subsys().
> - Replaced cmdq_pkt_write_mask() to cmdq_pkt_write_mask_pa() and
>    cmdq_pkt_write_mask_subsys().
> 
> The original cmdq_pkt_write() and cmdq_pkt_write_mask() will be removed
> after all CMDQ users have migrated to the new APIs.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



