Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A258C369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB/HrPehJ8yBSz1jcdQAHt5d+DzA9WDigakwtL+7yQM=; b=p8qGHETd5x5cBPrV47hpu7r+6n
	XSqUbYPeQLX9bKtG5mtgc8U8l1QtrWvOlNv4sfO5S1kkPj9QHSXtO0HZ7JFgg9CAHbnxGOBmFU1jG
	3sgNGm6qb2mGdbD7+rYPzv2er0vLO/6QrQEbVpqEglPeb8iAFg+EBsupl6/ptZ8o4qtxcLwaErGG0
	8cG+UVBTi2qU9uoK+nvcIrhGieIh9Ru+l0YKjk4aCUjWp3K13nm17iUstgBVOTWJ2aeaXTCoPA8+1
	FS63aEIkyKAfN4KwXvAFj/J3SwqDZf0qFeK97cBciWQXRM0QyMPzjq60c5EinVVa2RfRUJdWlIrAK
	/HIkgq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lW6-00000003mUb-09eL;
	Mon, 21 Apr 2025 07:24:34 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lUD-00000003m3y-0Qkx;
	Mon, 21 Apr 2025 07:22:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70FD71FCE7;
	Mon, 21 Apr 2025 07:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745220153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pB/HrPehJ8yBSz1jcdQAHt5d+DzA9WDigakwtL+7yQM=;
	b=BPTWG4046AxS47RS7og1B9IhPUceoJjjieNTQ9pyyODZGK3f1/gv+okj+dogYvAFzkwdvl
	+M0W6IlJ1Dz/MbxF7uQF+f43IeqgrNNeKjue/wpfk5125IZI/1s11mwxasTW8qe+NX2vY9
	FoOuJz90Va8h3peogzG1AhpedOoqJDu4QUJAGvWNwbYgdHvwqNQ4+VtpGQFPS0TLZg5Ic1
	K0Jz9s25srNQ191xM+9UWbq4qgXFEKH1L/tSVng31v67fGi5jz4w/Zn7FH81E05MRNeN5C
	bqE0As9y5KhVnbufyPqpK7LH8kAl/9hIrW7+KJz0nxnJwF8MmbpQMADBIyuGgQ==
Date: Mon, 21 Apr 2025 09:22:32 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and
 i.MX95 I3C
Message-ID: <202504210722320ac51194@mail.local>
References: <20250421061544.2471379-1-carlos.song@nxp.com>
 <20250421061544.2471379-2-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421061544.2471379-2-carlos.song@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedtvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemtgelugdumegtvdhfkeemhegvsggsmeeileekudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmegtleguudemtgdvfhekmeehvggssgemieelkedupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopegtrghrlhhoshdrshhonhhgsehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtt
 hhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_002237_882142_93155CA0 
X-CRM114-Status: GOOD (  18.07  )
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

On 21/04/2025 14:15:42+0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
> 
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
> 

My guess is that the IP still requires 3 clocks but the integration in
the SoC feeds the same clock to two of them. I'm not sure this change is
required.

> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 4fbdcdac0aee..9255d35e2854 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -9,14 +9,17 @@ title: Silvaco I3C master
>  maintainers:
>    - Conor Culhane <conor.culhane@silvaco.com>
>  
> -allOf:
> -  - $ref: i3c.yaml#
> -
>  properties:
>    compatible:
> -    enum:
> -      - nuvoton,npcm845-i3c
> -      - silvaco,i3c-master-v1
> +    oneOf:
> +      - enum:
> +        - nuvoton,npcm845-i3c
> +        - silvaco,i3c-master-v1
> +      - items:
> +        - enum:
> +            - nxp,imx94-i3c
> +            - nxp,imx95-i3c
> +        - const: silvaco,i3c-master-v1
>  
>    reg:
>      maxItems: 1
> @@ -25,12 +28,14 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: system clock
>        - description: bus clock
>        - description: other (slower) events clock
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: pclk
>        - const: fast_clk
> @@ -46,6 +51,34 @@ required:
>    - clock-names
>    - clocks
>  
> +allOf:
> +  - $ref: i3c.yaml#
> +  # Legacy Socs need three clocks
> +  - if:
> +      properties:
> +        compatible:
> +          const: silvaco,i3c-master-v1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +  # imx94 and imx95 Soc need two clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>  
>  examples:
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

