Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F66C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=; b=e76N/+EdojzyedZWrP+hZ2FuZs
	hwxJF4NVVcr91w002yemZD6xl4ttBhWclE0koKJD98jNsfpNEsN+OyknE+exZM2RF9E1loXExRmOh
	J/6isfdKhK4yLGj2OCI/mQfU/HUVGk6oM5e24WjHZdHCizY4EkCr6McWM5pezi9JjGOOeogd5FGLE
	16Hj5f+7rCAv01LuOQ7MAPxL46N3Q56vG3hZLNUqT5SIdlTHZu+gvDVmOe3X38v5DLgx2dvXETDK8
	BfkM8T+WQAbuky6+inAo0xaXe9un/cLLSiahj06FhKxkdgME0oRCEzrzJf6m0SBAxLH5CnNnQwrq2
	4Z8+EdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyA-0000000EHnp-1abw;
	Fri, 04 Jul 2025 11:52:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcSE-0000000DtKZ-0f1t;
	Fri, 04 Jul 2025 09:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=; b=BFrc+/Xa70soRxiHabgixAFKaP
	8lphfuA+NH0gBBx+ZWo7scOwa6TlzBhkkmLoJeqGlZeG+uiQD+0fRbCONT6/g1oxaSsagAUbGGEs/
	kr5Na4dfucnF/7CRTUh+7HdcbVdSy48e6HCmLuBTuOauyUMWWXdxrfJ6+d7NDTlAt2ry6Tb6gGhdD
	dXx0qKJCcDFtl9NV3nmrv+y96TXBJyNz0xyi7bgHWfgv877pEO9MRIW9LT7bSfXGElNy/l8Betm74
	KLwYGEBzgTOX5mYCd2dkG5cNpWklm3bqyIGFbD2DJV/xMTg5kiPtPwg2j78dUunuJTx9YYKg4yvnB
	Y2cFQTxg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcSB-00000007tHl-1NRD;
	Fri, 04 Jul 2025 09:11:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-453398e90e9so4263315e9.1;
        Fri, 04 Jul 2025 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620289; x=1752225089; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=;
        b=c2LkHCilyESzRtjTWfCYJfc1ncNNyUqS4kxliF1PXE/bh04ql/H9lQUtWm3prVhbsf
         5kTbpx3MaZaeXLNAy/aP10j2+kNWEW5luut6eYLGaFY9rqTxONCmA34XElOdB4UATlVJ
         odQIma5XhWJZo/K4MPwfAmRjZsEFZUXjDiOAO5xuhGGit3CciQ0p0f48t6maj5tQC09k
         gHgDVmMWTATeAldWZkxandT3wa/GVOmUFvc0N77tpUbkXen3VdYGp5VroQScM4AG3KH8
         /RlDt7WRdWxqW9koSb4ZGgt8bX4zRDmsa1HdZtZ6wYUEP1ecK9rSHldvMXBHwM2EQBbx
         yeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620289; x=1752225089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BxPSNuI1K+0U+zGcMRGFuPmBq+1SIMVgn3s+fjE3jI=;
        b=iubKQ5oJhfbDWE9pGL6MyzTrXHDHo4yUDF45sg545hnUOM++ebGdKp7MEhCE0fl4c+
         Y0R4YSIdEjOcQCyJDrpDtxE8kyO7rjq23vQpENtwgj5Aj0BSlTPU+e2/xcIb+zsf/Vtd
         XQKrfb0M0b6dl2it3SOsFW0FBAZ4yQBOC874Cxp1V6AZB1S7Ca6K4KT7wjWiVPEYKyUE
         5tpJeP78ScKWppOdP5mOHuSLVQimKsZTlZ5OCQtXiSOorMhcYU+d2f9kygd2xnjHHz3C
         xs446Od4pmQjo49UK6GhCderlua2m6ptqxyK2bMYUjAi830qGxL247n18G4mV34M/Tbe
         Mjhg==
X-Forwarded-Encrypted: i=1; AJvYcCUVKx/UPXPq4XXANe08Bcllgri24LrwpLIDXuc/9FJXYfhCqlS/Cxd1uUnuS4U0BBCa0AXtttmlRp8pGoBmXGA=@lists.infradead.org, AJvYcCX1FWHTs2WCmbJUAkjxPKaKWZbM9Hi5n20ifxQ4vrVyBMtZM/I/O0qmPtrvRAoOfA/505E5+W7vo3tgDokHn799@lists.infradead.org
X-Gm-Message-State: AOJu0YxwTT7gRKsgEb5npME4w8fLcph2ywGhyOdLjPM1LhTo5f9yZDXh
	4Auoq3QUAFrGe+mYIel9t99Ci5mIh06rq+Ma3igCPfBfkqihaqyDWiqY
