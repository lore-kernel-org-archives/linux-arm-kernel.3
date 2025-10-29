Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062FCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5TG0ueaKuFAyQO0OV9etRSInulzLHrCU1Q3MeGK1uY=; b=OaiyaKKYV9LIYSstHOn1nkdk43
	Xl6wetgmH9on2BlF7B+tE0dD3fq5xHTAQX5DnrA1tWF3fHb0OYrc4Vf6u0D/GfnyONHauhWHxYwEm
	7TxZqrc68z7S/8CG50VS8Uuj2QW17h2zcT0ZPQ/dw5Gr8dxClnilNK2c73Q/udbqvpSSpbn7osnIs
	wdVtqE+YdKJriErrwcvpnreq7nArzY4QwZVQpDLPghZM0xsAwhymQtyQE1LIHbcLwBsLZCPgMNYXH
	KSGm6IGCQdKZs8hA33NVeJnNuxMl18M7srUPoChlY3ZCi4SeiwU6LPgmVxIVjmhAK8OXMxxLm5gBv
	l7xe+y9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Gn-00000000S5V-12Xs;
	Wed, 29 Oct 2025 09:15:05 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2Gk-00000000S3b-2BLu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:15:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so7665578e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761729300; x=1762334100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5TG0ueaKuFAyQO0OV9etRSInulzLHrCU1Q3MeGK1uY=;
        b=Yey1fmMp2Zq1eW8QhN8QlFI+T0Nk2c7ZcASO1fsSkeOPrQG4UjGmtHVNHW0x+PdG27
         CzQqAw3Uwc8Uq7VNu1pIQ0zIajCIiu1OUhno6TLAyGNPd466NpQfvz7FQcATQJ4FuW7x
         4gq279zCx5ZgZdpXaB1R2FyYieLNUx1E9E4ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761729300; x=1762334100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5TG0ueaKuFAyQO0OV9etRSInulzLHrCU1Q3MeGK1uY=;
        b=oTPTXA5TOCufNLPhPlywWhvNrwXrWELW8LBKeRAgt4mzNpnjNIV/qFLIjt+CEoSa1u
         r+1uYJZxd/ft7Jrn3bxxh5QflfUFPPImqTWtkwfN7f4Ur+d3+mfOtFeMayDasVLfAT8x
         QJcs04zCo9r7ytOBgeFfhZywzb6/VL55hE7zy6tdK4yYi8GhDr5oEF7FockyWthB2PGn
         lz+RWWjX1TwHTlFQdvKdM/4kid/kYRLhVhooQf7CXIWiU3D/2Ks1F/Jq/Mgm4QNMLvzF
         tw8GwmJfbTTL8FRiH6X1zdk5ZzbvtYsxk+iWLuggPYy0KxpKM25kG7d6X9r2LxBEBgHL
         2mRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXESXCpiDC9Bu3rIkJYHt9uOdwnltNxbjHMlPgOHDV/H9B4DbhEex6CADwhbqMi8YTwuuMeDWJ5QWnoNQaPimRl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9adZnc73F2FYcLsN6XndHbG0uXd/FuSWrEu0RE1skTJUcUVXw
	NO6UncpKVDwa7ZNAskOfqmVcirnWkNBB15Q36tcVzHcQkQGOJhDggYaB4EumMCVbAH3RIwSHfGC
	yQQCwfnaPkuyNgyam1zrUeOVK3dktZHHs0J5uk4Rz
X-Gm-Gg: ASbGncvE6J1BjCxQ7xrEY6uE574bC4P3EHQpNbQz/Q94lSolRWfxmuPy4O0sJ0Jtrot
	SMytFRwWspBTbOGWrXEhmjE7CEDEPX0aLt0xy5Nl3s6TcTGop5OSbRdteRrSBUmaFH+zgfOhU5P
	F8HesuH+9U8pyjCGbcX2LU0VepmkxboXOQlNsi9jDibQazZAh4iru3v3wx6gtn/Xcy95BrOIeZX
	zCNyT3k01/cOy7MJIhils3BH1X8uVE6C32YtBaUoXSjbPVi9E5LHC5JZxqfVF5uXUPEghcxWqwH
	/kPP1wSmDzQXHA==
X-Google-Smtp-Source: AGHT+IEdzCz5CagXh2U1asZRsfKQhXvsI7kXu6etELWvVx9B3yH4c3fTQRn6qbqQRMN7bG9dn46906V22dlPmaM6Xt8=
X-Received: by 2002:a05:6512:1150:b0:592:f2fc:51f0 with SMTP id
 2adb3069b0e04-594128b54famr828019e87.30.1761729299812; Wed, 29 Oct 2025
 02:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20251015084103.10737-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Oct 2025 17:14:48 +0800
X-Gm-Features: AWmQ_bkTadC0tGmcwZKXgN_YyBG7Nl3lIGZgDu08N9ula1vkSppNL4aPMzmz71k
Message-ID: <CAGXv+5Gs5_j5L3+HT7K-XYwVG6S8ZGhHZkEcS0HpdkcjRQq2oQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Construct FW path if
 firmware-name not present
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, arnd@arndb.de, andersson@kernel.org, 
	matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_021502_616209_A244C942 
X-CRM114-Status: GOOD (  20.94  )
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

On Wed, Oct 15, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> After a reply on the mailing lists [1] it emerged that the DT
> property "firmware-name" should not be relied on because of
> possible issues with firmware versions.
> For MediaTek SCP, there has never been any firmware version vs
> driver version desync issue but, regardless, the firmwares are
> always using the same name and they're always located in a path
> with a specific pattern.
>
> Instead of unconditionally always relying on the firmware-name
> devicetree property to get a path to the SCP FW file, drivers
> should construct a name based on what firmware it knows and
> what hardware it is running on.
>
> In order to do that, add a `scp_get_default_fw_path()` function
> that constructs the path and filename based on two of the infos
> that the driver can get:
>  1. The compatible string with the highest priority (so, the
>     first one at index 0); and
>  2. The type of SCP HW - single-core or multi-core.
>
> This means that the default firmware path is generated as:
>  - Single core SCP: mediatek/(soc_model)/scp.img
>    for example:     mediatek/mt8183/scp.img;
>
>  - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
>    for example:     mediatek/mt8188/scp_c0.img for Core 0, and
>                     mediatek/mt8188/scp_c1.img for Core 1.

I know this patch has been applied, but this scheme doesn't actually
follow what is already in the linux-firmware repository.

For all the supported platforms, the first core, even for multi core SCP,
already have their firmware uploaded as just "scp.img". Multicore SCP
is seen in MT8195 and MT8188.

I guess I can send a followup patch?


ChenYu

