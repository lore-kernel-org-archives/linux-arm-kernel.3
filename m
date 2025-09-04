Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE09CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2b8f0HG/g1hoFjQFsW6ldfZjYHSPM9qpQZoCdYE2fI=; b=Fd+Djdof5+XtpXsX+CuvnfZvpE
	gG3Q97ukR4AmC0fJ8QemQzXXHv4CPhXpvLbgAZsYvOGZ9ICDYhOzol+nk/FVe7v1QtFBGFzdy/QVE
	QDTQTBE7XnvkeufAAzLnmAseBojPVJLir3Ac7gz/o7jhHa6WDpzJLRX6eWO7aJfcsf/oPc+SdUKih
	MsOx0Rqnp7Z9n7Iuf4HC9KExD0/fpQ4FnQHJABJWGOXDfHL2TRyGhRhMw9W02EjRiO95q9JCFzp4v
	JCLhgta3BXEvMrDIjRD8ZHy+pwZjluyS07bPJamtGZ7zZ6lOooQV2saRbzNz+TDNUeocUsAaM0bKP
	y88xPGxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEnB-0000000DeaO-3Jmk;
	Thu, 04 Sep 2025 18:34:41 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu99F-0000000Bagd-0rC1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 12:33:06 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1756989172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t2b8f0HG/g1hoFjQFsW6ldfZjYHSPM9qpQZoCdYE2fI=;
	b=pNDj5LQn02gwPbCkqTgYS6OnB71G069FSFeB8Zv8pa+rN1xBDdPLJF1mFYnXsMdxLyBWVZ
	fTwNrgjYreSARsOx7PSvZBYeSv1szZqCT7EtKiaOGP3dCRmlLKYCSARrk1IRnIrNCilDl/
	nxTDX//FzBW34b4q3DQbeKaLOlagL1WhJtKvQVrQ5hqhKoGinRm4xf9or7nQZAaHnInDSo
	GhiOA3qKdn93hAlejWcD9tsASqkNuoFHd0aQSFXbHO1HnkPn1lCeDDsFupe3nGpr8FJ0p9
	FTmo/FrDrr4FwN0+GVKaUiXgQEdKQ9Woi0TDiD8tKxTCsLnGiKLxKUqVQcKsPQ==
Content-Type: multipart/signed;
 boundary=3849e3abccc41c0afb77643d48c9c411b54c55e1791606530e9b10577404;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 04 Sep 2025 14:32:31 +0200
Message-Id: <DCK0O99SYSCF.BMBAEUV24C1G@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Ulf Hansson" <ulf.hansson@linaro.org>, "Sebin Francis"
 <sebin.francis@ti.com>, "Saravana Kannan" <saravanak@google.com>
Cc: "Stephen Boyd" <sboyd@kernel.org>, <linux-pm@vger.kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Michael Grzeschik"
 <m.grzeschik@pengutronix.de>, "Bjorn Andersson" <andersson@kernel.org>,
 "Abel Vesa" <abel.vesa@linaro.org>, "Peng Fan" <peng.fan@oss.nxp.com>,
 "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Johan Hovold"
 <johan@kernel.org>, "Maulik Shah" <maulik.shah@oss.qualcomm.com>, "Michal
 Simek" <michal.simek@amd.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Thierry Reding" <thierry.reding@gmail.com>, "Jonathan Hunter"
 <jonathanh@nvidia.com>, "Hiago De Franco" <hiago.franco@toradex.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, "Nicolas Frattaroli"
 <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support
 to genpd
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <97231ac9-5cde-49bf-931b-d5baf6d2d2d1@ti.com>
 <CAPDyKFr8AYuS2aEVs8X2As1NzXnbea4rPLKiF5=fKjq=PAeZgg@mail.gmail.com>
In-Reply-To: <CAPDyKFr8AYuS2aEVs8X2As1NzXnbea4rPLKiF5=fKjq=PAeZgg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_053305_535188_77E80EEF 
X-CRM114-Status: GOOD (  30.26  )
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

