Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BA7CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozOwTgXAigrd5oHT9vBIbGfOq75N06JnpNcxCeXcBQQ=; b=feKzUJMgh2hoIe0xovLMekypLj
	0x07m4Y86R18w54F+41HcOQZVSCnmNAVUC2gg9QOWKjKC25x5VUg4u6vh0XujarRcZi2X7y3WQH4q
	KkjPFsvxdy8SBDYTZGYVbMdCXIk2zfDpkBxKrVrtS6J4UXfkr2cT6mZwQkIfE7B+is8LoljV48tgf
	p2osM5YZWWJcvm8t/KKWGIHvM4DWfDBPEQsVst1vOuA2mCbjA7q+1BVZKWBmHmPtEDwnDzvUC8Adw
	PZztvzwAEpT/FkVR33UfGTTYiqaXecXp/pPH/gMDE+HBAX/F7B+kNn9PRR/VrKMku9rmQEsaesX14
	vqsV9ipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmUF-0000000GJcv-2uHL;
	Tue, 28 Oct 2025 16:23:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmUE-0000000GJc7-1iNo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:23:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A1B46023B;
	Tue, 28 Oct 2025 16:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33A0C4CEE7;
	Tue, 28 Oct 2025 16:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761668633;
	bh=W/FEnj9VxOYcqmIZ+DDA0xkXzU5i3PtKbUPkgrRzNI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C6SeNnSGD+55bP4czAwMBmIYvjYQ74bgJnrP9sHnJv0CRjRUam9OxVbozOQNMHsKb
	 yi4GWSQkQYH2ts4476SpOCGYSWzempXK5e3MzQ+hKeXVvhH19dgGyLguAr1Ojb8AYF
	 aQYH+xzUQC0UbrzsJ/kxgLHUIUuZQaEshgsZTkXSj+80rGfs3AeEApLfJ0Y6n1h4KE
	 UYNXqyTUNXwM2qooCEw5TaIMp/IkErey4/tknYAlAGPsYS8eQqAHTY94b6T2nACAB7
	 TWrzUiUGhzw2pGN0qxChVTjvboBtIrPb5CX9XQiw4NTCvOe3HeiIGk4dlpppqmINVp
	 e2yQtNQdVodcA==
Message-ID: <a5e9f1ec-69f0-4f91-9dd1-387b3e4ace5b@kernel.org>
Date: Tue, 28 Oct 2025 17:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: display: panel: ronbo,rb070d30: add
 port property
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-2-683f86357818@solid-run.com>
 <20251028-premium-sunfish-of-feminism-2bc6ab@kuoka>
 <5e055ce8-e30c-45b7-993a-3ea8f8a796d2@solid-run.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5e055ce8-e30c-45b7-993a-3ea8f8a796d2@solid-run.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 28/10/2025 13:01, Josua Mayer wrote:
> Am 28.10.25 um 10:03 schrieb Krzysztof Kozlowski:
>> On Mon, Oct 27, 2025 at 06:48:11PM +0100, Josua Mayer wrote:
>>> port property is used for linking dsi ports with dsi panels.
>>> Add port property to ronbo dsi panel binding.
>>>
>>> Signed-off-by: Josua Mayer <josua@solid-run.com>
>>> ---
>>>  Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
>>> index 04f86e0cbac91..a2dc67a87fa3b 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
>>> @@ -13,6 +13,7 @@ properties:
>>>    compatible:
>>>      const: ronbo,rb070d30
>>>  
>>> +  port: true
>> Port is never the second property. Please look at other bindings.
> 
> Some places did that ...., e.g.:

Yes, finding few outliers is not a good argument. Especially binding
from 2020 where many conventions did not exist.

Look at the most of the bindings or the recently reviewed.

> 
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml-  compatible:
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml-    enum:
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml-      - mantix,mlaf057we51-x
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml-      - ys,ys57pss36bh5gq
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml-
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml:  port: true
> Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.yaml-  reg:
> 
>>
>> Also, missing blank line
> Okay
>>  and missing top-level ref for panel-common.
> 
> Does this impact which properties are considered required / valid?
> 
> Ronbo panel has different gpios / names from panel-common:
> 
> power-gpios: similar to panel-common enable-gpios
> reset-gpios: common to panel-common
> shlr-gpios: special to ronbo
> updn-gpios: special to ronbo
> vcc-lcd-supply: similar to panel-common power-supply
> backlight: common to panel-common
> 
> There are some other gpios in panel-common that ronbo panel does not use.

Just use the properties from the common schema where applicable.

> 
> Is the above relevant?
> Would it be correct adding the below?:
> 
>  maintainers:
>    - Maxime Ripard <mripard@kernel.org>
>  
> +allOf:
> +  - $ref: panel-common.yaml#
> +
>  properties:
>    compatible:
>      const: ronbo,rb070d30
> 
> @@ -48,5 +50,6 @@ required:
>    - shlr-gpios
>    - updn-gpios
>    - vcc-lcd-supply
> +  - port
>  
>  additionalProperties: false

unevaluatedProperties:false now.


Best regards,
Krzysztof

