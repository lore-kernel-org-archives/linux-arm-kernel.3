Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF8EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hefcKfevFSAoEM61KtOENmpzPHMyrIir5nAPgdsgUUk=; b=YidF6JZ3I4EUyoFgGZi3tXlyqg
	lEyq0YaYqJepeNqK8GXG3TeRsk8hP+aO7OmjhQNjgiAHMit2Y74g6nJcxwaWNNMP/dwmiFHtsxO1S
	3HCKioOWFsFTDTe/0OpX6p8iGTyUHwGwnXhBm0t5B/gdwc6c3p9Qy3b5PLoEAqttlkuECAPg18jFK
	DNxfF1jZ9EsJvxXTLBDzwKhOErDkCtB1YcMx9SDeYlJQ8KPMkfxyocC9tADobKuYOm1xUxdRe+G6t
	EEwFEOHGq1TyHi29ralGq/yY9OOWM2cFxct3dOcXpyOHq2vyvkXQV+4XYjNnaiQA+8P/eLh9qlUnc
	4NhrpSjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZAb-00000006vKJ-4BvG;
	Mon, 09 Dec 2024 08:31:10 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZ9X-00000006v3X-0s98
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:30:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0EF3A402CA;
	Mon,  9 Dec 2024 08:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAC0C4CED1;
	Mon,  9 Dec 2024 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733733002;
	bh=hefcKfevFSAoEM61KtOENmpzPHMyrIir5nAPgdsgUUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L4qev80ZqVUxrGI/ByF3mlXqjOKaEr1fR9eE4OFZKnGQGbFBxFTdRXD/bo3oEqw3h
	 3szdQa5l8oF0epWqAgq2vhdoP/gahZ+jeZDGUyPAjs50bqP74JEdGz82qWiGdwa9NA
	 GL4gE/t9WU+AWxNr4zkHVEejbO8oTPCxl8H63ZlnknrUV4TXUbxnVfsHTRLm6A3Cne
	 RVHMU3DWI2di8PHY/T7uZLByn/jLyW+d7jkiWimsAoFzKD+67e9olj5WuGDX/opxr6
	 H5o0XX9z6ZSiB6EgaDaKVuYZfE1Jss+P/Gc92dj5cjgc/0YU1kkeUK2o/WeDpx4KVu
	 QACsk5uUYtg8w==
Date: Mon, 9 Dec 2024 09:29:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org, 
	kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org, 
	javierm@redhat.com, tzimmermann@suse.de, vincent.guittot@linaro.org, 
	ulf.hansson@linaro.org, arnd@arndb.de
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Message-ID: <faghtvhan6xmhoezeaocmdusxkmy4g3vrldzn7mlukbh33isr6@c27o6p7a6a6f>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <ce757b8e-4e6c-4ba9-9483-b57e6e230fdf@linaro.org>
 <vxqi23hxw7bmtfs5wk3u7szganpv5aa74b26xrvpmbehkltodw@dpum7zrxdz44>
 <2eedbbe1-6b4c-427b-a369-5b08dc27deaf@linaro.org>
 <0ba62a72-8247-447f-b710-234385a29d14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0ba62a72-8247-447f-b710-234385a29d14@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_003003_369793_EB261056 
X-CRM114-Status: GOOD (  24.38  )
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

On Sun, Dec 08, 2024 at 06:38:50PM +0200, Markuss Broks wrote:
>=20
> On 12/6/24 9:50 PM, Daniel Lezcano wrote:
> > On 12/6/24 14:28, Krzysztof Kozlowski wrote:
> > > On Fri, Dec 06, 2024 at 12:39:56AM +0100, Daniel Lezcano wrote:
> > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > +
> > > > > +config EXYNOS_ACPM_PROTOCOL
> > > > > +=C2=A0=C2=A0=C2=A0 tristate "Exynos Alive Clock and Power Manage=
r (ACPM)
> > > > > Message Protocol"
> > > >=20
> > > > Given the importance of this driver where a lot of PM services
> > > > rely on, does
> > > > it really make sense to allow it as a module ?
> > > >=20
> > > > Some PM services may be needed very early in the boot process
> > > >=20
> > >=20
> > > If it works as module e.g. on Android, it is beneficial. I think the
> > > platform was booting fine without it, at least to some shell, so I can
> > > imagine this can be loaded a bit later.
> >=20
> > Usually the firmware sets the frequency to the maximum in order to boot
> > the kernel as fast as possible. That may lead to thermal issues at boot
> > time where the thermal framework won't be able to kick in as some
> > components will depends on ACPM while the system stays at its highest
> > performance state.

I disagree with the first assumption: usually firmware selects high, but
safe frequency. Otherwise you would not be able to wait in bootloader
prompt.

> Also, as far as I understand, ACPM is used here as an interface to the PM=
IC,
> so every driver which would need power management from the main SoC PMIC
> would get deferred until the ACPM module has been loaded. This would make=
 it

It was an issue 10 years ago, not anymore. Drivers handle deferred
probe.

> impossible to e.g. initialize the UFS or the MMC card before initramfs.

Which is not a problem, because you are supposed to have initramfs. This
is preferred way. Being this a module does not force you to use it as a
module, e.g. if in your setup you do not have initramfs (although it is
unlikely for arm64 platforms...).

Best regards,
Krzysztof


