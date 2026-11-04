Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C360A3819
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UTxEPlFd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XQj4uUnH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=; b=UTxEPlFdh1Tm3H
	GaFlbObur3Ib8sgM9AbFN+IQcfLrOdagQD/4Njk3nSIbBoTeJEAeIIjg+rquNeG5bZzkZ07Wn2ZRm
	glTZMay1HOxUik31u8uHtgHU9sTVnWT1/+eoYfig4rvvBoxw3uuSncGI3VYgg1w3k7bp5hRQHoIAC
	LSitb4EQ7USoIJjmcRFfdfZGpM5hEL0leWGBh0SIzzezRo1mekW8eINnRBln57umGec3NO/6Ft+vc
	eFDQjWACfNQIFhnHhDzjjRBSFSs/fiX8SEaameT4aQIjP5BbjzB5MBCxf0+6UZfhQkHgLq4XZSanD
	pkclefOo4QMGhWqH7TLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcii-00000005jzj-1qAe;
	Wed, 04 Nov 2026 15:16:12 +0000
Received: from mail-ej2-x0b.google.com ([2a00:1450:4864:34::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOcif-00000005jxX-1WpM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 15:16:10 +0000
Received: by mail-ej2-x0b.google.com with SMTP id a640c23a62f3a-c4064596f05so60541666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 07:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793805364; cv=none;
        d=google.com; s=arc-20260327;
        b=FGTkFWfdJ6gKVuM0WpD9KzQDQ7wcmVq2VtQ6Ovq+O/h3OKIG8Kjh/EfY91FIOHyQF7
         wDKpFGeoWgZiCOfnQoa+hT9WGF/zYT4pO3sVbpB80ArKHoVvnQsv8E/Y0GMfjCkJDtMY
         mdbFSw/WxxsYskzbmPnMOc1f/q2MHEY37oe0DSEXtrMz0qIMLDEBOOwYNIOlUEF563kw
         Ei72qZ0LHXMVNYPov15utp1DW2/6hV/CE457RmvURcp/CuJKX4qKtsNpdn4GrdDXq+tp
         88I9fhBvMhw2abcvphb89gMj2+4mCrxz5PToiLdqgSFMh3hPNDBfk3nDbLPIPbLNKlnU
         aumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        fh=GXFWRRPFO1XTdQ/UurmCepxWwW8w4d+jnn06TGhjZ3E=;
        b=f33Y+tzdHE+hktJYwM/BoY4Ipp4+g2LRPGA3m5CuVumcZssSJ9/eQwzY73dmjLuznU
         T84MFNmRnfolawLw4gOdxIrD6Wj8q6IXMyYnLj8bisfwrgXQyrHyB/Q8dPxLlkrpt4K0
         7thD8Fc6mmNxFgChGd/qo8jM/mOQSL5lTOFSv3y18Pw5Pok1OZdAZ6vdXfiJi8XZC1ZS
         XA3FWGPxWrVQwL/VYxTI+Gp6RKEfSPaezxPukGUmrQT7t1BSHrjI4eZNPOEQtxnPpiKX
         7Sj//op2QftiaxuTUK7xqqRSQZjCLCpCckO81bwzwdXVcP4mXxsGm+Zd/eFdTTPYe0oe
         zPqQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793805364; x=1794410164; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        b=XQj4uUnHTG8GqH8AJEFCUsf89l0cIiyulzWwq6b5q0OReXfJFtvQb195hhVkCgypSw
         S88fXh1LAc0SOTaLv/xd9oUdOGkD3GH8DDUD9UQ6YZ0ZTE3QpP5ya61UGzHIqynlo/8d
         5bjEAXtUjSzFyzYL65Nkap9oHMsNWnZfyyQ9kFCzKvn26xPM9d80Lucm0tBnp7tePmGH
         q6tNJj+fShu5AQT//9e/8x2gyzhbjbV8INgADApbzbFUeq8Yv6HMQwe0D79kmGE2qebL
         3N+r3n/tlRX/TNyG8dXQwcR7bIOjTkPU5WR5Y3QmiatRdwojmmybx3oSIeFmceHySv/7
         27mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793805364; x=1794410164;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdTVz8w7xpVwwFxFrP/pPSrvcaXONHeufsr6axyMCLQ=;
        b=t4Cys8mn2ifAJeVkWe02dhhkQfSYHsJ/nNAIPmPvE5XAZwCWNMAPCERVkEzdB3soij
         4U38fuJHArIp/90Rn6B05wIsVCZDIjT6kdXDyyQuWGoeF9MnktPAB3utjmzOLUtVv2Gp
         3BtNz1azC05PCjwOcNOgUjCVfy2nLNXKD4gYRwEsDpcT5o2urNcLvu6JQ48RqkpNsfa1
         /HIlR3Z6OXosw33KtXHnTNdnBq/UKJRzH0Ysx96W7PQZ6eVdjM+F2tNXwi7nqJPRHDxd
         miXm2akjPG0wAErTCrv482ttkI3ftCIoxyPa4cEXPq8Pplz8rXWD7EfKgPxRay16Q76Z
         HTnQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/9u4ZD+DGIAKwYFHHwAc6s1MNT1SmrI41mx4Kh+V1wM6pukFFHBnaMU7FZGP9qgGuZtxYwJWljRdszOpBcOKz@lists.infradead.org
X-Gm-Message-State: APuU4Z87inueq/RPdjJgawbS/xXwz/3rZz83ACjUn0nfL8M8kbpEBfud
	v7z01PIBqU9sqrKKm0phMdayQ2zM1+25miOc318nh/yn5ZdwjY902wmB/6rmDwFh67VdnVE/g8J
	ZTtG5ttqW6+LwnmbkyXERccB0Ngvjr7Q=
X-Gm-Gg: AYBFou3vJo7h80Q2YRLXyDthOwDE3C5zCdiYSAz0avmYjSbstztxJrDS4Uw5pDvFIF/
	pliocVBoMgo6Q/R1P5N3KEuT0DRai2y01vJSAsM2zZg2tvvrHcLBUG56Xw/uCIBeY2KotdQUWne
	XJjaAEiLFC+FWQm5yFQkyKHimokRRVaEorRzDO3sT9zI1aIvzJV7k0P/QyjHu9cELrGp+MC0RQ2
	ZUlrvCN7MwQi4YCelI76HJuIYKxoKWPyrwVlCekCCITEC0XJ+pthP4RHN9Q366Ne7mg2t7+OnBZ
	JiRso0ROCdBim3mnJkv1guIBwXLsXuoEkLWPXrTMY7Vp/eEupPH/MlV3n/CR03iVATyH1rwFsIa
	eoUZalGtJPTvn+zpdZr8fRDGr9k4PXGqSI2zFCrbvPTZXlf1uIZtx+Pk=
X-Received: by 2002:a17:906:99cd:b0:c46:50c6:f737 with SMTP id
 a640c23a62f3a-c4ca7a8459cmr1547068466b.31.1793805363810; Wed, 04 Nov 2026
 07:16:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102174450.3000397-6-coiaprant@gmail.com> <20261104124020.3546166-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261104124020.3546166-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 4 Nov 2026 23:15:51 +0800
X-Gm-Features: AclHuK-zeYM4UdtsZyf6UCuVcNw6qYpttvJKvduU9hQNxft_dHREd_O22uUfBMU
Message-ID: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_071609_418423_5F7B44AB 
X-CRM114-Status: GOOD (  16.66  )
X-Spam-Score: 0.4 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=884=E6=97=A5=
=E5=91=A8=E4=B8=89 20:40=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > regulator_5v_boost: regulator-5v-boost {
>
> I prefer to use vcc as a prefix for consistency.
>
> > +      * 5V_OUT is the OR-ed combination of the VBAT boost (via D5002)
> > +      * and VCCIN_5V (via D16).
> > +      * It has no enable pin of its own.
> > +      * Model it as a fixed regulator depending on the boost converter=
,
> > +      * so that VBAT is boosted when running on battery.
>
> What are the benefits of doing this? This is not a real regulator.
> It is the same path as 5V_BOOST. D16 controls which channel the VIN
> of VCC5V0_USB30_OTG0 comes from.

Hi,

Thanks for the feedback.

1. Naming: I'd prefer to keep the names as `regulator-5v-boost` and
   `regulator-5v-out`. These match the exact net names in the schematic
   (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
   mapping between the DTS and the schematic, making it harder for
   anyone tracing the board power.

2. Regarding the 5V_OUT node: I understand your point that D16/D5002
   are hardware ORing and there is no software control. However, 5V_OUT
   is a distinct net in the schematic. Keeping the node makes the DT
   power tree accurately reflect the hardware and clearly documents
   that both the USB VBUS and HDMI 5V domains share this OR-ed source.

   The `regulator-fixed` binding supports modeling always-on fixed
   rails, so this doesn't break the regulator semantics. If the kernel
   later supports multiple `vin-supply` inputs, we can update this node
   to list both the boost and VCCIN_5V explicitly. For now, chaining
   `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
   representation.

Coia

