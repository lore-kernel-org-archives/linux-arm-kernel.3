Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D5C71137
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8FVl7iw2OPmUTyS5YxK4bwWFOWwYw/pSTt4UiTlbljo=; b=FYSgUuD05zO4GRxpGh5RHqexV3
	P8wez6XwxVEUb6GRGRJlQFbhri7td71jiubtVkhqtVUyNmQpcVTNEjvAaaAXIOtDnrJvL03AbSN7r
	isu4RkGRtbox2Nza6NJct/mVb+BE8+0vclku2+qrTluK5z+puts/6Nvx8nD4L7/bvaq2bnrjSJDYD
	2/Fd+QKJNqsChr6WF7yAOf873Egtj+ZSBWW9bTror6E5Is+moTy4Rq8FkWfzahGAI+dBZCQ9e0kpG
	hhGqBoSobwFv0ZNk3yp/TPDuInr7EHX1UFSNSxndln89FWxax64S+8r0QRiFgZgsADjbHeBWqp5rM
	3KjZ8nkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMks-0000000A9Xe-21du;
	Wed, 11 Jun 2025 14:48:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqF-00000009UBB-04Kc;
	Wed, 11 Jun 2025 09:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8FVl7iw2OPmUTyS5YxK4bwWFOWwYw/pSTt4UiTlbljo=; b=YssMNAqcgprJHjw5rLnQkNNPNi
	y81DQnTtPLl5Kue3YHRCZueIl5Uo2lSVu4J+N+bNu7CgcE9KNWyIeM9RSgliKOfQYq/gkm+iX3cuw
	Puo4AYJ7RPffdr9D8ke2fe+/EB3C09RU37DuDmmyvB0M2NYHo+iFXWdt2LOaSzDt1R2Ay8oLWQ8HG
	x7xOEz4POBssiZMHZL/38jSsHevD+sXO7GetGXrcXBSQMnlQFWFoN1FjjEYRcJ83DFXERH4BOvjUU
	3Vtdb00FMzoTFc2KMZrmpncQw6MhsQl4AhUKesjWYp2AzGpqrMwqfNA5uZiGMnPL/2v7hENvC4EJY
	L9pkfuWA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqD-00000002EaE-0WNd;
	Wed, 11 Jun 2025 09:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634431;
	bh=aVqfa+rUoywoe8vYl+T8e4/6MblA1+D7SSSfmwI7pFo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jwCAm7igJDiNWfPFK6ayvAuRcMPlY1z66lq7UJ37mZGM1K8yDZ4nqgA81Uz5ClO94
	 Yzdv8bfwZ3FT1vBwtw1s/47Ihi1g6glMmOe9uxtuK+gD5LA/JLAVg8rBoLRO9WzkOv
	 Q0S97y5n4zSgKyw5C4rgcBcbQ/C6R0NW6C3hcaKsjUV87IX7oyJHHNZJHzFi6y3v/V
	 KMg5JLdIgSNAKaubYqbj4lmf+bvGoMKowCP1KMm/EgKB7oCB4e0agMFUpkrHEusU4P
	 m9dHi+OheXfchlPaOy/nVPO67AeQWIS9XrAPyJVUfrs4xcBC4UyPggXuLwNVGa0jaZ
	 IRF9KrlWD95JA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3D8517E378F;
	Wed, 11 Jun 2025 11:33:49 +0200 (CEST)
Message-ID: <44c53bcb-3df1-41b2-a5ba-8024cbad4aa4@collabora.com>
Date: Wed, 11 Jun 2025 11:33:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/13] arm64: dts: mediatek: mt7988a-bpi-r4: add
 proc-supply for cci
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
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-9-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-9-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103353_375758_B225D3CB 
X-CRM114-Status: UNSURE (   6.11  )
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

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> CCI requires proc-supply. Add it on board level.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



