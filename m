Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8D8606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 18:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wPeVsqkO;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=PJG96eK8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=; b=wPeVsqkOja+Srw
	To0MS9SPmCwYuojxv0Ubp5vcPBiOAIBP6Y2/SaT1xUmU5emjpt25BF9iv+MgAaOyidT9HD1ACiSEy
	5bG5QHhyS4UICTB33LjCs591/MHryctke8k/BX3Ag1ZWL7nrZTOGlTHfvbjvOSeCtmYQuPL/FYUXq
	Mc0UzkZBgbMJOK9MyS7hcvt+8C7Kz4tuUclKvFYDMNVEyvHbDWEXDZ9nC4UUN8ciHXvEYSrDrqi3e
	bE/jpj3YFHf+H6BfVRYDIGAxcXYDqZdXZ/fd2YV3bB/Yjxy6Vs7xHhUdDtW+jEjjGY8R1zWtEHSDp
	VzQRa6akw+ITF4dG5vwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP21S-0000000A6sR-0dAe;
	Thu, 05 Nov 2026 18:17:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP20y-0000000A6m2-3g7q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 18:17:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1230853b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 10:16:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793902604; cv=none;
        d=google.com; s=arc-20260327;
        b=Q2DnZpnGoUK09Cp2uGVCxsZjGJ1u6H9WlO1u0T83a+J453CLw3Uao6n92BGPKjXUNb
         wWQv8qwH7rkI/rO7g+L6xuXWW7HmaXOUwQtmgGOn4iQP+uzQTV4yRbbfhDMDF8PEC4Vd
         iQIGMkLBk26JV7O7gCvpo1HiqeVtRSK/J5zgzPgnpAGnhMqSBZ9YDdgQZn34lNkmLs24
         ExAIrhUsb5krZ9PG7gwlmGRDyTF0qrExOd7/9Dp+1vXwSSAuiwSeRsQpkixMwZwnOE/q
         Xs6pstv7ZfAlfc82WNFv4wEOG5jLwM9x+JSq24LeXnLs9a6DYH2PxcA7bpqQfGrommam
         Cvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
        fh=SLwnn125YDVIZKBosCyytWn4p/0luxyXHPQ7JL2QWzk=;
        b=n6K+ElXitgWhkLldM/rsJP0V1lBn7/5+K4zgtO3HyBGeeUo3xPkx93JQ5L/5X20xYp
         KxtpimRWqn4N756uqoZapk+Hv1D/5guxmREPfugn02HbFMpWu2TkTt79wXNQd8Ew/xLi
         /Q3oB6DXYeKJXtSJEFFAoXM/li1BSDuk3cJQvGvXzsuQmnAI5XpzviDL/Vu9ZbYUQb+e
         4ETceiHdvVmfFahI83+HWNwKWP+f1GyT6/iaRCUxtLEZiWSusBHP+QBtR5t2rV8LyzJP
         dUuOmalTwOSfGHRhwryL7iYMG/OFex33iazqej6azuisKG1B9efZpXWOpko7qw43ML7q
         PrHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793902604; x=1794507404; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
        b=PJG96eK8s61N26j4dJE3rWFyzgZSADmhmYFNYVq0t8fopFAZoRy2fg1V2lWuRzon/Q
         0SK8UoGPxfsSs47qcf7jAjF+3A1jwnFSnm2ulWk6hdMpIiRyIHoseJcC3Cf5pcGyr8V5
         za7z1/H+qG3htL+nGqdfXPLlRfpQT0OebM0Vj6zT+4WtCxDh26BPMmTH5aJll/RNPu5l
         OFjkwjF+KqmYhH9ilVu9t+vrR4x7MQBVQar6BH6Tgshz+T/Fw5wU2IsceFZhhuK9bucq
         6Ql2OyFpqU15lKQ3jhafBWKjySzcDOWIbMEDXMuUYjPpFwWVCgT+VOzOjO/xrqx5rUiP
         IUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902604; x=1794507404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRuHktTDVKwo5RvXXcGGk8C8OZkIyyUELpQy8s7GxcI=;
        b=sGxefX29ZenU5oayb12CxXf/7xrzMaYsj9T4PMs2i7wDqMEwXfwdYl/jtWGU28j0dh
         5RU+OFNlugeEQVojxE/nnqUKNwcCCMA+tqNdlBW4RIEvUnK7/eSopyu8sTvBM8/kyIZw
         5gZDNox8NPqha1pvgnNiCig9oSHBfr+7739VslR0IGput3UJcw6K58cSRFhlw1CaGANX
         sclAT5F75hlYIO0fiR4q/0GL8jlqbdzgSUnEmsH/ZWo8P4fMVXBNK6iPvIJNn6DHUODX
         76HMs+dv37YAP6lvyHyN7GkR0jNlqn92c/KFPmLDf6rjahUII5Dhra9Xh2PgA5ajbEl9
         dM3A==
