Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F03CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PX0TVZRIO21hbfCK0qHSMvs3JqFsLEmMokOk1+GF4bs=; b=CJFmeF9Lv29rzJNgcMPP/oHegR
	lFU4bNCS1XJtdYmay04g77WPg/11aOX56mlz8Xo/shIOE0/+vc7MJEqrXn63jVT6M6RaJN5aUq+t7
	tLrYnLTZjK7E1pUCgXloddhPMChT9N+exO6PIt6Kjt4/hB4h/XAmUP2urGFQ1qNOYyr0Qq0sUHn1N
	OcVsJUaVqwlfnFEwWNzMVe+CKVVwlaRntVhjL3qWUHK+Eu4H1+NEpWJPLtmQ4+o29mLb3p1Pcirjt
	E9h8X+UqSfEQuZww62mgo1Y+JKKGJR2sVrK9+qwIXW0gKVrtWgUFCr25cCQ9YkoBHoW6hI/upLLGb
	3rutOb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSJ-0000000Cvu8-2eTc;
	Mon, 20 Oct 2025 10:49:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSH-0000000CvsW-2iVw;
	Mon, 20 Oct 2025 10:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760957371;
	bh=f5NRPopbIABr/yUWGqy22uRXN9XPujqRZDh6gopa+Z0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kjZ+jMoItKSMENuJPgHOULI6VlerddeI/0mwdoYHSgD1nPKueD8y6IzGkQc8lcWhl
	 rJwWDLouNiMC6fuCnxt3UTTs07Ifv5R3QwDzJljgnHNsUSyoVfRnvYCdNIFV3AfSK9
	 gSFx17+UQKU8hMAab7EHCTRGcs1BlSY1bqT8TO4o8EL/FU1+eCMy23/xDW0xHN4WKC
	 rP81tMKXwnGJ3jSv0zFLFBmp9UzG5mBWqHv65zI0jw85yxkrb4UVngAX/JAqxPyV9N
	 zXmVOgH3asNjzUgn++aQ1u11pK659XdhRCJUas+YM425WOSgYLKnwwTXfMjrf/0Lyi
	 hxqYF7Cin25Ng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE99117E0FAD;
	Mon, 20 Oct 2025 12:49:30 +0200 (CEST)
Message-ID: <c55fc496-e297-4b11-88e6-c4b6fa27d8de@collabora.com>
Date: Mon, 20 Oct 2025 12:49:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/13] soc: mediatek: mutex: add mutex support for
 MT8189
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251020074211.8942-1-xiandong.wang@mediatek.com>
 <20251020074211.8942-14-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020074211.8942-14-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034933_855118_84DA9520 
X-CRM114-Status: UNSURE (   9.05  )
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

Il 20/10/25 09:40, Xiandong Wang ha scritto:
> Add mutex support for the main and external displays in MT8189:
> - Introduce a new DVO1 output component for the new mutex
>    settings of MT8189.
> - Add a need_sof_mof flag to configure both SOF and MOD settings
>    for the output component.
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


