Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE9A606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QmxqbEzc;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LOM2emZH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=; b=QmxqbEzcKhWnWMaht46QfwwAhb
	KhsxZ5nV+pcJsSiG5nwvUMtaHLQr9qaEz4336p7X4aebtyb7Resz5ZmXH1k8JGIYzw7P6s4Bux8Qm
	7z1HmjzYBKRVVDtT51kHyDDYwYjMW3BJrwkSVTO0lCysVoVP3PFqd1fqqXghl1dUComeZgyqYZjDX
	srUh6iAJgQ/+pYDcDFB5F5yPp5C6ibvIO5lYpIJ7TXyIrB5Oj3FH8r370kU4tG3AVMbcHtEz6U6+S
	eyeUhFFNJmRtc+M9mLQ1lOGgH+Q0CWo9RgfSuFT9P4+ESrWvPrZ221yUZKRprk352vc0JR6AcGHUs
	APBD8teg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwm-0000000Hafg-3CGU;
	Sat, 24 Oct 2026 08:17:48 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKWwZ-0000000HaZ2-2NIU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:17:36 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1271092a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 01:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829854; cv=none;
        d=google.com; s=arc-20260327;
        b=Bua4GKpUeril0qNx44LYEXHePPs4H5HUyyBXwWhBMcuenpGdF6puktUPHXsX2oYGw3
         rUYJymh4cFN0EfKUgRujx09Qczwd/kBdH7FyqJsf9xaKmWiRKFFWXawSbD9qw8tzHBu4
         W4fzeF6DVe43TjrypbJc8XcP07FcQY13lpN8K+8NZVMGx125bJF+Mc6/l95MRXMheYtg
         xyj+Fe0Y16ZfEOSrCdSMBt8lG5E2oCk5K4PZQI/hePuNi0181uLyuSUZ/WISwSgECKwU
         i8inEgrJVQT/Z/2y4SVkMQv25EsTAHaHe9gYbOv5HaIrfA4JEX+yiaO+S6zVpX2IFa49
         6yZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        fh=eNnO4j3t7huoPHk3dLxTsXGmQfI93bafVS2ZKrxRc0o=;
        b=kPLvA4vs/+l2kUeXCHJaSPjk8hOWydfq4kYWEs9nwr0KfiuVjZzZnA/aycoC+yCaQO
         WbjAhO1Ncnv3nZK7hxw1/+MippNZ1CaWFiaersHTUUhXtdWnC+2br8DnOOt92KAdFZqb
         8CMW1XoiKqhLS01r2tWymGJc5cs0U7zdh33NBvi/VPlkqynyAToINmDcwqfMT1LZvgps
         4e66V4f8jP7vn3vaODkUFQG87haHBheIWFItt7N6yGJVeWl1j4SSRl5L+849V0CZ5eeZ
         74WyUWnuZt3FDzAkupGSQ3R1VWkE6CkDrh2f2qrmf+4YSzQbI55LuEQOsCJkvN286taX
         +hTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829854; x=1793434654; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=LOM2emZHZUZ94YWlb38kR+CK5J0CDDm4eZP77bH3ka3PwqK9CA9wNiVqUeN0b6328t
         8gTE8o/ovRLAgLEQGa4z4yOUl/GV8pZ0KshDllTAYyjvf11rPV9stc3k1jVSz+qnwM3Q
         nF++JtuF9s3Y0dK+GbMCWzx9avddn3ped2qpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829854; x=1793434654;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f/c+EwpzzrIdTL0a0bddGX7KBZ15+Zku2avwoxWG2Wk=;
        b=a/G5iNSJkjxkFRV9tGQVD8YEkJeteO4a+4jdVZAGnU9aPTgo8uNdxu9URr6dkEsH8Z
         4REp5mhBGmzefYUrzDdARFZZMsHQq4GZSQUjbc+/N6DUNXLp8iztu6FkThEEOvFc4Wdi
         TiMmdUpSLk9aHjFuz79hYaRYX7eZFRCbsWc4jleW1nSlIfP5yyLYUubnTQ3RWv/6Fjj9
         1WSHg/Yv1MqJ9ZJAcHR5ljwM/bEIHwwEyk3ug2COYgasZBk+ili5G4GRHKHetXYsOyrB
         dlEqJiK7M3pvs/ElFAqWUoY2NBOCqbxMzFpGMg6D2PNouPndUp9aAN7EX/0WGsE6XnID
         bywQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/vMftpfu0wq+1E5pEDnPeXaTK0zJ/ImfN+CIQoyjURfzRI1bpSflWPo00C7hQESA42+uLKBN7uXGSEQuvH9kG@lists.infradead.org