X-Forwarded-Encrypted: i=1; AKwUvBxfgUGDH47lesPFkb4aAnjSDf47idhNIPE6KVamZphESndEXJEpJh59OQwoW9H48SKvG1AOLnWGIAb+xNO07U6b@lists.infradead.org
X-Gm-Message-State: APuU4Z/i7gcWiShp2NhmMGULlL6xjlBdlw5v0J5Ho7iAYRtqsnd4rowc
	ND/uB8+Pm1BXWKmfTJOGSNomwm3INKcV54cVbZ/h9CtgCsvxD1/p9lzVXFABAfc/0YBdodwxuYx
	/j0OeaIZLj6b4cGacpfs+3tNvVnID5s4d/vJh37Kj2g==
X-Gm-Gg: AYBFou36Zb84qI3sWs4MlFLtLtvROLEgeGWQ/thUtEFquiGJZ/IrrA3KbvpkUZKTIvj
	/huSrjAcmQuzvmJsItDhbhWScog/FwCqSZ8UD2JiHxxjUhnc59xe+/iHwX1s8PZlUq7qGFuDMqX
	D7fLPK/OgV/qilaMp5Lugm/B1LpB8OA46g1sB8Og06ZdEySq6/AFNTsNBgilFgk+dYsSKeymPx8
	wM/Aiuj4yNs5GDvp2iT+LHU8Jjfyw9rl6Qc9EAklUUS/9qLFY/AdWQ8mp5hZSnzlC0ucfY2HSEp
	cqRnqEXURM1OAWC/dyRqR/L42wqAH9IGguw+g9xFBMaQs35JzEB2Bop7gwwoq2Vq9pmQaOPZDIo
	FU58XdQQzBdqi7n89lv0jonyj4mnVh+DVnBuu
X-Received: by 2002:a05:6a00:2e10:b0:89f:600b:610d with SMTP id
 d2e1a72fcca58-8a9bf3371bemr17651793b3a.31.1793902603859; Thu, 05 Nov 2026
 10:16:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv> <autNWETrwrHbD2H9@sobremesa>
In-Reply-To: <autNWETrwrHbD2H9@sobremesa>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 18:16:32 +0000
X-Gm-Features: AclHuK89M2SkDj4GupZYw3Cx5gF7O7bIl48XC-kBSDLQ8-C12o5Bi1k93zrIM-g
Message-ID: <CAPj87rMoGhN6yew4tcGeTjrG87685f2cdrmkHFZ91CwfgXx0fQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime suspend
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: iav@iav.lv, Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_101648_418126_486F6606 
X-CRM114-Status: GOOD (  13.17  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Wed, 4 Nov 2026 at 15:40, Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
> On 30.10.2026 06:43, Igor Velkov via B4 Relay wrote:
> > @@ -983,6 +983,7 @@ static const struct of_device_id dt_match[] =3D {
> >         .data =3D &amlogic_data, },
> >       { .compatible =3D "renesas,r9a08g046-mali", .data =3D &default_pm=
_rt_data },
> >       { .compatible =3D "renesas,r9a09g047-mali", .data =3D &default_pm=
_rt_data },
> > +     { .compatible =3D "rockchip,rk3399-mali", .data =3D &default_pm_r=
t_data },
>
> You're effectively adding support to a whole new SoC. This made me
> wonder, are we sure suspension resumption not working is only because of
> GPU_PM_RT? Shouldn't we know first about its supplies and power domains,
> and any potential GPU quirks? I think this goes beyond my knowledge, so
> maybe Steven Price can pitch in.

RK3399 is an extremely known SoC. It was the flagship for Panfrost
development for quite a while, has really wide community usage, and
quite a few products shipped on it. I think doing runtime PM on RK3399
should be absolutely fine.

Cheers,
Daniel

