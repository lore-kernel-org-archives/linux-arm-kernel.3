Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F0AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJmqCleMofVCrnxlAckrfznnsnusT3VKHy9EugHM0EM=; b=i6uFyU9JepPhYnGrmrr9HmPdLr
	JjGHSanAhvMbZMXS/aBz2ovdOlHtVSeLEYW475UN2pAYyuF8dwUqr2dH+x+uyqXL682e6uaEu5v0O
	iyud/I0XpNzTYDaSLJ1kjL0jR4KkM3nkIqEc/Lv+yjbdYYiOK3bzomlgbBzXE1zxsNhdiC8WFHQ7s
	lfDf+8f5zxba4FABmkVH9IbV4/BNl0lXxtt2gpgBrkXdsWgPUVqHV/w3dtrL0eLBuL1Wlps0NilvJ
	TW8RorQEJw2b0eEHMhny+4B2vrGs3qpDYUeErC3gRQh/9p001U3Goffs0GHlzS6/TNfczwaMkKZ4I
	3tU4nHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA7C-0000000Ev96-2WER;
	Fri, 27 Jun 2025 14:31:42 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9NM-0000000EoJj-1BQp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:44:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 06D1620F6D;
	Fri, 27 Jun 2025 15:44:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToE2WMaHRbaz; Fri, 27 Jun 2025 15:44:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751031858; bh=cAEs2spaxPueJxKHXKyopePEl3MqlVBkN3UFzTPU8Sk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YhQHA0mIm10roynyZHJhCDRT7tmozYKY85f/YD9X9oNofLc0mGiDLwqbKW82kVMoh
	 w5iRZqBBZvckSbtJoKcb3DvAZ3wPtUw4J5N3d26C9Q8aRMARha+7wlfa6XofQV96de
	 zNLP2OqqBDOhqi4KZN8CSZjwkeEiOXwxVMyOmtQ6PQeK0xlYEM4Zc4NIDew8n2xNe3
	 Lg6CM3dmImHbDZn5gJ1hkJkjfoSxxjzJORpoLkqybzhVPenPktfkcqXa0OwQ7c3e17
	 JGFgVVGpynhtbga0NcRNbsWvi9m/EWA1gp2YqTYx3F+ua9gG7CHv8waeTpg6JY0Jxt
	 G0l4klyZK8V7w==
MIME-Version: 1.0
Date: Fri, 27 Jun 2025 13:44:17 +0000
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
In-Reply-To: <20250627-literate-talented-panda-cbac89@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
 <20250627-literate-talented-panda-cbac89@krzk-bin>
Message-ID: <85c3658fdfa90636caac3b3fce295915@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_064420_463292_DB20DAD1 
X-CRM114-Status: GOOD (  13.32  )
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

On 2025-06-27 07:50, Krzysztof Kozlowski wrote:
> On Fri, Jun 27, 2025 at 12:50:28AM +0530, Kaustabh Chakraborty wrote:
>> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
>> - May optionally require an IOMMU to initialize a display region.
>> - May require a port connection to another block, say an MIC or a DSI
>>   master.
>> 
>> Document these bindings in the devicetree schema.
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 
>> ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml 
>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> index 
>> 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 
>> 100644
>> --- 
>> a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
>> @@ -80,6 +80,14 @@ properties:
>>        - const: vsync
>>        - const: lcd_sys
>> 
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Contains a port which is connected to mic or dsim node.
> 
> You need to list and describe the ports.

-    description:
-      Contains a port which is connected to mic or dsim node.
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port which is connected to either a Mobile Image
+          Compressor (MIC) or a DSI Master device.

I assume you want something like this?
Is the formatting correct? Should there be a space between
ports:$ref and ports:properties?

> 
> Best regards,
> Krzysztof

