Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D22CCDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC73b91HEO74osloKjUTD0DDGZ8iF8lp6LJqm7dhJ8M=; b=TmYEgpCbZKz8DwYLdlwEF9wJL+
	YsXrZmNfEDQ0VqkVtl+xbH/+JhClvqwjLp2MHaAtAFq2uGIG4mvY2X6d8ljQhKfjSnBKmNuHLMn1n
	RkgDFhFseg1IejgOzwPXApAmALo3FhQ86L4I7xfrb+ZLzLhV6uViIgivZB/YNwjB5jm/TI5/zYE7W
	ji5gXMID9K/7gyNKxSr1Q0qEQWGSBSWlRG0dGA2ZUaJbxW/HjwnOy8U6jvOyuJScszXa36Robx/NF
	DaFBNT3PNqvSDSq1M55mzpCoYdHaiq+0ESdkLuVe0+kzRBzm5c0V4BEF3Zo7NxFrEPQcmGkF6PbNY
	ySYhkc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnXM-00000009WIu-09F9;
	Thu, 25 Jun 2026 17:06:48 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnXI-00000009WIK-21As
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 17:06:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E5D9C4E408C8;
	Thu, 25 Jun 2026 17:06:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6ADF60220;
	Thu, 25 Jun 2026 17:06:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15F7B104C944D;
	Thu, 25 Jun 2026 19:06:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782407197; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LC73b91HEO74osloKjUTD0DDGZ8iF8lp6LJqm7dhJ8M=;
	b=uQm8PJkfrXPURCmngvTfk5NTqUnIqV6cUS22d2DQymp7VGhbWSK2YM/nr/FqTxrSJvF0HI
	b7lUArpGfPlCwTOCWJc8Vjghs6YYfzMlNwNBNy+whbSTPu35wSomkE3LSzZxgygA5o4rl6
	RlpNtnsDVdzgWQaM02AKxTR/LjHBtvFIzfAqnqcv8RCRrGInl1bxhn2IinCYZxxQzUM8sL
	WOQz/CggHTDGFsy5iAK7RxegIR4zXGQH6apGh3u85BeK0lCvopk5iDNZW9Iv6IobFB6WaM
	hKCYQRjkelATr+rfI04ZJjCp+f02zxyQZ7mcRNpRICltWfek6ZQcLhy9zArciQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Jun 2026 19:06:26 +0200
Message-Id: <DJIAM5GDIA9W.NJQJTONTBQRI@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 19/37] drm/bridge: samsung-dsim: move drm_bridge_add()
 call to probe
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>,
 "Stefan Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu"
 <Hui.Pu@gehealthcare.com>, "Ian Ray" <ian.ray@gehealthcare.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-19-45e2bdb3dfb4@bootlin.com>
 <20260608-mellow-weasel-of-politeness-a56172@houat>
 <DJ63DNXUOW46.1DI6982PGPFRR@bootlin.com>
 <20260624-courageous-accomplished-sambar-0e3cf8@houat>
In-Reply-To: <20260624-courageous-accomplished-sambar-0e3cf8@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_100644_679628_C69D2650 
X-CRM114-Status: GOOD (  34.88  )
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

