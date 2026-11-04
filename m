Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6865606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lHQr2N9m;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DHiLWvjh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=; b=lHQr2N9mEjrug+
	EgP154lGBW6c9tc3kj+yag/BciA1JjFSf2w2p34adyZNEtfzHj42HBQoGDSJhTecAGvYq25RA4kwp
	YJbZMWtHP9WvPsr9amvLoG57/u+dVuz6s1eG2UqpiUZY9XZu+V3IU8yKGQKXj1hJFXzgsEIPtGegn
	UZ7fw7Dplb1q+drwIKjdMrORQbFxehD67PLYzxNQEoKOLMw8edqNsFp+sUCR8GE5/ZePKyvNpWVI+
	6FmCp2ZDNWaoRzkWU2J2YUXKtAcOlCahhchnqTVhGpOcpJnBMTEwsr7wGPIsE3RSggaLpWmUyz5Wa
	779/1YFJibh+uB2lHddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdrb-00000005yrx-2Mjd;
	Wed, 04 Nov 2026 16:29:27 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdrZ-00000005yqC-2Vs0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:29:26 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-679e86015e2so2144693d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793809764; cv=none;
        d=google.com; s=arc-20260327;
        b=iSXOXo85QySAA3CU3f4VeA+HUfWgL06LRcAVLk0Ccwc8jCk3+godQX/jWD9NVKaPsD
         xOffgj6Y2CscR9WmbHFNSI5UuZ1UjnV9wyo/ncCVy/fkhBDkTcx3+TPfwveAJqmT19rD
         +0U2NheOgCsw2mIEGuzHOUuHYwOqyNw+e0ySajPfLTfa2TYpt6IPHZz6A06Fmdn6Ozrp
         FqTSW8zn/6Y8kGVkOHsIsRd7UNJaEuvgacdMe1tVlQrrX1bOMCEv0sxU6PUImRmT9t2D
         K4sG7wYQp8doXAXYtrSAELiQKmzVUDOK48+Nea9vEYkQHGYzVNk/dbdzKu2HpQm3Vs3A
         4MHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        fh=zCkO1tl2Cw2CT9tUQ7HhqUp33YdW2FtBJqDRLffcY+c=;
        b=LwwjRsai+dZNAAq6xS6OZJ3CyPdPVF5bvyMKhj8PNcuqrbPiTxdH0jrNEHJtUYgNw5
         bjb+IVk03zaZ2heQfHBcFQxdj1NiXXudQesyhEdE8wia46ASKCzss8mQ0/84dtGkKvVE
         LEeHQck26czxIifFZ61xbPZP8OiYysYcvNpunD2ffhtl0XEsIXov2h8gZQrhOHifmqEM
         2wl5iDqCfNXXaWsuiiU5jKQ3v4pTENcBgzV4O4m8Jl3d52wNmhJU17umYsuG4GAGT/Vg
         FPJe+J6Vp52xE/ZjwDpCnPRHxZM+3KZs3lhjm6VikdLDzb/eV47vxX815/yoYSRFiPEN
         pIqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793809764; x=1794414564; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        b=DHiLWvjhVdZ/a/8Mt7zo5ESPyniKhwZU0fVcsJX0Zb01N1ZyCaet8gvNfRsySNqOSq
         cqxfDRrqR5LSwQth5WsfC3O29ID3Si6+ThLZZn6+Mp2/BxYx0leprmfVONU4p1CpwXTv
         EpCcgofU+PSFfSvApX6C0fZqJdzM/AsspQ6wif9oaaXFmFOnM9OlVPZVghQ8vXGR6VmN
         8I2Qf5Xc0qlXAC71hyXYaIkmbF10yGXwHczCpHRs9NhDM/3PUhrS+9K+8qN+NvNVu49q
         Genz9w7rLojydoeaZGQmLJlGUUQHavmv2L1JX2FVRDgnA6yPp8JD9wF+qTs1SZa1n5tN
         pt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809764; x=1794414564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m4qzkUPaTb2whrGmY/+Op6+Vx//rob+Ce4Qzd/Bakc0=;
        b=TVMiqSOxKtknlyX5CW12R4n7d8SLPVDaKcM2d1iP19DiRYspVS+VaUc/SlHQl5V9Hj
         e3432MM3frDHmEFgc1862qyPUd6aOtx7lZPuXxl7CXj3v7HLYrUk/DAmSJKMZtc3A+ar
         brsGYZAKaHS74eWko4SEJ/2KTCL29agoD/5FwMPq1rp8igUFicfT8DW88/7otMUgGs0H
         7ny0VsvNB13qdqVJ9/c7kmW4/8xo1+m15tNJR5cQBrJpQqGNtpsugxL5ZMVKYwqZ54WI
         bDmMOLVbDZM3BiGqgwrhehlpHnhiRF+L50rcN/b1+I5D9A2RZY8KCo3SCG8k/L8X4WCW
         XXcA==
