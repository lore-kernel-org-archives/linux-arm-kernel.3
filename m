Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE87606A335
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eESThNeZ;
	dkim=pass (2048-bit key, unprotected) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=DWiTfF7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=; b=eESThNeZSlDYJ3
	u/J1Fe937kO1aWbcLT7PZ19ta43dF5M6nR6OtBcs2Rnjc24an4NhfDTILNjg2PXEqKOwNxhg92FwX
	gtRehPxxEIZhJ3zdgXX9WlvxiJKxjLzTgKsRuRkQDEsnTigJFyS49FWSXLnCgCeFWEvLRLL4vJ4Wb
	uOSyE1hdbn4zKmlvRyIEn3wDtAUSXAnxinNNhV8EL6tr13dBeKg6MR0GlRyKwqkTn4pLQVqCyNXmz
	LyATwfGdNvNdkFAmvrsQdAhK9CXuuZExNqhHT4fhBUM1gHvYQ6PXmmpwL13Enwtz+/GbnTKeZ+1RE
	QlYiSb5BNqBBvHl5cpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObqc-00000005bqV-2kS6;
	Wed, 04 Nov 2026 14:20:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObqZ-00000005bou-0pEI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:20:17 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5be47aa555cso624754e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793802012; cv=none;
        d=google.com; s=arc-20260327;
        b=SABBZT+rjjSeI7tbNhDOlzCw/9aphVuV9hzHlUCR1dYJRfINNGetB+dGz6Jo4XUwFH
         5YMpdU/kAkQvCPWGriqNkWaCZGPGP5bK14MiXGN1lDLpimsPPnOiWt7/256GvDaSajq9
         3JICDtac9MMPlK8ejezPHoxjAhckzv3dVd0i0YOdp+fCZCz4M+E3fuI/IkaXUpRRceri
         W1tjIxktv9iXebgwtnYig73bSa1bFPTf90PvJzsewLPz91cVBdM1SVBqADLFn+IrGNl9
         ffJ7hi1lvTqSK1+wbfO6+1/EGXqVfejLcLWHdBLE1BsfPJAi5e3TAW6WGaDgYegibTpl
         tu6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        fh=dheGOWl3ObwobXtrBrfMT1RbSWnSmRXPhlNgD6GLkp8=;
        b=LoPIwPHeApCYQI3LcuBFPG6VtxnUxq9KwE4KkJ25lDI2qxNhKUIEwpNKC0c9V2x8Iy
         k/cQAxP13+2L4jOSpviP1DeOXiwBj9SVQ6XrQ8TumaEujXxLiFOCuAntACSdjB6Gj3Wx
         /JqLYc0/0474fnGBB58rwMRheIIMLYwm0QahNvbFdLaeuSB3K9ZqtB2b1nu8P46s/dEx
         wt+S4F3gi/F6Ohy/DykVEqC3nuQB7MhIzk3gtmeGrjwpk+jGGq6d+7B4wufCCT+ZQKrf
         AizsqFIdILPg3/Ets5wGRATPkqNTZFgKQtqsgtTkWVUNZG34yA2iH531v7Lin+6GJ29J
         NhpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1793802012; x=1794406812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=DWiTfF7s38TSnPlkXTKGiwBCu0jiJ9z8+vAMz3G+7rFONedsml8noUhY/iCzn4RRAZ
         Sw4R1UDYNgYiJmcJsPpktS5Lb/4w1eL0hGncgjd7tFZLmTjOsbr/WtTYI3NI5LhlFxsE
         S13N0MrHCpFARevZnlba7bvgKpzZADCL8oasvE2xOzw8pGnOC7OMkMgrshCszQ+tRdAo
         Y8BMhgeIx7WFZb64saMtJNCWPZ9zzc5uxcWCq+T+YfkGcEzPoHHLWOAvI0TWzhKw1lEv
         Cs05k3yH3tPJ8ZM4QyU21LCODZ1Yw1nal3Gg1KJz1/Tq5GOq5fT4eYKoy09C8o1dtNtl
         gFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802012; x=1794406812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cTFlIKCtY2beSm3M+7wixuQ4NtEsFsbXStwjOBxwJrc=;
        b=WEe8uedkY2hnZmSnM0vc1mPhBefi9fAMel2x7SQLk6UAxntI4i8g772rbmER/Z1tU+
         fglxgsR13yAYfmvK9lENG4oz7ov1e1NajlXeVvOV0EOMxlcj9NOaKCtOFDMxqH3hVRSx
         eGyVpfwaHlew7QC2kJqw/WXGSFXE6vxFx5ppIuDL5ddtpkwnr83Cd5O/fSE2w+rGvUTD
         AvDxMzWbz1goqjtXZ9y+aBVODxZBeDNbKRKmUEkMpY/3ysk5ryF7pd4i8gJJwc1fauN1
         NvoFzPuPe78nXT2nz2cl/nOy8Y4uOokoETmrCRHcExSDwyG6M+mI57tlgH68wXTQ0K5w
         ciWA==
