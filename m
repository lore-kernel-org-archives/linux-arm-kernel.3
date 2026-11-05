Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E4606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3zxz5Zdi;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pImwK7ff
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=; b=3zxz5ZditFlOQFkdsEKGWQtclX
	RRRgQO88URMmT7UnN0rDsyfZP+djgkfOvdYDlKrqezACN7Nlu1dIMsr0eubcSPZnia7YhmO1mqpuf
	wXvhU5oboNkaJ9uxsYdMAaTVm+Pk9SPU16SSn9FW407CwIa3OO0woJJUmnbgWnPOpFSMNF2JqQCFB
	bqHanOLEIDUWuunbaxoOJGMBDqt7pXzHk3KnnSSzvCHofLAJdWzyIJ3GVFpkXiqklUOc63CbpY6B/
	O7iVUQwl1jadzEKsgWG5tS5vuT+LaffWgvbN/32U6/GGxfGwKLRwzSUAZ9npIa1rCKAE8LVhlF5ag
	W+ffIEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy0U-00000009CnR-0ARO;
	Thu, 05 Nov 2026 13:59:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOy0S-00000009Cmz-0q5Q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:59:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso9237855e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 05:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793887194; x=1794491994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=pImwK7ffXScK9rsyZ9xLFuwZWDu0jiuCA7o/iyCwQaXv8j1XmmtItT2cq64E0qPFpV
         w88lpKg+AYa/XkzfSn6bGbZluDOC5OgCdmFUXDV21riUgbSql+mp8XYQZZ3SlTqvZacO
         DsBiXNm5xdczcXrqWMlOr4e+tKF8YVl91N403ssTK8tQbXH5J2K+Ohy4+qMITL7jV/K5
         osq2hKHv8zFhnhUrH+3ZM6IUcCrh4NsAVpZeaUmKxnQFWFF4m7mQMhogbj9eZB4gZoDT
         ykac4EpnZbSxvvr2edfTQdkCKdfQLmEhi6EBXKbXVywSCSBb77nqFW2YI3iEX9bsqgmS
         l51g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887194; x=1794491994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0bb3vYa61fFM02QV8RwA3NSPnIkcy66WcHx7ncn336Y=;
        b=FXNxUXmK5sA0kpRl9cxdpGs8WQwngsEiaXZMeDP7TnLyhhzUONsUgoNoOeB8avheLs
         swbct3up7KiO1+TkaePRgc+4JE60zaEw8eDmRhbWutV+Zq+1dK2me5wtWeh9rgwpRssw
         FwoSDUGrhBone1tq27Hatn7SZr4wuy1BibvWbDGD00nPH2A3Uv/0Iippe43oNMlDdjuB
         w8qKrGC7dPRKALOD0F4bJitcjZc4rqzALQUZsqbeMLVnmVhhIPYVYM7jkjgKCDEvmu2t
         23CuJJRnxnTU2gh/8LOhOrRX/XTzbhFzTIRq3xMVss2dmSEh54Nd85fIEWA/qxgbjyq6
         zt8w==
X-Forwarded-Encrypted: i=1; AKwUvBxP5KABlUBkcTjQ/PBBo9It+tyEot2N8M91Be9zNy1qgmVst3rx3aI4ubdor9xBp736IrEXQM0i8VJRQP5SRtsR@lists.infradead.org
X-Gm-Message-State: APuU4Z/btpNHv0NseWyIY+VtT7LtdTgjRuHCDzk3zBXXz5kDQ07OdygX
	5phSgNKtpWtAhY1ODNpw/2ADe0KBL3FWgXHo4H48avN/wTXfaHQnSJTyc14uMxOphZA=
X-Gm-Gg: AYBFou349buI1NhQ5xerXHg2eZEZPsmpQlqbl1jTqDUceIzOrTbAwr7jpKuPL2HmvLW
	W2RuD6gyax3DNJJE8C3IdYT2WfA/lsRi1mvMBYeBkka39H9eDvSbwiEG4IFtaHY2UeS39KCRyiW
	HOikwA3zatcxQbpqW73c27EACpXxxctxK6fyaTKM+Pm/FfjbvW6Wv7U8O3hP024U1Ogu+Boji8d
	vzG1WUUiDREZU9FEFsLX3m/s1l0B7qqPV3oN+Jx41rqceFT09gVPlCil83++1EOYRyS726nM6fX
	E3uQmucNSM22bjAACNot/8OkSRGjq1BcpULEdlZ1btNjHMHaEvec4gDyeoVMCOCbnlxfHrVq0Yt
	ckjxss9kxsYCpOzBfLPK+JRbqX4zgmYsPPaT3nTwXiVqcgHjN/gbuoLfz2+jj/V/0qg6mvRUdDu
	uEU/I9bKcX1iTsIbWPNUxlK59bRnkgVyCpPdyhf9LH02Kl9bS1nP181BzzA722A556XFeMP19Bn
	sF3cgQ2ENqOS8xnChl+GGTDdimXW4eW5AnaHpGFyyZnVhhCDvHX0Wvn75q9W4TpevuyoMBSrpvu
	5dAH6STDpyao0xKbPuwpCMJnhIY=
X-Received: by 2002:a05:600d:c:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4af83ad8fa7mr259029715e9.35.1793887194037;
        Thu, 05 Nov 2026 05:59:54 -0800 (PST)
Received: from localhost ([194.213.108.9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e2ae73csm69855805e9.1.2026.11.05.05.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:59:53 -0800 (PST)
Date: Thu, 5 Nov 2026 14:59:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
Message-ID: <auyLnRhPv0jz1roG@monoceros>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-5-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bvyb3kuhcvop66ue"
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-5-tcmichals@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055956_314768_5B1D7575 
X-CRM114-Status: GOOD (  10.75  )
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


--bvyb3kuhcvop66ue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 4/7] remoteproc: sunxi: Add Allwinner A523 XuanTie
 E906 driver
MIME-Version: 1.0

Hello,

On Sun, Nov 01, 2026 at 12:57:32PM -0600, Tim Michals wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

As for patch 2: Please don't use <linux/mod_devicetable.h> and rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--bvyb3kuhcvop66ue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsi9IACgkQj4D7WH0S
/k5Wggf/YfIQ7WHmvvey+xjJQnqBBC6pD6WMGs1N8zOjBs47xKTlmoiTy704ncA/
SHYjg0IkCpwOICXXvfiXJZFK8h5M7+y5jrB6VR4gKwnHKcUzaD8baV2tzCTRxFzk
q7fKaeI3n7fNH1aRrXWMimidD77eQ9VgIocGQaE05rZOFLWYznwN1IejorHjVYp/
vlaPrjtYabWXJydNPSHUrC4QQNwhhpon6qjxkgmEXkcW4zWORnfjI58d7MJv7jNd
i46zZKPpVOXafx2kCKmbSiggE5i1cPr6O3e+3Muw64B0kJenSgxjkPD0kzt1TMDL
MrWyYaGIU8+0pgKPYFIeJQiOoD98Ww==
=7Net
-----END PGP SIGNATURE-----

--bvyb3kuhcvop66ue--

