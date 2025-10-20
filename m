Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8302DCCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z4M66wR//JU8F7lni0r8fq1OCFkT24pRaVTxkJundus=; b=mXvmqYTU/u4DXauFTuRFabmin5
	o97TOKrYfQPsvdygJrr0fLXx5ekq10WvSmuGD2APbWMvh9PtbvTN7F21uNMntIu8M1/0hGKCk2lOq
	9vWQkH96AFbYDtpzyM3qxIStLWu71d6dEic+gbggY/vDzVtkRH1WykejQFMJ/6LkpHavWv4yzSSNm
	cvripia6+3hiV1Z2OOQ2iuggzvb7D/tU6jrhffeGjivDDAglj6zsYDcQZs8WMEAKg31xlJtR95TgA
	JIp/aHTHfceWrUnKclJKntvenQ06u81OPSwpMPCf+3KBXzzRH8uhKhk5jc0aTigHyKPouXFcHmUXt
	Eq0Gs6kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkg-0000000CiYX-0ld3;
	Mon, 20 Oct 2025 10:04:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmke-0000000CiWV-0XH5;
	Mon, 20 Oct 2025 10:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954664;
	bh=TSQ1O9TZH171lduwyZFqhbsEFJNX+R5Wl3LdaC6jVCE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CH+UctTt8HvyE/iPs6B/wGaSmV4/fgQZ4QkTgks/VTHtuBBPk+tVHooYo76AcmAdb
	 V9wSrjW9FgMJyDWox87nRVHyubDveOY9L8kCbIjJUBDVLeCh3cfDTICNLI7UJp5wsq
	 unGhjv0feF4HdEbbqc42yXzCpqV+ji3+35iHmt1CFXGaiKLGWcWvZ/6TX+6OZFfyq+
	 AZ5rRnYnyPy4m7rO1zH4swC8lpknvbEkcppJbRAKA7Hyv115r9rbu2juj4c6NLEBWb
	 DdgyuFkGqCnM3RZWRjtWHenDZf5va9VcQVQfr4kJDKrubxZayasHCsAXj/MnLyc5yJ
	 1tFBhyUqhoiUA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CCEF17E0FAD;
	Mon, 20 Oct 2025 12:04:23 +0200 (CEST)
Message-ID: <8adbea9e-998a-4da8-9388-7adc4102c572@collabora.com>
Date: Mon, 20 Oct 2025 12:04:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 20/20] mailbox: mtk-cmdq: Remove unsued
 cmdq_get_shift_pa()
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
References: <20251017065028.1676930-1-jason-jh.lin@mediatek.com>
 <20251017065028.1676930-21-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-21-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030428_334729_7A69595B 
X-CRM114-Status: UNSURE (   7.15  )
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

Il 17/10/25 08:44, Jason-JH Lin ha scritto:
> Since the mailbox driver data can be obtained using cmdq_get_mbox_priv()
> and all CMDQ users have transitioned to cmdq_get_mbox_priv(),
> cmdq_get_shift_pa() can be removed.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



