Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42190CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cy1vpTPJxzBbbcL4UR5MpD0A0z+QwCRJEL5GQWJ0QCM=; b=bgDSrhU5E4IszuzEGWKFK+m6BW
	ZvDMiZyCwJ7ZHVDbtZCaCRrydvB8fQshpjg35VSjE28nyrMWHLnFE0MJZF9saDhwEiVsf/RRFaSWY
	tKBljq6IlCaE5lGG4ZQpVbPRAhJNZkYeofvbDwir16sEuzshNMRyJYA38ZmaLQl246mXMDUuf+k8e
	PNssPxN7swoPUnd1cD+E7mhuii7zp8BBv07S1JZk64fT6wEp5ZgU3CdUOWeFsILgbpGuvzNE88U4/
	jrO/T4phSSLxEOi1jBSYSt64KdQgojVFzCUM2vHdSduESCbmQSxLRYvxXE+ZYOEYczD7mnVGR5qHb
	QddoKLRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKPO-0000000A6Ql-0Vh2;
	Fri, 22 May 2026 07:35:02 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQKPJ-0000000A6Op-3Fe6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:35:00 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id A2CB91F94C;
	Fri, 22 May 2026 09:34:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1779435289;
	bh=Cy1vpTPJxzBbbcL4UR5MpD0A0z+QwCRJEL5GQWJ0QCM=; h=From:To:Subject;
	b=VlgEkmUP1LeZ6d/1LrOi2YEOStTsBaBIiLGmNfnqjcxE7HnYazX6OI+NntkHEHLW9
	 8WeDKAQkbxldtkAgehhtJXXJYE3N011+gG6nYx5vkQ99jyqOUXth007X3K/zbu7wmH
	 dUMrQ+0zNVgdWfsMkNEWS1HwQloA5WdK4qvHfb43jRm7v21DtJt3o33lFHm7z3+GcV
	 SZVE+QM92bdM/SU1PYdH0MI+OQu50ELYho2uJicItAvV2es9MkmC7nSUgQjve+14a/
	 DTSLEeNXOXlxuemlXShlCvcVTmS2KExl2DLCyPGGcascdC/PHhIsd2e2U82eDqO8V8
	 GOB7NdaJ2+dtw==
Date: Fri, 22 May 2026 09:34:45 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vitor Soares <ivitro@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add
 dual-channel LVDS support
Message-ID: <20260522073445.GA25589@francesco-nb>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-30-ivitro@gmail.com>
 <20260522-vehement-kangaroo-of-penetration-de8d99@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522-vehement-kangaroo-of-penetration-de8d99@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_003458_691554_26C43659 
X-CRM114-Status: UNSURE (   7.84  )
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

On Fri, May 22, 2026 at 08:55:12AM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 04:00:49PM +0100, Vitor Soares wrote:
> > From: Vitor Soares <vitor.soares@toradex.com>
> > Assisted-by: Claude:claude-sonnet-4.6
> 
> Using assisted by is not permission to send us unreviewed code.

It was reviewed (by myself before Vitor did send the series). It is a
plain old mistake, unfortunately we cannot blame Claude for it.

Francesco


