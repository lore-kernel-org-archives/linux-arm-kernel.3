Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051B3C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/Cfij+Q5hH5r5YCJ8SjzJRHCMas/NePWqksJcwwvao=; b=gmAk0FGxDPrnualzkh6MKj0sWz
	t7ydSf9XizAHcFnpBOgEzYW2hfWjSNZCiXN9WbO2fgoZzLnUQ8zq3HnN4SJCQE1HK5vPQYyGiWR/X
	jflXbHcbm2aJfQS6LES0zgfoeU3C4e+IFlkG1p7SBpkBW5iXgNkRjWGq+C5Fudq9Gozn72AujOX17
	umFIDkreOHRr3V5c8riE/Mo/mxJcqMU3aA9e6bs9/BInUsGhgRh4FkTHOsatlh620UeIGAGLPMKd3
	rIIP7Ck9wFU2goaUii5eZnd/43OTmuYyEeR91MpW3wtBFKBoNFfZw1qSeQaPqkI7pUkovfw90lwtg
	ce/e5+uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvi-00000005DoT-0jh0;
	Tue, 22 Sep 2026 11:44:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvf-00000005DnN-2RFK;
	Tue, 22 Sep 2026 11:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077493;
	bh=W+7CB1tky3BRVS0DPQGa+VxhsQuoLSseXPxz/cl6bvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TOwCfCesqdcEZrUL30zGh1tottDeXc8EQHe9NfbzsfE0stQOlZiN/Yy9YlHuwkmDM
	 DScFWtm3IreUeoVxdGRFG9A+fmjGIESxO9G42kDcOxtUKjDCJWEBrPIGhxsFu6th/5
	 at8iSCo4obkHoPlVsjTMdwqc3pWQWkgyRdEMD77WDPOIGqbP8SkNdXo7e0nZXeHzg9
	 cwlNJlEnSYUfPC4KmhAvIpRDbJCVNcw40UIRJaw7Uw+ABNbsA+sO85gc5BRx9EkVOj
	 H8U0y/TD3mDIiXHvPma52E/VqdE2UhQ7KfFHoW6LIFWEXiiXmuK+apqvNptczsFxqs
	 ZkvYzRW2Vks2g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D29A17E03B6;
	Tue, 22 Sep 2026 13:44:53 +0200 (CEST)
Message-ID: <4e68e679-f4c8-4a5f-9b06-f1c61dbff7d9@collabora.com>
Date: Tue, 22 Sep 2026 13:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eugen Hristev <ehristev@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260921232819.3137721-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232819.3137721-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044455_779710_CE03E899 
X-CRM114-Status: UNSURE (   7.39  )
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

On 9/22/26 01:28, Rob Herring (Arm) wrote:
> The correct name for the MediaTek MT6779 audsys compatible is
> "mediatek,mt6779-audio", not "mediatek,mt6779-audsys". The original .txt
> binding was correct.
> 
> Fixes: e97c618234d9 ("dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml")
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


