Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A8E6E80E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 11:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szFGRLlVCEwZRRovS/jad1iKZfVKQX8FqT/CwFCFTuw=; b=MlaBJO+S3/MV4p6NIYdV7Z6kpK
	NwtBXPGMNL0t1ORZgwP43V0UwNRi3NZJmJV5jGukG6lOl7YfnXoZuoTNX2iPsth0phu3gPRFWI22D
	djxzoPFSLouQ33Fu6SHfRGF0im4fBImnkc7WkCPPVOnlXJuVixfIFlKyhrLyRd3sS0X2Y49dMmAg3
	Onzbwe94yQ7DaxbXfuUGtrOp1/o5Zw5Ld/XDqiAQcVrl23q9hM559hx6qtxk+w4jIQvLNlCXXQTNu
	zpXXmnmw6cA8LJtD4ONz5Odl6FNJ/hAaacToTpY6o+B5dy59cBqu33V2ojhyBfZ2ZkfAJQlJVJJVJ
	XwG2Xt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEKN-00000006WU5-1RQS;
	Tue, 03 Feb 2026 11:12:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnEKI-00000006WTE-2GUG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 11:12:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88BF4C211DD;
	Tue,  3 Feb 2026 11:12:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4351F60728;
	Tue,  3 Feb 2026 11:12:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49DDD119A8888;
	Tue,  3 Feb 2026 12:11:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770117125; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=szFGRLlVCEwZRRovS/jad1iKZfVKQX8FqT/CwFCFTuw=;
	b=DPoX7rqxJKZUDYyaRDR7/S+6t9BTtJqy8WOm0KmHCdu7fbDoA48IJeL5CmMiKa5CyLOhPX
	1m04Tm1xnpB+4RqSBdn7YL51+pYU3mHNquNAHCkDuVG/s86TDceDYJ9NzVKwqMLOP+ckgr
	l5IyZPCe6xDcieA1XnO/XkU+hCgZUUoC71wA9QWyEwKGBoUn6jkxFv+oPWNTwgiVXpO+3X
	zROF2ReXs0saPeDrmiua4EgvrIFBe8Jc+tbqSIiRARGUc+JofQISJrkPs/wocHLOBMIBdh
	sPveengo3QMRO55rX/CBQjMu9HRt0XLeznsH2BnuNRYnSdvxUSFDSepExnD74A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 12:11:53 +0100
Message-Id: <DG5A5BNULPQX.HRWTJLN9UQ2W@bootlin.com>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 "Damon Ding" <damon.ding@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v8 00/18] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <andy.yan@rock-chips.com>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <6571983.R56niFO833@diego>
In-Reply-To: <6571983.R56niFO833@diego>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_031210_741975_2870AC27 
X-CRM114-Status: GOOD (  14.08  )
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

Hello Heiko, Damon,

On Mon Jan 19, 2026 at 5:06 PM CET, Heiko St=C3=BCbner wrote:
> Hi Damon,
>
> Am Mittwoch, 17. Dezember 2025, 10:33:03 Mitteleurop=C3=A4ische Normalzei=
t schrieb Damon Ding:
>> PATCH 1 is to ensure the last bridge declares OP_EDID or OP_MODES or bot=
h.
>> PATCH 2 is a small format optimization for struct analogid_dp_device.
>> PATCH 3 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>> PATCH 4 is to add a new parameter to store the point of next bridge.
>> PATCH 5 is to make legacy bridge driver more universal.
>> PATCH 6-11 are preparations for apply drm_bridge_connector helper.
>> PATCH 12 is to apply the drm_bridge_connector helper.
>> PATCH 13-15 are to move the panel/bridge parsing to the Analogix side.
>> PATCH 16 is to attach the next bridge on Analogix side uniformly.
>> PATCH 17-18 are to apply the panel_bridge helper.
>
> On top of all the recent bridge-related commits, this series still works
> on my rk3588-eDP board - when the display is plugged in on boot.
>
> As that is the current state we also had before, this series:
> Tested-by: Heiko Stuebner <heiko@sntech.de> on rk3588

I'm appplying patches 1-3 and got a checkpatch warning for each patch:

  WARNING: Unexpected content after email: 'Heiko Stuebner <heiko@sntech.de=
> on rk3588', should be: 'Heiko Stuebner <heiko@sntech.de> (on rk3588)'

I'm fixing it while applying those 3 patches.

Damon, can you fix that for the remaining patches before sending a new
iteration?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

