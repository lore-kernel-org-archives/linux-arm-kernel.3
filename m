Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1790F34C68
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WhJV/dSWPhYZ6I8oCEn+1gY0fZt2y2fO4rItoVzHSg=; b=cCbKa7dzxOhRfZ/MZ19gfrR8xx
	xkG1EN0/73HaitKs/Dl/F991D4QP3bqzUTahGCVA4gziwVstjxAwGbprb1Hdci33cLvoiVXWH/iHz
	SMs1qmDaFAUtZoSJ1UQqjDh9OLwJK1oCwlFqjlCzZuUcb2cMgw9ejFKrYrLe0ojFU/rRG+DK+s64g
	svpLtf79AGxts7GoWD9cPN9t5HJIeLYzgCor1BwcXZynlnQV9qeV4OJPYI4tfRnC8u8U99Ryf49FK
	ZytWY8igI9GpCm5Ouw19iab7pKL0udPpMZtMbVT0qNfkRe1tP7bPqUoeUfXz4gAEIZimtM9B+yGS9
	Fgzv90Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKl7-0000000G6mK-2zXz;
	Mon, 13 Apr 2026 17:07:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKl3-0000000G6lz-3vk1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 17:07:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 289564E42978;
	Mon, 13 Apr 2026 17:07:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E42B45FFB9;
	Mon, 13 Apr 2026 17:07:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D876A10450150;
	Mon, 13 Apr 2026 19:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776100046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7WhJV/dSWPhYZ6I8oCEn+1gY0fZt2y2fO4rItoVzHSg=;
	b=FAthUWkYP3onPAjkaVdhEkowM64WlLaovRGOEKVVYVlDIIxl1jy0QIhBPcrZAkGVX1XGB3
	68NsMnuFgEKyarOAkggZ9Q/mVJFT/0grRcj2UEIlJqw+b4/maFxBlEqOGBmsN83WXQx3sQ
	O/Wj97KDGpbnaLFBUBNUXU4Z/ewKqcYE2iDllMv0neZ3/YBd/UjuCgceNNDBbpTfsDg00b
	fvk52HkNhzPYI/ns2RoNU7jsja2/gO+/7butSZ244ROXKIeKkn3pFd++cEYgNsyFOD7XIr
	8VClfbu9wRVqChpcY6pZrGScJsYc8QIwKnocm2Im6J+MFhNg6YskhjYaGYjsCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 19:07:14 +0200
Message-Id: <DHS6WZRYGWZQ.1X6ABU4UWF730@bootlin.com>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>,
 "Abhinav Kumar" <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Sean Paul" <sean@poorly.run>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Xinliang Liu" <xinliang.liu@linaro.org>,
 "Tian Tao" <tiantao6@hisilicon.com>, "Xinwei Kong"
 <kong.kongxinwei@hisilicon.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Yongqin Liu" <yongqin.liu@linaro.org>, "John Stultz" <jstultz@google.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Michal Simek"
 <michal.simek@amd.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 01/10] drm/bridge: add of_drm_get_bridge_by_endpoint()
X-Mailer: aerc 0.20.1
References: <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-0-acd01cd79a1f@bootlin.com> <20260413-drm-bridge-alloc-getput-panel_or_bridge-v1-1-acd01cd79a1f@bootlin.com> <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
In-Reply-To: <u2awvqh2uoc2acuuvyavwwtuvtiaidhbkkj5a2d2wwph2s7j7g@b4j73kwzblgk>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_100734_146349_E00176D1 
X-CRM114-Status: GOOD (  21.09  )
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

Hi Dmitry, Maxime,

thanks Dmitry for the quick feedback!

On Mon Apr 13, 2026 at 4:58 PM CEST, Dmitry Baryshkov wrote:

>> --- a/drivers/gpu/drm/drm_bridge.c
>> +++ b/drivers/gpu/drm/drm_bridge.c
>> @@ -1581,6 +1581,52 @@ struct drm_bridge *of_drm_find_bridge(struct devi=
ce_node *np)
>>  	return bridge;
>>  }
>>  EXPORT_SYMBOL(of_drm_find_bridge);
>> +
>> +/**
>> + * of_drm_get_bridge_by_endpoint - return DRM bridge connected to a por=
t/endpoint
>> + * @np: device tree node containing output ports
>> + * @port: port in the device tree node, or -1 for the first port found
>> + * @endpoint: endpoint in the device tree node, or -1 for the first end=
point found
>> + * @bridge: pointer to hold returned drm_bridge, must not be NULL
>> + *
>> + * Given a DT node's port and endpoint number, find the connected node =
and
>> + * return the associated drm_bridge device.
>> + *
>> + * The refcount of the returned bridge is incremented. Use drm_bridge_p=
ut()
>> + * when done with it.
>> + *
>> + * Returns zero (and sets *bridge to a valid bridge pointer) if success=
ful,
>> + * or one of the standard error codes (and the value in *bridge is
>> + * unspecified) if it fails.
>
> Can we return drm_bridge or error cookie instead?

(while replying I realized there is a design flaw in my implementation, but
see below)

I initially thought I'd do it, but I don't like returning an error cookie
for functions getting a bridge pointer. The main reason is that with bridge
refcounting the __free() cleanup actions are handy in a lot of places, so w=
e
are introdugin a lot of code like:

  struct drm_bridge *foo __free(drm_bridge_put) =3D some_func(...);

Where some_func can be one of of_drm_find_bridge(),
drm_bridge_get_next_bridge(), drm_bridge_chain_get_{first,last}_bridge()
etc.

Such code is very handy exactly because these functions return either a
valid pointer or NULL, and thus the cleanup actions always does the right
thing. If an error cookie were returned, the caller would have to be very
careful in inhibiting the cleanup action by clearing the pointer before
returning. This originate for example this discussion: [0]

[0] https://lore.kernel.org/lkml/4cd29943-a8d0-4706-b0c5-01d6b33863e4@bootl=
in.com/

So I think never having a negative error value in the bridge pointer is
useful to prevent bugs slipping in drivers. For this we should take one of
these two opposite approaches:

 1. don't return a bridge pointer which can be an ERR_PTR; return an int
    with the error code and take a **drm_bridge and:
      - on success, set the valid pointer in *bridge
      - on failure, set *bridge =3D NULL (*)
 2. like the above-mentioned functions (of_drm_find_bridge(),
    drm_bridge_get_next_bridge() etc) return a drm_bridge pointer which is
    either a valid pointer or NULL

(*) I didn't do it in this patch, that's a design flaw, I'll fix in case
    approach 1 is taken

Clearly option 2 is the simplest to use, but it loses information about
which error happened.

What do you think about these options?

>> + */
>> +int of_drm_get_bridge_by_endpoint(const struct device_node *np,
>> +				  int port, int endpoint,
>> +				  struct drm_bridge **bridge)
>
> Nit: can it be drm_of_get_bridge_by_endpoint?

Argh, this convention is changing periodically it seems! :-)

I previous discussions I was asked to do either drm_of_ [1] of of_drm_ [2],
but since the latter was the last one requested I sticked on it.

@Maxime, Dmitry, I'm OK with either, just let me know if I need to change.

[1] https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad=
@houat/
    -> search "called drm_of_find_bridge"
[2] https://lore.kernel.org/all/DEH1VJUEJ8HQ.MIS45UOLCPXL@bootlin.com/
    -> search "What about"

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