--3849e3abccc41c0afb77643d48c9c411b54c55e1791606530e9b10577404
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Sep 3, 2025 at 12:33 PM CEST, Ulf Hansson wrote:
> On Wed, 3 Sept 2025 at 09:39, Sebin Francis <sebin.francis@ti.com> wrote:
>> On 01/07/25 17:17, Ulf Hansson wrote:
>> >
>> > If a PM domain (genpd) is powered-on during boot, there is probably a =
good
>> > reason for it. Therefore it's known to be a bad idea to allow such gen=
pd to be
>> > powered-off before all of its consumer devices have been probed. This =
series
>> > intends to fix this problem.
>> >
>> > We have been discussing these issues at LKML and at various Linux-conf=
erences
>> > in the past. I have therefore tried to include the people I can recall=
 being
>> > involved, but I may have forgotten some (my apologies), feel free to l=
oop them
>> > in.
>> >
>> > Please help review and test!
>>
>> During testing on a TI platform, I observed new kernel warnings after
>> applying this patch series:
>>
>> ti_sci_pm_domains 44043000.system-controller:power-controller:
>> sync_state() pending due to fd00000.gpu
>>
>> These warnings occur when a device (in this case, the GPU) has no driver
>> bound to it. The fw_devlink_dev_sync_state[0] in the core has a check
>> before printing this warning. It checks whether the device driver has a
>> sync_state handler OR the device bus has a sync_state handler in the
>> dev_has_sync_state[1]. If both conditions are false,
>> fw_devlink_dev_sync_state[0] performs an early return before printing
>> the warning.
>>
>> Before this patch series, both handlers were absent for device driver
>> ti_sci_pm_domains and the device bus, so both conditions failed and no
>> warnings were printed.
>>
>> This patch series adds a sync_state handler for the bus, which now
>> satisfies the second condition. So it doesn't do an early return and
>> proceeds to print the warning.
>
> Thanks for the report and testing!
>
> Indeed this is the new and expected behaviour. I agree that it's
> certainly questionable if those prints should be at the warning level.
>
> We should probably downgrade those to dev_info(), at least. Let me
> send a patch to see what Saravana and others are thinking about it!

I want to report that I see similar warnings on Rock64 (rk3328):

[   16.868033] rockchip-pm-domain ff100000.syscon:power-controller: sync_st=
ate() pending due to ff300000.gpu
[   16.873637] rockchip-pm-domain ff100000.syscon:power-controller: sync_st=
ate() pending due to ff350000.video-codec
[   16.896495] rockchip-pm-domain ff100000.syscon:power-controller: sync_st=
ate() pending due to ff360000.video-codec

This is with a 6.17-rc3 kernel with various rkvdec patches and in dmesg
I later see msgs wrt ff300000.gpu (lima) and ff350000.video-codec
(hantro-vpu), but not ff360000.video-codec (rkvdec). Full dmesg:
https://paste.sr.ht/~diederik/951b54ea8422756e5efaa61d6bcefb575cfe28a4

But there were also USB issues (not sure why), so I rebooted and then I
did see msgs wrt rkvdec. Full dmesg:
https://paste.sr.ht/~diederik/156f65fc6be05d02484568dfd303c46ba76b3a8e

I also have a 6.17-rc4 kernel which is clean upstream, thus without any
media patches. This time no USB issues (also no USB device plugged in)
and I see msgs wrt lima and hantro-vpu, but not rkvdec. Full dmesg:
https://paste.sr.ht/~diederik/4affea034b0c9fb522a8ad5b90e8b59b4bd856ec

What's possibly relevant is that the 6.17-rc3+unreleased kernel also has
this patch added, which adds 'power-domain@RK3328_PD_GPU' to rk3328.dtsi
https://lore.kernel.org/linux-rockchip/20250830115135.3549305-1-christiansh=
ewitt@gmail.com/

I actually found this thread because I too couldn't find the commit ID
Nicolas referenced in this post:
https://lore.kernel.org/linux-rockchip/20250902-rk3576-lockup-regression-v1=
-1-c4a0c9daeb00@collabora.com/

I have no idea whether it's related though (I have no rk3576 device).

I haven't tried (yet) whether the sync_state() msg is also present on
other Rockchip based devices.

Cheers,
  Diederik

--3849e3abccc41c0afb77643d48c9c411b54c55e1791606530e9b10577404
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaLmG7AAKCRDXblvOeH7b
bmNxAP98YqXu31TFsZ7u3hLkIg/dojp3TfbfPSnZQ210fn86QAEA6SRKOyVWiXD5
4U+jLG4fAp2k3YuPI+j23ijX0Oum7QA=
=us0u
-----END PGP SIGNATURE-----

--3849e3abccc41c0afb77643d48c9c411b54c55e1791606530e9b10577404--

