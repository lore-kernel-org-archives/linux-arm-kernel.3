Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC71FCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpE33ixsZKka12SJ9vJFEx7XoP64MUoFBquOykC8kLg=; b=tNJSc9hCfE/6BAEIJsYSPFQ+h6
	w7zA48QcxFbRD4X5+qPUG88jhQK4rRthfiffhw9Cy3ZBAUZlD/W9+kL+TmZebzYK5+opoX9DfIlKS
	cgS/e8r4LyzjHBI+e7DhBCaJ81sRzMg9FXI9eRiA+oQKKX+QXM3oz35kM/L4dvkjMpMIEFjMoq0eI
	fEHrERGAGUABcT6TNT37jF5xagYhuOMjtuCpDtQPYCWS4cLG33Zrsu7FhDIfSG3kRJYq6qig/wQfG
	70EFxZRtvoSFPpv/aUH+q40YaLTgYnPMUiuarwFaJFT1BIpzWmfAkbc7OE/l+tAe1UawhyuO6aq9Y
	jKX4azQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmlU-0000000CjQk-0a5p;
	Mon, 20 Oct 2025 10:05:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml8-0000000Cj3x-1jZW;
	Mon, 20 Oct 2025 10:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=bpE33ixsZKka12SJ9vJFEx7XoP64MUoFBquOykC8kLg=; b=B6DiKt56PZut8P3Mxc/4s8Ydo/
	NaXKJa5d09mhme3SyWGQst5TewMb9B6pM4CIGUwrSaklO1mxefE/hYVKvtbOyiPp8cgafILyIHMsA
	Ss493p1eA6aB9EbyWHbpzzz16oQaM7pkxCKVjUNzxvnPKToqo4KjI9nD0754RUKorEKKMilT7AJ8X
	gKZtHgXpSyScZHa5kH+JaPvDExQDEaB67jEA5UpnjEqZdL29iME1nidsMzUyDCIzm7SucahzBUayO
	TMQDQJD9vFv9ETDataY6Yj5hmc/uL4DevMNqwteYXWVRqq8Oh5rpLvTV0x21ZQ15S+Y1jNQ8s/0DR
	uJMZAQiQ==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAml2-00000009hXb-1p25;
	Mon, 20 Oct 2025 10:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760954686;
	bh=ARtDZwsdCFqaJMeHgUn82RRxg6fZeKD7Hzqi7I3KSJA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cH2jcxgGTWXbL5Uj9plnlDcSy1rIpK6H0scnSzyf3uB+Y6IVZjH5SpJIZMPQ6J82p
	 AlZFZK26tN47zUgLf/JSIF15au/EParWh5QZ1QqcG+p0xF1xLetq4VtSgqjidZvY8O
	 RUXUtIqGo8f2xt3wrohwYKbmKJY0RtCb7jDlUELVaec2A75/e4777hmbpQ4z2JwZdz
	 Ap1oab188MzOSS48fZvU71C55N4t5SCGnAvArZcvQoI7HfSlrq6ISEAAZ+5P9nlf5c
	 ABovrbf1C68PpMuMneDeIEK8ifEP0dleQanTHIzgAj0WOp5w8518XbmCM46HhhTt6i
	 PMH3MFhCB0cqw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 611DC17E0FAD;
	Mon, 20 Oct 2025 12:04:45 +0200 (CEST)
Message-ID: <bd9a2670-008a-4e0a-9ad2-90bdad22778d@collabora.com>
Date: Mon, 20 Oct 2025 12:04:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/20] mailbox: mtk-cmdq: Refine DMA address handling
 for the command buffer
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
 <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251017065028.1676930-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110454_518120_268F019C 
X-CRM114-Status: GOOD (  14.44  )
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
> GCE can only fetch the command buffer address from a 32-bit register.
> Some SoCs support a 35-bit command buffer address for GCE, which
> requires a right shift of 3 bits before setting the address into
> the 32-bit register. A comment has been added to the header of
> cmdq_get_shift_pa() to explain this requirement.
> 
> To prevent the GCE command buffer address from being DMA mapped beyond
> its supported bit range, the DMA bit mask for the device is set during
> initialization.
> 
> Additionally, to ensure the correct shift is applied when setting or
> reading the register that stores the GCE command buffer address,
> new APIs, cmdq_convert_gce_addr() and cmdq_revert_gce_addr(), have
> been introduced for consistent operations on this register.
> 
> The variable type for the command buffer address has been standardized
> to dma_addr_t to prevent handling issues caused by type mismatches.
> 
> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


