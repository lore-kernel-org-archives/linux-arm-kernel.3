Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54FBC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 21:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=; b=NaBjpcuT5WEqGvys+oCN9Cg7oA
	/9Uw3MevB8O2QTAB57bamc0gZTq0Y0rRFf0mcSv0ACHEl3lFySIypflr9Wieu6YNKZPbeUoe983/q
	l7P8qCXZkyob1nbet0b7qb6RkWjiFh9vnu5lkQ2u2hysBg8XGRT/z8fW06faeRJvNJ9Bv1hxj114A
	AhXpWkL43uIv5txgm1no8UQL8DpeMS0+oujFU/ORb4upyW+jXYwc0g3YU2DfcblX8dbp885hllj3s
	ABo8iQRRPack9nVFNwGh4357Ip6h8JdiDVEpMCuNpA1/l7+yEP3GWNfBArdWkSFydGOsGVfYtGZcH
	XoVe94rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Fpg-00000001pnw-2OVD;
	Sat, 19 Apr 2025 21:34:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6Fnl-00000001pcI-012j;
	Sat, 19 Apr 2025 21:32:42 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224191d92e4so30127025ad.3;
        Sat, 19 Apr 2025 14:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1745098358; x=1745703158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
        b=lo+DGzdGTycWGGIunvTmAiSYEp9CK5MT119jW680ujPfdkzU2Be2588jP0/B5w44wo
         1Fop0uijbLI+/yyyKgU3RieMXS1YTffvi1zQIb1sGoib1EEyssClA4RZXQOmJO2q7QjL
         FOrM7YxdR0/qHHHajYoQgjoon+KYHpStAMcmMZFTAGhrsLdkk611DJt9tzb4baaI3SkI
         3L3/YdspA2gAO2i5lFcXAG4R1igSlwIYdi/ytC9IK5wC9mqxuV0kN32R70FTL9Ml90qp
         XcL+xiGRHppniYHOj3ROQg/SEWGUsWFUU6lOnnw/wq3NZY8yp/xUK8wTRUL7EaODrZ++
         GbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745098358; x=1745703158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOpxvDT2hzdXC/Lk44TDPK4RjDKnxL5gg9PE5JOWs0E=;
        b=Ez4DiP358LIdT4z/YHVPDsQ0PnSB0QOIkXMKiWT+tzA+c16X1Te/SYmCR0CT7LRPF3
         SVwNYc2iTRNyzV5Bwa6Qp8MWney0Qs4PPM0YVdVoHRc0e/WyCT8QgRzn4KJhIujHPJQ3
         +RKoDob4saTeYjN6Bu0ivLC7uF0iRMf31eOlIaYyV2mzxWrAKhUlmfKFtGHBFlTR6Ace
         UKLAAn+31rUJSkv902oPaBtrAuIh4C1R7kDM8eLO8L2zCsyT7IH8RFV8q62YDmuzwdoJ
         BzmTNcNoGFZnZt8RFkYHdwxq7Y70vkg8VUj9ugvxEbGQLTusTStJiExEoZIaSR9pJPvI
         5aVA==
X-Forwarded-Encrypted: i=1; AJvYcCUqXhZrb3VraPrsp5+xMH2zPAlNEwDnJXU942Av1rLiIxQ23q2EJMFkgW60hSNC6m7Ysukr19T6ObnTlwkYx7o4@lists.infradead.org
X-Gm-Message-State: AOJu0YwUwh572z2usKzvZSUUErl8OurrzKULYqEr02F53/4+Hb6pPZQV
	ktT/vH2mjAwFc6kuMk3LiHxPDHX4g+ra6Jj5OXT3OH3SuPxXO4KDujz0XMzOTIQ5e2zNY7VHALN
	/yHLklyOms1eFmVoyiy22sjbAklw=
X-Gm-Gg: ASbGncso9mRqRXa/SxMiwuGpSOSWsOoY2jLELvKa+/KkZ3y6sYBYLQiykgX/XsaPVn0
	hZq6wxUFtRvdr4Zsmjmc1hClb671kcxSiaxrvDVzjla1SMoSX6YOGY14sIv3+LnuZZy8aSHEkxy
	uY9KnBe9Mc1iueurXdypp5QSlcvEF8E3ypygeU
X-Google-Smtp-Source: AGHT+IGLlR8UcPQM775uZfby4awG21f1XTwAj2dFL/MhOfyAEZBG0daUZpkUnTjuqdZFSKrcnfs7NqueiXGk5h+tOx0=
X-Received: by 2002:a17:903:98f:b0:224:f12:3746 with SMTP id
 d9443c01a7336-22c535aca10mr96258145ad.30.1745098358068; Sat, 19 Apr 2025
 14:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com> <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
In-Reply-To: <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Apr 2025 23:32:27 +0200
X-Gm-Features: ATxdqUEyKysz5d6KQERLrTW5mLuoTSOc_4gWR0BkMuxJYXGSMde_moYAT3tKcVQ
Message-ID: <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: linux@martijnvandeventer.nl, neil.armstrong@linaro.org
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_143241_061951_FE3AA9FA 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Martijn, Hi Neil,

On Thu, Apr 10, 2025 at 8:46=E2=80=AFPM <linux@martijnvandeventer.nl> wrote=
:
>
> Hi Martin,
>
> Thank you for the patch.
>
> I encountered this issue some time ago as well and had a possible fix in =
my tree (see
> below).
> My apologies for not upstreaming it earlier.
No worries, we're all busy with both, offline and online life ;-)

> While my fix is not as symmetric as yours=E2=80=94I like symmetry=E2=80=
=94it is somewhat simpler. It
> did make the assumption that only  calling component_unbind_all() was at =
fault and the the rest of the
> code was correct. Therefore, calling one of the following functions:
> meson_encoder_dsi_remove()
> meson_encoder_hdmi_remove()
> meson_encoder_cvbs_remove()
> in case their counterpart was not called, should not result in any issues=
.
>
> I just verified, and, as far as I understand, all of these functions do a=
 check to confirm
> whether the encoder was initialized before proceeding with cleanup.
Yep, that seems to be the case right now.
Neil, would you like Martijn's more simple approach with a Fixes tag
and backport that?
Then I'd send my patch as a small cleanup which doesn't have to be
backported. Otherwise I'd spin a v2 with a fix for the issue that
Martijn found (and including Anand's Reviewed/Tested-by)?

[...]
> > diff --git a/drivers/gpu/drm/meson/meson_drv.c
> > b/drivers/gpu/drm/meson/meson_drv.c
> > index 81d2ee37e773..031686fd4104 100644
> > --- a/drivers/gpu/drm/meson/meson_drv.c
> > +++ b/drivers/gpu/drm/meson/meson_drv.c
> > @@ -314,35 +314,35 @@ static int meson_drv_bind_master(struct device
> > *dev, bool has_components)
> >                       dev_err(drm->dev, "Couldn't bind all
> > components\n");
> >                       /* Do not try to unbind */
> >                       has_components =3D false;
>
> Above two lines are no longer used, so can be removed.
Well spotted, thank you!


Best regards,
Martin

