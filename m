Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6559C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElPYPQY0AhEUWeQHjSRbpNvkdQSFvBUnJdyvmsTl2Jw=; b=xiIQy1On0RIY9Go6JSMkEWQCPn
	GC3uTuLYCaUjal4muaV0UHpftvmx5g0DgATAIOOiSdi4EEo3lz0mK2lE3lpj+qWQnUca5B11oNfnQ
	7ITKVO0VCvD09PbTGoFy1/br/JBxwWPmk+qypEkb+G2JZ+utCq7p6cCtLxU1cdyvhg76yyne3hap/
	jdbgZe1QnS56V68x10u6eLUlQvJK1fx1a+Mo13kFmJwmgwSvAmEtFs/4VdgpGaHkiWdoXTFo3heor
	/rR46fkC8aPVRvwkXNopOXY4Gc+p1D2TX+D9WvWwEQkFOfS5r/j96CN9tdJzA447sw5cKboKk1vpU
	i1gRQSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRd-0000000DRbg-2CYu;
	Thu, 19 Jun 2025 15:44:53 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDH5-0000000CqI3-2R72
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 11:17:45 +0000
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 6C2D7138062F;
	Thu, 19 Jun 2025 07:17:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 19 Jun 2025 07:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750331860;
	 x=1750418260; bh=ElPYPQY0AhEUWeQHjSRbpNvkdQSFvBUnJdyvmsTl2Jw=; b=
	QxoBD6F9lhYXLFS8dh8BbJDQ9t2ZaRWjdlUYdkcZQZJKCb3o+ZHFgCuFYBMJTDG4
	ICHugXFZ+durrqdLgL2LcWaZSWvBYG+aiRMASc0jOJ9K3SqfmXZLOf/kvh4UftzZ
	DnfK4hEoq+z4pRmGynx/McZAnpLU2k9ZtFhzHOO/4o4epoUjzWgg454/QPJv/N9z
	4TkygF2tEJUxOWtwttWWJn5QbSM+Bc7fOM++0JPmImHNC4vnHV7thXxd1xTcXNYj
	LHZh7H5tXOZJzKAAs7RW1uxmV6zDwNztYQ1JU+3rICFBq/qXaD/v19hIoT19tBqS
	wSJhknxYpK3mEj3Y21723w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750331860; x=
	1750418260; bh=ElPYPQY0AhEUWeQHjSRbpNvkdQSFvBUnJdyvmsTl2Jw=; b=f
	NZRVtxioYOpyfqjzUmGtm3v8N0fIe67JK6VVdODfn+e+XB+hgpINwdsJZDvkbd5y
	P8y578MUwvhEr3H0Zy2k+7QDDf5qYaPVzyTRRvDqJ0cS+Kgw9SEgs5+lTpLANQH+
	z/X/uYK773jUpNu1sflTFiwTagGWvNitW/yyVspxdHKeGruQxANfn3sDaDFCu+Em
	O4ylUM1IKAxNawBJ2D9Yz1DelRm/miizBXxCEHsqIzNOvHrD/PmBVBIRPClRqTZC
	kddgqBdqQixQZXuU3wjByND8PPoouB2JPuR+8XOLbkPc3ebkoBdAeCDb+lBpzD8h
	aLaGTT1iffC5zQS7Eo3/A==
X-ME-Sender: <xms:0_FTaL7FfDSDc7sBj15KinQ7mwYrCtfL0mSZvtp6_YcBsHN8W4XVUg>
    <xme:0_FTaA4C58mUVgnVnEoHExCMTVRvbpBI0VnK7TIErj-lVIlhTcFDNdD2j_MrxipDi
    J-JjEkRio84-hxObB0>
X-ME-Received: <xmr:0_FTaCfMfINw9uR8yrr4wYAF63ZO-AOBNady8o0n8ePVN59t_sRL4XA2wWtUA0qNp7OarPwh_wb3xQTIAvxM_1aZ1G-ytqutoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrght
    vggthhdrshgvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepuggvmhhonhhsihhnghhurhesghhmrghilhdrtghomhdprhgtphhtthhopeht
    ohhmihdrvhgrlhhkvghinhgvnhdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhlihgvnhdrmhgrsh
    hsohhtsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepshgrkhgrrhhirdgrihhl
    uhhssehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhgruhhrvghnthdrph
    hinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehgrhgv
    ghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuh
    hsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:0_FTaMJiZWaTFk-YJK9ay3-CFEBjRuteXGnZZr8d4D5Ah_zp8bAwMQ>
    <xmx:1PFTaPIcATMfx_p1l81YeFgmZtNgHIgpowsI4hXXieSv0Zuvy4IE8A>
    <xmx:1PFTaFxbecPjOQ5SIqjGd8JZszAPBaJ75nFWPwORTyMAI3v6l4xJvQ>
    <xmx:1PFTaLIfLrZs9WINNZZ1rTQtHbmBI0rBbMtykD8MSRAHJKYnYXDGUw>
    <xmx:1PFTaB6A6YclWYdCVuO3x2AntqqpZ2SjApFoW2IKUAt1a-_OUOXd5odF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 07:17:39 -0400 (EDT)
Date: Thu, 19 Jun 2025 13:17:37 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	"open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)" <linux-gpio@vger.kernel.org>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>
Subject: Re: [PATCH v4 08/19] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Message-ID: <20250619111737.GB2847778@ragnatech.se>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-9-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618095858.2145209-9-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_041743_851123_B69111B5 
X-CRM114-Status: GOOD (  14.77  )
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

Hi Cosmin,

Thanks for your work.

On 2025-06-18 12:58:44 +0300, Cosmin Tanislav wrote:
> The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
> the selected PHY configuration. Use patternProperties to document this.
> 
> The input ports are all the same, use patternProperties for them.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../bindings/media/i2c/maxim,max96712.yaml    | 29 +++++++------------
>  1 file changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index efdece2b33b9..f712d7cfc35f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -40,27 +40,15 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> -    properties:
> -      port@0:
> +    patternProperties:
> +      '^port@[0-3]$':
>          $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 0
> +        description: GMSL Input ports 0-3
>  
> -      port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 1
> -
> -      port@2:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 2
> -
> -      port@3:
> -        $ref: /schemas/graph.yaml#/properties/port
> -        description: GMSL Input 3
> -
> -      port@4:
> +      '^port@[4-7]$':
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
> -        description: CSI-2 Output
> +        description: CSI-2 Output port 0-3
>  
>          properties:
>            endpoint:
> @@ -78,8 +66,11 @@ properties:
>                - data-lanes
>                - bus-type
>  
> -    required:
> -      - port@4
> +    anyOf:
> +      - required: [port@4]
> +      - required: [port@5]
> +      - required: [port@6]
> +      - required: [port@7]
>  
>  required:
>    - compatible
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

