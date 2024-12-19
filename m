Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBEAE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqL6Sh83tyK8i9TfdyCWzUDsDZTkWTzarFVvPQU+Jr4=; b=p2VarpQctT4//AFUW+Kilef+el
	P9xQJfW2ubLYQmUdsd3oyI3XrS9Z/+1/HXTd/R28Vl+pZkhPXBzGXOHrJaYhD4VbpWAUQ0YSFMUKp
	0qk8k8Gz2Ay6U+gB6M7jWzX0rb5+KFBMhqERmjM6vgwRgMZnZqS2NluPm7XntYQjxRcPZCRyTYkQ3
	R5EM/wnEwcoU89HBD8JHRXhbjtIM5fhgFiODKRF/TrNlyJkFmtZR3IkaNkFaRRupJiNt4eH4HOKz6
	sszSnzjO0YI2/PI5ZpzwgHXeWv3OohlOrc8h1CtGDIaTprk0GVDhyY/DaPgU0GJb89JODIrC7vATN
	PRqAI29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFnp-00000001pZw-2S6R;
	Thu, 19 Dec 2024 12:38:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOFjo-00000001oZC-3xFo;
	Thu, 19 Dec 2024 12:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 612855C6049;
	Thu, 19 Dec 2024 12:34:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A354C4CECE;
	Thu, 19 Dec 2024 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734611684;
	bh=oET6+uDNf4kR68e3trU5FsFxrPSJ+p2mnS3KEULc9H0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhGC2Q8ai0xJrb+hFv2iCyRXSfZiv9Hg1j4U0NtOx1LGDEjq3ORtPVJbxzb7ZdT6C
	 neg4j+GLc0PptW5dpz00W5dD8/I8EKcow7VbTgdR56wKUr+oyISPe+XkndEWGY4b7e
	 cSPguYKONb8DwdrQMDwFPCdlCC3+mKOklN1t5G0sHVKW7PmyL8f92hKcUF9pBsWzkc
	 +hA9SFbHTm2wLu9Rnm9CIFjRlePwI1JES8x3P1uwPuxCqzQCuF0rebV7olhOV3XpAe
	 JcAB4jazwfD+Xja9vvgD/Asy91jqjjQcRa/c9RMYWFO59LsikGVP4teJgpAzBaaAiP
	 +tifFGVzF23Zg==
Date: Thu, 19 Dec 2024 06:34:41 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v7 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
Message-ID: <20241219123441.GA4016373-robh@kernel.org>
References: <20241217085435.9586-1-linux@fw-web.de>
 <20241217085435.9586-4-linux@fw-web.de>
 <4ecfcdd3-3c81-4625-90cd-1d45f6d71a2f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ecfcdd3-3c81-4625-90cd-1d45f6d71a2f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_043445_019420_512DCF54 
X-CRM114-Status: GOOD (  12.53  )
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

On Thu, Dec 19, 2024 at 12:56:23PM +0100, AngeloGioacchino Del Regno wrote:
> Il 17/12/24 09:54, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > This adds bindings for MT7988 pinctrl driver.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> DT binding maintainers, can you please review this patch and eventually release
> an Ack so that I can take it through the MediaTek tree along with the devicetree
> changes?

It's been 2 days... If you want to know the status and where you are in 
the queue, you can check patchwork[1]. But guess what, you're #1.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

