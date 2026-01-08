Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C592FD185FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nMvPB8zadVyfsKlAj1v2LGmAamemGiweqUfq17KWGU=; b=1rtalD4AdwTDOGdzgZqFGzgrwH
	05MyszTH2FjmgdqeWnimNRjM/YFapg93Djc6ACln5WeCGHNXXyLfWM+eVB6tfM17UOpTbb1+8Fcj9
	MpBBp1K3ebd3rKI9td/O5A1+xw5ohVG5uesVDKuUAhnhTDYlGY3VhcDI7Kv14sQA3LQ+ASvAW1dHr
	AgSMO6/ztMOcBGVbDVKnhhlR8noZmwx5t+Dhf6MHz5ooGDUfryZrISuajKZl5lNdx+ktBh0W7nBnH
	5nukx0nHwzc6kCXveJQwwy2wpTNhuVRs4/x7HkFzRDgF5cjkB6ubHmURtql+dq5f+vHfle+Fyi/GV
	2l6BKJSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqgG-0000000HGp8-1aLt;
	Thu, 08 Jan 2026 14:08:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqgD-0000000HGoJ-1HN5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 14:08:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so9632015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 06:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767881279; x=1768486079; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8nMvPB8zadVyfsKlAj1v2LGmAamemGiweqUfq17KWGU=;
        b=J22d2d26qEtl17o8kbNuyF3ebggBnb19S6rOPs4hK3JG+eEGjfiuq/Wz6BmrHm5qWb
         9EcHSNyMHH3zjUZItUtxlUF5bqMcTUzN3qNhY9AIuAtmKOu+uLVZxHWD8UEJVWAXN40O
         K4jEHk1yjAMbN6HtVh/0EGYuIYm9FEFzgvIFwSi0tOwlcUa44YoTTe6EMAdLND0BspyK
         EESGdktEFhxgyXvtWE1w4FPMw4IjoUEfLgbnbBwSLlx3T/QRcoRKloGT25O51kZTEOK+
         OQn2fmjLTuLD/xUt/U2elKlNfGbKhGztdwtpPuQ2i3yLPmSZEFII5a4gCsxlUHJeSB4o
         rmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881279; x=1768486079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nMvPB8zadVyfsKlAj1v2LGmAamemGiweqUfq17KWGU=;
        b=Y4zruYmP5w1COfX8cK1/R6a6H5edGeK3vx3639OdNpiGCg87lct5fAY8kG1tcwT88l
         FD1nxsAecPrl7zM3ipXiMmDphCVpefIfdKxq0xKm5aI2bK7t2Yamz3dmO707n3+NaNFP
         YbxoKz0Fj6ugBqZqEDP1wHxwzhrEr0Jx+CFjxhWNBJu7C+NOTfwvlt4rrgs5Fq2L5qNY
         6F6HVbzynlQLOLQMI6ZTzqZmUyKVPd1/kV09ONZ/Kh9cA+vD/7+sudZ1BBoD/oIxhuRC
         lKwzL0ijRbQ29P1GoeJjwnoNNS/4qYw8pEGF7DAwXWXIfD5NKBewZdGE5+KS1EoXHb5C
         b25Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1e8P6JuZnyNcIQmjTwVCw37aCH3/lZKG1sYwowkOdUi8ALRFo80iFhhmi3WVSod+vQbY6RmCmfOQxLSnGHFN@lists.infradead.org
X-Gm-Message-State: AOJu0YxBsfKsl73RkSkeUStaXsAhgp4RN1MQHOAQx66ddGptyUpqjHG3
	QmJ4GNC+GU5weXdN3poZCFFnxhJbmJFXITXx3n+PSKSWdkEPag7xzgv7
X-Gm-Gg: AY/fxX6mNTB8dhXtC0eTE6C5S3aeswnR5yUUvW3pfOh/YF/2ToJCdgbGAcpndf3chcQ
	ewHI/kbGpgbUn41jsgMtNx22zDMvO+fnguruXypw+vINZ2aYo8c1loCW7MkPDv8kvK7PUinB81g
	eW15Am5GbVeJM68Lxhjg/kCh4o9KrD7eXINDG0Wui2vdACwHwd2jF32m3xxwK3X4fuZ3XXU7/T/
	GB6auaZc8JmyOXuH2BPFwB1RiB1UlzTZ/l70NqTde7gerJm9M56gx/ibboD8mqcp44ulBfJSBL2
	bVK3jHPxIbqHXGjlP/t2ATzgowTLmL1sCSSNh7v+LvkRyeH4BoQQbTn4byocZx6z+uVVTFCdYdo
	CHUlVCniL6TkQhLZMkkUn+yiUhpAMrjs2OI05a61FkZ8K1YIdVPznpZ/MJK9BrOHjIIDOki6IA/
	CzA9b9WfIP/bsuHSKodJrlAc4VikLvcGPC3Q==
X-Google-Smtp-Source: AGHT+IGlyg3a2wGJ6eNa4NY7IUhIZRVQLPQakGhgz4PI+aNlgwGt6ig4v0UiSDeoqq/5mYZ3miZerg==
X-Received: by 2002:a05:600c:8b6c:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47d8486ccebmr70673845e9.11.1767881278927;
        Thu, 08 Jan 2026 06:07:58 -0800 (PST)
Received: from vitor-nb.Home (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653cd6sm163176345e9.9.2026.01.08.06.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 06:07:58 -0800 (PST)
Message-ID: <49bfb30f71eae0844676e6b545d67739b6d79539.camel@gmail.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt
 Trigger
From: Vitor Soares <ivitro@gmail.com>
To: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Nishanth Menon
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexander
 Sverdlin <alexander.sverdlin@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall
 Willis <k-willis@ti.com>,  Akashdeep Kaur <a-kaur@ti.com>,
 linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 08 Jan 2026 14:07:57 +0000
In-Reply-To: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_060801_362455_8C3E7791 
X-CRM114-Status: GOOD (  11.53  )
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

On Tue, 2026-01-06 at 17:22 +0100, Markus Schneider-Pargmann (TI.com) wrote=
:
> Remove Schmitt Trigger from mmc pins. With Schmitt Trigger enabled
> u-boot SPL is not able to read u-boot from mmc:
>=20
> =C2=A0=C2=A0=C2=A0 Trying to boot from MMC2
> =C2=A0=C2=A0=C2=A0 Error reading cluster
> =C2=A0=C2=A0=C2=A0 spl_load_image_fat: error reading image u-boot.img, er=
r - -22
> =C2=A0=C2=A0=C2=A0 Error: -22
> =C2=A0=C2=A0=C2=A0 SPL: Unsupported Boot Device!
> =C2=A0=C2=A0=C2=A0 SPL: failed to boot from all boot devices
> =C2=A0=C2=A0=C2=A0 ### ERROR ### Please RESET the board ###
>=20
> I bisected this issue between u-boot v2025.10 and v2026.01 and found the
> devicetree merge to be the problem. At a closer look I found the
> k3-pinctrl.h changes. Disabling the Schmitt Trigger fixes the u-boot SPL
> failure to read from mmc.
>=20
> Fixes: 5b272127884b ("arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger =
by
> default")
> Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
>=20
Hi Markus,

We're seeing a similar issue on Verdin AM62 with U-Boot 2026.01. The
board has complete SPL boot failure with no output at all.

This occurs in the same version you bisected (v2026.01 failing).
Could the Schmitt Trigger changes also affect Verdin AM62?

Best regards,
Vitor Soares

