Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21202E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=; b=Srxm8nbC/imVFUTOh/CP0uBs3P
	spvykIFVb/EeRPd7h9RU333bcAuDpggu8g9pdAuXEts3+bLthknXdquwfhS8Qo4cuQ6EFPkz1LgPP
	B5Z/r28A0HCGdXKar9OdTsrIGHH5HUcOBHe6k+jKnzaRHztHNKh/fZjTIcc4nraTUq2goG1bkbdsD
	t5wqWW5LV3/gSUfL1osuD4ykvcYBOcR+zfEbFtK54fIAPQUiVwYAu+c067j+GMiYNORkyS7Tmp+HY
	9pxK7fucjulXr0b14r7mER8JxDv5LD/xm38KZaKVXjiVDNML3tQWcTHxwLXvmZtj9fL9FlA70aZ7D
	mFEY2nVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmhi-000000017fc-2jb2;
	Thu, 12 Dec 2024 17:10:22 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlm9-00000000uA2-3UxU;
	Thu, 12 Dec 2024 16:10:54 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3003c82c95cso5699571fa.3;
        Thu, 12 Dec 2024 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734019849; x=1734624649; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=;
        b=HwyfaB9ATD+uPA9Kw5/HI2OZ8FnO1J+3syItpO/jJCDV9Lie7qNTwymafuomysa6Re
         B9f0zgKhHr5osTbD9oslXThN53Jz9zKnf+8+tJjD84DxCzgdi0lQdpdRgwW+ldoGqKdQ
         BV+XD67rz9t2rTWCUhuq60zfm02u4scdSNxm6g9MmXslNSm1b4CoJ6V0KrcZ9ysOrU8L
         XRbx//bQJGAO7kyri7/5dRB/z0/j/fYjxi4hgwu0uk00eo/kICfCBvEXQmvR29E3D7LK
         KPsMyVO1bV/Tmni2k6Ugr5h5Rf/9e2jYY2dXjxfPluEZxYC3VFwmu09MsS0FQ9pBO+o6
         Gnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019849; x=1734624649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYUSJr9oHr+FftcJrfxtweePljXVaDj/rdTt+vSgojY=;
        b=SDKaKHIrLhCNV7h6wKbn3Vb3AFXDynVtMCv2mLEBpQvvnNG1UVvqBYcZ9GGjxQsaOQ
         hmzztTZo6FJ73ap361RZUW8Rgq+q+UTLax3QbBpuzk15U4U6H3pVO9NSpvwH/wu8h6OY
         fEfkqJW7C+duDAHduA+crdIyujBWJPQn/ejRdl7vVX0++W5/+0gAWa/fUakjdRA4nDps
         F1p73mTT/Iu0d3pEqiCefeNki1WxzrwKPb9e7Rg1xK2PBafw+w8ycg68WA+E/7N4gOWm
         A/oYhCFXd7fGXwch1PphVLULuQGJj1ddorWyuSBiy9enNdCeHdgkCNoE1jHtWJNf+89f
         I1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0FhZCxXTBvryLQ5o6ulDuR4VesIyYxL9zBqdJHGIRjcIKqtRzLYiy7MAUDyUtnvMb9BuFUJCwJXm+4fR/M3g=@lists.infradead.org, AJvYcCXP0nYvCHMevq75wde/zeCAn7bAH6dQJu9hTg/Ec64OVGtMuSTPwm84g/yJPClEyAyMMYvd/xEl/ly60uxlB9r3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywro0ZSKm2ydyVBKi1kF0fXYsjKUs1/5LoCvyz0y1Vs0CnPXkXn
	fr1gnwH8wmJAnvorRFV1HPu700VijJjOcb3pETyEIOmZuXTost6pa/w5j/QJVIZxFNoiN75x5jk
	Mod+ncsjBf11dw+y1DpbDgLUJgCM=
X-Gm-Gg: ASbGnctONCBX6MAib6ZZu2lN7fWbUKDP2urN3AguMnhach07lY+HDogUo0siHZ45xdi
	wYCSndNpJk9LkytLyM9E+JufDJEcl/zPAI2j4UVy3Kx/IAc0uO6Z5jIaM88TdATlz+u8Fqw==
X-Google-Smtp-Source: AGHT+IEfxOaxJF02cqCb3o+35QthKCmm4+8U0/gTtwd0T+FvVSHeVgyOje6efKWJI1tAN9KX489WrZ5iZFjUW8eIxGo=
X-Received: by 2002:a05:651c:2226:b0:300:39eb:1aae with SMTP id
 38308e7fff4ca-30251e30b03mr3100551fa.24.1734019849270; Thu, 12 Dec 2024
 08:10:49 -0800 (PST)
MIME-Version: 1.0
References: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
In-Reply-To: <01020193bb8a24ad-99eafebb-3b0b-40c0-9b28-3a0dbc84327a-000000@eu-west-1.amazonses.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Dec 2024 13:10:38 -0300
Message-ID: <CAOMZO5DgW3YrpMJPCTzQ-LZCopB4tNPoJhyFQrr6RBvbnBu4VA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] media: verisilicon: fix reference padding issue
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_081053_891925_407D9387 
X-CRM114-Status: GOOD (  11.78  )
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

On Thu, Dec 12, 2024 at 12:43=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Hantro hardware is splited into two parts: the decoder which produce
> tiled pixels formats and the post-processor which produce raster pixels
> formats.
> When post-processor is used the selected pixels format may not have the
> some padding/stride than the decoder output pixels format. This led to
> miscomputing chroma and motion vectors offsets so data are overlapping.
> This series introduce a reference pixels format that decoder use to
> compute the various needed offsets and size.
>
> With this series Fluster for VP9 tests is now 207/305 vs 145/305.
> HEVC test score isn't impacted by these patches (still 141/147).
>
> Version 2:
> - rebased on top of media-commiter/next
> - Add reviewed-by tags
>
> Benjamin Gaignard (2):
>   media: verisilicon: Store reference frames pixels format
>   media: verisilicon: Fix IMX8 native pixels format steps values

Do both patches deserve a Fixes tag?

