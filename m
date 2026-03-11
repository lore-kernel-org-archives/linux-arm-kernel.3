Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAC71049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QB6qHVGVEA+z4Xc5gsIYEzSiI3gVUu5JYonckjgoxWM=; b=SSxlLnSfHrdy/rjf6FBKow/i0u
	NWaMTwskp/SE76A2Xud0v9zozElYBnsu0NHw6lAAyWhuybUjGtGcthHmV0CJsDwSE9oUdAuuPvB7u
	rn7tg2///l6MPeE0KfxA8X9veFV22nn/ucuJZKeVYv5NG/dzAvnTBHCw+ZwGzvGCkFclApvfGIRel
	JECBELqFpSTSSvrf8ramMHdJPuVqt5FiHjxXnzUsXxmzoFUATNcLkxN2MENCfysLexZ2O0qKBs7tn
	7L1B88cekr23+yfMvFtFtf5zapEvnO8j6/NFy6X5gGnZN/uF9kiHmKvr7vGHgi4Z3490Zro04zoTU
	TUzYXtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gfm-0000000BPEB-0AEd;
	Wed, 11 Mar 2026 10:20:14 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gfj-0000000BPCy-38Rc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:20:13 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C51921A28ED;
	Wed, 11 Mar 2026 11:20:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AD0BF1A2908;
	Wed, 11 Mar 2026 11:20:07 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 9F43C202D1;
	Wed, 11 Mar 2026 11:20:06 +0100 (CET)
Date: Wed, 11 Mar 2026 11:20:07 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: NXP S32 Linux Team <s32@nxp.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	"David S. Miller" <davem@davemloft.net>, boon.khai.ng@altera.com,
	vladimir.oltean@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	rmk+kernel@armlinux.org.uk, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>, imx@lists.linux.dev
Subject: Re: [PATCH v9 4/5] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <abFB1/uxq/ha5Bwm@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260311-dwmac_multi_irq-v9-0-f0c03ef8d01f@oss.nxp.com>
 <20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com>
 <177322108829.2695119.13138199275449513148.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177322108829.2695119.13138199275449513148.robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032012_061854_D6212919 
X-CRM114-Status: GOOD (  17.03  )
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

On Wed, Mar 11, 2026 at 04:24:48AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 11 Mar 2026 08:53:59 +0100, Jan Petrous (OSS) wrote:
> > The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> > set them to allow using Multi-IRQ mode.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 47 +++++++++++++++++++---
> >  1 file changed, 42 insertions(+), 5 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: [error] duplication of key "items" in mapping (key-duplicates)
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml: ignoring, error parsing file
> ./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: found duplicate key "items" with value "[]" (original value: "[]")
> make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts'
> Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:57:7: found duplicate key "items" with value "[]" (original value: "[]")
> make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/nxp,s32-dwmac.example.dts] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1597: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260311-dwmac_multi_irq-v9-4-f0c03ef8d01f@oss.nxp.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Fixed in v10. Thanks Rob for review.

BR.
/Jan


