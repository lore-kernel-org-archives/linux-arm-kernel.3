Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271C6CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Hij2eJ4bQfTEIFNL71Ydwk0oDbkNBdcXZcpcyNuK28=; b=mSiyVtf6uUreLQw+a9j1mu7mn9
	gjiCpj8Uxb8l4jspz9Sb7c8wdJv7DBQfvbF8AEl+QEbmZy4SKi8ZSjifOAsrd4rGB1nH3GMEdBcJT
	XV2fZfBavPsoBMQYHZWT/pKxGFogy8Vt9qda5yWeaWFBxSpwER1ba52tACOA9rYMbyTHw+Sw8VxtI
	W+Rxsulu1cNh7ijSI5l5tFEYazVEjFXEpxr+eSMSABtUEO1Nvnjn9XX6ecpnErbbDNgj6B8nQ8R1e
	dbeSmnv3DDvwj/htbTTF0Pbxm96nBWK1PTXOIXExxUy7Fl3dHSLVUyBFDWUnDTG8ebHEm/K7u9JXz
	ZaKwQ7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNcw-00000005Fwk-04mB;
	Tue, 02 Dec 2025 10:28:58 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNct-00000005Fvz-3JX2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:28:56 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5957f617ff0so6014231e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764671333; x=1765276133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hij2eJ4bQfTEIFNL71Ydwk0oDbkNBdcXZcpcyNuK28=;
        b=eEOWYFpklDmElpy+3JSPYML30uxpBpUcVzh4sb6fJHytB8SrVPMT62hHlMdi3Zaao1
         t2z0kKHMPGT5+wYoYhYu2H5klyw+/v08X9j9LETKFpyNba7W17/gBWxf7DR4vrWIQNyY
         N03bN5990cJ0xUGALUAGSUP9x9FVXhalkhwrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671333; x=1765276133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Hij2eJ4bQfTEIFNL71Ydwk0oDbkNBdcXZcpcyNuK28=;
        b=TUBaKs3zciwymHxCb7gS42VlyhYpRTrgfe5Jov4LUmybR9i+2y/haS5vvHKNU/+dmr
         VMRtCTA4XM5lgTq4BKAupFX48LCvamnlLj9X0y+mlBXLBCD0u2jlqXH/IzTNmKMyvtvv
         DXJDYHWHGkVCR70yhpiHO2OcSJYVMS+wNIHD2utmtGpGyMAuDNnXQ/PnYO6CCuOHooD5
         CAsWtX/NuBrOwEve1dhT00LCAemJiCV2XgwW+zW+V0E7e0Nya3IoetJ6UDt2ba6vhvRn
         CDIya7HVEWZwo8XiFtyfc8mzoxJD3Tg3AalEV4uSWBVmBUaajIgvhkA6fGpsU3zrrAqn
         VUFw==
X-Gm-Message-State: AOJu0Yys1TpnMfpQN6FvmurzB/dY8jgtl344pORRW5tA3BFkf0wEb8CK
	CLhMl+yucK2m6x+ZdTwE4YumJG6AHeYYy/LDpRBXQfa+nBIZ858WyfXTuIWqjyzBat95qe27Cw8
	25T8p0FlIrqpZAWKEsrUNqKU6/81FkPBpiFUpTpYhksxCQVMIBDiPuA==
X-Gm-Gg: ASbGnctFgiXpQZv74To8LcpAxZN7FNT8RyhTOcOosD2wXHPWa3MzlpbyYG3r0lrmd1+
	4H9j/DrkvTjEZTYBXngLjsGtOmkeWrtKX6qkZ1y0WTF8+RJBaU1QY3M9Zf8J+R38EEBuwOqhCR8
	N9SiS0Zw31KvP4I2Xh5mOVaYgxf3UGtlDplNs2rM1DVlwFDicNjJffw5S8TSt6STI4pN/T6n9/M
	vqFXs731Zbdw7mdKc+AcnnNyI6AxtOH/+e9VS+6rNwtFxr5RpWrRlqBl9rbWgklwFjFvwQ7FU+4
	38ldDbvzJ8Kp6+63ITGg/Y33XMMBdnU0OeRp
X-Google-Smtp-Source: AGHT+IEUWP09oXRUY7g4DEOUpOcEnRmbCPvKbs0mqukve3EoCbRXo9lDO4l8I/xQm7lQ2w+n9b6Ycu5noWSoeWMROkQ=
X-Received: by 2002:a05:6512:224e:b0:594:2e7b:6f9 with SMTP id
 2adb3069b0e04-596a3ed9526mr13041882e87.27.1764671333551; Tue, 02 Dec 2025
 02:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20251119181333.991099-1-sjg@chromium.org> <20251119181333.991099-2-sjg@chromium.org>
In-Reply-To: <20251119181333.991099-2-sjg@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 2 Dec 2025 18:28:42 +0800
X-Gm-Features: AWmQ_blXhlVTtInxk5zhTOgXEKnLmNEgPepJ1I-h-IW5gpx2gQXsjXMRQi6WcNg
Message-ID: <CAGXv+5Fm_jx=shhtfWAjrD_iaRtWQGa9bGdRR_ajXHLrWJg4QA@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] scripts/make_fit: Speed up operation
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_022855_855869_12E2652B 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, Nov 20, 2025 at 2:14=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> The kernel is likely at least 16MB so we may as well use that as a step
> size when reallocating space for the FIT in memory. Pack the FIT at the
> end, so there is no wasted space.
>
> This reduces the time to pack by an order of magnitude, or so.

In my case the time spent compressing the blobs seems to be much
larger than the packing portion, so I couldn't really tell if
this made a difference or not.

Despite that,

> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

