Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40846C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUgmY8UQBPmXjpgnbV7bnU9250T2nRGJ8VnxW9xV2ZY=; b=3me73fMjOu6eLoszeCWwSHu3mG
	ATI/Hk7jDoQ4AO8Dcmhbr5WC/fW7Bux/PSdeihE7BhuT3cPgQA96zS0Oej0gLNhWgas3AwNXVWTyb
	7gsg9KWsaUV8rZTlnepJYhy8JJLJZX2dSctSZ+tpohx2BqnqRHbbLpZJ79MNrW0sY1GmGMAO3/K8k
	1TSrBNB1cZjj0wrlotHbilCuAHXy9lCibR6M84hcFm4oBHMeENxHy+Mp9nzH4PjQzOShOQVFaiBBk
	AE7qbkTQT/Is17oxVjqfH559bHmiWUCgmpjfl9WLCuJXXsjTaQp5VdqiuHTGvvA2PwZRutsKPet3q
	hVaQ7WIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ifC-0000000C7Jf-0vqf;
	Fri, 04 Apr 2025 15:08:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0idS-0000000C6uK-0Xkz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 15:07:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10A8C61137;
	Fri,  4 Apr 2025 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93ED5C4CEDD;
	Fri,  4 Apr 2025 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743779229;
	bh=PApck01QYV/Gm3ye6uMvwA27Rqmi2H7xw7efZ8WzdfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIVwUz30QNkraC8Xbe2q5/YV+CRnzJXgiz5dfbAw/VNjgtceqvuhvaQfe/3Tu4/7W
	 7NX6rriinaFRtTk+uq5VcbmM8sd1ZYAHSt1dceBtZZxK+II7I1aeSAfrJvHW4Rapff
	 l13UNnkHR4aV+DryGxG2GXlzocwwzL/FSakfnwayYbDyhbOWqHk+PEos94TiVntBLj
	 fZPblxb4W1XZFj4wYrCL6eth6KPYjbhde+GGVPqNxZ+Zkj2D8TVOfrfxJduZZFd6Da
	 imfLRsiyftRIRtblv2qnh00VdRN/gg+jo1j/TngHM2gNDqKOVA3gl8ZyheRm7AybpZ
	 7e93sDPzqX4EA==
Date: Fri, 4 Apr 2025 17:07:06 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: lee@kernel.org, alexandre.torgue@foss.st.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jic23@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, 
	robh@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	devicetree@vger.kernel.org, wbg@kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, olivier.moysan@foss.st.com
Subject: Re: [PATCH v4 5/8] pwm: stm32-lp: add support for stm32mp25
Message-ID: <biwwcmsjatsmjdsgeiz27rfukeidkz64nfxdtdajpfp7ace4j7@5d5b5mvfoy43>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-6-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sewg2xfq5x3bxnf"
Content-Disposition: inline
In-Reply-To: <20250314171451.3497789-6-fabrice.gasnier@foss.st.com>
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


--5sewg2xfq5x3bxnf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 5/8] pwm: stm32-lp: add support for stm32mp25
MIME-Version: 1.0

Hello,

On Fri, Mar 14, 2025 at 06:14:48PM +0100, Fabrice Gasnier wrote:
> Add support for STM32MP25 SoC. A new compatible has been added to the
> dt-bindings. It represents handle new features, registers and bits
> diversity.
> It isn't used currently in the driver, as matching is done by retrieving
> MFD parent data.
>=20
> New dedicated capture/compare channels has been added: e.g. a new compare
> register for channel 2. Some controls (polarity / cc channel enable) are
> handled in CCMR register on this new variant (instead of wavepol bit).
>=20
> So, Low-power timer can now have up to two PWM outputs. Use device data
> from the MFD parent to configure the number of PWM channels e.g. 'npwm'.
>=20
> Update current get_state() and apply() ops to support either:
> - one PWM channel (as on older revision, or LPTIM5 on STM32MP25)
> - two PWM channels (e.g. LPTIM1/2/3/4 on STM32MP25 that has the full
>   feature set)
> Introduce new routines to manage common prescaler, reload register and
> global enable bit.
>=20
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

I didn't do an in-depth review, but the patch looks fine to me.
It's ok for me if Lee picks this up for v6.16-rc1, so:

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org>

Best regards
Uwe

--5sewg2xfq5x3bxnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfv9ZcACgkQj4D7WH0S
/k53Pwf/Zw3MFYpS7c/OdBkw9qirsB7YS6C3Y3MBc/vAYhYrhcxBpVevHbyFLsyW
yLhfba05+l6U2GOdtWltJUqVwzdVX8kt7J61y1jtQnRDTAExxJDwjTH+rfKSv7wO
3ZtQ9/BEO41/8sLLrZ8/eBxhG2SYgK4xBi46yR/b0Hx0/hGGPW82036L/xjxR3Cp
N5+q3kjLaDYxUIBGy/dJ5N500yM1fizFEK+ejjfR18yhcYR3bWXLoMGHsXSChnZw
3GnD89vE8w1ciehkBpbUWvjBXlFj0Qs+AUQmLAOBENriiX1OoH6+LI+qW9kqlef8
58L7lQyOAj2g1DyQ0B20iXRaCCxtCg==
=lIiW
-----END PGP SIGNATURE-----

--5sewg2xfq5x3bxnf--

