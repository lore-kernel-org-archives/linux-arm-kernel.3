Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3565AC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=; b=D4AY0MQMQVUYeKqGKSED61he8o
	i/KE3XSySr4L5T6Y1wuh2mVJDKJXtRsim8NTCOcyr52CoMaEzzgj1YBbTAd9Qrkxtp7CVoYjhY1D2
	BC0UBD4f8KGsvBCYI2oBcahs2cInE49kL5esgLJN3373q54FWMKqLIW2movlwShP45GZYGxtb435v
	yjBbMjFAkDlL2Yqz50QYOzfKzYJBjNIJww/KCfKKR2Y0Yg3mTuJN5h80V3a+ybS4fDc/qbuIL9OKd
	O96St6YAlIv5IXnM/p/RDZhRHlVwedDhuxm3xK3VRLcexIu1nAQHwNtTfmZSfxXfTDN0HvfWaGmjy
	9iCICINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCTr-0000000CMki-40ij;
	Thu, 20 Aug 2026 23:47:31 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCTq-0000000CMkL-0wv4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:47:31 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-4560d6f82edso361632fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787269648; x=1787874448; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=QZe/zA/ocDdqggce53XtCdq2ERCxdCJWjgnrdoI/pdKibcLutP/1pZgBB7yZ44vEiC
         56OO3Do77yZQyukoPghYcagc3iemiTMx5cBWXkZ1JTP35DA69JdWl14iJ19OYZwTkRau
         9NqPUj94OlYfpehJsFSBZyaelnqKuTX2eNGOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269648; x=1787874448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtldySaucpx0WiT2hf6Tf+4ZCCDvPTnOPP4X9Lh8abA=;
        b=JuEr/vBArzPMAW/OIcVFzEznMWAeKhvbe0aW50+j3rplZQL6nafBO50xIp0bqn1oKT
         YIS2dsGIC8INW2m1a52nBKmwXSkY173L+ncMcrcUJLbvkh1i3WPXFpsKW5UI8iZjclf4
         il07Rkj3ppGW4NUbWu6GFh4llg7nXsNWNLluybv8bgafwVzMEp74jvUCNzR5agfxFvGC
         ffcj41IkB+wfV0mYu5JYjTGul1GfsSZBUR7XHvYQsd+VB3h8Yoc75uGKkjJ1oPtmFr8t
         kZDaiNmF6YyHKdYiKn+YCMTWC2+8i6tF/BVNQYMsLCubjLQHUG+J2s50y+rlaxYZppol
         wwgQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh420WrNuFLTRTjI05q04MkBLBsf9+A0ZFYjiHiVWuxayrOHCOUZOb4tyuL0g+7SDX+hEvwATQAhadpeVnBqT3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5opZDRP4GOQVKm152Dk4+3VQrZ/sbiMhbsEAyVKJueAGcEf+R
	keigqBz2G82sWoGRe2jtz7b4K46zvYjveeYopm1cPi2QStoA6xGkmmJNrhAm2eAUUWWX5z0T6Dp
	la0Y=
X-Gm-Gg: AR+sD11XOA+VDZjc8ZbHJTcL9g+zT5cVRJ5PfJQEJpmGKtwf6FKRlryoR2jrFq1mSoQ
	jucQLILt1U1BfsgTG5khvWuuwgdz80BPgkCeZIcxsT0+eVC3ctPJrnG4E1LEnFgGEjidgbMT0PE
	QhbG5TUrLcKLupz4m88DYdcK9SBTKGCol/NhDvYpDy2gQaX5irTXnRHp5hdERMSnsOlxSAvm7SL
	J8CC56QZS298iWbWnIV7tmDNH0/pwa4zPHMzCMzJpYUIp+4qRBbKkrgjrvn71UGnjhtyE4KnGCB
	8Ex/L3zEAyrtTFdrJiewUx0bxavWc5VzGDJwx/yaEF4hkRvdlbRyFV3LjsHbyUUYheYpF9wuWlO
	cC9ZBK+JjC7OjDdw8LpN31ezbKNaAseXBrADONc45pzIEKY480p2xhdnTmOkHoXPW7uCl+seb+J
	mPwGwXeUTV/awkM7VuQtH2tqzhJejWiEm+/MPbaH+VCI+daap3xOL5RBAXRMfcoQbx5L9gse7SB
	krM3ZzvqlLH44KNX9lfupWBB3w=
X-Received: by 2002:a05:6820:83c6:10b0:6b0:be69:d3cd with SMTP id 006d021491bc7-6b1593b2035mr2121264eaf.17.1787269648543;
        Thu, 20 Aug 2026 16:47:28 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4632aa5180bsm2632814fac.16.2026.08.20.16.47.28
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 16:47:28 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb1dc6bd53so408907a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoqKImuEHK1ESD16jP2q6ntBRbJw9tytZdTiFsPn7lQeEo4zAuDh7otFSMGWKWHm9VRxXt01lGkt/E7ivquvECy@lists.infradead.org
X-Received: by 2002:a05:6102:5809:b0:76f:eaa2:6fa7 with SMTP id
 ada2fe7eead31-77a623259d3mr898151137.2.1787269303777; Thu, 20 Aug 2026
 16:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
 <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
 <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
 <CAD++jL=VLzW-4eB=izJwaTJ+6xObk9+AQGTDK6ABdrGX4K3vAg@mail.gmail.com>
 <CAD=FV=VsiQfoGYHw3D2xmV=Jedu+cmqEfrCk0mkKFzsrRCQcTg@mail.gmail.com> <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
In-Reply-To: <CAD++jLkJq0t8sC6_S4LHERbTTiUanKh32QJtdDtUZrXdDEHgMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 20 Aug 2026 16:41:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
X-Gm-Features: AcwNN1W02_U2EPpwN5r9pV16wwm63sX1fk_h0bppJD-El35NE0PVzCZcm5fPTEs
Message-ID: <CAD=FV=WjWd8fRuByAUn-mk-fMJqJN9wrzxAsYH7yYY3XxoDFqA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_164730_279346_1B03847F 
X-CRM114-Status: GOOD (  27.01  )
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

On Thu, Aug 20, 2026 at 12:04=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> This is where the imperialistic ambition of device tree
> kicks in: the piece of software - be that a manufacturing
> run-it-once piece of code - that produced said calibration
> should have *also* used device tree to find the thing it
> was to calibrate. Supposedly looping over all UFS devices
> in the device tree and calibrating them one at a time,
> something like this.

Sure. I guess this is one way to look at the root of the problem. The
firmware doesn't itself consume the device tree. It has its own
independent ways to know what hardware is present. Trying to get
Pixel's firmware to use device tree is pretty far out of scope, but I
do see how this fundamental disconnect can be seen as the root fo the
problem.


> "I have a random piece of calibration data and only I know
> which UFS it is for, so I am going to encode that knowledge
> into the device tree as an alias."

To be fair, it's not encoding the calibration as an alias. It's using
an alias to _find_ the node where it can put the calibration data. ;-)


> I don't know if this solves your problem other than saying
> "go with any hack because this takes place in an imperfect
> world", but at least it points out how this kind of problems
> collide with some of the core philosophy of device tree.

LOL. Yeah, I think at this point I'm ready to give up and just
hardcode the path that we hope we'll end up with upstream. ...and if
we're not allowed to have an "empty UFS node" for now, I guess I'll
just have to have the first detect that it's running on an upstream
device tree and have it not fail if it can't find the UFS node. Ugly,
but it'll get us booting and I guess will be uncontroversial.

-Doug

