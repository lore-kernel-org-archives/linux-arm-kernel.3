Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954EFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSZEDn5xe/S/FvshMIWqAmK23ulTfZc+nYOYqRLQ2iA=; b=zdxp6TYzY+y2OF10dWcgGVVnSd
	xX9gAsG3xfxe4XFBfaFivvpVAnSTayK/oBRc8Xie/TO+NXB9vH/dyF/JtjXm5qaOd+9g1EDWm+vr/
	EVj46pLbFcOGcopWcu2n3O790GQi2W/e9q57m3tggZ3hu7kfxYQ1l2DWsD6H1T9/5gXkXR7QWMsHP
	mGeqNPJuQMLulrZnzKuM0mwNCbVSj/JfWI1U8rhbqnBA8n05VT1L2tG/izUuPPc6k8HA0IhryN9LF
	CVKr6N52ic3yYNNUcOaVLlrlNUCvrNWhCtFGKmGLwqI5vHvx8vgb6CGBT4XYaF7831x7Ie/OJdJJN
	7MlF/qpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGkI-00000004SOq-1XFi;
	Thu, 02 Jul 2026 12:42:22 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfGkF-00000004SNw-1bZJ;
	Thu, 02 Jul 2026 12:42:21 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C5B572004C9;
	Thu,  2 Jul 2026 14:42:14 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AC91D200445;
	Thu,  2 Jul 2026 14:42:14 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 196A9202A8;
	Thu,  2 Jul 2026 14:42:14 +0200 (CEST)
Date: Thu, 2 Jul 2026 14:42:14 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, linux@armlinux.org.uk,
	ghennadi.procopciuc@nxp.com, Ionut.Vicovan@nxp.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, horms@kernel.org, Frank.li@nxp.com
Subject: Re: [PATCH 0/4 v2] Serdes: s32g: Add support for serdes subsystem
Message-ID: <akZcpgDSjAg6gcok@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260203161917.1666696-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203161917.1666696-1-vincent.guittot@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_054219_556321_082492B1 
X-CRM114-Status: GOOD (  12.94  )
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

On Tue, Feb 03, 2026 at 05:19:13PM +0100, Vincent Guittot wrote:
> s32g SoC family includes 2 serdes subsystems which are made of one PCIe
> controller, 2 XPCS and a shared Phy. The Phy got 2 lanes that can be
> configured to output PCIe lanes and/or SGMII.
>     
> Implement PCIe phy and XPCS support.
>     
> Change since v1:
> - Fix compile_test
> - Use devm_reset_control_get_exclusive()
> - Fix s32g_serdes_phy_set_mode_ext()
> - Manage devm_clk_bulk_get_all() returns 0
> - Fix s32g_serdes_parse_lanes() error management
> - Move xpcs filein drivers/net/pcs/
> - Add pcs_inband_caps()
> - Fix functions in phylink_pcs_ops
> - Fix MAINTAINERS
> 
> 
> Vincent Guittot (4):
>   dt-bindings: serdes: s32g: Add NXP serdes subsystem
>   phy: s32g: Add serdes subsystem phy
>   phy: s32g: Add serdes xpcs subsystem
>   MAINTAINERS: Add MAINTAINER for NXP S32G Serdes driver
> 
>  .../bindings/phy/nxp,s32g-serdes.yaml         |  154 +++
>  MAINTAINERS                                   |   10 +
>  drivers/net/pcs/Makefile                      |    1 +
>  drivers/net/pcs/pcs-nxp-s32g-xpcs.c           | 1006 +++++++++++++++++
>  drivers/phy/freescale/Kconfig                 |   10 +
>  drivers/phy/freescale/Makefile                |    1 +
>  drivers/phy/freescale/phy-nxp-s32g-serdes.c   |  953 ++++++++++++++++
>  include/linux/pcs/pcs-nxp-s32g-xpcs.h         |   50 +
>  8 files changed, 2185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/nxp,s32g-serdes.yaml
>  create mode 100644 drivers/net/pcs/pcs-nxp-s32g-xpcs.c
>  create mode 100644 drivers/phy/freescale/phy-nxp-s32g-serdes.c
>  create mode 100644 include/linux/pcs/pcs-nxp-s32g-xpcs.h
> 
> -- 
> 2.43.0
> 

Hi Vincent, all,
I'm taking over the S32G SerDes/XPCS upstreaming. The effort has moved in-house
at NXP and I'll be carrying it forward, continuing from this v2 rather than
restarting from zero.

Vincent, thanks for the v1->v2 groundwork. I'll keep your authorship on the
patches that originate from your series (Co-developed-by plus your
Signed-off-by) and build on top; I'll send you v3 off-list first, as you
offered.

A v3 is in preparation and will come as an RFC, with the v2 review comments
addressed.

Vincent, if you're OK with the handoff, a short ack here would help make the
transition visible to the reviewers.

Thanks.
/Jan


