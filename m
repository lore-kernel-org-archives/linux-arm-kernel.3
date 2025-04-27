Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B98C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGzuohvyvvCrwS5zOnEccgXhaNKdly9XzL/s3vD+/6M=; b=hup5PzPkJDmfQn3jrD2Y+ptgL8
	slm3AA31znWgtl8ouEZNbQcB2TNX5A1WFf1AmuyPxgeCC3O6qy0/wjiWGDd1EZj/7zl9AdiZefwRd
	TgivXQs3XBeenU8v4Ul3OYMjrMyqXHXiG87wM5PUy4W7Vs8QzR80xpEv4Hrqa4P62BMm7BatkUvHm
	vVuCGMlKX8VDrTkeP35e9iCWzvek2OUKzqaQMbnSdhL9aaUXqBpPLQLKvcWQiLXfRijs+NFjd3PL/
	EcsH7SAK8U8Ooo9ZJog/AU2DOIoKvLUUGz8qfF/raB8kypyiQejJTXj1aVNRGYkEk2etHSpXoVo9K
	TmOAFnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ySl-00000003IPg-3QOU;
	Sun, 27 Apr 2025 09:38:15 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8yQp-00000003IIg-1JOI;
	Sun, 27 Apr 2025 09:36:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso642641366b.3;
        Sun, 27 Apr 2025 02:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745746573; x=1746351373; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGzuohvyvvCrwS5zOnEccgXhaNKdly9XzL/s3vD+/6M=;
        b=dwZ6iMbVN4J1d9HkrECyhtwNhaX7TGMtxJ957XRr9Qm8PYTJdeYdD2wbZr50migPJB
         tmzTWmX0crDwB+5AxfX+f+UsLviaI8qdHoFS5Dg8iLnH37V4BXzrLI+21ajjibEr5M8D
         NcHXyaYXrzTab7RCQWLFk/W61Ltdp2sLwC/h08TuYJhyiP4FrEWtQhLXadvWT5PFyRnb
         qdyBo3+69tVpQFteTUhSmzz7hDYZ4/H3df4fX7tXU/EGsHKez/BVw2S+grSCJD0u+8KM
         xzFU4qgLIveUST8MqxGsbSNTBYhhRXOkNWiUZhmk7dVrjgpXuiUwx/OJ66DJ1naG5WVL
         wSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745746573; x=1746351373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGzuohvyvvCrwS5zOnEccgXhaNKdly9XzL/s3vD+/6M=;
        b=aCqlJt9n6cLusJtvD3j82KXvhKM0uTCAKPjvRBS3Jer91Az5/xe/bLTz/jwhmYUttP
         JamDeas3SeLtAnw0xRlfQNMuT+V/L3hjk0fjFSr33kTg1lg7yeHx6+szcLWSVzW0es7N
         AEf9OVg6XGW5D9Wh9tGqmSte/Al0408o5DQnNX+1z0uEiEKe7oKIsOchoPJqwDt42XRM
         E5bdKmkfPG0djTKfNxYENoZBHx5LSAMSfu7eVjYbf29o9iDYGwnWmHOrfiDYcX/oFY9G
         WIAfNbwyj2Q3ecaZPSLHrqxuWYjhVBGBNeF6ff3GNOzHo7ICuLKcJKFwrv7czGRxrgbc
         +tpw==
X-Forwarded-Encrypted: i=1; AJvYcCU4b1aMEyMOeGehi9UbDuI3dMtbyarSdZiIsJ7XmQy4Zy09Y4Z2UcQs284MzbuSRtzT3YwjVbNgo+Hcx5PVI1pMig==@lists.infradead.org, AJvYcCWNjtmhb9p1UTbQHR0T54klzgyn+NInEeadFDUa2BDUSrcffrEkxb3gZekcMOQxUl7vxH9m7JPBJG/atDFE2vaa@lists.infradead.org
X-Gm-Message-State: AOJu0YydKY0P0KPQEAmA+npzcCURpg64bbu8bSaYRC5rAu3OttQAxKOC
	AAiz0GmwVuP7Q6vV86hlR0Q9tNTcXX9vNV5od5CDyP/4YR7OKJDx7aLIJ+E2nmn61bDwPZLC+LZ
	n8ZiYQnT4mOEBeppzT2a1m2t+WdS+00Qe
X-Gm-Gg: ASbGnctbolGliEiG0WdaG8d90PvRWHG4360W3slv/Gmskkw1NIHu8mZ6U95+LB8noIk
	XuRh09Y5v6TCYa/uCcLBaT3u40qgBWVAoOpDaGqhFCNzCdGk33n1m1v1yDR3M7DgBSmpAgF0ieq
	zxDEX63uGgSvijgQT6MgXQzg==
X-Google-Smtp-Source: AGHT+IGoMZeNr5qp9wE08uyFjEL0FL5TyWGe8HMPsjjHQFeYThqcDC1gvwy6V+CCzAKFcw66C1iNantjGyqQ4J9Y5fw=
X-Received: by 2002:a17:906:478b:b0:acb:aea9:5ab0 with SMTP id
 a640c23a62f3a-ace73b1cd63mr635799166b.39.1745746572690; Sun, 27 Apr 2025
 02:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250427082447.138359-1-trannamatk@gmail.com>
In-Reply-To: <20250427082447.138359-1-trannamatk@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 27 Apr 2025 12:35:36 +0300
X-Gm-Features: ATxdqUHZ_-HZyhqiJ9dWL2SAXfBdPhoDJFCF5q7xMB2DoNABvHtVkjCzw97WyVA
Message-ID: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_023615_355265_5F5AC317 
X-CRM114-Status: GOOD (  13.92  )
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

On Sun, Apr 27, 2025 at 11:25=E2=80=AFAM Nam Tran <trannamatk@gmail.com> wr=
ote:
>
> This patch series adds support for the TI/National Semiconductor LP5812
> 4x3 matrix RGB LED driver. The driver supports features such as autonomou=
s
> animation and time-cross-multiplexing (TCM) for dynamic LED effects.
>
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
> Changes in v8:
> - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> - Move ti,lp5812.yaml binding to auxdisplay/ directory,
>   and update the title and $id to match new path.
> - No functional changes to the binding itself (keep Reviewed-by).
> - Update commit messages and patch titles to reflect the move.
> - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-t=
rannamatk@gmail.com/

Out of sudden without discussing with auxdisplay maintainers/reviewers?
Thanks, no.
Please, put into the cover letter the meaningful summary of what's
going on and why this becomes an auxdisplay issue. Brief review of the
bindings sounds more likely like LEDS or PWM subsystems.


--=20
With Best Regards,
Andy Shevchenko

