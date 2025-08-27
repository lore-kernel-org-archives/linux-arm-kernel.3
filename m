Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77205CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8Q+4WGdnzVSInxrR9e7vImmCQtyEK2zoJrrwmy0Jcg=; b=ymunSIcS8ggEwY8uIhXu+W0IIY
	JocLQCiOOZe08fCvcOw5QZ4wxZDkzEN+ZhVKshbR3ObXaNoAGuYU2E1TaOHDKlnXeFTL/Et/9GNm7
	mbCIlNGRpv10ZaazZWWh9o3DDI+ceozoC1JgBx2Pyk4DxKM0qxyMWf4WzADn0vV4RtVVd5flkG0m2
	vbFnr5AObMfdzAR4YeE6C5kpyVR0JtdHL29+aPQLBFOYB4L81QnWO1EbSvwpPqkrlliK2wtd4Q9FX
	s5D4QaH/F6zgyjXzDRALz30hfCEx4cmYpvK1wfutGb6fXZqPI8m/Nv/lngiZoP9Ol08MUWi3XXiGp
	qer6HQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJRE-0000000GEKe-44C2;
	Wed, 27 Aug 2025 16:55:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHRg-0000000FoBs-1WMx;
	Wed, 27 Aug 2025 14:48:17 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-61c3b84df28so6579103a12.1;
        Wed, 27 Aug 2025 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756306095; x=1756910895; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8Q+4WGdnzVSInxrR9e7vImmCQtyEK2zoJrrwmy0Jcg=;
        b=RwPZ2mJfE1WvZIgXa7vJcIxVsGDGsZBwD/wgsegON1+L8fPb4w4RFSbDXe3fjW71YG
         YO4BX224coM/K/hZTRP1wS26LxItVkNnInuxPbbSv4w3DMSlc7WdvD5r3xKbRttUVlKl
         ndKC07UEbdJs9btT4yY636Fk2npLPDAi4x357inHwQUaO9XReSpq54m/d4w/93oAk1ky
         Y/6Ayv3ARTIlxJ4b0wfJmgTt0EY5EczNFoxTmUOV4fu6tqWC7ksRYlSoHqJdc632NzW0
         sDrgu/+vQFiBtxYU0uEIDbjJ76alsogtypuLkQHuo0FYMxKSOfeNAcbkpJVmaMkK/zEf
         vSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756306095; x=1756910895;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8Q+4WGdnzVSInxrR9e7vImmCQtyEK2zoJrrwmy0Jcg=;
        b=vv+sffDBst/RbGTmuYBSZ6z0igLpZpEHFMGacXd0JN2isusGxRPzATBYHB1kLelG6e
         7ivF30XitgHSCsUbWwGIiKo+9y0HUIyBwBAAoiEqW1dvVrjxH61SUf9TbTT0xS3IvQwN
         Sc+UhdG6gg4rylWkpAFk1SKLIN14UDQO1DgH8uj9SB2vovLtpMfl/6L8tTIjyPNUSqoO
         e0wOrxeeqT69GRJUeg7Gr7sJpChmkJi5Y2kJrmN6IwjPt1XPOoFAE9IRnUQ6bJNPfgnj
         EXlFUBWrKESbvZ0hdXDT82sJVjJ47qqRk0Xsy+Wrh9q+Up6Gw9+mk6kTbb2DCbZmdGFR
         MpPA==
X-Forwarded-Encrypted: i=1; AJvYcCW/xvVtvmbxCf6njNzDxlGkIiscvTfRcTxvJ/SIKqaz/mgKpegVm7L44boptVhht2rLJbmTyaDNjOjxjlOn9NqJ@lists.infradead.org, AJvYcCXcPZdglCMBuIfMtcDjKDOymDxlMejydkq1+fa8rkzejnqxNH/wG9Ip3gEtk9dQzRu+UoD5+7EBEaNFhwmVfAs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUH6yeUyBpXmVbuFwbM6OLBuvGLiT40lXezXbSJvYuDmR7WGVa
	It7ilKFH7HxmyHBJNnVPTF/qnxbG0Qpbr5QN91aNS339h+z1osO444ZxO9LLj2ku6bjRkxU4NVw
	ZDbPiKD+7cEjaaCMqoMQjJkhLm2lDCdI=
X-Gm-Gg: ASbGncsBLQfd7ZqZ92FMcJNn+yNKYMB32rvOjikJ2+OkboH40h4KV+cOzdelX9bkbn+
	vYdsOFcKJLg3ZDWbVsw955ycXgO/b/qQ3PopPTxh1f4jxu8TrGVI3sucbukQqFExkGQ6IrT7WMN
	PfuwYXjmOZmGj8p7ysfvnlynLuLjNOH5BQxZT1spyOnfZAldT4zD0sk1QOf59NXJbi9l6Dn/Gnc
	CKh2BHgetvIm6YaStahBD2xlQ9BBxbrNPQoF75qhFhrEA==
X-Google-Smtp-Source: AGHT+IGSFBtc8BrDM7VUweQwXXMCtFRHX+kesW91DLtCc0fhgEwBQiuZn738srV9V3e9Izk4q+U6vcOlHWCa6GnVdTs=
X-Received: by 2002:a05:6402:35d1:b0:61c:74fc:3291 with SMTP id
 4fb4d7f45d1cf-61c74fc4143mr8418400a12.16.1756306094655; Wed, 27 Aug 2025
 07:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250827142705.1644267-1-pbrobinson@gmail.com>
In-Reply-To: <20250827142705.1644267-1-pbrobinson@gmail.com>
From: Peter Robinson <pbrobinson@gmail.com>
Date: Wed, 27 Aug 2025 15:48:02 +0100
X-Gm-Features: Ac12FXxM_9DtiKI9RRGn4o5JIdHybIk7XVWMWvt3g-3GgEvDpXvoAId_5kV4DWY
Message-ID: <CALeDE9PY9+oAa=tv_D4ordJCaOE6b8+_eBAzeq7xwDZ9Gx6szg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add vcc-supply to SPI flash on
 Pinebook Pro
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_074816_401672_1F9C1013 
X-CRM114-Status: GOOD (  18.57  )
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

Apologies, I believe I've already sent this and it's been applied.

On Wed, 27 Aug 2025 at 15:27, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> As described in the pinebookpro_v2.1_mainboard_schematic.pdf page 10,
> he SPI Flash's VCC connector is connected to VCC_3V0 power source.
>
> This fixes the following warning:
>
>   spi-nor spi1.0: supply vcc not found, using dummy regulator
>
> Fixes: 5a65505a69884 ("arm64: dts: rockchip: Add initial support for Pinebook Pro")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> index 5a8551d9ffe47..b33a1509a8e93 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
> @@ -959,6 +959,7 @@ spiflash: flash@0 {
>                 reg = <0>;
>                 m25p,fast-read;
>                 spi-max-frequency = <10000000>;
> +               vcc-supply = <&vcc_3v0>;
>         };
>  };
>
> --
> 2.51.0
>

