Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEABECCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjSj2BXaGOQkYnIFmtDUKAgdGqUwJGkNbvSdoYeCj2k=; b=0DqfooefWSbrO1B4CURJXPtaVw
	xd0yl5UedeXj3B+py7A9EP+ucwwTBlXs18ix2rGhDWkW6lVU8OJl81WkSoYgOSEEAwlUtPkVpRKqa
	ECFnJH5fjPnUmhpa8Yb5/38uHxdkSFxv9bH1WvR4fMeHoCexsB74rz2VkSewNbg5tCA3UeklK6wV6
	oITQaJR0RB3H+CIWJgE02aSb8JbL38YTZk4fqxC9lNdA/3+I+g4nCc2IJqwfyzLWl8zM/g69O6CXY
	IP6nqyEusKN2pd5oJHMrpmbL0LFdV7xrDOCGJ4N6/b2lI1VGMBlOy+0GZ2GFz8V8ZhHkUOi8EAsTn
	MIFudZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onm-00000005y61-0RiM;
	Thu, 09 Oct 2025 11:27:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onj-00000005y3c-2wRP;
	Thu, 09 Oct 2025 11:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009233;
	bh=IArN+RtuYOyMN6ifHcTZqjTU9T5GXTomdxvkjyTpvog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kszlChMxGCiSID1BGesFoQO5o1WuBuD0hz3VjE50XvSAyfFhRQA/CGlbeNy5kT/K+
	 RFtHcv4v29QHI5tgz6rZLLlDBlYm0o9gXfXFgIP5rmcjK6iH9iJ2YIZMn+Dz8I1qfG
	 VN1yJ+X/m/FE8MQxNJbhJjzZigYMZ1XKcuiFDo0TYhE1KnIybMG7ucfgiuj66F3g1X
	 m1RrZ0qyxwuB02TWCt60RmfvNckDCiHqVbnhtq3u8u19gIkG2rzV8Qu8qnUFHJodZu
	 62Z5BSDKJgef74B5rK+9oBx2Yo+m+44xk9WUhZqDP0WLploZa+xYYq9gB8hRo5tXZq
	 jFyJoQsjtdklQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E97CA17E01F5;
	Thu,  9 Oct 2025 13:27:11 +0200 (CEST)
Message-ID: <2834b895-d4e5-44f4-b8b3-c892f84ccffe@collabora.com>
Date: Thu, 9 Oct 2025 13:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/20] mailbox: mtk-cmdq: Add driver data to support
 for MT8196
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
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 CK Hu <ck.hu@mediatek.com>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-9-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_042715_905987_5BA35D91 
X-CRM114-Status: GOOD (  10.20  )
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
> MT8196 has 2 new hardware configuration compared with the previous SoC,
> which correspond to the 2 new driver data:
> 
> 1. mminfra_offset: For GCE data path control
>     Since GCE has been moved into mminfra, GCE needs to append the
>     mminfra offset to the DRAM address when accessing the DRAM.
> 
> 2. gce_vm: For GCE hardware virtualization control
>     Currently, the first version of the mt8196 mailbox controller only
>     requires setting the VM-related registers to enable the permissions
>     of a host VM.
> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