X-Forwarded-Encrypted: i=1; AKwUvBzL4c5WeKlXQsb/Ma3R7K1s3Q2wgi3wn0t+kwjnun4Jl3D8pxHk/QRrVz+/DXwoA5UtVPOSGze77FRkXCJ3Vxjs@lists.infradead.org
X-Gm-Message-State: APuU4Z9y1UixHIDsogUzS3HNaaXRgIIjWKZARWzLzUJRbwHCBJ5MKM8b
	m5ZJu7UkNE6YYXZ34xL3JpnLnIOblQT4jhIChn3CUkZUNsdK/wHbdPsP6NwFB56V0KwuDnbMYCN
	XJTNW2nAMtV5OrrfPLxwNyl1yMjaYAEQ=
X-Gm-Gg: AYBFou1c2oUE4iL+2ZUw2a47hugo9MgmH/IOeIftIkkTVk7xkRYUhe1uLSRqNkApN50
	jd/qq58jese+tVXDUjny+yE0G+MSb+1n1jK9EVYB+PVxNqie4eaKoYB5wm2L6plXmNCRbm1Fxtg
	sZ9s9UqX6TF0dK8xK7bC/txw3xbW0ITwa4BNhmCd2HuIhRgysP5QnqX4zGCRAIYDr/fufY961O5
	eigTvhfzt0vxSKSb5fosa/kyFi09jG9bmbCrMKCJkmzfPJEAQU4zp41jlH9xs7rgG5uwEDWh+Bp
	eveFntK4qf7DhwJqF99lZKRr0b2IMDvo06Tx0YiIYOQibVoQ0apGuJAcZGChJKkKoGHYcE7oyum
	G+J0ZNqPaByYkUn8s/AEr3bm4b6GWx9tp5QL5XwwY/O4bUdO1ES0civ9gWT64aCMSOFtk5W4wYG
	Lu2pU3nAxTNE4gp3NBo00cAbavVZix4d3YaaZKLyJsxcZvmMbBpiLkapfohg==
X-Received: by 2002:a05:690e:80b:10b0:67c:18:cc8d with SMTP id
 956f58d0204a3-67c030026e0mr23243d50.0.1793809764215; Wed, 04 Nov 2026
 08:29:24 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261104151601.70493-1-dev@deq.rocks> <20261104151601.70493-3-dev@deq.rocks>
 <CABBYNZLMVso40XpULwTwBwAE4tpXndSJMKhmoVLrmgm+unBNCA@mail.gmail.com> <20261104164647.5e9351cb@kait2en-mbp15-1>
In-Reply-To: <20261104164647.5e9351cb@kait2en-mbp15-1>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 4 Nov 2026 11:29:11 -0500
X-Gm-Features: AclHuK8doVEFo6j2Fi68c-P_EfTM3lCyF-M5HVrIdSqvITfMTgBypxfl_seEBVY
Message-ID: <CABBYNZLwMW68WYBVp=-R=4Mji+-Q5AEtrcu5F_7rRYju8d-XNA@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: btbcm: clear vendor bits in LE advertising
 report types
To: =?UTF-8?Q?Andr=C3=A9_Eikmeyer?= <dev@deq.rocks>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	66ton99@gmail.com, josemiguelo.ochoa@gmail.com, aditya.garg@linux.dev, 
	Yossef Osman <Yossef.Osman@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_082925_661386_28826829 
X-CRM114-Status: GOOD (  21.18  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

On Wed, Nov 4, 2026 at 10:46=E2=80=AFAM Andr=C3=A9 Eikmeyer <dev@deq.rocks>=
 wrote:
>
> On Wed, 4 Nov 2026 10:24:47 -0500
> Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:
>
> > I don't think I agree with this being cleaner then doing at
> > hci_event.though; not only is it more code but it also walks the
> > packet which is inefficient and may have security implications as
> > well.
>
> You are right, the driver should not parse the event a second time.
>
> What I would like to keep is limiting the mask to the controllers that
> set these bits, as hci_bcm4377 already does with
> HCI_QUIRK_FIXUP_LE_EXT_ADV_REPORT_PHY:
>
> - add HCI_QUIRK_FIXUP_LE_ADV_REPORT_TYPE
> - set it in hci_bcm on Apple machines and in hci_bcm4377
> - test the quirk in hci_le_adv_report_evt() instead of the
>   manufacturer, keeping the mask from 88397423671f
>
> That drops patch 2 and replaces the revert in patch 3. Would that work
> for you? Then I would send a v2 along these lines, with patch 1 and 4
> unchanged.

Yes that would work. That said, I don't think it is worth adding a
quirk for this. Masking the reserved bits shouldn't cause any side
effects afaik, well except if those bits are later adopted by
Bluetooth SIG. Then these controllers would become
non-compliant=E2=80=94though they already are, as the bits are reserved and
not in use. In that case we would probably require a quirk to avoid a
conflict. So, is that what you are trying to fix?


--=20
Luiz Augusto von Dentz

