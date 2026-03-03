Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66F2EC144C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SYlSKwxcdOuQwmCrvmPZXFJiFDHkc6g7d5W68uypmY=; b=EP6AefuL0N4UacBfd7hys2ltiV
	PgYmMJKnBqhxsQo54MagktLXYf9CGkjQGGBJS+rYV6Pew5b8cpFKqX2HAilQssZa6OhFJqhxCOjD6
	IOM8dM3sqnY6REIcCsyFjtjcqAk1Ykdinp3a3+lU8v88zvYV8N+3uUb8Gg/3LvbQcWQZtf05K3Ntp
	mOQn/tKBhrUhS0n6rLkGaBmk6dcx4vHdrPbURZThqD/ehTviFcEN+bSAc4dpfGdkdEfJZHt3ZvICq
	Oi6u92ROEcka3ZhPAqwFIt2kQDUph8vKcQEZQgcPW4WT+U033MJrs21vp7Y3m1yzZ9Si9h3t3tsXl
	ChWe/gpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQTQ-0000000FICm-3Dt9;
	Tue, 03 Mar 2026 14:11:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQTO-0000000FI9a-1btj;
	Tue, 03 Mar 2026 14:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772547092;
	bh=gqpj5LlBtH7M/NHlGkNd2PMy/VhJqn7LsUBN9beRTb4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iUOMBAPQf6QqMV9DwdlzOU9GODujSmrfgGXt3SXGgKc6ACzhdl4NDmaZ2XvuGWlfY
	 bD4M/LphRvhi9kXNjP4XEGjBoMcBItv9gqxKL97RQpzz512UfkhcQEHMPalaiGifKQ
	 IPgFCQpz2SPr5P5HV1emJvF6upCqj0XLAEU3Fh9dCSr0U24SywxCQU7I2WurUU1eA5
	 Itw5UyILKvlny34u/Cy4/PcOYJU+CpJbm/43e6qvzm+LVzbprt5yrS0PXhtK49OG0H
	 jKo+53AN9zN542I5m2yYObS49Q48NNrIPvoB8DnN/FCncbEpjHzQabVY50+3Cr6dEW
	 8t1ugUpQk07QA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4D1617E03E5;
	Tue,  3 Mar 2026 15:11:31 +0100 (CET)
Message-ID: <5b384601-cb49-4f69-8df7-f751c947c336@collabora.com>
Date: Tue, 3 Mar 2026 15:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: add crypto offload support
 on MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, atenart@kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260302230100.70240-1-olek2@wp.pl>
 <20260302230100.70240-2-olek2@wp.pl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260302230100.70240-2-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_061142_574286_E7F99B49 
X-CRM114-Status: UNSURE (   6.82  )
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

Il 03/03/26 00:00, Aleksander Jan Bajkowski ha scritto:
> The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
> This commit adds the missing entry in the dts.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



