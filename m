Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC89CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwNG8vJ2/dFVGTHMH5f891JHbQZiazfcv6W54xCxSws=; b=G6FZ2mRxzwe3BobdD7aQJwxPpv
	VltWSyUMbl50hch+4hVcH/SQi9eE8N0/XcIAfEs0YTFcz9pdN2am9k5MviNK8Li3u6o7AbclUokh5
	t9s6lgslUUZ02yPDIYMUlVWQ4KdS5a2E0dsnJTNCVbePfzPX4SjI6FO5zOj72Wx8mH5wwDC5L7SX5
	Oo+Y2ebY/hImOHxlUK2O5BRZNCxmmB2X8LV+MJSsLpmhHRXsbnuxdJrtj8FT5dfTLbKnCPDszaykd
	4kGX7lp19dVp/nPuoMCM8HoRVnDIWRUpao2SYnUN9vdz3XfZXbrFxxkm4wmLFplDRf+GCO7aODPN+
	WvDrab2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwK-0000000296V-2Tej;
	Mon, 29 Sep 2025 10:17:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AwF-00000002926-2xsW;
	Mon, 29 Sep 2025 10:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759141017;
	bh=f/1OQ8c/GwYQsJs2PTABxuE9dPKn0z3P5+u3vtzOc+w=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=h8f51fsBhnrIl9AhdurBpnywg7Cjn+965XIxuTAQPShRk6hebrrHEA2WfujwGaoCq
	 qE2UJuWmNoSCaUPbR1kslC+/WvS5NkOHjmX4EMQeJKK10K1n5FLdH+lo/61T6hmdxu
	 linoFifW235JxejaxrjLjg6xpBQLmeXWqJCqmQzQyyD0FECq+IrD1yvGYkrCrSgHEJ
	 cceONvKGu0ky+24BcFZVksh2q8Hs+N07wgWqUb2ulMu+Ga2YExkHchWevtiKeg/sL6
	 ieoxgtlai4IsADMLDwdphsIha4iEaxjOQbIKfwBttOoxSPMAYzij1m6FBaLbCybmrB
	 FeZEAFtO0wv0Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBF4E17E13B8;
	Mon, 29 Sep 2025 12:16:56 +0200 (CEST)
Message-ID: <48940f1f-520e-47fe-8f6f-2a9d852f80bd@collabora.com>
Date: Mon, 29 Sep 2025 12:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
 <20250925164038.13987-4-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925164038.13987-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031659_946210_6F152DFA 
X-CRM114-Status: UNSURE (   6.32  )
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

Il 25/09/25 18:40, Christian Marangi ha scritto:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



