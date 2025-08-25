Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2029C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 18:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2zMojxEaqSXvN7rZ89UIzDP+AqmDlozbvrUX8uFGJo=; b=BPAlH8/NungQOzdu7b52wCW18E
	1bRZbTvozqajuIqBWqOvC/hU+ln3RYaOmW3jJ+Afuu9V8OjVW/EDk7H2CkghaJP99nUxXEsXsegAQ
	13MqfDV0dMkd7V8wnFwzUHcMQ2u+GVJjUVIjdlwJ8b0tSNTvEsCX3P/KTkSKUZKtf5b0L+VhsQovt
	mFMZaXw+njaFqNvXog+RCwcYTIRlU+Ncy/tIlHfXWHWbNTRcQSGnItc/2cz+c2m7dYioryqgefV5j
	M3ambSHCA/BrnolutOJr36AncXATcpoA4m61eBnjUyilggurFhklx/PzF2cszq7ZAMSARavsKJGz9
	8w5M1fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcF4-000000096wM-2Kjh;
	Mon, 25 Aug 2025 18:48:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqcCL-000000096Qa-0JSJ;
	Mon, 25 Aug 2025 18:45:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb7a16441so757896266b.2;
        Mon, 25 Aug 2025 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756147539; x=1756752339; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2zMojxEaqSXvN7rZ89UIzDP+AqmDlozbvrUX8uFGJo=;
        b=PdS3lWmwsa0wDn7pOscJmJdttsQqs+XkAp/whJTdoSP4KZJEE2pTQ3MisOgE3Mw+h9
         9ugmeqhkYCALiTpN7yJiyeT6/WFH6c4hXPk08PpP2ZVxalP79u3A0cYU67EbwMrWvgGX
         TnjhhGFnbYIOijvU/8eDgGt36jdsdrPOq7wuVdimz+teQZo0v5pNBJyR/NybuX+hscnh
         8UD11YoBm1tNZGmWOYIFPIA4to5KTY+ugbQTZuwhcWQ/s5pvP0rEPgOVhouGl4EgoKJ5
         1Zw6tKmxvGAiZ9YMCO+a0M976orGVQCdLE9xWBMdewkVE2/g5WBA0uSGlNdT7LCmcZfq
         ffZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756147539; x=1756752339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q2zMojxEaqSXvN7rZ89UIzDP+AqmDlozbvrUX8uFGJo=;
        b=rIJokGYz6dhV2O7W7ACkXkupqOdFRhHwNnrsD3Xq4kjDFGDTsg1gJ7xzI39LX/4cST
         +h5KKKMkoaus7M2hAyUsK0yDts4O5VUt9qAiij6FpAttnD8cfIwL2InrvWCrsYqnfZi9
         O1tbvlzlbD5cF8ZhQzsdfKf/FDR2Uk93EHKHEBw4Lh+3RYpf7XwzhDfUIjg8M4qIsUVQ
         O279YQFp3k1CBDKebx8WgjH2VlHCML3GW6d88cAhybLox0vQiXQbQSxjGbmnhWdQlqm5
         6cq90I6crbns4UIqYX/LvcQmo5EwkYmh33KcA58MV1hxB4Zf3TLm+IiWlLA65zxtNtM4
         rNkA==
X-Forwarded-Encrypted: i=1; AJvYcCUU63w0zYM1yEDCSZkRe428UiRam4F4X0GC1yMGQJYTsSv1OKfhJaIMLQL75LADabqaNFHXrsXIh9g9LWty3XGe@lists.infradead.org, AJvYcCUyxs2CRAnzTs/wswGGxBrSACMgJehEnAPBbRhNhPju90sIYz9fYprzKh2Su7dCesnnMhjIs+GKel6tRy0S4xI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYbnX1zIS8zTslaG7BUZVTppD1HHMadqjgbyWL/IaHwJGqC0Ja
	pEl2honhqZotsiHHFuC8Ahk2iX44oWgIv0rkhje8HYgaxyByzmnqp/u4XObxaRAtWClrrbi03R6
	oUOex/pgl9KSR5P0kQwb37hzuF8Kv18M=
X-Gm-Gg: ASbGncvfsRakzIga3keXr5l2+KEQDVCfaYK1J3FSilwbJVo1esqL1EH7oIYc3OqwFeD
	GGm+8gvBUC2FWoQd4ttYS/JKssxB+Cuud2iyxattVBGNcVQ4UNcevugh+pBBxoerocKBUG3VFe9
	7JG4UX6s2fvYaBYhccmu6tN3I8tXCrxuNW+M4Mn9aF/8joT3Ibaog3Vo+YIfi/5eU23gBn7A3Ix
	Yz2q1lCtRVisoYvSGsJTWrJrfmTIEDnmtMr06hv
X-Google-Smtp-Source: AGHT+IHSoLDTkq5deXOI5kOXvOEJGs7/045c3SFr+zmXA7JcB8nnmgDCdO7Qbzl8FAm2rty6nUd0qaQ2gfQlRQ8Uk8I=
X-Received: by 2002:a17:907:d10:b0:af9:1be8:c2aa with SMTP id
 a640c23a62f3a-afe295e56d1mr1138094366b.45.1756147538797; Mon, 25 Aug 2025
 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com> <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
In-Reply-To: <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Mon, 25 Aug 2025 20:45:27 +0200
X-Gm-Features: Ac12FXwIBvZYaDx3nXuRC59YLfGWHPRaFpCScdKvQ4nArJPhSi57cSubMBYyjfo
Message-ID: <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Daniel Stone <daniel@fooishbar.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com, 
	joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_114541_121785_7D39E7DD 
X-CRM114-Status: GOOD (  16.13  )
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

> > @@ -416,6 +417,24 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
> >                                 continue;
> >                 }
> >
> > +               if (post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > +                       struct drm_mode_config mode_config = crtc->dev->mode_config;
> > +
> > +                       if (prop == mode_config.gamma_lut_property ||
> > +                           prop == mode_config.degamma_lut_property ||
> > +                           prop == mode_config.gamma_lut_size_property ||
> > +                           prop == mode_config.ctm_property)
> > +                               continue;
> > +               }
> > +
> > +               if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> > +                       struct drm_crtc *crtc = obj_to_crtc(obj);
> > +
> > +                       if (prop == crtc->color_pipeline_property)
> > +                               continue;
> > +               }
>
> Hmmm. One issue with this is that it makes things like drm_info
> harder: if drm_info opted into the client cap, it would no longer be
> able to see any GAMMA_LUT/etc programmed by the prior userspace. So I
> think allowing at least read-only access would be reasonable here.
FWIW the cap for per-plane pipelines also hides COLOR_RANGE and
COLOR_ENCODING properties from the client.

From a compositor POV, I slightly prefer hiding the properties
entirely, but ignoring them on the compositor side when a color
pipeline is available would also be trivial.

> Having a client cap without a driver cap also puts userspace in a
> difficult position. If the driver doesn't support post-blend colorops,
> then enabling the client cap strictly removes support without a
> replacement. And without a driver cap, the client doesn't have a way
> to know which is better.
>
> Cheers,
> Daniel

