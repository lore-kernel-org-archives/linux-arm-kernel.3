Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B15CE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=; b=V/3b95nnfo8C8ERoG1cZMB70Gd
	MmvUeKLNb1YVfXJIDY5NJfysc1pviSjTPfW9PV63p6x+XzKpZ32nKkreffRH/OrYIEQcpyddJoQpX
	IxwyKkd6ixpjUWnzF6S2O5omnFOGmnIj0Xks7zuxESjGvFnbtbblWT/3fZFPduHVBkpjgxY5Ko8kD
	DsW9AA8XaYCw7kOavF06g+tVzTmnOo9xcIdmLarL9LHSmT1CaZX6u4m1pynrf0dAV5sLfted+WTBc
	6Ks6PjFVyJvRf0VOTnCbcyDJ/kZ2EZ9FSlMyK6qkCe2DZbsU8d3J4V7OYxGbkqSP36oI0wfdfiAvW
	5/bqXB/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41yw-00000001Ler-47Vc;
	Thu, 24 Oct 2024 17:50:46 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41c8-00000001Hcu-0Ipi;
	Thu, 24 Oct 2024 17:27:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so12466795e9.2;
        Thu, 24 Oct 2024 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790830; x=1730395630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=;
        b=Zzj4ER+HapTjBokYAbPaekLN8zF2ABddzRLkQmJV0Epro7WRPRpzJi5+0K5yo6muGT
         +v7RFNu45bQcT+DRvfi3YEsIMaCoZ+q3u3m5dO5Oo6DWN/JiE6JsJAQSefPkkZcIKGOC
         nYIMIVJNQTvIvceMg4TaU8dYWZUvvdw94mrpI4vEZA55UNpSuG5k+8LjPrCUjXJJ3Uzs
         vIMV8pqmBDG5WS1G+yz/0+zC9q54lWOotJHzQYjeVV5D356RTXZgjFswWzQBHA7tkn2w
         BVdEG2d0iNpOa6hEw+yZk+M0RODkXZcoR70b0KsQwWSnIEWlQA7rhFiVtn9RtZC1Z/th
         mEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790830; x=1730395630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RF+0h3uJVvZLYuGZLW/jZ/HEsnjwutDdO799XJGlDs=;
        b=wJOui4WY6Sdd1pCify90Nf6dV81GcS2Dgn1Mh0kQ4xHJgBZj89gMncuOuEkyE9cV5Z
         MLvsDYsgIxfZ2DFQefLzXosVsskrPxCvo/JA5AbRlUYZSSWiG63ya98XuZZlePjk6s1I
         lvbwO7Q487dT5rBBOPPNdx2kyLT5TRuNOfcFRf1m2NqVLl7+vub07tS5v1y262wSjY/g
         3ia8PD0MdXZQSXnYh4hUXGr6xewUhDy9hIm0YeW678vxnn6mdR+Afc1a1yyklPoK974w
         BVpYnB98k4qz1DnCN6HcVBW6mh33z+LeLkOaf/Em9IaBqsOLFKLIhhJoayY/klS7hMku
         emig==
X-Forwarded-Encrypted: i=1; AJvYcCWDQw7sAymKo+wi61wQ9wVcpZiOgRGTS4HTiP5qa0JG200bTRhJoa05Ye7tz8PXXUDhoYk++LOsa70o9xgRkjU=@lists.infradead.org, AJvYcCX1GA2/AlhxqHRT/PJVKk2IBJ5wzM7oBLH4D4ZT+4lZ+4mbbunZqEf7xSNYzRf1aoPAGnnksKKHXjHE@lists.infradead.org, AJvYcCX6vy5OYbxeJ1ABItR9RZDh7RxxJtVbRFwDU4yWJ0kW/2CvZ1g9cgJjmDNXOBEY1wc5ZJCqzT+gVe4cVzz0NWXp@lists.infradead.org
X-Gm-Message-State: AOJu0YzWs+fVxSfImqvFDmUJADIj1tAiHg/CeefjTznsssfjF0F3iUXB
	du6+1dhVHJxkc/BeivQzv25Sg2N25uqIXEVXpnkldeWJR5ZDVz/1
X-Google-Smtp-Source: AGHT+IHQ7I/9aI1UHxXx6X/2TOQl2Yy1ybsuEFl90rIKNP8aItf1olbwHtlsGOqqhIDJTGHDheR+WQ==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-4318beb62e6mr24564425e9.0.1729790830026;
        Thu, 24 Oct 2024 10:27:10 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bfcfd0sm52020785e9.26.2024.10.24.10.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:27:09 -0700 (PDT)
Date: Thu, 24 Oct 2024 19:27:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, JC Kuo <jckuo@nvidia.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
Message-ID: <sn3q2kloect5pdsyks2xwiiu7avhaovl62rn3wzhs4qpznwegq@zaq3o3fuc7i2>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-2-saravanak@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hfzjdm3gfakfovch"
Content-Disposition: inline
In-Reply-To: <20241024061347.1771063-2-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_102712_133176_E83AA00B 
X-CRM114-Status: GOOD (  15.15  )
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


--hfzjdm3gfakfovch
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm: display: Set fwnode for aux bus devices
MIME-Version: 1.0

On Wed, Oct 23, 2024 at 11:13:42PM -0700, Saravana Kannan wrote:
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>=20
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>=20
> Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--hfzjdm3gfakfovch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcag2sACgkQ3SOs138+
s6Hj0hAAhMZxiCkgmHPpzOfFMLqQaRfXX70z+C/EbrTzA3OUMgMVTiRAMXm9USIS
SgjCLtThw+TN8T0NPDlAi/x53qr2/K1+ifxrgdjVcukCIcvH5xda17KWjl5lMbUy
OVUJP98lx/BCDvcsTH4HjWdNk52GLn99I31Ipkc8KXdndg/huxA9uYb5bdb5oSdB
S3l/6TUoLTnyb6e2PAg8G2UNwF0z8fOgPrm6bn1fPAHezUuZXYu7h+2tYidyzY0M
eh7RyFTL7Y+aX4jPJlHIKe/88qmAC2f8dKvpKuUe/FFbsjBkTIrSZK69Ynz5pXmF
K1sErSfkghxrbLGxjJMfQ1rU7Gy8vNwiP14Nbik2EFT+KAT6y1LCFCqpsv1fF3KB
tkzQYps46T3VBCljzQeZfV7/4ARml5DGv+Kv/CpiZV1lt2PKQTU+DHPoV8x4bzyG
GsW8JVuWqFjeSkPyf4APslY535lufQclLzS7yI6qalJ+30XDOixO4nJ3VUXawkHX
gJfEljNUTO5xEggz8QZ1wRSUVWV0Ik6PyYh/HneSiGCKn5D11kYTIv9ZX2d2bNBV
yb2OI9VOjn8/T7tfB6T36coLT1xNATeLQPX56+IQC0yw5NMfu7T55/S3amfn34rv
Wk3ki1ZLcI0tvP88rKMqTjGQSmuMDTJgPG2V41FZbUhDhfLy2Ls=
=i3zE
-----END PGP SIGNATURE-----

--hfzjdm3gfakfovch--

