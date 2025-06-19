Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E4C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YyQ5OiIFkEPqrZ6SWC3ezO49kjGRtXe1tfiAaXtyqA=; b=BCZxsLMvBmx5HpCGv/ovA895P8
	m54PknWNDACotSwVIy6hP2/I3NpS3yrA4AqFywHDbeTRp3W3kntCFp2Rq5kVY4G90UUKzRmXg1bB3
	To9YB377nayGHadFmHSlQdoawyJj9xbsXAmPUVGTiVc+blf2ZaXPy1H08JQqTBv4tn+vonaPm5FRH
	q06HUr4RIhHqtGrZQnKFzVQsX1O/UyWM18OLhzqICOKjR3UGgksmZHJ1nV0mVFXXnzaz0nv+ya0Cg
	7Qs23BLDZUBCwJSUXtG8Pv6/l0NzaI6t8UpwvzYPa7Faq8W5EA3ZJWljHssP1TIO+/ch5zqacp0Ri
	RqB77Fow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRZ-0000000DRWY-3KEh;
	Thu, 19 Jun 2025 15:44:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCYU-0000000Cl2A-0DFK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 10:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0YyQ5OiIFkEPqrZ6SWC3ezO49kjGRtXe1tfiAaXtyqA=; b=D/pd9AO9QfXQ6CFkMGinkChWI1
	bFPKBOgP6xx1v/vN1CKs09kDr3RgMP218YSzNZWYrddpDCufRDLaYZWBZchXjsoSSGT4DZebgo9Pb
	CQoIec3BKRR9HMCYkDzXSFeLyOoyrqniWpG69E8jBPkz1EK/a65fljZB3E2BskooOILI/Km9Xkm/V
	9QQi4zbzJvNjorbpy9D8KuRTizvOQVyC54XmBGziqyA+d2nklnfrjlMi13OXSS7MvGrb84pp/vSBi
	wJeg/GWzOWPQ79JD/eaXCaot3pu+UE9gOqrUiZk+wrQtkE4EvwY6b+c5GS+Yvw/zBxWsF7rKCJ83h
	DABngJVg==;
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCYR-00000004Phg-1Qol
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 10:31:37 +0000
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id CE3201380642;
	Thu, 19 Jun 2025 06:31:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 19 Jun 2025 06:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750329089;
	 x=1750415489; bh=0YyQ5OiIFkEPqrZ6SWC3ezO49kjGRtXe1tfiAaXtyqA=; b=
	TJGRQL3IigmqzKvAfzT0wXmFihWJZGSANSJH8RlXldFok9lQsRqVw2nO29suTFy9
	6F+wdYVjeKlY50FnK/54E6112q6g1izi0Ghmac1pbnPiOXDVqtXiTR47r6MHw97d
	0Ijlh8hRvEZJ47l9HpOHYNs3Liv9+0qQThxSi9yvA0qXt+qsUt21Y6QGcwJ7Ee7S
	EVhhh6vyN79PBfS/JhQ7RncOuO6CkRRpei3nsNHAtiwY6C0lqKVacLQD5gekmZnS
	qSu0kSAicre29/8JKBsGAEPcgeJ+l1w/S3Te8OQp3aT1T9p7c7++KXud3kdxTrot
	ovJ9MITuY1+ucOmoS3qUHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750329089; x=
	1750415489; bh=0YyQ5OiIFkEPqrZ6SWC3ezO49kjGRtXe1tfiAaXtyqA=; b=K
	Dw9h6T/hlSF8ahctV6Mcpd9PgqiLn7fFQLPB/RWJ7YTVX+t+tM332Ps7PBHhAPvP
	0PuXvoYU2HNKudQxs0iWzr+cjVgmk9eTnIOIrpDsRqaE7XWxV09hBtdSwnlvdnOx
	U4jgIl/dk+oTW5mvx0Ab7Y7H4b191er6uH20TTB2WY1X6eyA7zneIlE9Oxx2i53s
	21Evizc/s0ki7Ggb9c65QWWcoajD3bpz7FyedxNhwPPP/jU9I9RoReob+56IBfj2
	25xzLgBJotZYaPxqpLRa3UMSfxN8CboazgmZJ/mWDdTYeKYI5hvNX59w2mXwoC+c
	geM/DOBmdCw6FnjPlIGMw==
X-ME-Sender: <xms:AedTaLeW0leb5D-cJa8GpIjBR-MPvXQquummYaXnnBSAiFhOkymE2g>
    <xme:AedTaBOyvILu3SCbcMn5zHPWkslCmBygJwOsH06F5CHzesEEIoO5SCO_fDY57_WJS
    vWizvCi5Z4LZPtQUZM>
X-ME-Received: <xmr:AedTaEg8Oc06rLCnoSVR-HWbUDYbqqEJWS2dobqs2t4eeKmVHM56AE7QJk3eHdNeL-8KjoQEuIHlJSRn-xKFAbs2qBOTexWy1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehvdelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:AedTaM_GyhSJMaz8ECrJ04ALdo8cCGiQFwJAJ1FqFpVJIeyv1xl7Iw>
    <xmx:AedTaHtkDA7kZWBG14zDkTLrDJnncbi1tKt9J0CkN2RrekKpswsqRw>
    <xmx:AedTaLHm1-lAkmfYuzeHSzQrVC3VR0dHXd0K47mS1F-LXxMHUe3BdA>
    <xmx:AedTaOPQ-SUCnLA7bKcOjUg5_9eH9IF5p9ekSpitHt94pqslzhUjQg>
    <xmx:AedTaEdLHin6pIVyWVT-gbmxzf2BUMJ-lNNmZ3K-fqVeTJsLnPL78njD>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 06:31:28 -0400 (EDT)
Date: Thu, 19 Jun 2025 12:31:26 +0200
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
Subject: Re: [PATCH v4 07/19] dt-bindings: media: i2c: max96712: add myself
 as maintainer
Message-ID: <20250619103126.GA2847778@ragnatech.se>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-8-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618095858.2145209-8-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_113135_957922_FC1108AE 
X-CRM114-Status: GOOD (  16.21  )
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

Thanks for your patch.

On 2025-06-18 12:58:43 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 1 +
>  MAINTAINERS                                                     | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 26f85151afbd..efdece2b33b9 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -9,6 +9,7 @@ title: Quad GMSL2 to CSI-2 Deserializer with GMSL1 Compatibility
>  
>  maintainers:
>    - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> +  - Cosmin Tanislav <cosmin.tanislav@analog.com>
>  
>  description: |
>    The MAX96712 deserializer converts GMSL2 or GMSL1 serial inputs into MIPI
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01363fbcb9b3..77adb1f7ac9c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14728,6 +14728,7 @@ F:	drivers/media/i2c/max9286.c
>  
>  MAX96712 QUAD GMSL2 DESERIALIZER DRIVER
>  M:	Niklas Söderlund <niklas.soderlund@ragnatech.se>
> +M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

