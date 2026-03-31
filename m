Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82111061B3F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koCLsVVCHbPUBaymCm3WWi/XqkEDpla9QOi7DTJ2Ihs=; b=myUmjfO4y4LFqfn2T29q+bF1w6
	bBAIMdQuxz3XydVrP0Nv+/02IEwhNeVW5A31QAwMaQvD3SU15Do15VF9Oqq8d/XTAC6WyhBnrv0XY
	Ps2aq8AFVDiCS8WYycKqZvCGIkJsD59PQ7MzWESH4ftwFw+LL7ZiUpwGWwWLWhsRJjvaDQy2wjbmW
	6RBZma9Sim3nvrkBhyuZ1YzSmwPBJ39y9hISLOcvzgI617WFBs7TMrNqYRu7CK38/lStaGdLYvZ6Y
	JHvosBKt0RgHiYU+LJaLeqNkeJlgaS4dWcPvoMVoiD+zpUYR9toLCTEfowyqXuo8sWVft6uwwQjYU
	L7+dtOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YTD-0000000Cxb2-3qeb;
	Tue, 31 Mar 2026 12:45:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7YTA-0000000CxaT-4BrD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 12:45:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7YSy-0004rB-3T; Tue, 31 Mar 2026 14:45:08 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7YSx-0032jD-16;
	Tue, 31 Mar 2026 14:45:07 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1w7YSx-00000000Ab8-13OI;
	Tue, 31 Mar 2026 14:45:07 +0200
Message-ID: <d6cdea5f1a4f2eb3f7b73e6136c77020f444d8f0.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: reset: imx8mq: Add _N suffix to
 IMX8MQ_RESET_MIPI_CSI*_RESET
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Robby Cai <robby.cai@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 festevam@gmail.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	aisheng.dong@nxp.com
Date: Tue, 31 Mar 2026 14:45:07 +0200
In-Reply-To: <20260331101331.1405588-2-robby.cai@nxp.com>
References: <20260331101331.1405588-1-robby.cai@nxp.com>
	 <20260331101331.1405588-2-robby.cai@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_054521_059164_400449D4 
X-CRM114-Status: GOOD (  10.80  )
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

On Di, 2026-03-31 at 18:13 +0800, Robby Cai wrote:
> The assert logic of the MIPI CSI reset signals is active-low on i.MX8MQ,
> but the existing names do not indicate this explicitly. To improve
> consistency and clarity, append the _N suffix to all
> IMX8MQ_RESET_MIPI_CSI*_RESET definitions. The deprecated
> IMX8MQ_RESET_MIPI_CSI*_RESET versions remain temporarily for DT ABI
> compatibility and will be removed at an appropriate time in the future.

The register description in the latest reference manual I can download,
IMX8MDQLQRM Rev. 3.1 (06/2021), still call these bits
MIPI_CSI1_CORE_RESET and so on (without _N). There is no mention of
polarity in the bitfield description. Is a documentation update
planned?

Right now I'd say this improves clarity, but reduces consistency with
existing documentation.

Are these bits self-clearing, or can the reset be asserted by writing
0? As it stands, the CSI driver using these resets, imx8mq-mipi-csi2.c,
only calls reset_control_assert() in imx8mq_mipi_csi_sw_reset():

          /*                                                         =20
           * these are most likely self-clearing reset bits. to make it
           * more clear, the reset-imx7 driver should implement the  =20
           * .reset() operation.                                     =20
           */                    =20
          ret =3D reset_control_assert(state->rst);

This will probably have to be turned into a deassert together with the
reset driver change.

regards
Philipp

