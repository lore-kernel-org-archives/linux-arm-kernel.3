Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C3C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MDPcWgMNo2FqmuOqa9TlGd/nusehsLtSUTJAhoCLfx8=; b=ZEAq2i3EDNh6eQQQTZqetsCjps
	4Jvohs1YKJzPARiA2SHDMVYIKNMVzQIJOKadr0uVpexycloVykovtQT86jAq64kj3C5smxq294zx6
	OCVW1nQNDsvq4JX0CH0Va1ksN7HvkF9T6SUvdxuIbq3089Q4kx03GZ2b2or5un2DGs2ZizSU5/Qdc
	lzHZVky2lkJlBS2gFEurD86rFsvp2SkRi5osnFUshAeZPyMBeEY2p+FDQpyg6RwD7BypxiZPQuLIe
	JCFutNLWJ8wLjlQUT6lF67yN3c7tgC0LAUQmPQw43hgHavCrLZpKNe1ZHyvrOCkLumpQF/8amUPt6
	QjuZvAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw0wA-000000001hY-0HIH;
	Sat, 22 Mar 2025 15:39:02 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw0uT-000000001dV-2qg9;
	Sat, 22 Mar 2025 15:37:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ac2c663a3daso601660866b.2;
        Sat, 22 Mar 2025 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742657835; x=1743262635; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MDPcWgMNo2FqmuOqa9TlGd/nusehsLtSUTJAhoCLfx8=;
        b=Rnkglo/djJ/xtV92MYrJEifuiK96jiZdJ3YDZVMXyaeAGyW19YzRC4pfVMozbwKAk5
         0Ux6rAdHGHva1bJQndctCqUiRa47gLMcgZtzUSKXexJX6par78IckfyjZ2/9InsSg7SS
         Seh49+H6cWCv/QEySsfdm+qoBsXv3BMsUpUqHEdu1UVEqRjwHEjbaPgn6kuxsjrUvd+D
         RCsMKrpEzV0XfxiHvG3Tvm0/7ZTNN1gh5eOqIMKZmO5v6guDue8wKD6aDnXuw1XykoLU
         WAReY3pfGGJjTcuyArRclmoMRDUVlr0Jsl/l4z3by9H0SpN6g7A4ZSKw9UOROPgUgR2Y
         KU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742657835; x=1743262635;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MDPcWgMNo2FqmuOqa9TlGd/nusehsLtSUTJAhoCLfx8=;
        b=uhsTRCy4TIr6z62kS/s2NHcTuL9pC4NEcG4691BPSUvS0zcU414/hPGBdN7sLM/+zC
         BqTZrC/qPIeuzRj4vGM4N7iYfsl2FGsdFRXV+a8kP1t7AEPlcVHnIgBDpfjGvp/TgVMO
         wfC3WTqurSBSSiVQtf/6Xg/UVSQBZltjKi7ZdreWvMscM8BgqERh4f0eUBmMbuA4oEpc
         54TyuYN5sWKfYJFvQr4x/cGr+XdkHq7RaO9NocXU29OLPvWUFdn5boEhNeU9CBxrcuAq
         mJ2Acsw/FR2Zj/gdAELC2GsRQIEeh0xfUrTYeqhAr6SM3ksOgk9TKKyhAGoDPqIxEXhF
         ihog==
X-Forwarded-Encrypted: i=1; AJvYcCW8+59if8W/hoLOURYwJRBtDVPT2GeRaakwUTbMr3HVzxhSyaKd2IAADxrezmVFsCikBmFEtGDWwcbOA7Os0pCRzw==@lists.infradead.org, AJvYcCW9GbKMJlHV1YH0eiBoaSzgLQa53w8q2IVI8M/NpR9cfaWYQsKj5OYKWUHcQ1CV0JLxjyf81Asc8fLiuHOSAYZd@lists.infradead.org
X-Gm-Message-State: AOJu0YzzGMu6G9d1tC4bIQP8UeGm6xzgJn2txlJE5/XjjUtkOEjPyaFX
	JNTRjKiuqtPh5ZDAtTUCWRMjel45qvnirth1fGm6YfIFaeosJNDC8QCcelMSRo0=
X-Gm-Gg: ASbGncukXffUpPO2MG6eCZj8812ajXyF3m8XWFVKtvOLTWaZDsV5uIO59ScjSGDsNsJ
	ucfgry85SMxpbIVls3PA4+P5ubN9+p8k2qQCS7/4J6m+irQadgWew5/dQQCqq1RAhZAxS9FZd/5
	9V0lAK6xJp7MJxwUrgFCPxbjIOps3A16XYIIxYQT1XVu1kJXmiz8BuXOVtSy2dk92/45fkbkS2a
	5oIYz/X/EYcEvrqvTda+GE6j5JpPM1OEubcHu9a8Ril0SeoNEs7LMT+Ag7tdXoXY0RHYD/AS9XI
	YLQ50eLxutuXqNBpu5+NSeSd5ylleMP+sC4UHRK3Kp2jvTULFg==
X-Google-Smtp-Source: AGHT+IFkSEzUgBZ0q29OnEgwaAmNJN8Y3mUH0OvKhoqlOBRCbzI4wzIkN6km6zh3cBkvJW4Gi+rwRw==
X-Received: by 2002:a17:907:9403:b0:ac3:154e:1391 with SMTP id a640c23a62f3a-ac3f207f927mr779803966b.10.1742657834898;
        Sat, 22 Mar 2025 08:37:14 -0700 (PDT)
Received: from HP-650 ([105.112.226.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3cd3sm363834466b.40.2025.03.22.08.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 08:37:14 -0700 (PDT)
Date: Sat, 22 Mar 2025 16:36:53 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: bcm2835-camera: Modify function call formatting
Message-ID: <Z97ZFURPvDcTkjjf@HP-650>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_083717_738404_5605C301 
X-CRM114-Status: GOOD (  12.50  )
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

The line is a function call which ends with an opening parenthesis
thereby not adhering to the Linux kernel coding style.

Modify the function call to include parameters on the same line as
the opening parenthesis to improve readability and consistency while
adhering to Linux coding styles.

Reported by checkpatch:

CHECK: Lines should not end with '('

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v2:
	- Add more patch recipients.

 .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 6bce45925bf1..e670226f1edf 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,

 		control = &dev->component[COMP_CAMERA]->control;

-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
-				&imagefx, sizeof(imagefx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
+						    &imagefx, sizeof(imagefx));
 		if (ret)
 			goto exit;

-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_COLOUR_EFFECT,
-				&dev->colourfx, sizeof(dev->colourfx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_COLOUR_EFFECT,
+						    &dev->colourfx, sizeof(dev->colourfx));
 	}

 exit:
--
2.34.1


