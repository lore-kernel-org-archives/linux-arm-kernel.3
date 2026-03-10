Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE74EB1052
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23B0sW7TLy2SsjrPyd+kkupKVDBS90ijKBBr+MbJjFA=; b=C+00Ww8ODcl/x+KWl4+qcih6KE
	R/yvOzx2qcxNE0viBR+jEbnvEI5RoRxWLC+rk1w/PfKzjE8dkq5AjUQvooFfLnAJLtWBMJtyytips
	B7dWf9tzaAjRXFnfxyI0/d2lBY0BHyu1cISD2TKhYmqyfWQ0Xe8IGHPnRxS9adrhEDFkG8T8zOx7W
	MPOMQzTGlnrMQF5RSxWp4V4m7fptglJn6ex6Sj19c0/hat0OZ0NVXtqAaqgO0u6BymOEoZ/zx68Sf
	i/5qEQuMRIRTEHQi4BkZik++S1OwuLwxW3XR9gLEZEbsMTnKkZbtHGscp0Rk7Lknk3p15U3jHKAin
	0HO4+iCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzved-00000009KDi-1aLB;
	Tue, 10 Mar 2026 11:53:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzveZ-00000009KDL-2QPl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:53:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33B431A2D01;
	Tue, 10 Mar 2026 11:53:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0613660002;
	Tue, 10 Mar 2026 11:53:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EDCD10369A98;
	Tue, 10 Mar 2026 12:53:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773143610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=23B0sW7TLy2SsjrPyd+kkupKVDBS90ijKBBr+MbJjFA=;
	b=Z7BbISe7HT9N7v21Wm54gyJ2yfbxsNsWE8LqImb+BJAg92oi32vIe26wWUBb/tVjx9ggaL
	hx2mmCQ3eChBTkeRRU+VkFHUBnkRQ/VE86g0+kLTQeMWdplzeXSLPZMm4CYIvYjyOYrjjQ
	gQBOKfHunMd8tCuDBlo+7rm4jj+cawyiLGrZgXWKAI83d7lj5uQ8thUj463AUegMpo233h
	C030UHBSUNWMu5u/d/6UgGR8g7pSobUR9XzHqciYgKFhiNwKDW+OYoTO2EQ/4F2TZUt5D2
	f0zW+Lg7P4CERgYoe1H12rCsMBUQz1b/wHr/gjUqZaZRGGSN8/3m6c6P+776Qg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 12:53:07 +0100
Message-Id: <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Cc: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Marco Felsch"
 <m.felsch@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "Peng Fan" <peng.fan@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de> <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de> <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
In-Reply-To: <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_045335_770520_6E6B6316 
X-CRM114-Status: GOOD (  12.76  )
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

Hi Liu, Marco,

On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
> Hi Marco, Luca,
>
> On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
>
> [...]
>
>> +	next_bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
>> +	if (IS_ERR(next_bridge))
>> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
>> +				     "failed to get next bridge\n");
>> +	pdfc->dev =3D dev;
>> +	pdfc->bridge.of_node =3D dev->of_node;
>> +	pdfc->bridge.type =3D DRM_MODE_CONNECTOR_DPI;
>> +	pdfc->bridge.next_bridge =3D next_bridge;
>
> When I was reviewing another patch[1], I was aware of the necessity of
> calling drm_bridge_get() for next_bridge to balance the next bridge's
> refcount put from __drm_bridge_free() for this bridge.  I'd be good if
> Luca may confirm this is correct.  Sorry for bringing this up late.

Indeed you have a good point.

After re-checking devm_drm_of_get_bridge(), as I wrote on the other thread
you pointed to, you should call drm_bridge_get():

-	pdfc->bridge.next_bridge =3D next_bridge;
+	pdfc->bridge.next_bridge =3D drm_bridge_get(next_bridge);

Marco, you can keep my R-by if you resend with just this change.

Sorry about the confusion here.

As mention on the other thread, devm_drm_of_get_bridge() is unable to
support bridge hotplug. So it should be deprecated, but as of now there is
no alternative.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

