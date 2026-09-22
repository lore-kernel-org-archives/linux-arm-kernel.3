Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B199FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZc72lVezmkXz2G7Jp1DA5jGItZ0xUg8PC4HKJRbhcs=; b=DhfnHshjZV23NsSRiVjw/xd+85
	HC0ril98xSJOqq6Rdiq/wJIw4pJyaHW0YWtX2Kqb/a1lAj8z+iN6OmELBsJj/2rKjsKKogSujDYJR
	RAUhPjiI1vr9lOe8D9hIXOaADYsA+wF11UEsdNSxZ4OCRcVqlI/K27s2BJuWFp7qH6VE0HOXrIgid
	ZQ6ROuB9OhJ87YEpO44p+O++7wpd9x+ruNpmCFTAvqvgmJh6BQRYLDK4DgMTFQLof8o0sHgKtNHjH
	m/haHnabmPqO/REM8Hl7E3Af7t/Ro0e37quqP5fphfB52J5n5ZzppXAl2W8hPqGcX9CZmlQgCKc8U
	gjG6TQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr2-00000005CEs-0WcO;
	Tue, 22 Sep 2026 11:40:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqz-00000005C9w-1fJx;
	Tue, 22 Sep 2026 11:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uZc72lVezmkXz2G7Jp1DA5jGItZ0xUg8PC4HKJRbhcs=; b=TvXRetfajQG6D9tH1XSuckdTAl
	4z+QXtUT6CN2rUA7zO4TmktV9vAfKGsH3/Zkbqu41oFu1s36Y5JRUtrl91yS8exozDAsf5BnBfEtt
	dgCqaIGOmPb5CtXGOll1AHqohDjawddhG3H+ScTb5eeJIICTAmU8JqkrEyDY5klXFK1fH8xPeDALa
	k+TqW9/YY64j+s5l5EQrXp67WrZ+i/CHER9eBWMDcWbe78Z5K7LBkjEnveh0IgKdvuZ7rf3dcAKt6
	XL0O/ZPFlMH0n6xdFJ+vnMgh24kOZatl4Q1vOaqCrcI4KCe8F6fn37pTi/joWD9HqrCFl7d2RoDiW
	UrVsUDBw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yqu-0000000DV7H-47Mq;
	Tue, 22 Sep 2026 11:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077196;
	bh=BlNsu5y9N74CLlypKsAoY7D/nmyC2bMJlD/FQtgwghU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b7KFLW7yKcvOZMkUaajcF85BtYI+3FnxF0T28XELjdze9ubwlApkbmJ4X4Zifly0C
	 JXHizn672BzzV8pnNR/24FOSDbUoNsf+71cFtdEDBDvnX61qa2FknG5G1+UZfyCeE1
	 g//hzZHf+oN1pAXf2/hQ+Oa/Kc/3RclddNiyT0qvVheB4rfxxpKhbAU1iYG9Ou3oq0
	 nw3voyE0/4hdjbrmXH83Wl/sMQImVsl6jVl7cWpsKgrjfy/rUI4CtGUB7A1XWvuuL3
	 4lZvoc9GKc7+B3g9pl7w5AyXCKd0YbdgUfCxeMPv+ThYbM95pVqFCCTHtftJsSm587
	 T/L9Wrzct1t8g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C505C17E0D7F;
	Tue, 22 Sep 2026 13:39:55 +0200 (CEST)
Message-ID: <b1730fda-67e2-4f07-bcb1-8ac18c49479a@collabora.com>
Date: Tue, 22 Sep 2026 13:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 09/12] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-10-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-10-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124001_206055_747046A2 
X-CRM114-Status: UNSURE (   7.58  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


