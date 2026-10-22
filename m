Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 03:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1t2Mq8Yu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NxpNegoc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=; b=1t2Mq8YuwLk3WUZoBWmyZgTfUv
	Fwwxam0gJNydIvysi0XWrRBx0bSwcUWQPrFDbj5nhjIjzneKTRoo/F0zHE2IA6Hx9EaOZxj19Sg0m
	5Dbf8ZbxiODmP42HzDG4/buBGj52V96mSqY8dYM4wVKKKmXY8IEXB7e2higj9e1cVzD+lRPmSe+fV
	hBm+4/98rCnF03bomODisQmsMBdFD00v8uHiwrNKH6w+fjTBpoPpqdUF9tXukgnDU66YDuPXi/XXn
	aP/tUTlgNSElTy+Fl7qE3EHdKd7UQuzybCIA8/zPJviw655lKz8SQl31VNrW4I4aoPHvZKWuKeoSP
	cEfauvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj6U-0000000DGDy-4AO9;
	Thu, 22 Oct 2026 03:04:30 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJj6S-0000000DGCt-1wxY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 03:04:29 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c41bc914672so60775366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 20:04:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792638266; cv=none;
        d=google.com; s=arc-20260327;
        b=mwzrhzegJP6tcVXOkTOp/ZPPsi2sHRSXkBuEiVPi+3tB1V5zDsxbQHLEEJoarWgvHG
         IqkLEsDQamtSN18uJYNlPT8QFDqe+iN0ojtJoWFgBDv80XFzzLncM2nXBfWSVUqulKhz
         3jyO4+D+CSPesQDIrxdCuRJWDiiGlc1D38WHroP7KBCxHaGBJVYK2MdqZuu5++50FBFm
         3yilQSGhWNGQ9dxQsWZzmCsfwMcac9RKhk4t+nMGhOy9lIKElDQKKAgfPDGswa6gUeQr
         6pI+pHbNswGFg8SRUJF8mPaizrf5Yw99sqdXksUXvrhfh9O7Pr5CXhPfz2cwVKjn6Dlb
         ZhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
        fh=4hfmDNYfdu0c7LtgtqvJlWUjw0vch3WC2JFEYzWpsdw=;
        b=bpT/Ie1fJQ9FPOjSyJZfpWdgpk6TVIIvT3vZWHqPPdpEmyGTO325yF6JbWrMrMLOml
         sWIIETWeBoDhhJ1HKqlUDi952qjeUhXpqkTHleCMlG3TahIsQBZL/hQFWk058F8xkVAI
         DblxzDIY8T2iMwdLhoayzv9sa8Yd7eus/1lfSFLzsvnno4mddrVEp1ZeI5BMdBeaePKK
         KSEv5doEbEu7XrrSxe4D5Ss0V0mPZ/mXkFmyoNQVKny6qNRsW1K5RJN0kZP4cjLgSHU2
         q50qkZB4fiwPpTTCMDmZBu1Kf0+qopMMQPrlXuGIEDdpaTjUh7WNNMDumE1hF8oagvId
         WyTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792638266; x=1793243066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
        b=NxpNegocoTIKautWm7lfGe+hqmy+QWC6ELUfs60u0d2/RNCT4s+kvGH3GtWMu7ltYn
         b1spB9uslegrTPJQU3u7R0bCObs7Wgj1osA/Rn6tkV78iwCKc9DU+MvaDtDxEPjNmTER
         FAcJcMJAmORKuJxkJhBWmwtbnVl7iNkgAM2LkE0kT0bWq8crqu3FlzBZEZ74aZ2oghoT
         ci7jfbcMAI8G94LITEWMluK7RJIZ4Z5r0Ta++zucQmtHQQLbHWMgp16FHzn0Oy2UXZc3
         cJPof/3qPWmWVB68cILxv3DO1+EA+Crc0Wo3pIT5labzyNxW8C4gxhqG7ookVnqtc+3r
         nxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792638266; x=1793243066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGQyhFT+2bVUEMq+UKAq2bulBZGeiIByCybjssa5muk=;
        b=B1mcSzpqyQSbDa0AiqqIWK/WLdtJUTVCulT0ggr0ov4FagWAYu2ZPkMpca2F/ITVtk
         DQ0tTmKGi/mmJqNEfWVbT++EWwkA5AoWx6mUSt0YQEc+rAvIc4XNiogL95hV034xi2e+
         tonU/bUpZkLEhEl9/W/rUYJSnnIiIxLF++ZhX+dX4AAGdL1ucN26wGhAZlzg+WznSJvC
         Spq/M6Py1/pd8WiHHGopl7p+9BWVokCM33Zd90I9tBV3Pam91/IA2hwSTKCeyTJfLDWz
         IOA8VcTfiMfT9DCAQSB8GeedLUd8O4iJpnMZOsBIr61otapPXjzXx5JO45JpsN3APEe/
         9cqQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8b4hIAoVfxPYzPy1GsXL0xTX51TARkVpBxL5zd5pU7AUbvrHmKGqWOxZjM/waKH3QlIwyrDMoQY3K20g13/Zs@lists.infradead.org