On Wed Jun 24, 2026 at 5:28 PM CEST, Maxime Ripard wrote:
> On Thu, Jun 11, 2026 at 10:54:14AM +0200, Luca Ceresoli wrote:
>> On Mon Jun 8, 2026 at 1:58 PM CEST, Maxime Ripard wrote:
>> > On Tue, May 19, 2026 at 12:37:36PM +0200, Luca Ceresoli wrote:
>> >> This bridge driver calls drm_bridge_add() in the DSI host .attach cal=
lback
>> >> instead of in the probe function.
>> >>
>> >> This works for current use cases but is problematic for supporting ho=
tplug
>> >> of DRM bridges. The problematic case is when this DSI host is always
>> >> present while its DSI device is hot-pluggable. In such case with the
>> >> current code the DRM card will not be populated until after the DSI d=
evice
>> >> attaches to the host, which could happen a very long time after booti=
ng, or
>> >> even not happen at all.
>> >>
>> >> The reason is that the previous pipeline component (the encoder in th=
is
>> >> case) when probing cannot find the samsung-dsim bridge. What happens =
is:
>> >>
>> >>  [1 and 2 can happen in any order, same result]
>> >>  1) samsung-dsim probes (does not drm_bridge_add() itself)
>> >>  2) The lcdif starts probing multiple times, but
>> >>     lcdif_probe
>> >>     -> lcdif_load
>> >>        -> lcdif_attach_bridge
>> >>           -> devm_drm_of_get_bridge() returns -EPROBE_DEFER because
>> >>              the samsung-dsim is not in the global bridge_list
>> >>              (deferred probe pending: imx-lcdif: Cannot connect bridg=
e)
>> >>
>> >> The samsung-dsim will not drm_bridge_add() itself until a DSI device =
will
>> >> try to mipi_dsi_attach() to the DSI Host, which can happen arbitratil=
y late
>> >> on hot-pluggable hardware.
>> >>
>> >> As a preliminary step to supporting hotplug move drm_bridge_add() at =
probe
>> >> time, so that the samsung-dsim DSI host bridge is available during bo=
ot,
>> >> even without a connected DSI device. This results in:
>> >>
>> >>  1) samsung-dsim probes (and adds to drm_bridge_add() itself)
>> >>  2) The lcdif starts probing multiple times, but
>> >>     lcdif_probe
>> >>     -> lcdif_load
>> >>        -> lcdif_attach_bridge
>> >>           -> devm_drm_of_get_bridge() --> OK, returns samsung-dsim pt=
r
>> >>
>> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> >
>> > We should probably amend
>> > https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#specia=
l-care-with-mipi-dsi-bridges
>> >
>> > To mention this use case here
>>
>> Right. I haven't updated the docs for this v1 because I was not sure the
>> overall approach would be acked. Now Dmitry acked it overall, and I kind=
 of
>> infer you are not against, so I'll look into updating the docs in v2.
>>
>> However I find that section of the docs a bit hard to read especially fr=
om
>> a newcomer perspective.
>
> It's a complex problem, so I don't think we should expect the target
> audience to be newcomers. But maybe we can indeed improve it.
>
>> A better understanding on my side would help in doing the right change a=
s
>> far as this patch is concerned, and as a bonus in improving the section
>> overall (that would probably be a separate series).
>>
>> So I have a couple questions to start from:
>>
>>  * Do I understand correctly that using the component framework is legac=
y,
>>    not recommended for new DRM development, and that converting existing
>>    code to stop using it is welcome?
>
> No. It's not legacy or deprecated. And about the conversion, I guess
> it's on a case-by-case basis? It's not encouraged or discouraged anyway.
>
>>  * The first bullet quotes "The upstream driver [...] isn=E2=80=99t a MI=
PI-DSI
>>    host". If the upstream driver of a MIPI DSI link isn't a MIPI DSI hos=
t,
>>    what else could it be? What are the use cases here?
>
> Nowhere is it said that we're considering a MIPI-DSI link here,

To me, the section title "Special Care with MIPI-DSI bridges" seems to
suggest that.

What about rewording as "Possible driver combinations and their probe
sequences" or the like?

> so the
> use case is any bridge that isn't using MIPI-DSI at all.
>
>>  * If read literally, none of the 4 bullets after "Indeed, there=E2=80=
=99s multiple
>>    cases that needs to be considered" covers this driver (it does not us=
e
>>    the component framework, it does not use DCS, and the upstream device=
 is
>>    a DSI host). However the 3 bullets after "The ideal pattern to cover =
the
>>    last item" appear to cover what this driver does.  Do we need a fifth
>>    bullet for drivers like this one? Or...?
>
> You tell me :)
>
> How does hotplugging, say, a MIPI-DSI device bridge controlled over I2C,
> or a MIPI-DSI host bridge, affect the probing sequence, and can we end
> up in endless probe deferrals?

I'll try to write that in a fifth bullet in v2.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

