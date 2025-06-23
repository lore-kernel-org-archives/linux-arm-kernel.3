Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FE7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 11:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/9SSmZ8YzY2Okeft29F/tmLjOli1BA9xBbdLb9bITw=; b=stjE9Vy2LEl5rmsWIJCVXd/7/Q
	h6L0fWyTmjmmEPniwlhm1w6GNkXmbUevcwjxYj/JqpokCbJ+aoCKqM7f+KrUdJSjgiRqD4kaVOBJr
	bIB16wYWiSUgNA7KC+IfKw46/lYL9KOpD+/n0acMoGR+WBuvb7DR4GMHAMhuiBhEh5u1gqKHzyFMn
	QEml9mCJVLaqs4N5v/Gvu1A88ma+pirimSmH7PyFxWl2zNqfTVkVuzlZyJsYQgMR9H1Qjeyfiuu5g
	meneERpZBufEidTYVLFZSWCRJamusrPeiQGbkAmqlXCWpd2dE9caqYG3Wj1Pr2x5TYzJ1UEi86Qfa
	hQ5fHPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTf9E-00000002UHj-0uNg;
	Mon, 23 Jun 2025 11:15:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdXV-00000002BTz-0EjV;
	Mon, 23 Jun 2025 09:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J/9SSmZ8YzY2Okeft29F/tmLjOli1BA9xBbdLb9bITw=; b=TaHwmfr7Es+tTrFhMalav+GS/0
	tduMlt9oKiJgaaMUATFa0b4w6ypoGwZfaS8fUpSgrk3T8P+uP2KEIjHCcZ83unPgwMgQTHBDekMPo
	BtpVFvPtd+xl/4WcZ6c9SLnfcm//epR7F4o2qZIfOiMGSVOYyh5h5wvJn0tLwX9+p6ukz2ByqS3nR
	vP3asXYW9Y/YLwBNI3JUg+SKyZGDfjIkZakBnCFl+L1YxN/vc22QQ01wQeMpnjcf2OjiVRBlqYiwA
	tjDRsFGeXDVWmyAPadJ8AOJG46lTJMftjv9FBCNsBiSYLxnrBPvGE23nDKilaOSq9UpmYO8mSmOwG
	I1A5Rt3g==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdXS-00000005Aks-1h4Q;
	Mon, 23 Jun 2025 09:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671148;
	bh=rp7QXlpJ88U461NSYjTe7hshUlrWe0crXomaDdZmcKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R8JHlTsizWSjQYLcBahFGj4zGojwUmlSMVkZ4ijKBn+4fH9DIyTZqMa3nllfw/usi
	 5cA1Aq6PqWhxsx+duJTf1OUW9V3+eRAaPuyBhZLe/yVTUi+LwhN/lfZa1Jl1KQtVHI
	 Axwss5Wpv2AJ2wY2EF1wwW4l+82z6QN5yEvdIOW/Rn6jGooeuGIUst+XanhGftoQxP
	 43Y1E4USahPp4Dqga3Z8bNso4x4YobbvUHanSJTGsTndRsjiV1UESz8UF/UeWQbx+L
	 RJfHk758fnyM6m8wSW0FaOxDwmCLm+pTiHSQzq2uMmmOJLbHPwUUNyGnJhTKQHRE9m
	 CowHRBTninilA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10BA717E0CE6;
	Mon, 23 Jun 2025 11:32:27 +0200 (CEST)
Message-ID: <cfb78d27-b4e4-4e91-b904-2632a574e08e@collabora.com>
Date: Mon, 23 Jun 2025 11:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/13] dt-bindings: net: dsa: mediatek,mt7530: add
 dsa-port definition for mt7988
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
 <20250620083555.6886-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620083555.6886-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103230_672370_2CEB17D8 
X-CRM114-Status: UNSURE (   6.40  )
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
> Add own dsa-port binding for SoC with internal switch where only phy-mode
> 'internal' is valid.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


