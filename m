Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C9FCCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 18:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpTSiOPXX8wfXwImlsolqAJ9WURkWVPhsipC38lvdxg=; b=Woblj1kheG4v1CGLHw/fxmNJEB
	5HWLPV4bTct8v6wxiNktZWIXJWhxScAuwoiwLi4NxchrA9T+G1E441HaHz6++DdllBTzFE146nByU
	xYjWdGw0l5ZvJuycQYbgI9f1d+L1WXcAAblM5BuTaggKN9wRHsKgViCXRhdsCBAk0FPneBUCFn+so
	dqd+FM/aGY60XygiSECk/bErXgwDJaTHytHBf+LC9NWPEVAebLSzfUtl3hgH4b7r4EPRNphFykFeW
	fEPimDIL5fGXAPOjmIksbmPGJnvtJtCR2qDI7nh3C+8WYmEJ91CShqDLzUDAyy9KnzS1pv6CocuNh
	gIITRPcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI907-000000053rV-2CtH;
	Sat, 17 Oct 2026 18:19:23 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI900-000000053qp-3bV0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 18:19:22 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 250AE1FB65;
	Sat, 17 Oct 2026 20:19:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1792261151;
	bh=RpTSiOPXX8wfXwImlsolqAJ9WURkWVPhsipC38lvdxg=; h=From:To:Subject;
	b=jzlvZpvDijkHExpia6go2tWbL3gNnnjaUicl7J7bG70rCpdlLnO8iHeVsDtLJViux
	 G3R//dDgdpE7pm/TrJ9l0f9Wh50G4iFB+ITanrSWaa55O8UQncNVS8brkzOTdwAiEe
	 bhxDAd08+EjuGnO2gfRzltiq+umepgVu/4Bjdp1aqrlF4vw0CXPQBlXZ2CTIhxWCer
	 ZUFWxjn1WZ84+F8ib/kG8fP71kbQVHT0ARvMxM8EmRow+UZ81Sa1Ikz+yW4bJsqJYL
	 7747Z+S5rXrSaQydALonfGxM/fBRBQpgt38PiLRxMDq3hY0hxaRTLWVQaIIMIQcenJ
	 r6yvejn38Da1A==
Date: Sat, 17 Oct 2026 20:19:06 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 08/14] ARM: dts: imx6qdl-apalis: remove disabled node
 "panel-lvds"
Message-ID: <20261017181906.GA8265@francesco-nb>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
 <20261016-arm_dts_cleanup2-v1-8-3a0cab9fd784@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-arm_dts_cleanup2-v1-8-3a0cab9fd784@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_111920_839332_0300AF05 
X-CRM114-Status: UNSURE (   8.15  )
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

Hi Frank,

On Fri, Oct 16, 2026 at 04:10:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> "panel-lvds"'s status is disabled and no dtso overlay to enable it. So
> remove it to fix below CHECK_DTBS:
>  arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtb: panel-lvds (panel-lvds): compatible: ['panel-lvds'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml
> 
> Reduce move than 44 lines warnings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Please, do not merge this. This is just breaking functionality for real
user to fix a warning.

There is a series [1] already posted to address the issue correctly, so that
we can have the issue fixed without impacting users.

[1] https://lore.kernel.org/all/20261001155412.3177428-1-leoreis.costa@gmail.com/

Francesco


