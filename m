Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E66606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O99hJvaJ;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IWeHFbpu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=; b=O99hJvaJ2/LU80qqQFY46P56Gl
	w8oYH/5gzfrgrMtiQxorECbbYYFG9jV14mUL63JmH4oPGpC4g+UWF7Vy+odfx+rQb9JqBGaSufxPW
	0FDewxYe5U06jnAFMs9iSMQCyqxNfAs0SvEjUReu5O7AZTQ2dax2Az9Ot4dYSYEB01IZJSL4LcACO
	4bDMPSc9YwbLsB89PQEI/T0RTKYLwKLDnCd/MRvTVFm2LFSo13UDB7oqhUyQcs8lrnMtlWm4GmwWZ
	Qsps1N7AOE75x9iHwpi8YRkOrWG2aQ/GsNZef8ZmnEIYehmSeoEY0+v5GEu7QAf63PFGgEzM4YDPH
	IwDqzy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxzT-00000009Cfl-3O8H;
	Thu, 05 Nov 2026 13:58:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxzP-00000009CfH-26gv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:58:54 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a214af2076so13828295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887129; x=1794491929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=IWeHFbpuVLCgLkQHj+M17u2Tr4HzU/jvIqljsjiNcLWiYB5p8YschYUHLWlNXWnF0q
         7gvZXO6+AvRAJdMC8OqHlOUX30TI+q3Oh8789F3wU2/kIirVkJrkRpGG87hHTbiMDvmN
         b6iFk/iJmwO7+G39/pqaJ8RMWTo7CHf3SynpYtCXWVHzaD2BFDFQfnTFfzCKfHOw/6LI
         mLa2yI2C6wmjEygVKyOJv11tn9AqAbD7XUvp+rVliEdcT8A372CO71UCFTGStWYRDlhj
         sjAYNAXyf+Ync/qrbXM78RC5Z89BhMysYxG2XBYcRaSrMdaKMrIBPgg1o1XhnnOv21fK
         v52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887129; x=1794491929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP2sPyfb4drUGyU1lXjbZR0XesYSs81x4qP77e4f+vA=;
        b=KLmPqq9oDLzgsCLbEDIz6zMksuazCHtN/AR/gVpfIoosOLcnfd67mJJGClo4kO6nkF
         JdV5DWhP4ruGMKhx2TfrRPbR00w3oXWsdf+xbxT1TH0dUFufH0nvX6chbR9pcSXmzSsy
         lhp3wBiUpa+F2Vs645trXMmtFy0Xh9UCSAs9fTl8QiS7q5E69SByJUQ8UsOxGUW9R0zS
         XticdlTiUZTVJpkamysr7LvLENFiWbqSrC/g24++JQH7m9rDjKNlkmw148JbqW5+4XfB
         kIUJYsdWTPSs+DYezqI+vTGtseh+ZXczDAElx+GNyuARhP8y90/ORsy3ojIn5iJxvgwG
         plpg==
X-Forwarded-Encrypted: i=1; AKwUvBzuq7QkGwfLORmUmsOy0HbGrXMU63ah+U8rVVxRNkO2c94+TKRm63IphOnDRURpWV2jwGE5MRKM5T+qjjXrky8D@lists.infradead.org
X-Gm-Message-State: APuU4Z+9Rk+wyOFFeQTi8GX/RO/Y9PVpcuxvOE+x7twqmaIRA70JVhyp
	AKNcsfizItBs+t9ZuYv5nWpkGXzzpwtir7+7xX/psupCO1OFhVqQAfnjElWeFSsQdhy2KzYJffC
	PEJbKrFY=
X-Gm-Gg: AYBFou2fuOpDwj/y3NPcj0ULQ9AmEZbvvK2FWC6GvD6c77pIfZX+gPdw7qXBEnfU3Em
	dOP+5jwGv9guvxxquBO6/qePG9VtWCP7o1ipGEdq+5T89ztL/QbPD8vqN8mdqELoGQNsgtvuSwN
	Z3PeA0SAkGo2PX/LZg0NQ+/vfKrafYH5U+FYz0284XDMCzOESJdwP4kF6dHKnuhEhLpKDb/A7No
	TWmJTiNIo6py5UGtJd3Jp5EwdkM14fOnEaI7/PyqP+HG2eOxs8GPoefi6joLJ8PjexAtm5POptT
	e/Jm1uG6lZKHZ+lgiPjwWtoG3GSSC5AxPxlSE1LjaqEuk2YaUN7YJluBT/HMtLki1mlXbYW+g5o
	vmgI7WuYZ1abPkOz0UvviRaFBhx+cjbKTiGTxh4Zs1w5K1PkeERFjrq/wCdJqXElnextxN1AMY/
	Y/GtF7csylihTKRcWUqD6KI+Y2W4kbyRn52MNhWr3UQOiBFzkTCWf2geDF6I82LYrpMSK1om++4
	zUllyH2j7otzOVEf4zzM68lvuFgYEGZcirHzAwdfSslwHrPLSEHcstnhqE6rF07dqpgTiRWspOT
	NECCnd5q21ceylaonpwqgxxLts2D
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr375702725e9.22.1793887129505;
        Thu, 05 Nov 2026 05:58:49 -0800 (PST)
Received: from localhost ([194.213.108.8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56ba6bc36sm75097435e9.0.2026.11.05.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:58:48 -0800 (PST)
Date: Thu, 5 Nov 2026 14:58:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
Message-ID: <auyLOc4djmm29Bnz@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-3-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6jfoalgweekh6k4p"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-3-tcmichals@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055851_564557_80B26427 
X-CRM114-Status: GOOD (  10.23  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--6jfoalgweekh6k4p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 2/7] mailbox: sun55i: Add Allwinner A523 message box
 driver
MIME-Version: 1.0

On Sun, Nov 01, 2026 at 12:57:30PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h> as this pulls in a lot of
unneeded build dependencies.

<linux/platform_device.h> already provides of_device_id which is all you
seem to use here. If you want full iwyu include <linux/device-id/of.h>
instead.

Best regards
Uwe

--6jfoalgweekh6k4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi5EACgkQj4D7WH0S
/k5vhQf+JI5oqB8wirr4Mfq53+EuIcbqVBMYKSJ4VvYsL5NgmUbk5OmelFsyFXLh
1cTpKfp/pSXjaY74bSTdw8Wzj26UAD6h5WcL7M+Y0R76ERavh1U/j83g7GfDBxJr
eHota1nXeLkRvpDqW7tWDBWn66eu0IeVsO8nlokpZTVhmLk/uFlIIITHp+IbJSUS
oBmB5o0SK31zlNe1wrqwI8jCXjAUPyVcVouZEhNQ5mtIja4FE782+wlnw7agZe69
vl3MG/TIihE7J63RC8U2iKs7BsfN9oB5xF5H8YMQYZ8/3uAj4eNkgFSjpbU8xXtp
IDWe63lnv5ShurGsD35Z20wJbKGEKA==
=hD40
-----END PGP SIGNATURE-----

--6jfoalgweekh6k4p--

