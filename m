Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801CBE67A72
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTIgmgb/ImQ+v4+VhZg8vRmsZhPrw5oDndGDTm3rYyU=; b=cr1RE66VcZfD0h
	rG/vLix+9gVUtdp2RyNVzzLQZjDEYpcURVO6oqFIcm88HL1yguYp8Aot6nt7PvXsaepHZuFhXJxRK
	FC+oc9lbpGFqb+FuIFNpJvBTuEsJzk0lLs+DIlrSC5YyzA/+vEfpZr8C1xHZoAtNmzVY7xHqBD7YP
	DLLS4HC1tWOnSqWNUaSrUeblSnuQc2qe7hf7FMNusIan9IoZ1lkXiZEIpxlK6n2IhFyAcGxCJRFKA
	oNB2F1oGk3H1xWNzTdFN8qRTOCc3+xKfEfNx9XlfclhSBBUQf+tFkZw0kbCaJF7EKkcT2WUYEAynE
	1EGRSuJXewa0UuFv9u1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRAY-0000000FMZH-2Uik;
	Tue, 03 Mar 2026 14:56:18 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRAV-0000000FMYr-1sK7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=cTIgmgb/ImQ+v4+VhZg8vRmsZhPrw5oDndGDTm3rYyU=; b=Dj6VtwQ/vo5l9HiQZuUUD75aA3
	Vh/txUhdj0g+wsjdCXC/Kiz35j6z4cLxYbwnDvT5NZAH6DyyTFFxF1B7t+uW8+XBJROxShyx50ZTa
	JwGmkaHJkyrGMQqcsBuxBVRtgxrtxOC9bT60v4kp233ssO1FI4Zwd25niUMiNVzbsTvs=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:38300 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vxR9q-0000YP-RN; Tue, 03 Mar 2026 09:55:35 -0500
Date: Tue, 3 Mar 2026 09:55:33 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260303095533.1c6dff174f6c9d162d3e3303@hugovil.com>
In-Reply-To: <20260303-rational-thundering-firefly-9dcaa9@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-5-hugo@hugovil.com>
	<20260303-rational-thundering-firefly-9dcaa9@quoll>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH 04/14] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-6UL model name
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_065615_612530_6F89B998 
X-CRM114-Status: GOOD (  22.70  )
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

Hi Krzysztof,

On Tue, 3 Mar 2026 08:10:51 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Mon, Mar 02, 2026 at 02:03:40PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > There is no Variscite module named VAR-SOM-MX6UL.
> 
> VAR-SOM-MX6? And there is.
> https://dev.variscite.com/var-som-mx6/

Ok,
I was confused by the "const: variscite,var-som-imx6ul" and thought the
description was not matching.

But there is still no module named "VAR-SOM-MX6UL", but "VAR-SOM-MX6",
with different CPU variants like UL, ULL, etc. So I will modify the
patch to reflect that.

In fact, I will modify the description to reflect that it supports both
VAR-SOM-MX6 and VAR-SOM-6UL modules.


> 
> > 
> > The official name from the manufacturer is VAR-SOM-6UL.
> > 
> > Change SOM model name to VAR-SOM-6UL to reduce confusion.
> 
> That's just one paragraph. Please write concise commit msgs so reading
> them will be fast and easy.

Ok, no problem.


> 
> Not a sentence.
> 
> By a sentence.
> 
> In multiple steps.
> 
> > 
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index 5716d701292cf..99dc1b3f1ba92 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -688,7 +688,7 @@ properties:
> >            - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
> >            - const: fsl,imx6ul
> >  
> > -      - description: i.MX6UL Variscite VAR-SOM-MX6 Boards
> > +      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
> >          items:
> >            - const: variscite,mx6ulconcerto
> >            - const: variscite,var-som-imx6ul
> > -- 
> > 2.47.3
> > 
> 


-- 
Hugo Villeneuve

