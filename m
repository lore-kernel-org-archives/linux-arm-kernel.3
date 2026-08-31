Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F768C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH3+ta8Jzlfe9YfifDoY6Fp8kEL/fycLY3rWU7L5qew=; b=NJgRV4gPxpn5nooTvvunY5s08X
	z/hHS3llRPTh7tMCWvE797ScYfdFq5YAFF6u350S6X6uBcH9UttO1f9O05zQ8zOVunsxzUW3VSfaL
	szHGbiGIEY4iMDnXSEAHiILgisomnYSyszKxmrMXDLrcVwyK8bsybzRQy88TChcZU30dZTODbzY/X
	Qso54bYkGP+aEODyF/vyLMjjCHqeKiUHQtmtfkPqnbyY6y6U1cRYoLDTumsleBV7FgY4XXiOtXME8
	vKxeA7bZMQsnX8XBW5SgH0pT85Rb1I/E/H2U8SZhjwPdziu6kpVEn1YURgiqCJChLN1zChupNiFbx
	zT/DW7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xnr-00000008xLO-3R5E;
	Mon, 31 Aug 2026 08:55:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xno-00000008xKO-3Izd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:55:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B99A04E41465;
	Mon, 31 Aug 2026 08:55:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 828D960231;
	Mon, 31 Aug 2026 08:55:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E612411C78388;
	Mon, 31 Aug 2026 10:55:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788166531; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IH3+ta8Jzlfe9YfifDoY6Fp8kEL/fycLY3rWU7L5qew=;
	b=t61caDuSF2irF6DNux1IMZxVTw2aJtxSkCDUvMTvvKIgWTYP/CUgZT90GJDTUMXVxgTA72
	L0MrzWTPPVI/7As/5c+SAlmYDsATfKkMXUql+Q7ADipsRnCYTkVAUgFma8Lz/IUtx6I+GF
	CaC4LTGkeq5u+oDyN+BK2ITp6KNabqs9V9u0EMDkMl6MXNPHJShb0c24FMcWer2CLHEHet
	pMYW5zn5jvAouPnbCJ584CP19xNFM6sQDFl79L1tDP5JgTh8ZODYPMVdGIV0vaQ6pWnKeE
	1lMTWpUAKULoUNw+OR/4cIEES1WicZhLbhDBbihZ7cwSS7PFd3CbzAckKme4dA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:55:20 +0200
Message-Id: <DL304N0GO2Z1.34O1XQZZ4HSHK@bootlin.com>
Subject: Re: [PATCH v2 04/12] drm/bridge: ti-sn65dsi86: don't select unused
 DRM_PANEL
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "Sandeep Panda"
 <spanda@codeaurora.org>, "Franz Schnyder" <franz.schnyder@toradex.com>,
 "John Ripple" <john.ripple@keysight.com>, "Michael Walle"
 <mwalle@kernel.org>
To: "Doug Anderson" <dianders@chromium.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com> <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com> <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
In-Reply-To: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_015540_960193_414AA749 
X-CRM114-Status: GOOD (  14.39  )
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

Hi Doug,

On Thu Aug 27, 2026 at 6:24 PM CEST, Doug Anderson wrote:
> Hi,
>
> On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
>>
>> This driver does not use the drm_panel APIs at all, so no need to select
>> DRM_PANEL.
>>
>> Cc: Douglas Anderson <dianders@chromium.org>
>> Cc: Sandeep Panda <spanda@codeaurora.org>
>> Cc: Franz Schnyder <franz.schnyder@toradex.com>
>> Cc: John Ripple <john.ripple@keysight.com>
>> Cc: Michael Walle <mwalle@kernel.org>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> ---
>>  drivers/gpu/drm/bridge/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kco=
nfig
>> index 043596801a65..d46aa2eb01b5 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -474,7 +474,6 @@ config DRM_TI_SN65DSI86
>>         select DRM_BRIDGE_CONNECTOR
>>         select DRM_KMS_HELPER
>>         select REGMAP_I2C
>> -       select DRM_PANEL
>>         select DRM_MIPI_DSI
>>         select AUXILIARY_BUS
>>         select DRM_DISPLAY_DP_AUX_BUS
>
> Looks right to me. Ages ago it used panel APIs directly, but not today.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks!

> I assume you have a plan for landing the series. If you want me to
> land this patch on its own to drm-misc-next, please yell.

I have commit rights, so I'll apply the series as soon as I have the needed
R-by/A-bys.

I am also sending a v3, unchanged, but with an additional patch as
suggested by Sashiko:
https://lore.kernel.org/all/20260825103234.3F2B71F000E9@smtp.kernel.org/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