X-Gm-Message-State: AFq9FYLjAWhZ4Wiaq6oDkh5egb9NVr6DzrFYJixI0QbQz+N3TyX8Pifa
	aYw7bVry2RdlYX/Eadvionxu3OAtFAF8ArRkEoIqqdpD+Ag6Uq0JHqLny3aw6+BefGihGt8zKKn
	4dza8ZrTloduT7vBk/WJ/0FTuOEuOO1c=
X-Gm-Gg: AYBFou2kcump8uC6NEZHmm16XarWc49et3IELk2qKYAdkJuisypUqcfs9xSNs8Rzy/m
	KB2CzNrVtmgIQZ5w5+XHluH0BY89men+gW6afzzQ/Lq6JQTwvNi43QUVL87uCKcKLTT2WRncsIn
	fE3VkoH+/wXjaAzkhKQMWJDujzSFsr336uR1s2Wyw8Zb51vkcSCg4JatdnKPxK5H7YT/SLMUuiJ
	yko9MKSf3Qj0voePqTAzsKj6G66RSQHCteHX6YmfYErPs+Vk1zuw8lFDVTYqyOd5zAs9pd4XjFB
	ZIy/TwNLxCC97BffQWwq3YfNZdDiBmlbmBMAeYQG4qIzux/Sh9fYIkHeMd6Zcx1LMsOm2ZiKIyF
	2tK3BItVXvzRd5YePDF2f0/LPRNGfQRw/sRahM4Sv
X-Received: by 2002:a17:906:7954:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c46791a9854mr357604066b.1.1792638266169; Wed, 21 Oct 2026
 20:04:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925041751.495818-1-coiaprant@gmail.com> <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
In-Reply-To: <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 22 Oct 2026 11:04:13 +0800
X-Gm-Features: AclHuK-x9tgKioE3zW95rXaMi6_YZtM8cmcvfk6VmaCJ91IvPzsI4d9vJZ8M2Yw
Message-ID: <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: mark PD_PIPE as active wakeup on RK3568
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_200428_545616_D188E447 
X-CRM114-Status: GOOD (  18.63  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Coia Prant <coiaprant@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 07:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gmail.=
com> wrote:
> >The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
> >controllers and the SATA controllers.  All of them can act as
> >wakeup sources for the system:
> >
> >  - the XPCS for MAC WoL, through the SGMII link
> >  - the PCIe controllers for PME#
> >  - the SATA controllers for hotplug wake
> >
> >The domain is registered with active_wakeup =3D false, so genpd powers
> >it down during system suspend even when a consumer is on the wakeup
> >path.  That kills the XPCS and the SerDes, which breaks MAC WoL on
> >RK3568 SGMII boards, and it also powers down the PCIe and SATA
> >controllers while their drivers still expect the link to be alive.
> >
> >Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
> >of its consumers.  Consumers that call device_set_wakeup_path() keep
> >the domain powered; consumers that do not mark themselves as wakeup
> >sources are unaffected and the domain is still powered down when
> >nothing needs it.
> >
> >Several other Rockchip SoCs already mark their PCIe and USB power
> >domains as active wakeup, for example RK3588's pcie and usb domains
> >and RK3576's usb domain.  PD_PIPE hosts the same kind of
> >wakeup-capable controllers on RK3568, so this follows the same
> >pattern.
> >
> >Signed-off-by: Coia Prant <coiaprant@gmail.com>

Hi Ulf,

Gentle ping on this patch. It was sent on Sep 25 and Patchwork shows it
as "Handled Elsewhere", but I can't find it merged in linux-pm,
linux-rockchip, linux-next or mainline, and I haven't received any
review feedback.

Since then, the XPCS driver and DTS that depend on PD_PIPE staying
powered across suspend have been merged and sent upstream:

- XPCS driver in net-next: https://git.kernel.org/netdev/net-next/c/5e91edf=
b0e45

Could you let me know which tree this should go through, or whether it
was already picked somewhere? If it needs to be routed differently, I'm
happy to resend it.

Thanks,
Coia

