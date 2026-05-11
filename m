Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCCFCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S08ARNK4JyjFSmUJ+5xcB6ex0c/0uNFUV+SgRIJsO5s=; b=JsmdBx9DmRAaIS1TqbK5ZFGLAQ
	qO0Bd4vcMPllEJXfw0LVkIZgIdWTDQx3RDWhlkTrHLaiLvy4UUwbLRTJI0i5enCG3DNRwBRGOr45t
	QBrLkH3ZcVA1hJ3581c9u1sXecPVOTHbeXMcyS9ZrxhyLxgd88DtFFKFBPR+vehowh9YHw1k6SqNc
	+n9w2UiIuuK0mvHWRk1whzz7VFu5cRP4Y7S5aW/ipm5oKh7fD2c9BwrZkUIn8QxgC6+wMb3SOXMJ3
	cqUdbp4OC2Drz8jblw94anIPupbY47Uhsq6mMwRd2raOa28U9fwZdwNyCR3a4gAaeG2WieC7oSieo
	O3d9mdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMV8k-0000000ESrE-3ulO;
	Mon, 11 May 2026 18:14:02 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMV8f-0000000ESpj-1pVI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 18:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=S08ARNK4JyjFSmUJ+5xcB6ex0c/0uNFUV+SgRIJsO5s=; b=k/nqdyIA4uz/7q7lLSmEW3s1Lh
	mpcsX4NwWiCr/zGvf1NN8TyRDt9KBqs/gYg/5h0m9Jshi34R5p19KCtp6w2+dv8f1pxclfwKjm4zR
	iIZIFJDLiPQ8cni40gI+YrmvclJtLmWcE1+6gh46GICm359dhW4KeN80P8nsR81p1cuk=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61] helo=debian-lenovo)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wMSng-000000004IO-1xyo;
	Mon, 11 May 2026 11:44:08 -0400
Date: Mon, 11 May 2026 11:44:06 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: krzk@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 14/15] dt-bindings: display/lvds-codec: add
 ti,sn65lvds93
Message-Id: <20260511114406.24673c770d112b2ca4aba2eb@hugovil.com>
In-Reply-To: <20260305180651.1827087-15-hugo@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
	<20260305180651.1827087-15-hugo@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_111357_477658_18CEB4C9 
X-CRM114-Status: GOOD (  13.98  )
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

Hi,

On Thu,  5 Mar 2026 13:06:29 -0500
Hugo Villeneuve <hugo@hugovil.com> wrote:

> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add compatible string for TI SN65LVDS93. Similar to
> SN65LVDS83 but with an industrial temperature range.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Now that this series landed in linux-next/master, except for this
patch, we now have an error since it is required:

https://lore.kernel.org/oe-kbuild-all/202605071909.lXKPelNA-lkp@intel.com/

Hugo.


> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 4f52e35d02537..f2cb74b86cc05 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -37,6 +37,7 @@ properties:
>                - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
>                - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
>                - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
> +              - ti,sn75lvds93 # For the TI SN75LVDS93 FlatLink transmitter
>            - const: lvds-encoder # Generic LVDS encoder compatible fallback
>        - items:
>            - enum:
> -- 
> 2.47.3
> 
> 


Hugo Villeneuve <hugo@hugovil.com>

