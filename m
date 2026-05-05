Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD49CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiFhYTTWhPaYG7k6xQeGXacfbvfc085+WmffoobFaWY=; b=w5lZ5rBHyyJLubpmFyCWolQsaa
	jnYg8tcp+fPN4f6nJ0sNnpOEgGjfKBtObfnkByvt9g8DplZ6m2NanjkDrZ092YkxH5Zy62gyL5kJc
	3qSVQoTTRTFeIZcs94LTtlDZyycmxBosbMhEcyh8p8RO6/SgLvxERXKqwRuketU3OFXCljIkp5dEo
	70+zSFVWOaSjEZqpNmHF/TS8SD6gCFaB+goMLpsKiqvXX8zu5xb6fhMqPJ+xN/uypp00Uiu4+eNE3
	ybdh/lAt5rklPN84pmjHIBcc4xUt6FYU81ADZWA0FsuCP0CkIssy9lGwu5DfwALHlYoClzBebGqlW
	3sgnRBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGPN-0000000GRPH-3nqZ;
	Tue, 05 May 2026 14:05:57 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGPI-0000000GRHI-2X2z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:05:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2CDA84E42BC6;
	Tue,  5 May 2026 14:05:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D186053C;
	Tue,  5 May 2026 14:05:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81E7D11AD01FF;
	Tue,  5 May 2026 16:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777989946; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LiFhYTTWhPaYG7k6xQeGXacfbvfc085+WmffoobFaWY=;
	b=T6dtH4l3SQK8LakHyVwGl4F+Oc2UPGOw7DGU4SoB5JYhBmRNfbFaZbGwbMM8BVGf/cTSdJ
	TPs3f6k4Da6l+T2I7apfGrj8TAUNblc/HSE2nt4W2tCn5mZockxFpnIKvI+U/GhW4uflal
	p49Mwskl/NbrSvWh3ixnlOKcur52nwrXfjrso3lE6c7ZPjkR2GEJ/b50VGHZ0k0I5kHzz+
	NHCByjlmqwBVUGT4izIkL/1TYeGeEAEulBemXbys2xuEl4EnA9684gfH6Q5XI6W6dbqat2
	GawapjmBH1FYkduLf87eZDe5VdNf7gP607oQSn5RjGB7JB5GhNYnTdk2eamS+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 16:05:36 +0200
Message-Id: <DIASTWTYYQDQ.1R0JI8NB9I4KE@bootlin.com>
Subject: Re: [PATCH v4 10/11] drm: zynqmp_dp: switch to
 of_drm_get_bridge_by_endpoint()
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "John Stultz" <jstultz@google.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Michal Simek" <michal.simek@amd.com>,
 "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-0-b578c3daaf10@bootlin.com> <20260504-drm-bridge-alloc-getput-panel_or_bridge-v4-10-b578c3daaf10@bootlin.com> <20260504152418.GC1455860@killaraus.ideasonboard.com>
In-Reply-To: <20260504152418.GC1455860@killaraus.ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070552_771951_3781090B 
X-CRM114-Status: GOOD (  10.08  )
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

Hi Laurent,

On Mon May 4, 2026 at 5:24 PM CEST, Laurent Pinchart wrote:

[...]

>> @@ -2461,10 +2459,15 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
>>  	 * Acquire the next bridge in the chain. Ignore errors caused by port@=
5
>>  	 * not being connected for backward-compatibility with older DTs.
>>  	 */
>> -	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 5, 0, NULL,
>> -					  &dp->next_bridge);
>> -	if (ret < 0 && ret !=3D -ENODEV)
>> -		goto err_reset;
>> +	dp->bridge.next_bridge =3D of_drm_get_bridge_by_endpoint(dp->dev->of_n=
ode, 5, 0);
>> +	if (IS_ERR(dp->bridge.next_bridge)) {
>> +		if (PTR_ERR(dp->bridge.next_bridge) =3D=3D -ENODEV) {
>> +			dp->bridge.next_bridge =3D NULL;
>> +		} else {
>> +			ret =3D PTR_ERR(dp->bridge.next_bridge);
>> +			goto err_reset;
>> +		}
>
> I would find
>
> 		if (PTR_ERR(dp->bridge.next_bridge) !=3D -ENODEV) {
> 			ret =3D PTR_ERR(dp->bridge.next_bridge);
> 			goto err_reset;
> 		}
>
> 		dp->bridge.next_bridge =3D NULL;
>
> easier to read. Up to you.

Makes sense, change queued up for v5.

Thanks for reviewing!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

