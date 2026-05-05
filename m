Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68430CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 19:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0HyKv/RNTGe8HjoFsKMOpXRaG8qGoW6Si8iNKe6tzk=; b=Y8QJYYoYwhjZjHUfIqPueqOXzE
	tQDSAOA105RA9EyaB/H/RSCh0lwPMqeFFHpMDfT9B9p+QPXdzx0CbdEVMQM9kE3FVSDxoaj47+Pn9
	VtIAuW0n6OmFTlS2WK4YFIzcx2qt9Jwx7Ktjj0i/ehYZaaOYgSe41RNDwQ0nUt1SwXvldcrBr0xbv
	mTPoVzLz0tu9oL9QIo70Pz8ri7X2oYUsz+Yg96TkmFEok2BpPd3UaDRPucL+RhkDHBQkv3jLgIUSH
	sZvPDtS0+pakDpUVYgvMUBhsq58ARwJU1Si/+6IonfR6n5cWF+eTNdKPhFy1aByoDGMrdAWJHwwzu
	DKfKsGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLcc-0000000HJry-2iRr;
	Tue, 05 May 2026 19:39:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKLca-0000000HJr8-2RGa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 19:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AB7EF43375;
	Tue,  5 May 2026 19:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7E7C2BCB4;
	Tue,  5 May 2026 19:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009995;
	bh=VSiMCNBuHpiPp86N99Xj+iuf6kVZawCPJiGuH+dp5rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=chGnl/QyLautU03Pg06PeXJGCSGlDl5BsiBytVAZoYxJ2Fs24UAxPXeSNIyE6fVXB
	 Pc+l1U2c8fzNtuYqUYfNlkYC8SpeeHx3RbwvXk3Q2f3rQ1ZQbee+TxwEJUlH6pKMKQ
	 KMydki/1DnhKzMBmM8NKuj2jvA2W/pGt0+v+aMzjzzvQiuqpypluqO7iXmFcEchtnc
	 c6d6RzlRFmvnf8tvnP0XJxXIUt5JaRVzdPtmAvhOANShu8LhOJomeGtK9IYjry7sXv
	 HA7l2u05Z1u1pZ6S6Yy1SKzzkgD4HFAubbzYG2TVwnCKdiI3LNOhZGT2S2Eplfr+Wz
	 PrivbX3OufqPw==
Date: Tue, 5 May 2026 14:39:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
	Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Lee Jones <lee@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	devicetree@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Swamil Jain <s-jain1@ti.com>
Subject: Re: [PATCH 05/15] dt-bindings: display: ti,am65x-dss: Add AM62P DSS
Message-ID: <177800999241.3798284.2696880196834050021.robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-5-f628543dfd14@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-5-f628543dfd14@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_123956_635837_CA3C2955 
X-CRM114-Status: GOOD (  19.84  )
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


On Mon, 20 Apr 2026 15:54:12 +0300, Tomi Valkeinen wrote:
> TI's AM62P, J722S and AM67A SoCs contain same implementation of the
> display subsystem (DSS). There are two instances of the DSS (DSS0 and
> DSS1), each with two video ports (VP) and two video planes.
> Additionally the SoCs contain two OLDI TXes (OLDI0 and OLDI1), a MIPI
> DSI TX and a MIPI DPI output path.
> 
> DSS0 supports:
> - VP0: OLDI0 in single-link mode, or OLDI0 and OLDI1 in dual-link or
>   clone mode.
> - VP1: DPI
> 
> DSS1 supports:
> - VP0: OLDI1 in single-link mode, or DPI
> - VP1: DPI or DSI
> 
> The DSI is only connected to VP1 of DSS1, but OLDI and DPI are shared
> between the DSS instances. Thus only a single VP can output to DPI, and
> a single VP can use an OLDI block. Note that in single-link
> configuration OLDI0 can be used by DSS0, and at the same time OLDI1 can
> be used by DSS1.
> 
> The DSS IP itself is compatible with older SoCs. While we could use
> "ti,am625-dss" compatible string, we add a new one "ti,am62p-dss" to be
> on the safe side in case the driver needs to do something special for
> the dual-DSS case in the future.
> 
> Original patch by Swamil Jain <s-jain1@ti.com>
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml          | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


