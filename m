Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5DCFEA82F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQXQNNsQGfvR6gkQ3BXucR97GIRMgPeV/r/DkmWWWY8=; b=YtEC0XrfSk+nhGK1I0iPGfOVbZ
	etw7zw6BAXQDKsi3cFoeafiV66QzpuEr69jsBmZMV7IBw3pZLiem9D9wy7He8v1PsiOnPtU/2FQBs
	ZhHtl7FKxL4eV9ERKZl3Vu75dF/36p1x66MjA8I1KldRPjYAbDrh7q4CSdlo8zukd7/2smInM/bnf
	Z9LxfwAgHbUw7SYI4lrMFJvT2amDFTbyNyNmZI4FVk8vAVOt2ax4gdE7eCnE4n+q3wye6+qpejsCY
	VdpblkXZjkYxyVLJC8ATU2HccwjcHJQsnXnJAJI5ffkjaL/nEsSK2qaggh7pQHELPC3GEtS+IaPEr
	mDRYEQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JSA-00000002w8X-16qH;
	Wed, 25 Mar 2026 08:19:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5JS7-00000002w85-3DFj;
	Wed, 25 Mar 2026 08:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E54824191E;
	Wed, 25 Mar 2026 08:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D309C4CEF7;
	Wed, 25 Mar 2026 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774426738;
	bh=l5hbhBxK0vQal/zDiyjexDnCisT8vaZyQAqn5AAN1d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6WxswBz1yLsbEY+xondEzkTMuDm0moXJREF1w7n//W18yp3UzKPmamuortP7Bb2s
	 Lwbw4Zar1SbgCbhaV513HhOQya6II4lAEeN2qqIVbYU89mb8+oY4BO6vHsMsIofAqq
	 aLcksX0bJsdbdiY5HfJChnDmiws+ri4Nsbvm0VwoY1GOMM4DQyRHH8TpWkzqn4K0ZB
	 2ZuH/OsYouMq+RSJEKfZU/Ka+ncgHrTQ1PNA7McshNnYxWjotELQayE9FZ2Oo+SNsh
	 yjJTw+hLvnwsVaKYJMAojm5Tz9uwKraD2YX+o9Ol4hC6MQfv40bSOiYwmRQOHY+hWT
	 xhYIvvqPnfJFg==
Date: Wed, 25 Mar 2026 09:18:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/6] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Message-ID: <20260325-cautious-giraffe-of-serenity-b55d8f@quoll>
References: <20260324125315.4715-1-jay.liu@mediatek.com>
 <20260324125315.4715-5-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324125315.4715-5-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_011859_845522_CE0BFA55 
X-CRM114-Status: GOOD (  10.61  )
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

On Tue, Mar 24, 2026 at 08:52:01PM +0800, Jay Liu wrote:
> Add disp-tdshp hardware description for MediaTek MT8196 SoC
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../display/mediatek/mediatek,disp-tdshp.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml

I don't see improvements.

Considering how vague your changelog is and you only implemented coding
style, not review comments, then NAK.

Implement everything I asked for.

Best regards,
Krzysztof


