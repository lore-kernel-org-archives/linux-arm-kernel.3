Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA8BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdUiAqzvCeYnrG/Eu3AqsBdAT5oIEHl6/+wmVwzVGl8=; b=JSburLjcnVaZVqId8HIL9norII
	87uD4zqCJTCpUgSn/FnA9dQtG+maTsT/d/PMya6+EkxaF0HSS9CzKeBYiiAdaqYTRtgbxGcGDM+h1
	aFIzJ4SOfznHS+lRGSxlkOt6Mnu9+TzxHf0X8V5nUi2UTbVtjyCTRxTKrY7AGHD5gIqZtWLxXhaNw
	mCmzOZMDtsDzc8/vW+JtKp6ywsh4a3oxxEPOIl4xTh6/t5Oh03FIhUcWRXhW+1Mae42/bMY4xlblG
	MD2yZaNtx83WrAp3GAkjjoNpcAScFHecxS6U9vHFPZQM3i0sNowNJTw+zqZZIyp0S4SufP49S7a0a
	YpEux/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmlM-0000000CjJ2-0FLe;
	Mon, 20 Oct 2025 10:05:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmkt-0000000CioB-1kzn;
	Mon, 20 Oct 2025 10:04:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954681;
	bh=Z4HlAqmuEginOGn4nx1Uy2m/t52IZhvWc16fAqzsR9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Myqrzj5wOwTgtZKe9MGN5uLeKEMGcny6m9AWkZzMGkIoDoG6jJnZllSTOZ+vHWdPh
	 QKb8iIz4wfiJonnz3wcRzxwCy02tGtZDbjl3KyW2uyc5JvsaRNpQ+Es8seDB0tdaxp
	 WDwJUudnsHiwCi7/a51pNMG+52ZZ3w1ks/c5EeJybo3Rv+ukC81cjBh3KxZ2HMXzZM
	 fhcGB9dZqbXMN2Hqp0TEORMuXATKr+tqMRO9F6YqOzdO4B8uMTFdzN9gC1FxGciAPT
	 owK/uaOi2odutmhOjjICwhswiHvVfGWCjgQdaxtrDR2Y9z1gHx0vxKyIDI/oMONIJX
	 X5y3tCRWRcwLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CB9C17E1278;
	Mon, 20 Oct 2025 12:04:40 +0200 (CEST)
Message-ID: <f3d6bd0e-d682-4798-97a0-8bd60923b006@collabora.com>
Date: Mon, 20 Oct 2025 12:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/20] mailbox: mtk-cmdq: Add cmdq private data to
 cmdq_pkt for generating instruction
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
 <20251017065028.1676930-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_030443_639951_FECFE471 
X-CRM114-Status: GOOD (  10.07  )
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
> Add the cmdq_mbox_priv structure to store the private data of GCE,
> such as the shift bits of the physical address. Then, include the
> cmdq_mbox_priv structure within the cmdq_pkt structure.
> 
> This allows CMDQ users to utilize the private data in cmdq_pkt to
> generate GCE instructions when needed. Additionally, having
> cmdq_mbox_priv makes it easier to expand and reference other GCE
> private data in the future.
> 
> Add cmdq_get_mbox_priv() for CMDQ users to get all the private data
> into the cmdq_mbox_priv of the cmdq_pkt.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


