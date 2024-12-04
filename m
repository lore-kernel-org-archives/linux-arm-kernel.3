Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5035E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wWCK7I53pv0MXm2vf8vtfX/hrFwsCtYxZ6WvPdzWZg=; b=jKsIzvUdVdqk+W+edX8QVDnCBx
	OmoDoWSyo1I6QyBZRpXPQZUINvdOgJStSo/Z9gGWKVVkH7KPJSYAo9ip3jkRJknoxSh2EsCwttNCw
	U0zS1B+MELUyWBIDFg8EkT/gtmEWGa8AP/r5xw7UPGlnzmlodD2rcVc4gE+ruy25mKTtbsbbkwE3j
	1qnHXCOPxv5EAR1SpLCkAXKU61SSQegE2H2WmvcMLVOonUFQ+s6hROT/GzMRKf5g5aZ9AZ/wJsRVu
	rTPD2FLuOjSfVO1CdwiBtuDasGvzsqTfTlKLCweJEklNsiRlbgNieSU/9WxkqSi+bi8HnoZt6P+5w
	Va/qTFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkE7-0000000Bnpf-3b5k;
	Wed, 04 Dec 2024 07:55:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkD7-0000000BncD-15Ma
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 07:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5C105C64B8;
	Wed,  4 Dec 2024 07:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EA3C4CED1;
	Wed,  4 Dec 2024 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298852;
	bh=r7spAKgJ9nwULUJ94kYk71uQKUoe4HtwLYlFt5AYFJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dg46Bgf9jwMe6I1uCUp3Lsqtqf6L/k+MOBRHQoLdYmuzUIj0YUPcWbX0FtmUbIOMh
	 /+dpPtOR1Mg9DF47VITfak8t3HqsepZ8N0gAtcWbT/6pxjIAqvvjniAX1LLVgw7bAv
	 V31ZZPZO5JGoHe70R9EUujt8ApeIxGQSN2FHtuLpDeFwBHMvZt7nUB4zPOdfIl+35Y
	 shSaxILOJRNytxvk+PlaGNVVI6LhNiGKKuEe1HsxGlNunsHDkFmJ/hO3htzzthOhGs
	 WoTh7KGN6Wdvj/s576JgluvmyghHZTCHILiPJucuZ5Ury76Jttc74A+mCtU4XIUUMJ
	 t5DVVQuNwx9MQ==
Date: Wed, 4 Dec 2024 08:54:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 properties for ti,lvds-vod-swing
Message-ID: <vgg3bygtmj6sotatddkqfapset5bofsqvkzuj7ejuvomn6hs3n@mscq2jbhtaux>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
 <20241203110054.2506123-2-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203110054.2506123-2-andrej.picej@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_235413_337834_7CE1BAD5 
X-CRM114-Status: GOOD (  17.24  )
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

On Tue, Dec 03, 2024 at 12:00:52PM +0100, Andrej Picej wrote:
> Add properties which can be used to specify LVDS differential output
> voltage. Since this also depends on near-end signal termination also
> include property which sets this. LVDS differential output voltage is
> specified with an array (min, max), which should match the one from
> connected device.
> 
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
> Changes in v3:
> - no change


One version of patchset per 24h.

> Changes in v2:
> - move LVDS port schema to a $defs and reference it from there
> - properties are now defined in microvolts/ohms
> - use 1 property for data-lane and 1 for clock-lane LVDS voltage swing
> - add 1 property which sets LVDS near-end termination
> - since major change was done change the authorship to myself
> ---
>  .../bindings/display/bridge/ti,sn65dsi83.yaml | 36 +++++++++++++++++--
>  1 file changed, 33 insertions(+), 3 deletions(-)

...

>  allOf:
>    - if:
>        properties:
> @@ -120,7 +150,7 @@ allOf:
>            properties:
>              port@1: false
>  
> -additionalProperties: false
> +additionalProperties: true

This cannot be true. Not explained in commit msg and this is not shared
schema.

>  
>  examples:
>    - |
> -- 
> 2.34.1
> 

