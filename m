Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35443C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kDt3zlJ8Jp+wHdv475e9FkA0WuAIngnIKvyPPcuVz8=; b=OK3QDCWyhSXG5KyojDIYbrsuyX
	3o53SJPHrIX7HvbjYEwrNU4t1k2efVNuY75TOQ++HKNADRiL03/QU/7jVDyxlZX+98IeYUogWFi5K
	IL2HfOJW674lIikc3FBRLkYiCcTf3urg9DGdaE64Oeq2sj9z/02h5Dn+hmOaDRBMHEBD9f+O5+smF
	zopnOU8qIlV8+3xZyCUevNf06K7o2kzI+jUNFN4AQvq1//xW71yviyeSnrTgNDVEDJdYxxSZD0vb6
	mySmjhtmcx2SrsWR52a8LzBMtO1UE0CJ46qVfCpahzqeEsTw12CgSnPoebnppuZTNsb5innrU7SLd
	jYrfNgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHWR-0000000DZIn-1zRL;
	Thu, 19 Jun 2025 15:49:51 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFOn-0000000DBod-0ibk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 13:33:50 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 1423D1380546;
	Thu, 19 Jun 2025 09:33:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Thu, 19 Jun 2025 09:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1750340028;
	 x=1750426428; bh=8kDt3zlJ8Jp+wHdv475e9FkA0WuAIngnIKvyPPcuVz8=; b=
	du9r+xtubVk3ZlGUMI/gYv2uEWuBgdGsGeQrc5LnXP9sqYF/JtcWebDMMfr5Ofik
	o6yVaj7t7eUgUbjWI+QkjnfpuhPaXVDe2dLNud7kCvdYv3daxCIM76SdGtXbkNDu
	a5IXmWxHtP3qQbiMzrocAh8wZGhUCAsQHmlNtIcWBCXxKWKplrIkFlokdDaHOmT6
	Xd290YgA2hUEFtDKarhs1lClP1qV0LUHXun6vUx8pyUFnIGoLuby4bY0hb5zz25F
	JrbrVrhdP6O0vTQfx5awDniTkfeXR1CFwZbYy053ZqrIr4mDI04jdn3fDpMbGEn3
	YiU/YXZch4R54T+ps6EVuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750340028; x=
	1750426428; bh=8kDt3zlJ8Jp+wHdv475e9FkA0WuAIngnIKvyPPcuVz8=; b=k
	6H8SekOvaL4IK9ddsbjtvJmZtrpsLT+BtGGRxsaqt65WGXtjuxvLb4CLVmGi4qlu
	eEa/rGtyobXd304A4IYLZlAvTvXIzxEA5wH+/XIVt4lUlOXdJ/mFggcozXHL6EaB
	fgjn2houQeT7WbhJgoVlG0REdp1F5VDc/m5eVMTCNwVomvWKkP1MGi1mpnFBcotB
	f3gizsZuh7/GMEvsWh3g0/psGJvGbCRjpsUKqmqCe5+TqrhRu7BLoNlqNJ6qxwUX
	1p/i3HEHblQHMzDl3tBdMBf2Ca5mvM1KToBHatZOrp6Xn4xXLlQy2SpFS4q8FXWT
	OLEsgrCP//ZJ9E3Rq8kAw==
X-ME-Sender: <xms:uxFUaBAxE4xVXIX6QBqNkoJC3xC32NZj8PJ4RYvvqn7B68iXPV5cFw>
    <xme:uxFUaPhf9kTH0rbwptH6RC0RWBos4RH9wwOT0bHospfsUL2s2R5rWu1Lil0Shz_bx
    IINOmZLemjUU3wpSGM>
X-ME-Received: <xmr:uxFUaMkEIDc4LgufQW-GS8wasAOqU0-YOfUG1NVDAP67-tlZrMUIBV8eEhI_XjofETV_K4PjXj1SQ8_izwz-l83i9OxECZM3TQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgrshcu
    ufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvg
    gthhdrshgvqeenucggtffrrghtthgvrhhnpeevteegtddvvdfhtdekgefhfeefheetheek
    keegfeejudeiudeuleegtdehkeekteenucevlhhushhtvghrufhiiigvpedunecurfgrrh
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
X-ME-Proxy: <xmx:uxFUaLwLHjkFRPWQh42kzdFHZxtjF0tCpPdAmYvj-DtJUsueU8bSpQ>
    <xmx:uxFUaGSr6WWzjzDqo0Y8JBna7-msqLkqx0hQVDYnJGbSrTllI6iRrQ>
    <xmx:uxFUaOZtkI2szj8vIZyv_pqIJ42bArmQapqaqMMo3y7l9L7rn1x6Qw>
    <xmx:uxFUaHQA4T9roLWPsmCIYWtAlgitLh12mZWRsS7ux8zY2goVDn_2sg>
    <xmx:vBFUaNnb_SYY2du1AvVe1vNktkzJobqctXQFcnAo_K8xWL9QK6OmqOYb>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 09:33:47 -0400 (EDT)
Date: Thu, 19 Jun 2025 15:33:45 +0200
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
Subject: Re: [PATCH v4 11/19] dt-bindings: media: i2c: max96712: add support
 for MAX96724F/R
Message-ID: <20250619133345.GD2847778@ragnatech.se>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-12-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618095858.2145209-12-demonsingur@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_063349_276244_5F42DD38 
X-CRM114-Status: GOOD (  15.05  )
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

Hello Cosmin,

Thanks for your work.

On 2025-06-18 12:58:47 +0300, Cosmin Tanislav wrote:
> MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
> only support a fixed rate of 3Gbps in the forward direction.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index b345305acc4c..5dcafd46344c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> @@ -24,12 +24,17 @@ description: |
>    MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
>    serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
>  
> +  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
> +  direction.
> +
>  properties:
>    compatible:
>      items:
>        - enum:
>            - maxim,max96712
>            - maxim,max96724
> +          - maxim,max96724f
> +          - maxim,max96724r
>  
>    reg:
>      description: I2C device address
> -- 
> 2.49.0
> 

-- 
Kind Regards,
Niklas Söderlund

