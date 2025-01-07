Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077C0E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=; b=V72DA97PDvIdfRgN2UE3ucBQab
	eEvGwHlWhMDhlHt4T2L9iPqrgtPINFVPLNpYFQkkXv6fDRgRZB2pqG83R7iEA/OT9qLej3JQO5kai
	diro0PnnOBPWnqI9DsPM4F+1tCYWdQrAQ07ZE1FLMzI0po37T0rsx69yMXpwpMVkMu402ru5qAneF
	ljW1cDnI5boq85erU4RIOz6ouP/X9P1D9jmuT2j8l5B3nRmCjzpvwCNoGkac7HFrdAOR0KkdnogJ8
	Wr1OTjRsUgmhV2bLbOchGJoRhgw+6EZTXF9/gRe2cF0k84lRGV29qjgabc2a6WHXpNcIt6aTFSS0/
	ONmaxQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGLi-00000006GQB-2PQd;
	Tue, 07 Jan 2025 20:38:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVGKV-00000006GDP-3ErQ;
	Tue, 07 Jan 2025 20:37:36 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2167141dfa1so3100225ad.1;
        Tue, 07 Jan 2025 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736282254; x=1736887054; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=;
        b=iF/j12b5NooTA7UDTnd0x7fBdak8GfeqGnT+CXQ48fnLl1F2GqN5QqCMef73QCd/LY
         wNqes31Nmc4C8HD7xbsfrt3hWDnjHz3/UAQktvziu1vKINs+14vriR9deGqEhFoQuOES
         Ix0WMXteke4pppSTrzswG3u2Woi5HYAU/jRflw7SQgck8MPtgIbledwSqXtBDYKBiDV0
         CxHw4DlBwrU1B+vRZWejWY8UeEIHIJdsJ5EQaj9FHAmHx53SqO413PIEYY6CeaZpjBhV
         h1JTuJRtzQN039FhbyLT5sdTA/eLVaAyNywniTzXSrscf3OYqBJxJX+kyg5Iy1Th0ioe
         ZUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736282254; x=1736887054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1H/J3xaLiB+SOTacWZ1CrgmLpcpSfI8SMqoIoJuoKI=;
        b=n8G4mDcTcMuzhMUggmCLFD0WyGwPuBFVTV3EIsPY0pZ76ggwV7c6jJNqMqzasiQFCw
         RgFKKo55leTNkLhU1MAbpOW0wolOBXRnUvlrcmYZSS/FNGkcaSeSQoSeeZgGdrWzMxFm
         mTvDB/5tyLORpBs5Xoulmlj1UDiJMspyQ2oPWisXEe2aesoPgtv4I3uMjoDgBYodT8yQ
         mpRFx7Wn7S4G835MlvI4SdGUX5cI39NpUaGYOOKkyjqThRhbvACoB6ARZkxio5SiCcFN
         +JR4vgc1XlVIw/T8V+YXEqtIElDpy/rLjhkSRwtALdN5jjZP6/SP508EJBALs04dRSvl
         hpoA==
X-Forwarded-Encrypted: i=1; AJvYcCU5L+zPyuWKdXwQ5UXmGVCuBkHSsoaUoLtagRHQ2lYukyorJ2IiaB4GSYmsAqYceGzQxTi0jDJvpbGTjRyXLScz9A==@lists.infradead.org, AJvYcCWjeeWIQ1LTG5CaFRkr9Jubv93IgCipWM0DwEtflTQS0ma95WkJbS2RgMPeXiwqpSBRCWRZWYiK5gr+4kOJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxils9UaMpuNN0c/tUis8V51oCa2nk/h4qJRSvOXJWq2WFR0aBC
	GVXCz8HUopmH7AG01KkaoHSrvf21HWeP7JE7X2PFfNpM/fqgVw8Pi5YWo+nubVFsYHeEGanZdfJ
	sV20iihzYWpIdvyk2S2/9Y73eedE=
X-Gm-Gg: ASbGncsgpso01obfmoEc7eQ60HWwu8R+osWzLt7lc8NOx45adtxtNpTe6Ta1IZr44pS
	W4B8TyY6YRMR99hf0bNTI4FXjF9IFofKBPOD4ZlyppvKjo/fKmt+3
X-Google-Smtp-Source: AGHT+IFpy/zEv8gV0glc3e85eskiQiRjVRs6FkoV/+B0RRM/Pns1lF2tiJiK6t7vuZVqLlK8YkI/dPy0Q3JwAvn8b/M=
X-Received: by 2002:a17:903:41c6:b0:215:758c:52e8 with SMTP id
 d9443c01a7336-21a83c148abmr6677255ad.12.1736282254604; Tue, 07 Jan 2025
 12:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125613.211478-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:37:23 +0100
X-Gm-Features: AbW1kvYyTE4JPE8j-clACseuWPbFM0gz7gQf2hau2axwDVbwPBqu3atU2f_bDWs
Message-ID: <CAFBinCCwASspnr2u94K=SqTaheS00zwJVjoHOO67-qgw8hNbcg@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: Correct indentation and style
 in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Kalle Valo <kvalo@kernel.org>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Dario Binacchi <dariobin@libero.it>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, Brian Norris <briannorris@chromium.org>, 
	Frank Li <Frank.Li@nxp.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_123735_815878_A86060C2 
X-CRM114-Status: GOOD (  10.39  )
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

On Tue, Jan 7, 2025 at 1:56=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 14 +--
For amlogic,meson-dwmac.yaml:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

