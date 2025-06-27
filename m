Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A4BC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LnY4u693r85NHiCyk1/hxNPBsrYOBWfolLs1TTp5yo=; b=2hDqjG28ESxqO7RW0ofMZb2du/
	JKZaW+MyzL/+xaLv6Itcme3ogRh4yu0W+8Ft3ujlBVG1r563M6vY0qEzm+W61aKgyXNZjfar11w2C
	hd+T9WUTZ5va+VKTVsvpVrF7srI8Jq+54SdNyaDkJC8Pc6KBtDw6nGTfn5kZNTELO4d1muzYKpkQG
	I4vZNLWwyt/xepCBCudhLII1uI031q+ramRt3J7k4q0aaF+vP4TqOlORjeTdDJgMc9MoOz8SXMXmN
	xBuJXi+ftNQoy0dt9qr7lqDl+FGr4ZWxtSFZAPsF7F1jY5g81DeGk4MBmfxwJ/4TJD9et0Zz/OviQ
	N8lDmk4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBFr-0000000F9AH-3Dge;
	Fri, 27 Jun 2025 15:44:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAbm-0000000F0Hk-19qZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:03:19 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8D5D425B9B;
	Fri, 27 Jun 2025 17:03:15 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SKBRcaReXqhH; Fri, 27 Jun 2025 17:03:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751036594; bh=vHgbqqxav7PLXVzwShebkckuGfsjD85hkjxnlgD60cs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UoRytafxH9QzkSuEhGQ2HepLO3UAu131e4BI//9c+8132UHkDbOtLQKy22yrR3Eu+
	 wm6rc9/QwYtwaGKRMf+5wUb0VpG8Bd73pNEuw6KB53JRdiTiNT3nrdu/ocqSBQ/tdG
	 z3XTI9zd5bfUhbHVlIA5qZi/k8I5pYTVMNTcEvyipk1EaMxDglwSEhw+Z8RMdXSsd9
	 qnCfb7/xxNzFYjH6QYZZEqli6Ue6/NLlWgMPN6NPbM63P/9eE0rgh9ucZMJZYLBqnR
	 UrmYwITZxYabuYlJfhV9Twg+Ya3D8l5T8Rk1xedsz4xyRS7Rw2j61VvjNruw+On4XG
	 fuUX2QVvFmKzA==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 15:03:14 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Ajay Kumar
 <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
In-Reply-To: <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
 <85c3658fdfa90636caac3b3fce295915@disroot.org>
 <efa167d1-a5f3-47cd-855d-250f41a5e883@kernel.org>
Message-ID: <ab1a39df178b68e2f1d61a537e0d567c@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_080318_461169_45E6292C 
X-CRM114-Status: GOOD (  17.05  )
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

On 2025-06-27 14:44, Krzysztof Kozlowski wrote:
> On 27/06/2025 15:44, Kaustabh Chakraborty wrote:
>>>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>> +++
>>>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>>>> @@ -80,6 +80,14 @@ properties:
>>>>        - const: vsync
>>>>        - const: lcd_sys
>>>> 
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +    description:
>>>> +      Contains a port which is connected to mic or dsim node.
>>> 
>>> You need to list and describe the ports.
>> 
>> -    description:
>> -      Contains a port which is connected to mic or dsim node.
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          Input port which is connected to either a Mobile Image
>> +          Compressor (MIC) or a DSI Master device.
> 
> 
> If this is only one port, then just 'port' property, but I have doubts
> it should be one, because even you mentioned two - MIC could be the
> input and MIPI DSIM would be the output.

DECON is the first device in the pipeline. So it should only have
output.

It's either:
DECON -> DSIM -> panel
or
DECON -> MIC -> DSIM -> panel

Exynos7870 doesn't have MIC, but other SoCs may have one.

> 
> Maybe if the MIC is integral part, it would not have been an input, but
> then only 'port'.
> 
>> 
>> I assume you want something like this?
>> Is the formatting correct? Should there be a space between
>> ports:$ref and ports:properties?
> 
> Look at toshiba,tc358768.yaml or the simple-bridge (except you should
> name the input and output ports).

Okay, thanks!

Therefore this:

-    description:
-      Contains a port which is connected to mic or dsim node.
+
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output port which is connected to either a Mobile Image
+          Compressor (MIC) or a DSI Master device.

> 
> 
> 
> Best regards,
> Krzysztof

