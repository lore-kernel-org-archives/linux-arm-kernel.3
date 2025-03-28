Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C754C36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfQaa787B8DEy+88Z288KkCipoRF65Y3wOciTnXojJs=; b=D9sEXivkLDuZ0mBDhnwVmW9h+z
	lzpC3iM7eXeMQazcSeKsX00pOZg+zWrl3cfSKvMTg6czlIFbJUNv4jcUZQjYNx0IhufrdPme4Lwbc
	I+lzBU/iMbNWEVXQ14upmvliyg5GUpScjQInWhhqUID+46+hIsgrq+5nsn6FHaDReDebdWt1tGFXd
	JctEYHAreCJ84K7gkv/GULe6r4uobMAT1HEKJ5feAjdWJmxt5RDyts73hwipS1rYCNl3pPaf/OhVn
	8OCczbarrk/yne33IkVy0ZedJ9KYev9iG1DsjPtYa3MlmVPBpnOFT7EoavEM7qUQtIwkKtligTC8q
	NwooDCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5Xi-0000000CyPf-2c8C;
	Fri, 28 Mar 2025 08:58:22 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5Vx-0000000CyHC-0slr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 08:56:34 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ABA0844;
	Fri, 28 Mar 2025 09:54:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743152081;
	bh=8LFkZVlNrqslp/Rsd3HJnDbo9vMoZv8DWHlbdsSgBo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkzDgYGPVMxD3mg2AwvkZ17isoDdkfKt9nfBsfyBoTue9jtF1EhfThMNtkBkXObxy
	 GhJfFMdJv7+ZAuBJCV/Fw5ul134XKC69iVN/Kti8IVtiGkBOMszH0WiYiCDx5vCZog
	 G7vCeNxeVEnoQFWFQuu/zmkRgQ+IkLkYr+u/67dw=
Date: Fri, 28 Mar 2025 10:56:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 07/12] media: imx8mq-mipi-csi2: Add imx8mq_plat_data
 for different compatible strings
Message-ID: <20250328085607.GE22295@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-7-324f5105accc@nxp.com>
 <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZAmCrZ=OmMLWF80mrMih+uFDKMp3dGsEosJe0vCHgEEYw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_015633_400740_D3EAFB57 
X-CRM114-Status: GOOD (  23.10  )
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

On Fri, Mar 28, 2025 at 10:35:44AM +0200, Daniel Baluta wrote:
> On Mon, Feb 10, 2025 at 11:02 PM Frank Li <Frank.Li@nxp.com> wrote:
> >
> > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> >
> > Introduce `imx8mq_plat_data` along with enable/disable callback operations
> > to facilitate support for new chips. No functional changes.
> >
> > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change from v2 to v3
> > - none
> > change from v1 to v2
> > - remove internal review tags
> > ---
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 60 ++++++++++++++++++++-------
> >  1 file changed, 46 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 1f2657cf6e824..b5eae56d92f49 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -62,6 +62,8 @@
> >  #define CSI2RX_CFG_VID_P_FIFO_SEND_LEVEL       0x188
> >  #define CSI2RX_CFG_DISABLE_PAYLOAD_1           0x130
> >
> > +struct csi_state;
> > +
> >  enum {
> >         ST_POWERED      = 1,
> >         ST_STREAMING    = 2,
> > @@ -83,11 +85,11 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> >
> >  #define CSI2_NUM_CLKS  ARRAY_SIZE(imx8mq_mipi_csi_clk_id)
> >
> > -#define        GPR_CSI2_1_RX_ENABLE            BIT(13)
> > -#define        GPR_CSI2_1_VID_INTFC_ENB        BIT(12)
> > -#define        GPR_CSI2_1_HSEL                 BIT(10)
> > -#define        GPR_CSI2_1_CONT_CLK_MODE        BIT(8)
> > -#define        GPR_CSI2_1_S_PRG_RXHS_SETTLE(x) (((x) & 0x3f) << 2)
> > +struct imx8mq_plat_data {
> > +       const char *name;
> > +       int (*enable)(struct csi_state *state, u32 hs_settle);
> > +       void (*disable)(struct csi_state *state);
> > +};
> >
> >  /*
> >   * The send level configures the number of entries that must accumulate in
> > @@ -106,6 +108,7 @@ static const char * const imx8mq_mipi_csi_clk_id[CSI2_NUM_CLKS] = {
> >
> >  struct csi_state {
> >         struct device *dev;
> > +       const struct imx8mq_plat_data *pdata;
> >         void __iomem *regs;
> >         struct clk_bulk_data clks[CSI2_NUM_CLKS];
> >         struct reset_control *rst;
> > @@ -137,6 +140,35 @@ struct csi2_pix_format {
> >         u8 width;
> >  };
> >
> > +/* -----------------------------------------------------------------------------
> 
> I would drop this line. It doesn't make code easier to read.

I personally find that clear section markers make the code easier to
read. It's a personal preference though, so I leave it to individual
driver maintainers, and aim for consistency within drivers.

> > + * i.MX8MQ GPR
> > + */
> 
> Just say: /* i.MX8MQ GPR */
> 
> This pattern happens in a lot of places.

-- 
Regards,

Laurent Pinchart

