Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D99DCEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giKe3hsqYQs+P5a1qPwMOEHn/DCpeC8WJXyZSlfEoAI=; b=ROmJg8AIDWV2W0EUSO8j5HyQ16
	Qbd/GA5uPpP1BO1RXM2ZqOu66uBe3BjLwAA4f1AF8idlAuO7qnNvJshADsOXx01HvnnZUocb4mNtN
	F006+KOACuutKb9U4fvxWsIGXifdC7kgGv6hToWu+sogkFfJdyAWw8qqpqSsdx4umlyWDOQfsfJg7
	qGrkIur0atLrsIJVQ5QvE+HD8CJ4bczHOYRS70qZrMbH9lKshwId97USRyeDvMtJjmFQ5Cdvm5sXS
	9j1lA7jL0wI4gYHwDd+4pbtJBfNUnfGEjAy5Fcgikw+1LRPkSUHSKoETPZnMnvGIV0Z45Ju20Jf7z
	zCbSH7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVN-0000000G5Yv-38E2;
	Mon, 17 Nov 2025 12:38:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyVL-0000000G5Xk-0rkW;
	Mon, 17 Nov 2025 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763383123;
	bh=n+whlhVXGNmROQDHpFtUuk6MoZNagUCrrAscIOv6pMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lQ05Haa58fPVLNVCR1XlSb8ov0bHY6rJxrvBg/wn4n+wcriVuIiExdEWtT2WUG1jl
	 dg4bug40KDpd6wp0hoFqE7d33SgxVd9GaFIxlcfIeAWmAZ5GWgmhLCVCP15NRDdtdR
	 Hl1FVirpj8eGOk5TfWm9kvRjK1ihWmEb7c7K+TsMVI0+tKXDHTI6+Zry+cjxiOUAQQ
	 4dguhNic9duRUhLoUtWVDWeD1uFYFn3ZpQgJSI0kiqvgBm8fhCF75SvDrxhuJNqLQn
	 TGzvhhNrF/TLH9VkLQbUZjVZ7o5i0HnRA1DgpIHVtLy3GcjJTuxSKbzqxvYfTokLq2
	 obgvmBaWKvUGQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D78FA17E1249;
	Mon, 17 Nov 2025 13:38:42 +0100 (CET)
Message-ID: <f63c1702-e847-4c45-bf9a-a4985baff1b7@collabora.com>
Date: Mon, 17 Nov 2025 13:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] soc: mediatek: mtk-dvfsrc: Get and Enable DVFSRC
 clock
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Henry Chen <henryc.chen@mediatek.com>,
 Georgi Djakov <djakov@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20251114-mt8196-dvfsrc-v1-0-b956d4631468@collabora.com>
 <20251114-mt8196-dvfsrc-v1-9-b956d4631468@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251114-mt8196-dvfsrc-v1-9-b956d4631468@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043847_399883_44958B92 
X-CRM114-Status: UNSURE (   7.62  )
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

Il 14/11/25 17:54, Nicolas Frattaroli ha scritto:
> The DVFSRC has a clock on all platforms.
> 
> Get and enable it in the probe function, so that Linux's common clock
> framework knows we're a user of it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


