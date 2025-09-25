Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF35CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 17:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IB9yQNRgVuz8m2m/oI2qa6ls/IWIUCOFdQtE6J/rfIA=; b=LMD0njGlgsOXN1B5gOA/Cc37x4
	9WVuPd91NyMpj4oC4G/VRUGFHr5WIOE6ND9qxckWArtW2sHUIca8wzWN5HP0XsVqMhT4bQ4nT4hX1
	yxBIFjcL2kP+dA3/lYISfIFm2BBMyp6I9FY7rYu35cU8aQfvBlrDKdhbX6M4PYYWu7xShZdTjU+gV
	uMqm0qMp4h02G/feRTcTPkU2dnOpg31mGQSAcsBVulwZjS1ijCEnu5htvqJzMJAxZrLtA/UtuSrjS
	wL6kysJNxbKCeFsqeX35IHY9bo18KNGoxnvcLu1hhXrCagKGfYd/m11zAeX4gLYlWueMvdK3z7C2T
	6M6IRTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1q8y-0000000Bi5Z-1Bio;
	Thu, 25 Sep 2025 17:52:36 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1q8v-0000000Bi2M-0oZr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 17:52:34 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758822747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IB9yQNRgVuz8m2m/oI2qa6ls/IWIUCOFdQtE6J/rfIA=;
	b=EMq1VUNsJcP9snVahb7nKoWpXIaDE41gqDWsbAG4yWY8Rnu1rMo2FDoiKi/9dfZarIh/+m
	LL+7sHuW/hw2dFQgEiTMq8vIfTKXyby5P9trym8R8wVkzGXGV+/2ggIAG+J8T2nqPOeWCx
	I9ulU++zscOBm+xM54yiJckom9/K9rvw6go4Wjs40pw0Q66AUVt3DsUEhXU5UnpNatT2sH
	qew11Tjar4NMmOBj2Ro8RcgCmPRTE9RYc+st28XVeUMh4kruDtkgh0Xjzs/qFt1sWHCd8Z
	zDJY9AO0tox9pwPXH+P2KTHVOaFxbGFCWZyv0V/fjzMbVfcJrR+53XJ2McAOEg==
Content-Type: multipart/signed;
 boundary=a357dd026792ca33492dc6fb0c6b8bf0ccfe6b9c80285818675682e9f5be;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 25 Sep 2025 19:52:11 +0200
Message-Id: <DD22MGF3HNLM.Q7S70RX4NZXS@cknow.org>
Cc: "Saravana Kannan" <saravanak@google.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-pm@vger.kernel.org>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 "Sebin Francis" <sebin.francis@ti.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Jon Hunter" <jonathanh@nvidia.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] driver core: fw_devlink: Don't warn in
 fw_devlink_dev_sync_state()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
References: <20250925115924.188257-1-ulf.hansson@linaro.org>
 <DD1XOHE6P5OC.2JUQRAGAE1KTU@cknow.org>
 <CAPDyKFrKP2bdpKTHzqDdhEpRAjYu+PFd2Bst=-WPddByxcAX_w@mail.gmail.com>
In-Reply-To: <CAPDyKFrKP2bdpKTHzqDdhEpRAjYu+PFd2Bst=-WPddByxcAX_w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_105233_789364_F95BD699 
X-CRM114-Status: GOOD (  21.01  )
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

--a357dd026792ca33492dc6fb0c6b8bf0ccfe6b9c80285818675682e9f5be
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 25, 2025 at 4:26 PM CEST, Ulf Hansson wrote:
> On Thu, 25 Sept 2025 at 15:59, Diederik de Haas <didi.debian@cknow.org> w=
rote:
>> On Thu Sep 25, 2025 at 1:59 PM CEST, Ulf Hansson wrote:
>> > Due to the wider deployment of the ->sync_state() support, for PM doma=
ins
>> > for example, we are receiving reports about the messages that are bein=
g
>> > logged in fw_devlink_dev_sync_state(). In particular as they are at th=
e
>> > warning level, which doesn't seem correct.
>> >
>> > Even if it certainly is useful to know that the ->sync_state() conditi=
on
>> > could not be met, there may be nothing wrong with it. For example, a d=
river
>> > may be built as module and are still waiting to be initialized/probed.
>>
>> "there may be nothing wrong with it" doesn't sound very convincing.
>> So there *can* be something wrong with it, so warning sounds
>> appropriate? If there is (certainly) something wrong with it, I expect
>> an error.
>
> Sorry if I was too vague. See more below.
>
>> FWIW: most of my drivers/modules are built as modules.
>> I do seem to run into 'problems' more then average because of that, but
>> to me it just signals there is something wrong ... which should be
>> fixed. Not silenced.
>
> Well, why is it wrong to have drivers being built as modules? They

Nothing wrong with it at all. It just means I notice issues (like [1])
that others may not who have modules built-in.

[1] a52dffaa46c2 ("drm/rockchip: vop2: make vp registers nonvolatile")

> just happen to be probed at some point later, then why should we have
> warnings printed in the log due to this?

I thought the failure of the check was more important then it apparently
is. Then warning about it does seem excessive.

Cheers,
  Diederik

--a357dd026792ca33492dc6fb0c6b8bf0ccfe6b9c80285818675682e9f5be
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaNWBUwAKCRDXblvOeH7b
bhxxAQCeedjuz7MzbGyk41Q/ap7bH+8LHheMRHyOxpn9SezY7AD+KZApBH0xFnE/
3+O2yoRG+dre2ZIK4DMmnaaZXvwd8QM=
=3Rfs
-----END PGP SIGNATURE-----

--a357dd026792ca33492dc6fb0c6b8bf0ccfe6b9c80285818675682e9f5be--

