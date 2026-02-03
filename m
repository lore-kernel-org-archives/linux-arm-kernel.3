Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA48E83078
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 10:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaxurYH+pSZiT55rBegAYaKI+3y+ZBTAe+5LlaGS5Qc=; b=2xeOMEOZ4T0/gJEOjC7Bf+Tqjl
	pjDYwoYS8cYhpEgQWQ9vLz5nrmJr1EgdxKLBy4QyufZu2cD6td12sBzKa7tT2hBRRkcK/J0/PuKeh
	re8F6ktbPR1bGA5Qlbd3MaQ4BmEXf6Wt8G8UoMMP4WWWwQ9Gv0KOj+Y9ohX2VlrOdQKXuwX+Wp5oZ
	v6Y51cv86Z9ATz6Yvy5MnN01TuC7L1ojb3aJM3IoGyhseREh34Ve5drKpWpttXf8Ql7KMXQkX3Cp3
	9beogufa6t25Ujcb+y9S+KSr2atp/ssQGaBnUE1WPO/RO3J7zpiSqp1LpQ2QBkQCa7//ECnCwkzjp
	D66doQUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDOD-00000006S65-0s3N;
	Tue, 03 Feb 2026 10:12:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnDOA-00000006S5F-2ew7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 10:12:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 399771A2BA8;
	Tue,  3 Feb 2026 10:12:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0765E60728;
	Tue,  3 Feb 2026 10:12:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C634119A8888;
	Tue,  3 Feb 2026 11:11:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770113521; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kaxurYH+pSZiT55rBegAYaKI+3y+ZBTAe+5LlaGS5Qc=;
	b=soDBBG2bgMR8f2LbgIrwrYZOZzYJcpbUWVYRItBu2O1PQqna30rioLkNHxmoqkhNvMoty+
	if15F8cH7NZWu28bObiIMmjSXkf/cYBNUhfuBPoO76QtFqb1UQUMLfLDYevJwW/p1Kl7Lu
	+I3G0dxG+J6RhTJVOFeRfdIz+h/B9NG/cjr+thEijncqEHuyHKZUwYUANoWLQg294fKT8y
	TDLWlGQamhmukciHP6cONfNmeBtpmJaloA59+nUyzJxHvdVhD6JznC5KaF3u+dPqNNeDk7
	seesqobwi6ZjgtZhhsyn/aWw21kF+XuG5pXLFvYh5MYavI/tXRZlfn3DYpa2Fg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 11:11:50 +0100
Message-Id: <DG58VCQ54OZA.2QHGR8JFIATY2@bootlin.com>
Subject: Re: [PATCH v8 05/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <jani.nikula@intel.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251217093321.3108939-1-damon.ding@rock-chips.com>
 <20251217093321.3108939-6-damon.ding@rock-chips.com>
 <DG2S064XPGXL.1MQDAKWZEK50K@bootlin.com>
 <7256ecf9-b10b-428c-a1a6-e35e80a686ed@rock-chips.com>
 <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
In-Reply-To: <9e1da672-a52d-4ec3-a20a-fe6f8ca15496@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_021206_799007_A0AA1E7A 
X-CRM114-Status: GOOD (  22.43  )
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

Hello Damon,

On Tue Feb 3, 2026 at 2:31 AM CET, Damon Ding wrote:
> Hi,
>
> On 2/2/2026 10:54 AM, Damon Ding wrote:
>> Hi Luca,
>>
>> On 1/31/2026 8:33 PM, Luca Ceresoli wrote:
>>> Hello Damon, Dmitry,
>>>
>>> On Wed Dec 17, 2025 at 10:33 AM CET, Damon Ding wrote:
>>>> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
>>>> out of imx/ subdir for multi-platform use. The driver is also renamed
>>>> to make it more generic and suitable for platforms other than i.MX.
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v7:
>>>> - Rename legacy-bridge to of-display-mode-bridge.
>>>> - Remove unnecessary API drm_bridge_is_legacy().
>>>
>>> ...
>>>
>>>> --- a/drivers/gpu/drm/bridge/Kconfig
>>>> +++ b/drivers/gpu/drm/bridge/Kconfig
>>>> @@ -244,6 +244,16 @@ config DRM_NXP_PTN3460
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NXP PTN3460 eDP-LVDS bridge=
 chip driver.
>>>>
>>>> +config DRM_OF_DISPLAY_MODE_BRIDGE
>>>> +=C2=A0=C2=A0=C2=A0 tristate
>>>> +=C2=A0=C2=A0=C2=A0 depends on DRM_BRIDGE && OF
>>>> +=C2=A0=C2=A0=C2=A0 help
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a DRM bridge implementation th=
at uses
>>>> of_get_drm_display_mode
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to acquire display mode.
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Newer designs should not use this brid=
ge and should use proper
>>>> panel
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead.
>>>
>>> "Newer designs should not use this bridge", but in patch 8 you are
>>> introducing a new use ot devm_drm_of_display_mode_bridge(). Shouldn't y=
ou
>>> instead "use proper panel driver instead" in patch 8?
>>>
>>> Can you point to the conversation where the converstaion where Dmitry
>>> suggested this change? Maybe it already contains the answer to my
>>> qustion. Also adding a link to that conversation in the commit message
>>> woule be useful.
>>>
>>
>> First of all, thanks for your reviews on this patch series.
>>
>> link: https://lore.kernel.org/all/
>> xwenycscalzdlpuxytorbiyvej3k7pv3lhxwtadilxq65ipwsv@x5rxm53w5e22/
>>
>> I think it may be a misleading issue caused by directly copying the
>> previous Kconfig description. Now that the new
>> devm_drm_of_display_mode_bridge() helper has been added, drivers using
>> the panel-bridge framework can rely on it to maintain compatibility with
>> legacy display mode parsing.

Ah, I think I got the point: the mode description in device tree is legacy,
but the driver itself is not legacy and will be current until we need to
support legacy device tree. Correct?

If that's correct, this patch looks OK to me with a new Kconfig help text.

>> It would be better to update the comment as follows:
>>
>> This is a DRM bridge implementation that uses of_get_drm_display_mode to
>> acquire display mode.
>>
>> It exists for compatibility with legacy display mode parsing, in order
>> to conform to the panel-bridge framework.
>>
>
> Dmitry, what's you take on this?

Dmitry's opinion would be much more relevant than mine. I don't know much
myself about this driver.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

