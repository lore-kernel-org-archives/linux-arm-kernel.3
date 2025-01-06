Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED96E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUk68aiyMXS1Mc+lmT/iASH9vRB5FFsj4jqhaNuNNKg=; b=CDCETbiW31svO0JNU6c+PA/eiJ
	Whmp1sQjgMgvyDlutECNXBhDXtBIHFBwt8M1N1d0ni6Lg6FFVLScN3pYIsMhkWVt3WARlNZRVRxw0
	n/P+08CCd+UEFXPPzNHpoquqltGcefvjon/dShupnL5og08uCYJdl+IQXtlWmk14H+MpXGQ6tqz90
	CMUFHO/dfik7clmGiBxMb687bbIxlnGJuctboVqjF2ocYn5t76ZNr6DMa/374TPEKL7wPaPYArP1D
	itUSBvQTva9S11ng7+KodlyBqMxLsEuy4x9VdRDlCN2pLxB/3dxkSeWYwD1lCoSA5Gbp8zlppaMoL
	Bs15cpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhC9-00000000MKm-0B7I;
	Mon, 06 Jan 2025 07:06:37 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhAw-00000000MHP-1tMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 07:05:23 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B9A822E;
	Mon,  6 Jan 2025 08:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1736147067;
	bh=awVHU3gXrjHE7tKmYneTP2+PaG8+KpDacT2GKYKtdbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFoU0USxLOmfN/9R8xKNakPqu5uHUW6/gLaq/jL3RANdfHywEFN2OUz+BSoInw32J
	 XEBwIzsIzJofCGWcZ0EhoX0QAaWb52462LDZElVeLwne2JMUUCjvp11SsTyXDKH02t
	 bmw8pzoNX+ZaWmaLOJTGVkl0V3xlMVfvryCR/+Rs=
Date: Mon, 6 Jan 2025 09:05:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/4] drm: bridge: dw_hdmi: Add flag to indicate output
 port is optional
Message-ID: <20250106070514.GA5568@pendragon.ideasonboard.com>
References: <20250105190659.99941-1-marex@denx.de>
 <20250105232219.GC21164@pendragon.ideasonboard.com>
 <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a783fe47-89dc-479b-8e85-f956d95cf404@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_230522_691662_F350FB24 
X-CRM114-Status: GOOD (  21.18  )
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

On Mon, Jan 06, 2025 at 03:48:52AM +0100, Marek Vasut wrote:
> On 1/6/25 12:22 AM, Laurent Pinchart wrote:
> > Hi Marek,
> 
> Hi,
> 
> > Thank you for the patch.
> > 
> > On Sun, Jan 05, 2025 at 08:06:03PM +0100, Marek Vasut wrote:
> >> Add a flag meant purely to work around broken i.MX8MP DTs which enable
> >> HDMI but do not contain the HDMI connector node. This flag allows such
> >> DTs to work by creating the connector in the HDMI bridge driver. Do not
> >> use this flag, do not proliferate this flag, please fix your DTs and add
> >> the connector node this way:
> >>
> >> ```
> >> / {
> >>      hdmi-connector {
> >>          compatible = "hdmi-connector";
> >>          label = "FIXME-Board-Specific-Connector-Label"; // Modify this
> >>          type = "a";
> >>
> >>          port {
> >>              hdmi_connector_in: endpoint {
> >>                  remote-endpoint = <&hdmi_tx_out>;
> >>              };
> >>          };
> >>      };
> >> };
> >>
> >> &hdmi_tx {
> >>      ...
> >>
> >>      ports {
> >>          port@1 {
> >>              hdmi_tx_out: endpoint {
> >>                  remote-endpoint = <&hdmi_connector_in>;
> >>              };
> >>          };
> >>      };
> >> };
> >> ```
> > 
> > Are there any in-tree DT sources that use the old bindings ?
> 
> See 
> https://lore.kernel.org/dri-devel/AM7PR04MB704688150ACD5D209290246A98092@AM7PR04MB7046.eurprd04.prod.outlook.com/

Maybe I'm missing something obvious, but where is the patch series that
moves the DT sources mentioned in that mail thread to the new bindings ?

> The rest is fixed, thanks.

-- 
Regards,

Laurent Pinchart