X-Gm-Message-State: AFq9FYLU3UiSU/UTkUt33PIKGWA9fMcd7ausBVMxFevx+sfsZxdRUM3+
	KWIb4Vg/yVdspf4/VTUjj2HcC3DXoGTS6m2FypV3uzD2g3wZDTo+/VZM3izkE06JdtbpjDlYdh6
	KruAoH2zBebAglVkCkVEBuEbmvpNjbvP9ISaDWPeb
X-Gm-Gg: AYBFou1f5+PoKj+k3wA1kd8dy8eLv89SXW9g5gBCMfqaeKVdHqVMBpDETXr+JCyIEVH
	Mf94sQRHZaXYnlwP7OWc1DzUtPt3Lt+ccNlaLEmFad1RaAFt9KdSn6yH4cNPvfsdUCCKxH0r9Kw
	Fp6rV9PfJvHz+aY8lE91OegXSGwBos2WpGO7MyyhLtrfuF4TURcnaksZC5MM2QaoaKRhzwyglyA
	md4J/KdxiICBrgwj+pa5ykbVC+75K11NH2XUunCiLr8Z5oZEp5xWBYT2q/C/ul88vunxvbxtPIm
	YPSwPHiU4f6ezRMDHAG4IyvOfllWXRBMjPOpKRAZ/iA5AK8LbXUMsHfrCzwiwHlya9Qc5GaTdx8
	GWpr8cI+IVplkXHMu5XBwzqdqcjRTsmoCPlP9
X-Received: by 2002:a17:90b:1fc8:b0:3ad:c14:35ce with SMTP id
 98e67ed59e1d1-3adeb0f4b03mr1215366a91.64.1792829854594; Sat, 24 Oct 2026
 01:17:34 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:32 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:15:41 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.7.I1683fb18dd1cb29680af5efb2c2d3c3f539af0f4@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:31 -0700
X-Gm-Features: AclHuK_RH6hRiswn7VkHcSfsxk2rWaTJ0grpI4PKmWKFGktw6V3bTGvWs-_Kz3M
Message-ID: <CAFLszTgz66uz4gU6deR_go028R6MhwYuB=Jb5RJ8hqtzb5j80Q@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] arm64: dts: qcom: sc7180: Add sc7180-trogdor.its
 FIT image script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, cros-qcom-dts-watchers@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_011735_621023_64C5BF94 
X-CRM114-Status: GOOD (  15.52  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script
>
> Add an Image Tree Source (`sc7180-trogdor.its`) describing the FIT
> image for SC7180 Trogdor family boards using `Image-framed.lz4` and
> LZ4-compressed board DTBs (`*.dtb.lz4`), allowing the Trogdor FIT image
> to be built with:

This says what the file is but not why it is wanted. Please can you
move a short version of your notes below the --- into the commit
message (matching what the ChromeOS scripts produce, a model for
future Chromebooks, helping people who run upstream kernels on
trogdor)?

>
>   make FIT_ITS=qcom/sc7180-trogdor.its image.fit
>
> Assisted-by: Gemini:gemini-pro-prerelease
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++++++++++
>  1 file changed, 728 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.its b/arch/arm64/boot/dts/qcom/sc7180-trogdor.its
> @@ -0,0 +1,728 @@
> +	configurations {
> +		conf-1 {
> +			description = "sc7180-trogdor-coachz-r1-lte";
> +			kernel = "kernel-1";
> +			fdt = "fdt-1";
> +		};

One thing I'd like to check. Patch 4 says the main reason for a
checked-in .its is to have a hand-written description per
configuration, but here each description is just the DTB filename, the
compatible is filled in automatically, and patch 5 adds fdtfactor to
cmd_fit too. So as far as I can tell, the only thing this file gives
over 'make FIT_COMPRESSION=lz4 image.fit' is limiting the FIT to the
trogdor DTBs. In exchange there are 47 entries which must be updated
by hand whenever a trogdor board is added to or removed from
qcom/Makefile, and nothing checks this. The list matches the Makefile
today, but the two are likely to drift apart. Would a way to filter
the dtbs-list passed to make_fit.py (e.g. by a pattern such as
sc7180-trogdor-*) get you the same result without the duplication?
What do you think?

Regards,
Simon

