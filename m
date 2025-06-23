Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0994C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAhLw8ix9vTodMyuqVidjoZiElBE05wHApINWeqOpZA=; b=w5UecfokfuHyiLpTrjCetkc4l4
	FI0YDK8mm3ccFJvWEbfHCqE0wN52whe+8KE4dVC/sxm6THBPRByjbSJLj8oApo0R58pPTSw75vmjL
	Wo7HIUJqKgr6eYfa9RbOFh4wCQZX6nt60PcXpwHmbNh2YxJM2eI7LFlv0ZJskc/1BOU3zaJmpndPb
	py3zOuYK45NNFIgK2/QBvQYBDQhAtznQvUxqe8QXp8CZIzCiT5u8Rk3z1wBKcSpdGJs24WP8KyLtl
	Ft1f0rUq+GOcQj5Qy4ztUil5NcEyXTRTNFwDKHUHNKwPKq8evKpSdVa7NvBS7alH7ZXwax478+EnM
	oRq1JKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTf6t-00000002U4l-23G2;
	Mon, 23 Jun 2025 11:13:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdXT-00000002BTa-3j8V;
	Mon, 23 Jun 2025 09:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dAhLw8ix9vTodMyuqVidjoZiElBE05wHApINWeqOpZA=; b=D8s57iFf8jfRAGAC+643neiesG
	G/QfiSe0vM/bN7sK5JoHcORGZrIG9T/KGO9L8tgB+fAxUxARwybavua8TY8fCULinhJvJDiLKWAhG
	lIaPo66SmmZrM3pMFVHOvcykjEribcCt0zdMo0Uu1yywIKypyjAlElqRZ20JtShr8moBJO6dmWS3t
	z8s76GjP9YHjaCuP03fYb+lKpu8/sKhNn5kVl1in3elJsJwYq8SJScuP8swpS5C79sQHGZJbGyNzt
	pwsFO+Ycsj5CzDb4mM7r3TgSP72uqyYaZ6VKeCO2QzkoewCjLMHEbW37fSUJ8M26mHf5RimObERO2
	eea6K9vg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdXQ-00000005Akd-1Si8;
	Mon, 23 Jun 2025 09:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671146;
	bh=36tf2K/9hUByUZGrXncX4bNZ2l5rw2ra9GVPJ2PLCa0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MTBpNLRkEKEkVz5HWfPsaefWPF4KLf5W0VPAu0pSafLVBQ50mxtEzmfJwnPadjE4m
	 yo8PWJFEbbMoebAU+WCvR6UBobF1hZM6pMMo1iEfX0sw8zVm4JEjzmQFF0JdkuOzGE
	 h50nJ2XnOrBEunWptBVlVo9vCeJLQiKv+Vb13C2lk/Ej8ICx28iqexYbxpIDrQ3XUs
	 7OGgftAlLQRi2py9fggXQfhW3bW4Tb6y2/WGYXYN3TCXXbAUfnGUfkbcc8xjSutNa4
	 Mj5tSy/DMvjqJNVlFi9axNTVDTlCDRD3sZXtBxVVRcnXE7qRNibXxxbVNqgbzXxTDP
	 4XnKqxEcx2WiQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 30C4D17E05BD;
	Mon, 23 Jun 2025 11:32:25 +0200 (CEST)
Message-ID: <df51b1ce-a205-4e4c-90a0-e827f87a44a1@collabora.com>
Date: Mon, 23 Jun 2025 11:32:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/13] dt-bindings: net: dsa: mediatek,mt7530: add
 internal mdio bus
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250620083555.6886-1-linux@fw-web.de>
 <20250620083555.6886-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620083555.6886-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103229_532122_1DDD0DF0 
X-CRM114-Status: UNSURE (   6.37  )
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

Il 20/06/25 10:35, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Mt7988 buildin switch has own mdio bus where ge-phys are connected.
> Add related property for this.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


