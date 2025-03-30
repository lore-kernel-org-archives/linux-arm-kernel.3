Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BA6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdOAGHLxbMItBbiFY9iHNCWbLYXgDn4DhPnj7HUrDgc=; b=mwRngckXdgLOxggdSS1qdd+WNu
	94aBf5mrwgnCS8pTpjeNvd2oynA37ualy7dFlb8ma9SZX+fzM+Hr4SwdmMLLTNVS9B8cRdxnbbLuq
	gs6eLu6TkJe/I8WCbxQT5+5EYCGBdYGLz0ABrYypdiG/mbUISrmZcOpGufDuegEax2QldsGeOvixx
	aIOC/F9DrroAale1ASraHwVychnr1EEeeKClHU11po8gs9JBXfB7LXsXc+3SIqCdCgjHRTvSQ+gWP
	uUoBZYIuF5JZqjoWbuiK39WfKNc+vUde7pR/zt39t/t+ZAi1BvGc4Aqr+vqFvQv3yRM/50sAayZlb
	HzwR3PIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyu90-0000000GJKC-2x0n;
	Sun, 30 Mar 2025 15:00:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyu7G-0000000GJ5A-3EMV;
	Sun, 30 Mar 2025 14:58:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2243803b776so47393635ad.0;
        Sun, 30 Mar 2025 07:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743346706; x=1743951506; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdOAGHLxbMItBbiFY9iHNCWbLYXgDn4DhPnj7HUrDgc=;
        b=R1lj0mc8nt92r6z5vt5boFcjCT3B2O29ZdLgEXKvMfA5b4kdgBvkKCrN1tRo5oDzKh
         OCVQ2Hrk+PQvxvC4WosMKGZ8MLAWmUmMnnd78v6cnPkaQvtN8P36CIphNLGez3Tu4mkN
         pA8gWgx3/Lfxrg3g338eaBMa3RDNVwqhxnBuFJR/N3nBvl6YM9kEoWm7qQ8z/fOBlLMQ
         cidjV7wHhToqN5FbIAvPTYXN7JWexiwhs4L6VLLdFiCNnvjI3+zvi+sw6/jv88tNeJeR
         xs+U0Kx6QHlaE3aVWVytvbnKXnm6/wuHFjapEDdzueVvYEYgjk6LxA2HY9VZQkF3xax4
         I+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743346706; x=1743951506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdOAGHLxbMItBbiFY9iHNCWbLYXgDn4DhPnj7HUrDgc=;
        b=TMHp0ZIZrokMZ+Ws8Rofe1t62HcjjDlvWOvmb+jkI0AsLltHgLp4neFzfhm2bsXuui
         iZaXKccrpDcU/BX1O1reusK6Mkj/6Wzvkb1EJ9zCYQMGNljwJ4G8r5uL8TF59EJ86tIa
         UGUyl6TpfFeDcTk0OKG/vRoehLR+StlY8888Sa/iXZ/P6DanzrX8ia3W/tLe8rQtHQGn
         GUMQOur3D2ElOg+Gf7iB4NiiBQwTFKI8ujAekcLLzHziWv7HJNaTiW7yCGHba6yAbojl
         88PQWJoczGuvihzP1/FltdsEn/Pe6xMaMHTmPjKizU2qpxb3yssLSh2kjHiv7fscqmcN
         wj/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsMauJH4uhM/dkUOVPnu21AlW5CFKSrl0jRwqtaXuMvcLNtQV9WTBNSK0q6wLMaQDXQ6VKWhIsYMjdMboBJRWlGA==@lists.infradead.org, AJvYcCWe3G6cQgTsNtwIEr66RWn10o28/Pk1hUW5g/JJy7pTWWbjIoYrzNJE2IrOYCbKqreepMevG/aQwr6OXXlz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2DKREG6Hlj8RRFp3B/b3USdig8qignaDWRBUIS1w6S11hP1JB
	sgZQwaH7g1414geS9WMe0JjSQeRFj9iD3TWW28HgmNBgfnUhrUdrevjrKDMAROsSSCLTJbg0h45
	cXlZIpZsweltnhUoOYrsINxKhsRzHIN5U
X-Gm-Gg: ASbGncsU2sYEFEUtnFtepLWYc4caiDGCPHwHMrPtyjtItr8BJ3sLeJr00aFOvitwGTN
	2wsTl1ASa+rtBnvPBb4o/8tvMdDgt0p9dNeOHurZ7iiXbl6ddSjjU96yiOHfFJzVGEHxf9QL3J9
	NuY7FDaSi+cer5Z1NrfuQCiJ/GmpsQeXf3mqr6xa4rZrRxiDyFOJA=
X-Google-Smtp-Source: AGHT+IG4Jkc9gXUSv+wEsEX6SgVo8adn3w5Ep79nMPuvu1HAehPF+DyxWNUs1H80EL5KcTcYImCxJs06lxOsr3L3jDQ=
X-Received: by 2002:a17:903:1c1:b0:224:a79:5fe9 with SMTP id
 d9443c01a7336-2292f975394mr94533925ad.30.1743346705656; Sun, 30 Mar 2025
 07:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250330143254.3159519-1-christianshewitt@gmail.com>
In-Reply-To: <20250330143254.3159519-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 30 Mar 2025 16:58:14 +0200
X-Gm-Features: AQ5f1JqLwUBn_vStmnEBY5lsQvrYI65RiuPeP7Vq4pNLt0KL_i30X5OO_dk1zJQ
Message-ID: <CAFBinCA87aJvLhsEm0-YeaAKy22LpviZZ2AA_FSD-XSPtDXm4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: gxlx-s905l-p271: add saradc compatible
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_075826_825699_D4B3DE49 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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

On Sun, Mar 30, 2025 at 4:32=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add the saradac node using the meson-gxlx-saradc compatible to ensure
> MPLL clocks are poked and audio output is enabled on the p271 (S905L)
> board.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

