Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2015FCD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4fIA5mrNfq3wdINvclEbTHkW4IM1ZcnAg2hM5wZt1k=; b=DY1z8g+oW+5SIwRi05RlVuvpZt
	uP+BMlz+e2ry2tYm+JonocYkRlP5QNvjIXoobXM70XYOySl0uxqxTf41GRm/4bp2ITQ2DfiOgC/mb
	0cIIkHAlpheYEkjOpPppodWKQ4MyWDuL1fICd1e4Ps6TGrMROcLNXOZu/juMgjp9S3t6Qqvt8DNTh
	wCP2HUgJsnEKS4wGI6ILs+Fbk5BXJwvtHjFaSdDoAu5kPzfqeCe/WVz/klMK1nIsoC4mw+UL1OHyU
	ZA25GeiA50I+onp24BebEDhkh9fwLfmfMElrvLURibj+LPKs/T9OKKA0qBOVtJOKA2ptA/sOewbfR
	j2qLrRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzq2-00000007rDa-12oP;
	Fri, 29 May 2026 16:13:34 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzq0-00000007rCg-0MHG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:13:33 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id AC6051FCFB;
	Fri, 29 May 2026 18:13:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1780071210;
	bh=T4fIA5mrNfq3wdINvclEbTHkW4IM1ZcnAg2hM5wZt1k=; h=From:To:Subject;
	b=tVLVKRpIoMaNd32APImLNK4zlijIgn43Cw2Cd+8NLWvTPrq+qXHwn9L38sCZ3mOwX
	 rlaGY5/gjVqW91Ml80OMBREew90HCde4k0Bz4EYxa1VteTS7UgKjbfVLFZRe4dUzSm
	 qUcL0Y/P+vq5PHYuvirJSGjkSL/YC7iteWQqQ7kTTDchD83LlneN53h++Rt2APD5V4
	 bD/KjkHbec0Vkd2OuEyg3jl5XuFZP4ZUU5qehDqWmk0eankNQt4rC1dyrkLg0OPZmV
	 TkowNr8yIA4rWv/Fl85acDVXFivkrS1KJ4oPAg4IL7OxYMm5o21gSOpn2Xl/QnG7sP
	 AWBx/0Qipg5ng==
Date: Fri, 29 May 2026 18:13:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1
 dual-LVDS panel
Message-ID: <20260529161321.GA9596@francesco-nb>
References: <20260529110518.624454-4-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_091332_280377_2B9667FE 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

On Fri, May 29, 2026 at 12:05:18PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
> a Verdin AM62 overlay for using it through the Verdin Development Board
> with the Verdin AM62 Mezzanine LVDS interface.
> 
> This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
> was incorrectly extended to describe dual-link panels. Back in 2023,
> when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
> pointed out that dual-link panels should follow the existing
> advantech,idk-2121wr pattern instead of introducing a new generic
> compatible.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