X-Gm-Gg: ASbGncuFB+rZFEsY+RgsNv9hO00f+9beC2ZjKNw1CDjmI0umCvVFoluKjYjUlJNf9zI
	lowsTLc/8AwE87q93RQ9PW3ebcsSfmkSdHH0gKYFtq6QUeNLKHurw/wRqRuS8djEZVV/odiSdEz
	t49vQnR+wP/nNZe07YZ8riaX0q1gytiPwOJnC3gIn0PRFxO75J1bRTmoP4jZNHOlIabuiY9zxjB
	4tCBt9FYkClSwWGeaZTIXB1IEzin61P55aPYrU9RiGV5rfcXq2X9/w0oXmgYcKSQuqYDzi73g98
	YbkzB5b1rY953Cmz/kGSzSNXe0UaYxM72HPNuFCi3NcwYwE5D3VHcowLQ4iSnGK4UAK44VsU3++
	UJ1SjQObPKtAA4Td+/sEQn8qNlVy7aXVOOgvFql2F6t9eOO/z
X-Google-Smtp-Source: AGHT+IEifZ9+Qoefw6C59P68ghxiOjv/mmB7vnLxOoNgNMQhGBq65x9dlLFXIorvyQQpoQF/016xrw==
X-Received: by 2002:a05:6000:2f83:b0:3a5:8934:493a with SMTP id ffacd0b85a97d-3b4964e56c8mr1521328f8f.44.1751620288471;
        Fri, 04 Jul 2025 02:11:28 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcececsm49889865e9.23.2025.07.04.02.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:11:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:11:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Mathias Nyman <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bastien Nocera <hadess@hadess.net>, Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
Message-ID: <ycajp5zwm65aauacebivz5773qhe2tmhcn7wqhorjybarfs5qq@su6kxog6t66k>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dd3rsrobpe5enhed"
Content-Disposition: inline
In-Reply-To: <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_101131_429011_1D04442E 
X-CRM114-Status: GOOD (  15.82  )
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


--dd3rsrobpe5enhed
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:53AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index 0c7af44d4dae..554b03e3ae92 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -1394,7 +1394,6 @@ static void tegra_xhci_id_work(struct work_struct *=
work)
>  		}
> =20
>  		tegra_xhci_set_port_power(tegra, true, true);
> -		pm_runtime_mark_last_busy(tegra->dev);
> =20
>  	} else {
>  		if (tegra->otg_usb3_port >=3D 0)

pm_runtime_mark_last_busy() was previously called conditionally only for
host mode, but not for peripheral mode. That said, since that call was
now moved into the pm_runtime_put_autosuspend(), any issues would
already have been introduced by the series that this depends on, so
we'll see if there's any fallout.

Acked-by: Thierry Reding <treding@nvidia.com>

--dd3rsrobpe5enhed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmr0ACgkQ3SOs138+
s6FhWRAAmqKDqeofJQ11k5izwUxvfuUGMikCMaAXOhGyv2+Tokqg6xbVpQ/LTy3A
jW7wNUyH5ZjWFprk7RPURsZpkc8ruTDl3bmWdSdp+DlV5VNfEYs1fqreyNsOF1k/
a++KWAlrXA7VRbSlFdMj6W6SjudMMjWby6Pm2K7I8pDuJQdOwSuBf0bWgN95JEiu
MEf7+WORXLjgJToa1eiPE9aPSMqS+vOMhkrhJLfrsCmwqoG5CUnIJXf6wnaN5hqq
QGKPnHXbDocqwAaMFkzX1/nSahQOIl4A882n8JB885SajqJ81BnjWVaUFnS2RDfS
aPDiHDlZ+xs/Ix8ISxgpY6MPoMalnKlf3pkQ3FWrgS/NyTNryLm9bBT/SbhJVddC
kAShqX2e8jXSn1MbNhLryWBJYdQ7jWagl5HwL2/R1w6BzY69iwUKHK/1Pi3SHFY9
ryW8wlQGR2/ukqPqFPZVfXMmcX00Zuu+JIaiSscFM/Q5I3n47JIYmsFSWsertbI6
DTkF9fKh5n1npEGFeUCilrG9b1bsYM+BJIrwqZ+7qfpgKb1uxC6yjdIlDLwkOLjy
gc0ZORc30ulN3X2p+KUzVnte27Q3llclgZoISLYfv0+wkWvQcNYuBCBSvpajeqMe
dC9Twi/Dm657HYa4TfqcD3EMTgt//GUiOVxKCHqOlQhXpEvQMuM=
=lUG1
-----END PGP SIGNATURE-----

--dd3rsrobpe5enhed--

