Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6389CE7B1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bb0UJXfBdxAxh+iVnPVK+vs19ADwDSadYINv64vJMs=; b=Jm9/5h9rjzavHCGEVCK6TL6ein
	8qditP7g/KTbpMbj+WaXNYQRs2DOWri8SpOco0NDG8jrY0zzI1iNdnpP3udiZrC84gCbCi+AfIw58
	7adotpR1wta79YpCyQTJRpCGheGQhuzZXAxYkgCvkZ/v09pGf8T5Ceb8veRUQnKZibeB2PNyfOxo0
	rPW+KJg+WrAxgi9UUCYDKC8WAbTjCElXMycVvGtIh1omcIFGsnq8hQtxEu55/1/Km1SLlcWxZNeXq
	n3/x8TSzFTKztpqAYyPr3VWnkN9JfN9DWzBEdc55pqUNYCrjYRd8PVtaPZdYTRU2yA7LVz/u11mV7
	KFFHoKsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvEx-0000000CPUM-37Gg;
	Fri, 14 Nov 2025 14:57:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvEv-0000000CPTX-08aG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:57:30 +0000
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1036CB5;
	Fri, 14 Nov 2025 15:55:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763132124;
	bh=UTl0W5+Bdo6I+bjM1sDG2qr2k/CxEVF6Tf83hOXGMzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaZwhQLDGaev/igVb0jI/OydGH3dMJiRT5hie2WPZI9PhWjrvgydCncmP68HwsIgu
	 NMOdv/Dod3ygTeAVnKJy2eINSdDKG2I3B7kqTPukZdAjBN9Jt3CCNjyRmGKUN7rBX6
	 nd3GoNDppwdbVYgtEa5Z/5fN1XuPLYXj9XDckE7E=
Date: Fri, 14 Nov 2025 15:57:21 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com, nayden.kanchev@arm.com, 
	robh+dt@kernel.org, mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v13 15/15] Documentation: mali-c55: Document the mali-c55
 parameter setting
Message-ID: <umslyxkmj4gnr743c6ixsykay5w2seoeiy2hzidg6lb3fcizep@dglvrn7l7a4q>
References: <20251111-c55-v13-0-3dc581355e3a@ideasonboard.com>
 <20251111-c55-v13-15-3dc581355e3a@ideasonboard.com>
 <2n4sn2aakwl7k2qvcefb7m2zzllytj7i4nup55xex2ggdngfkd@gwpxbpmlupko>
 <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRdBbn4cpdn_7H0v@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_065729_232666_EF58FCD8 
X-CRM114-Status: GOOD (  24.83  )
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

Hi Sakari,
   can't say timing is what we excel the most at.

Afaik Hans has applied the PR, and as all comments here are on ...
comments, they will be addressed with patches on top

On Fri, Nov 14, 2025 at 04:49:18PM +0200, Sakari Ailus wrote:
> Hi Jacopo,
>
> On Thu, Nov 13, 2025 at 09:39:37AM +0100, Jacopo Mondi wrote:
> > > +the data member with the blocks that need to be configured by the driver, but
> > > +need not populate it with **all** the blocks, or indeed with any at all if there
> > > +are no configuration changes to make. Populated blocks **must** be consecutive
> > > +in the buffer. To assist both userspace and the driver in identifying the
> > > +blocks each block-specific struct embeds :c:type:`v4l2_params_block_header` as
> > > +its first member and userspace must populate the type member with a value from
> > > +:c:type:`mali_c55_param_block_type`. Once the blocks have been populated
> > > +into the data buffer, the combined size of all populated blocks shall be set in
> > > +the data_size member of :c:type:`v4l2_params_buffer`. For example:
> > > +
> > > +.. code-block:: c
> > > +
> > > +	struct v4l2_params_buffer *params =
> > > +		(struct v4l2_params_buffer *)buffer;
> > > +
> > > +	params->version = MALI_C55_PARAM_BUFFER_V1;
> > > +	params->data_size = 0;
> > > +
> > > +	void *data = (void *)params->data;
> > > +
> > > +	struct mali_c55_params_awb_gains *gains =
> > > +		(struct mali_c55_params_awb_gains *)data;
> > > +
> > > +	gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> > > +	gains->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > > +	gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> > > +
> > > +	gains->gain00 = 256;
> > > +	gains->gain00 = 256;
> > > +	gains->gain00 = 256;
> > > +	gains->gain00 = 256;
> > > +
> > > +	data += sizeof(struct mali_c55_params_awb_gains);
> > > +	params->data_size += sizeof(struct mali_c55_params_awb_gains);
> > > +
> > > +	struct mali_c55_params_sensor_off_preshading *blc =
> > > +		(struct mali_c55_params_sensor_off_preshading *)data;
> > > +
> > > +	blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> > > +	blc->header.flags |= V4L2_PARAMS_FL_BLOCK_ENABLE;
> > > +	blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> > > +
> > > +	blc->chan00 = 51200;
> > > +	blc->chan01 = 51200;
> > > +	blc->chan10 = 51200;
> > > +	blc->chan11 = 51200;
> > > +
> > > +	params->total_size += sizeof(struct mali_c55_params_sensor_off_preshading);
> >
> > s/total_size/data_size
> >
> > And I've also updated it to use the v4l2-isp types
> >
> > +.. code-block:: c
> > +
> > +       struct v4l2_isp_params_buffer *params =
> > +               (struct v4l2_isp_params_buffer *)buffer;
>
> What's the type of buffer here? If it's void, you can drop the cast.
>
> > +
> > +       params->version = MALI_C55_PARAM_BUFFER_V1;
> > +       params->data_size = 0;
> > +
> > +       void *data = (void *)params->data;
>
> No need for a cast here.
>
> > +
> > +       struct mali_c55_params_awb_gains *gains =
> > +               (struct mali_c55_params_awb_gains *)data;
>
> Ditto.
>
> Unless, I guess, you use C++. :-)
>

It was C++ code yes :)

> > +
> > +       gains->header.type = MALI_C55_PARAM_BLOCK_AWB_GAINS;
> > +       gains->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > +       gains->header.size = sizeof(struct mali_c55_params_awb_gains);
> > +
> > +       gains->gain00 = 256;
> > +       gains->gain00 = 256;
> > +       gains->gain00 = 256;
> > +       gains->gain00 = 256;
> > +
> > +       data += sizeof(struct mali_c55_params_awb_gains);
>
> 	data += sizeof(*gains);
>
> ?
>
> > +       params->data_size += sizeof(struct mali_c55_params_awb_gains);
>
> Ditto.
>
> > +
> > +       struct mali_c55_params_sensor_off_preshading *blc =
> > +               (struct mali_c55_params_sensor_off_preshading *)data;
> > +
> > +       blc->header.type = MALI_C55_PARAM_BLOCK_SENSOR_OFFS;
> > +       blc->header.flags |= V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > +       blc->header.size = sizeof(struct mali_c55_params_sensor_off_preshading);
> > +
> > +       blc->chan00 = 51200;
> > +       blc->chan01 = 51200;
> > +       blc->chan10 = 51200;
> > +       blc->chan11 = 51200;
> > +
> > +       params->data_size += sizeof(struct mali_c55_params_sensor_off_preshading);
>
> 	... += sizeof(*blc);
>
> ?

Patches will follow after v6.19 has been released


>
> >
> > With your ack, I'll apply the following changes before sending the PR.
> >
> > Thanks
> >   j
> >
> > > +
> > >  Arm Mali-C55 uAPI data types
> > >  ============================
> > >
> > >
>
> --
> Regards,
>
> Sakari Ailus

