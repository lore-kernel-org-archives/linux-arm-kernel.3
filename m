Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2ACC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/nopLGOv1+8dQTLeGIwVkMfLbbmxU+173pEhojUVLI=; b=pvlCN6WDTpcD09raEQb4nXjVtT
	cG+fGW/60X8tlRzjyClC6+rWWVfbVgz9I/W+YVzFMBGT2Yh5h4cBsjXW//M0ZBZHow7vZwDousxxw
	xYhB3D1QKo7gNk5Gj5eO62ixmVXuq6HiacNjsmr0XxYaKxep7b1m7pAF3hCnoKxLr/4NGKylbslGY
	deuhOnlRGKvpv2SitYy6C0wpCN1uL13ffGL1/Feoz3Ol2YOyyKGb9egqXhseXpK4sBHXJkwwky3Bd
	6ZOQVqBB7ezGokQpDSGfnfOZAiM7CX9/BPn0pAYuR0UCR021bWGVsNzSvA1Gu+HZe0ab1E5M0ILjo
	NUZTdcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgLq-00000003X91-33RX;
	Wed, 05 Feb 2025 14:26:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgHp-00000003WTK-2NPW;
	Wed, 05 Feb 2025 14:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738765312;
	bh=z4xLhAFLf/B1L/TVeba89CAK71hycjBQqvUHHn5ZRdw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZkGr9NCRwiKXGkl2q0INFs3zGNBYED8Zcn8p5X5Hh5aCphcjGV2K14e/S93fZL1Ax
	 mXbZ0jWnnLCOidjAqQ52ku0Bfpl4+kIdCtynjbAInpPhjCbKO8RKmE4E1CrNV/Ierl
	 WNZV7t0Px1T+X0QOIkw+RWwSSIFEHPw/A8XvSNMk4ND90cP+TxQuakyBKYJRi43pR2
	 6ZrGXoM2atJUZOCN7J8+vP9sqrBXRMwprwrvC3UQC8BXZl5gGLUMHSileRtogJCA7g
	 PhTChgWI/hrHcGxWOXTSog3UFGxfCVwjAM6GIxpntrsbGc5UMrVhrCx7bkYQX8jsH4
	 Lx8xmA2qshMtg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 815C617E153A;
	Wed,  5 Feb 2025 15:21:51 +0100 (CET)
Message-ID: <fa193392-0057-4bfa-9674-8d92062d74bd@collabora.com>
Date: Wed, 5 Feb 2025 15:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt8390-genio-700-evk: Move
 common parts to dtsi
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
 <20250115-dts_mt8370-genio-510-v2-3-fc9b01d08834@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250115-dts_mt8370-genio-510-v2-3-fc9b01d08834@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_062153_754697_12739DBB 
X-CRM114-Status: UNSURE (   7.51  )
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

Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> In preparation for introducing the Genio 510 EVK board support, this
> commit splits mt8390-genio-700-evk.dts file in two to create

Again, "this commit". Everyone knows that we're reading a commit, so "this
commit" is obvious.

> mt8390-genio-common.dtsi file, containing common definitions for
> both boards.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
In preparation for introducing support for the Genio 510 EVK, split the
...blahblah.

After fixing the commit description:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

