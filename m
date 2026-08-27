Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE93C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=; b=TULjUZUVv0y1JE36Uwzpvm4WVT
	bpxuQx8Dvb874mtTwOQuQ8MCfrmTHuyhGbWvHEEk2izyZWqtmJABSLBrY5hqLvPzzpeFnGSkfcQgN
	+c5LnVMH4YMlBC8p212Vx1AaOsgSwHSakYDsG8MZ+YYJSzIoW6uOt7V/dxim0B9zGQ5D9cBLX6Wcp
	DGEAfpeDhH/XWNr6dxTKPxsQ2ONLkXCc5y8iR7fSxJL93gCqKbynOJR3ElkbmbP8aJ64lRaJdnfCn
	dCWOIWp05xg4JI58RSiVfx2SXO0NnZJuPjSloDQEfoSlEkPFwBPOrOEhhJdSp5MR4Mn5YwVLUoDzL
	G2+m7wzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd08-00000004LpY-1GBB;
	Thu, 27 Aug 2026 16:30:52 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd05-00000004LoY-3qUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:30:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c25420fe973so9023666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787848248; x=1788453048; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
        b=oWMHRDmBWvd/Gsco12kEYDksYZwAw/wxrKq+P4d/MN+1+RZWHzxo6WDMbKC9lUy0Qo
         ZzUPHxMh+Tm3aBTcaH95J03J5MwxtahxXMP+MzgxefgC9igRGj+4bdkKgsOxCYmYuyvf
         UFsNAfRDUmxHjL5KymAwCbszncwFYuMJEe9rQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848248; x=1788453048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
        b=ZbQeNO0p1xLOjftHmZ8b8j0TzoyTEIzInYh3mwu34alezgrOSr7CZa2GUrThjhQgof
         5Y1M57gdSllVwbXxrrcWBrJmorvcrNh7JTI3d1fy0r+DNnFnLWnbaAyFw4sQNaVZyAjt
         4FtjoffCaUVgLH02nTQcKBJTzBG8ky591lVmwLGa4eV6eWLp3v5NhRt1ei6hx4gk+x4F
         5Yv3BJrLSkrKog1T7GT051qyacG4vdy9P6v6c/6E3cgbW5EtEf/jTeyuw+z1N5E/IU29
         ZGgfa/aOTEcNyca4gDdYFaB3wLPuON5DbJoMzOq0qaE+kLi0mNZoJjzfLYR/Su/57UVe
         1TrA==
X-Forwarded-Encrypted: i=1; AHgh+RrCXOPSsZszjxd1qT4CP6li4Z+EKcrQJqqeO8cv9vWHTiAaAPg6pUVcPkrVh/cha2HiSbO0mBjGPYNI/ctaI9kz@lists.infradead.org
X-Gm-Message-State: AFuF++m4oLtQ8vuLnRl4DkmwdO9k6Xx+h8vR9BHL07Jid2uYKtKfDbRZ
	QvFiPi5kRBYra+V0AQ/Kj5MYvrZzTsKvtO3t45lNOgoIvGDfKr55rv6LeVOHH+9WnHBwkJ1aywz
	sYiX4qom2
X-Gm-Gg: AR+sD13PAlORhBH/s6F8VzVjcQmult0D3VaZoQSRghqiSB7S4tL77zslzPjjg8H9zmi
	68FREPGBleSHxOi5mR/CJojmma2tgfcJQUCQfVyiXngCXO6tYsmjqx+hCcXQp+5GoiWN03MgOEX
	WTNIfBDkdz6tbYUjLlWJrFT/9SQ7xKLjBfFJ8Awsr7DByexzg7qxzxt8Nn3+qgJ0NE3peWeQnw+
	XJOJtmWKLOOI2pdGyQ1A1ttqN5215uF+C9fQbvy61/09sQqFl9xxL9rUBUGRXpqKlJRiOSn9Eyf
	9cOqIYBU4VKaJIJ6C0kko0VRaTQBiwa1RnYiqP5968O3wSFYWDat24vaJPmfvFYWR8OpIdel/o+
	5uOB7Nk5dgOSBUL3dgREFBewyfhVjq755qfEJKKpozmuqLhBsbKfUJ1CsovUvUuC3ZLwxdYaqjH
	pfVWb1b58uEcD97LJnZ2YF3Jk3j1rP1NDFTHoyhpagLQEHjlmHVuAnmT9nQy8nFwezZvU+raVPz
	22fx0oo0lozxKjWkkpXFtmTHgo=
X-Received: by 2002:a17:907:6091:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c250c408972mr1843257266b.24.1787848247789;
        Thu, 27 Aug 2026 09:30:47 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25469d5a55sm94046166b.54.2026.08.27.09.30.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:30:47 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c25420fe973so9015966b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqBxxciZkwhBId5/SgQzIQtip99sHfvMVQFmw/Y1ato5acM4V1znSPvDCfPcFg7N00j/Z1jMEYpNBqbuz0BSLOY@lists.infradead.org
X-Received: by 2002:a5d:64c2:0:b0:482:e10e:58df with SMTP id
 ffacd0b85a97d-482e26d51e8mr23348728f8f.21.1787847829596; Thu, 27 Aug 2026
 09:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 09:23:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
X-Gm-Features: AcwNN1Uxl8vA8-7oT2LAyO-KpGAM6LbpIr9SieIL_bb_C2KnJR44V7-XxhJsCE0
Message-ID: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093049_997733_A154AD32 
X-CRM114-Status: GOOD (  11.97  )
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

Hi,

On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver uses the drm_panel_bridge API and not the drm_panel API so it
> should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Which exact "drm_panel_bridge" API does it use? I don't see any...
Certainly it's highly likely that the next bridge in the chain is a
panel, but there are no API calls that I see. Maybe the scripts got
confused because the variable name didn't get updated in commit
5486eac81004 ("drm/bridge: parade-ps8640: switch to
devm_drm_of_get_bridge") ?

-Doug

