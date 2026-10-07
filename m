Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1062ECA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz6buXav5QfaxJzEdzND6uCBc83XGDCGlVkDtt0fjUI=; b=Q66/+s+r4i9DOl/tC5DTi0Ufwq
	iRaRW5pOl76b4ViZcNHsGCNvBFiC9UNbDPyJGBB0Ob4CY3YAXycUAWfWy3v/exFNdmpqEisZxcNJR
	ZY0qibEDje+rZjw5vhrHXz/wUBeiRMkRxxwaOrXR6XyyuF0qG7YoVj2Dm2pj1hfwduQO3L93R/Si+
	w8obTzCLHcPc47Nio/3wlDWA4E8Ja0E1T4r8RmNYQ4Jz7an47FwDHExzkAx6NqcG6qjErJ7NxZCYC
	HKutX/Y0Gr74qSCM6g8SKAyCpkhiuxMiw1V9Vvptp9YcwAEn5e4RUkgrQuYnQzIY2WIFfb38QPaT1
	P2AAsG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ0K-00000003B7b-3ZIV;
	Wed, 07 Oct 2026 21:16:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ0I-00000003B7A-42tz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 21:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21FDC60A93;
	Wed,  7 Oct 2026 21:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55531F00893;
	Wed,  7 Oct 2026 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407805;
	bh=Xz6buXav5QfaxJzEdzND6uCBc83XGDCGlVkDtt0fjUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CEiJ2dcqsFhbZiLoaLAl684SkYwbahdW2iaeXPSNiXij9shN8TPl+4RxSg6Zgpv4j
	 AbkwUkKqxD9rDGSece4d8LvdYMzJmkzsFbNedRngVhAVQEeDFNe15HIqZJxAb16m7H
	 qV2YnAG1U/hYy+TDTdxr7+hZ0I48eg0R3GRtVtqYRV1VmYXF1GuaARCe3BLcXIO0ok
	 3bXbXgU5bWy5sMRU7pUUs1BJL6oWxvvdHes+VH5wV8NfvMbLgPeOFb2CBTfZrZp/FF
	 AMFyQdu1Wmwlh3AW74dHTIJJDyvlyYwJIoR1AbbaTbblYlphHr/3gOlVG2PY4Ytmy6
	 k0buwOexwssOg==
Date: Wed, 7 Oct 2026 16:16:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 05/11] dt-bindings: rtc: sun6i-a31: add Allwinner B288
Message-ID: <179140780417.373527.14543472932668244444.robh@kernel.org>
References: <20261005202731.153971-1-pmazzini@gmail.com>
 <20261005202731.153971-6-pmazzini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005202731.153971-6-pmazzini@gmail.com>
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


On Mon, 05 Oct 2026 21:27:25 +0100, Pablo Mazzini wrote:
> The B288 RTC wires one alarm interrupt, not two.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


