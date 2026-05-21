Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB958CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9BWViu2SpWt7Rj6XMWPmrgjG6rA+onWCpewnCfYlnQ=; b=KKRmVlWipTgKNZfCG+/96CTt1a
	q8B/PsmsunWedNF0W1gsfULAW2c4K7vhzoiOSmHXKRj+geoi0lExYR8xsnt7Otxot8ro2muaU69kI
	vUXB+Pp0LhYrl+QCTCElglQu8c1zyE6JqH1rpA3CUDYj3LZOCYpvt9kFa68zHdzNvTfNiYS7b8hnb
	V4ULMt9bO7bMxxynegh5VD4OrHcfyM74mZspxwYa7VkhRb+OWnZYdeLJVzKyn5j/Q+gMliAntiJth
	ePIT9YXACJxuoZ44/AWpQZOBVc5ABquI8pDBZ/oifamgDx8vlwZRmD7CQzl3WvxDZ14isCvc04NCJ
	YPHjnApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Bu-00000008TRM-2pWJ;
	Thu, 21 May 2026 16:24:10 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6Bs-00000008TQF-18Es
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=j9BWViu2SpWt7Rj6XMWPmrgjG6rA+onWCpewnCfYlnQ=; b=s7PzemULtOwfVJPGZe380o8FCH
	Ox3Fin9xFVsNn6I2c2+c/byyh8SKz+3aGFTyvtsoGgz8uOjibUR9Vvtrxznxc2vCikoRLnqP0+c9l
	baw9lqMUwBVYAxoDJErmQsJwFhgkBcSblolqdS6T9j77woqnmIzPP00yIL8GRmkEZLp8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1wQ6Be-000000003xE-2ZGi;
	Thu, 21 May 2026 12:23:54 -0400
Date: Thu, 21 May 2026 12:23:53 -0400
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
Message-Id: <20260521122353.82651a97984e58d2ec8309c5@hugovil.com>
In-Reply-To: <20260511114406.24673c770d112b2ca4aba2eb@hugovil.com>
References: <20260305180651.1827087-1-hugo@hugovil.com>
	<20260305180651.1827087-15-hugo@hugovil.com>
	<20260511114406.24673c770d112b2ca4aba2eb@hugovil.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_092408_410157_9766FEA0 
X-CRM114-Status: GOOD (  18.35  )
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

On Mon, 11 May 2026 11:44:06 -0400
Hugo Villeneuve <hugo@hugovil.com> wrote:

> Hi,
> 
> On Thu,  5 Mar 2026 13:06:29 -0500
> Hugo Villeneuve <hugo@hugovil.com> wrote:
> 
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > Add compatible string for TI SN65LVDS93. Similar to
> > SN65LVDS83 but with an industrial temperature range.
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Now that this series landed in linux-next/master, except for this
> patch, we now have an error since it is required:
> 
> https://lore.kernel.org/oe-kbuild-all/202605071909.lXKPelNA-lkp@intel.com/

Hi DT folks,
wondering if someone could pick/apply this patch to fix the build error?

Hugo.


> > ---
> >  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > index 4f52e35d02537..f2cb74b86cc05 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> > @@ -37,6 +37,7 @@ properties:
> >                - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
> >                - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
> >                - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
> > +              - ti,sn75lvds93 # For the TI SN75LVDS93 FlatLink transmitter
> >            - const: lvds-encoder # Generic LVDS encoder compatible fallback
> >        - items:
> >            - enum:
> > -- 
> > 2.47.3
> > 
> > 
> 
> 
> Hugo Villeneuve <hugo@hugovil.com>


-- 
Hugo Villeneuve

