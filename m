Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D549AC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 15:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=552yr90urBhvBvN6cAihy9SNDNfGhvxsBdcKYn8Bqkg=; b=cWApzHTXc9Czrl3sppi8RWnQW6
	9+pn0EiQS0YN0OBnAsaO6TYMhrym/MMdtsEsSgUJ2pN8gKYxfsNNg066BD/rXqWRWrVMlPYnDSQYh
	31cq9OHoAOM/WFi7X5sO3UmP2cR9tZ6WtPb2fv1RAS6LohM2k/ayki9gNcodigYgZo/GKPbs2BVgn
	N52afDLgp/Ay1sm3D9X9IwFjaWjxwKEbozFACOQX97ccBh0w5rUsplmUoEJ//HTol7MuIn1pnKyDz
	mPE+y4sL+PYW7GdDQFst0ixMXyQMJgka4HMrfoCNrwv/b3n7J3+ZOXLKrDztATJmKY/PUK9OujVOZ
	ScI9RRqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqmV-0000000GW25-11Zv;
	Sun, 27 Sep 2026 15:27:11 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqmR-0000000GW1T-0NcL;
	Sun, 27 Sep 2026 15:27:09 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927152657euoutp01fee60fb85c8f744f5b23de099f9efd5d~ZNwQwVanT0796507965euoutp01Z;
	Sun, 27 Sep 2026 15:26:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927152657euoutp01fee60fb85c8f744f5b23de099f9efd5d~ZNwQwVanT0796507965euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790522818;
	bh=552yr90urBhvBvN6cAihy9SNDNfGhvxsBdcKYn8Bqkg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gjg9eQOWA0CxY3ngNhBHqtz1JM3KKcYnvAXf1eQWIfGbzS+ettayDylBqirZGSDZ0
	 4/LXiCaTIPkLLVpd5a2xD3aFHM5RQsqbdNfRkqEjajd72YE31sUYSbxWhMeTWRmQ+F
	 TWdrCd/edX3NzOp1vM2aOWlWptW3UGr6cosY45Yg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260927152656eucas1p1473e0b9575b6efc4ccc01e99783bf8aa~ZNwPrSQNF0222902229eucas1p1j;
	Sun, 27 Sep 2026 15:26:56 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260927152655eusmtip1c51d14fba318ce4acae93d017ad71be3~ZNwOCLRV_3134331343eusmtip1g;
	Sun, 27 Sep 2026 15:26:55 +0000 (GMT)
Message-ID: <a74ccc09-ed64-4915-ab85-232c6d953c3d@samsung.com>
Date: Sun, 27 Sep 2026 17:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/20] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Marek Szyprowski
	<m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>, Chaoyi Chen
	<chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260927152656eucas1p1473e0b9575b6efc4ccc01e99783bf8aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44
X-EPHeader: CA
X-CMS-RootMailID: 20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
	<1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_082707_746469_4CE1872C 
X-CRM114-Status: GOOD (  14.44  )
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



On 9/18/26 07:58, Icenowy Zheng wrote:
> 在 2026-09-15二的 17:32 +0200，Michal Wilczynski写道：
>> The JH7110 embeds a DC8200. The binding requires an SoC specific
>> compatible ahead of the generic one, so add the JH7110 to the enum.
>>
>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index
>> 919a9001220120054cb62d1d01b7293367266f95..05a202633cd273fec358c095c64
>> 584d959d96d90 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -16,6 +16,7 @@ properties:
>>    compatible:
>>      items:
>>        - enum:
>> +          - starfive,jh7110-dc8200
> 
> Note: this binding is being refactored as part of MA35D1 support
> introduction (this SoC has a single-port DC like a DC8000), after the
> refactor the binding string might need to appear twice.
> 
> Thanks,
> Icenowy

Hi,
Thank you for letting me know. I've found the patchset on the mailing
list [1]. Will make sure to rebase (and fix) after it gets in
(presumably before this one although I'm not 100% sure).

[1] - https://lore.kernel.org/all/20260918030125.315978-2-a0987203069@gmail.com/


> 
>>            - thead,th1520-dc8200
>>        - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>  
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