X-Forwarded-Encrypted: i=1; AKwUvBy/MAWX1HcOZ8J+GJJ7fix9xVzKxfShD8YYQxaGbd5ilGTCZ5LU1S+QlwLDBTeO3Ofx8tcq5kzn3y/qla7/LY9F@lists.infradead.org
X-Gm-Message-State: APuU4Z9SKyYNxDtWJ3eBUI7MMo6Rzky8KgkjUuqMBN9kG1508aW4iX/i
	7Sdv7XheGaZXsa0Ld2/aEmUM7b8VSXIkaAUNf9cZIqR3OL2X4+aC9Fy7wWSmgPGj4oZcAf554Xe
	4kaqfZ6XLIvAEHu0G7k5xOVwQG7xpbmdfJBq1KlJ1qA==
X-Gm-Gg: AYBFou1KpVKHzcP8Jn/hGbMvYKAU1eGooHdh8/Rymx3v0XhrSvhmmkiCwDF++M7t1oC
	YFWK9+Mvcnb6HUOUgaWNRuiS6Bm9TQ3ovbOUPUqXNaKT0LpxxqDvwqNCsyk48j8B/oXBMls17I/
	vztsWJQFL/TxVixswv1tsIkKAFcOJwfc3B7kmebEQQvbwpqZoS0bZMVwwMbUGCJKQm4+W1s8YUs
	zEWHxQbosnjyTViOzY5SVf6yeX7EoYw01wa9hVBSrCjsWW7vhW6rFZ2UwmzUoNWThz6gjWW2OTr
	qvK1jaOdYikJV4pCO4BDlM2u10VFj+EcjbgcrqWU1J6ohRRchgePgvE33xAS2k17qDrGID+AhNS
	Yg801CfsiAN2s4RAFSztuVOM2OrKcidpTAruh9ADc+3GkhWy6MGKFbG0ZKP9UnVX6ntCz
X-Received: by 2002:a05:6512:1394:b0:5bf:d1e5:6533 with SMTP id
 2adb3069b0e04-5bfd951f9a1mr5985954e87.4.1793802012004; Wed, 04 Nov 2026
 06:20:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
In-Reply-To: <2026102218-vowel-plutonium-629e@gregkh>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Wed, 4 Nov 2026 15:20:00 +0100
X-Gm-Features: AclHuK_I0DmQgyoOW_ayNCdieQ-bUqhZ24CNIegOfCwJ565mihqQwxeJ6QVlwrY
Message-ID: <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_062015_560759_64FA3C60 
X-CRM114-Status: GOOD (  15.38  )
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

On Thu, Oct 22, 2026 at 3:31=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 22, 2026 at 10:29:24AM +0200, Martin Wetterwald wrote:
> > Hi Greg,
> > this is a regression introduced by aa125180c673 (via your tree) in
> > 6.19-rc1 and present in 6.19.y through 7.3.y. If the staging pull for
> > 7.4-rc1 has not been sent yet, could you take it there? Otherwise,
> > staging-linus would be great. Thanks!
>
> This is not a staging driver anymore, please route it through the proper
> tree after -rc1 is out.
>
> thanks,
>
> greg k-h

Hi Florian,
Now that -rc1 is out, could you take the patch?

I've checked 7.4-rc1 and I confirm the issue is still present.

Thanks!
Martin

