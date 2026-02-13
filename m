Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F6AEDF173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLc8bSL3pOampOTk05CBLNSg0vQLHPlJB9I/Kmo5iOY=; b=VaBVinowceY/tAI1DLdImeIPfN
	q1jPTbRCEOdOZyNEU84fQF0xf9maPIuiM0Zl2069Aj4CEWBytk+QAfImGUqNRqLPGspG4ttH5HkWH
	GYjy//ltl3cNw5WJlz7hgkoYoI3fRY4Z2jDum/3I3fQAsJdztPVXNuDqufq4ZvEsgZeC79IDuzEJY
	yJf7EwKRYeDdgOIrphF7MA8dUzOYqzW9lSExSsOpg7rz2w6yGsQmJ5OdHMbuqNykPNCqUL+mDmP4o
	fV+KJZwhqCFzHrbDIvPwK0vDWTTJfgcUCNauAZ6B7b2/vOpSU3cT7Kj5UzdQrzXd0AOxSVMBQ65sA
	3ktd2UsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvU6-00000003d0P-1Qyv;
	Fri, 13 Feb 2026 15:53:34 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqvU4-00000003czv-11Xp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 15:53:33 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59e5eaa491cso1299128e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 07:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770998009; x=1771602809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLc8bSL3pOampOTk05CBLNSg0vQLHPlJB9I/Kmo5iOY=;
        b=Wm/KINNY9I9fG6PjTjUPZTptYmaU71Y0/qLz5NZwzOVUeG4n1+e3xZGx/R0Y8rCsV/
         GYm38eu+u9XT3Ai4SG2hrRhVRlfbowY495/Ue3x1PxinVZsDKeZWaLuwmrqdiv8xF3NA
         MjqPBoxa8Q505s/VRRN/fKz3EmHx7G0O6Wn0a5gXxqdWWRsebe88NvDtCi2P1VatrfKu
         f1bgvgI3+eHTZxJrxNgyDdOfEMttUSIIiLYKPdOFufScW5L43dkkohn60HPEM5F5hlgI
         pcQId2eqkNLlabmff74FilCqIdQFmGLYidjrtR29bz6pdBpK7GtfbIFb+dGU4C2AbsPj
         YXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770998009; x=1771602809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLc8bSL3pOampOTk05CBLNSg0vQLHPlJB9I/Kmo5iOY=;
        b=uVDU5SPsZEcv5MD9Ee6xxlgm7/9qx6Q2WeYk2UtMTWHlUUOwUVqjD5QhgNhJnK36Fi
         ++oPTe2IvD3Fd+FJm1ZO98kblmPIghHhvvUkSjParmwyJupWLhxiVRV+oLaYimDao52c
         fAH4SWJ4c16yGzpjfuTnSB5LaWMiSjblsnjKlRKsvrjp8UDEuEaEln1Vxshd+fYSZvne
         HLC4ifDFNOzmwto11MaN+p24UDu7LweMP93xEjzA5FBL5TAMJryZw0N+VQF75bNtMcsi
         979C/6wi762kz8wO/MyoHYfddFD+cMc2+u+xpsolGfl0y/SdOHoLKxRpAaymrYYy2tUC
         8l4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOQRrQxx9Nowf9HHNTIabrC58+NqdsJAoewrKLa80qWISDcIFryuNCiwy7isD1SeSCfAJ+tmY1mFzQp2SP1US0@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7YGvDcsx78ZJiOmHJmdJG4sQ0/bTfPzLmAm/KXuKeLpGHfy/Y
	pJEHY5gfwYDEvwqGj9wi2hp07CFPkpiBrVuJMCm2f4ZeP6ZFKip1GKQ9
X-Gm-Gg: AZuq6aIMu475+I1G2X1tZ0vu4FqcDSfcSqj86HamCWAm084xrMgfaSMC5X8lB1kRFsH
	dNoC4zhnHW7iiwYveShhsJObRJQhjzGcCr4BtF1+JP/zcmL/2/LHIg54+dLkDUYEp4lrTlirfj0
	rjUQ2CeAhLMIfC2ylwa1llj/7ZVE8467Z59LmqJI/GO5on6BFV4TrqkDplgSFtPks2reQjnSLnx
	889YE1/vYY2oGs9mpa2GHgk0sw0dy7YV5uv386oX9rAcRv1ItijFNIhMCN7BPT8QfQP6npoF9JM
	vyjFPyw43u9LaSvzkz2VvVMeux6pDwU7RUWALhemVA8jAMOKSWRGfiIgCd5FPMiSf0JZ3PkaTEJ
	Dd+Vzht4PsxrLJVoE4tgyx/tLedSlevxetCkT4O5Ug3J0C2ifrIMDcKcHniTSm0N085hFEAsm9p
	sOypGLvwUgxqNu4KRxhL/ajI+X2ColEh4aE1K47yxsQ2HDi4Ym/M602dhjb6HZ
X-Received: by 2002:a05:6512:39c6:b0:59f:6c3b:6d2a with SMTP id 2adb3069b0e04-59f6c3b6f6fmr333275e87.25.1770998009086;
        Fri, 13 Feb 2026 07:53:29 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f568dcfsm1666675e87.28.2026.02.13.07.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:53:28 -0800 (PST)
Date: Fri, 13 Feb 2026 16:53:26 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aY9I9r8Q82HrxEZM@gmail.com>
References: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
 <20260128-i2c-mux-v4-2-dee49ce276c0@gmail.com>
 <2ecbebd8-0842-34fa-a593-25168c91aa6b@axentia.se>
 <aY5KeH3Z1S3MswHI@gmail.com>
 <f38230f2-f74b-cf89-8d15-194d85f341df@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jvosexET//3GfWY0"
Content-Disposition: inline
In-Reply-To: <f38230f2-f74b-cf89-8d15-194d85f341df@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_075332_374601_8900B673 
X-CRM114-Status: GOOD (  31.79  )
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


--jvosexET//3GfWY0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On Fri, Feb 13, 2026 at 12:37:29PM +0100, Peter Rosin wrote:
> Hi!
>=20
> 2026-02-12 at 22:47, Marcus Folkesson wrote:
> >>> +static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id)
> >=20

[...]

> > Consider the following chain:
> > Root - P1 - M1 - M2 - P2 - D1
> >=20
> > P - Parent locked
> > M - Mux locked
> > D - Device
> >=20
> > In this case we need to lock both M1 and M2, not just M2 ?
> > I'm not completely sure though, I need to refresh myself on the code
> > base.
>=20
> No, that should not be needed. The reason is that when you initiate a
> xfer for D1 the following happens (xfer is a locked transfer, __xfer
> is unlocked):
>=20
> - xfer using P2
>  - lock(P2, I2C_LOCK_SEGMENT)
>   + take mux_lock for P2->parent =3D=3D M2
>   + P2 is parent-locked -> recurse to P2->parent =3D=3D M2
>    + lock(M2, I2C_LOCK_SEGMENT)
>     + take mux_lock for M2->parent =3D=3D M1
>     + M2 is mux-locked -> no recursion
>  - ***** (see below)
>  - P2->select (commonly __xfer using M2, elided here)
>  - __xfer using M2 (unlocked since P2 is parent-locked)
>   - =A7=A7=A7=A7=A7 (see below)
>   - M2->select (commonly xfer using M1, elided here)
>   - locked xfer using M1 (locked since M2 is mux-locked)
>    - lock(M1, I2C_LOCK_SEGMENT)
>     + take mux_lock for M1->parent =3D=3D P1
>     + M1 is mux-locked -> no recursion
>    - M1->select (commonly xfer using P1, elided here)
>    - xfer using P1 (locked since M1 is mux-locked)
>     - lock(P1, I2C_LOCK_SEGMENT)
>      + take mux_lock for P1->parent =3D=3D Root
>      + P1 is parent-locked -> recurse to P1->parent =3D=3D Root
>       + lock(Root, I2C_LOCK_SEGMENT)
>        + take bus_lock for Root
>        + Root is Root -> no recursion
>     - P1->select (commonly __xfer using Root, elided here)
>=20
>     - __xfer using Root (unlocked since P1 is parent-locked)
>=20
>     - P1->deselect (commonly __xfer using Root, elided here)
>     - unlock(P1, I2C_LOCK_SEGMENT)
>      + P1 is parent-locked -> recurse to P1->parent =3D=3D Root
>       + unlock(Root, I2C_LOCK_SEGMENT)
>        + Root is Root -> no recursion
>        + release bus_lock for Root
>      + release mux_lock for P1->parent =3D=3D Root
>    - M1->deselect (commonly xfer using P1, elided here)
>    - unlock(M1, I2C_LOCK_SEGMENT)
>     + M1 is mux-locked -> no recursion
>     + release mux_unlock for M1->parent =3D=3D P1
>   - M2->deselect (commonly xfer using M1, elided here)
>  - P2->deselect (commonly __xfer using M2, elided here)
>  - unlock(P2, I2C_LOCK_SEGMENT)
>   + P2 is parent-locked -> recurse to P2->parent =3D=3D M2
>    + unlock(M2, I2C_LOCK_SEGMENT)
>     + M2 is mux-locked -> no recursion
>     + release mux_lock for M2->parent =3D=3D P2
>   + release mux_lock for P2->parent =3D=3D M2
>=20
> (Phhew, I wonder how many typos are in there...)
>=20
> So, between the steps lock(P2,...) and P2->select (at the ***** mark,
> which is where you add set_clk_freq), what you need to lock is M1,
> i.e. the parent of the first ancestor that is not mux-locked. When
> you lock with I2C_LOCK_ROOT_ADAPTER, this happens:
>=20
>  - lock(M1, I2C_LOCK_ROOT_ADAPTER)
>   + take mux_lock for M1->parent =3D=3D P1
>   + recures to M1->parent =3D=3D P1
>    + lock(P1, I2C_LOCK_ROOT_ADAPTER)
>     + take mux_lock for P1->parent =3D=3D Root
>     + recurse to P1->parent =3D=3D Root
>      + lock(Root, I2C_LOCK_ROOT_ADAPTER)
>       + take bus_lock for Root
>       + Root is Root -> no recursion
>  - Root->set_clk_freq                  <<<< the new thing
>  - unlock(M1, I2C_LOCK_ROOT_ADAPTER)
>   + recurse to M1->parent =3D=3D P1
>    + unlock(P1, I2C_LOCK_ROOT_ADAPTER)
>     + recurse to P1->parent =3D=3D Root
>      + unlock(Root, I2C_LOCK_ROOT_ADAPTER)
>       + Root is Root, no recursion
>       + release bus_lock for Root
>     + release mux_lock for P1->parent =3D=3D Root
>   + release mux_lock for M1->parent =3D=3D P1

Thanks for the explaination, that makes it much clearer!
>=20
> However, spelling that out makes it clearer that Root->set_clk_freq
> will be inserted in more places in the "call tree". It will be added
> before every ->select call, e.g. at =A7=A7=A7=A7=A7. Since any of these
> additional set_clk_freq calls happen after the one at *****, they will
> take precedence and ruin the whole thing if any of them should request
> an intermediate frequency (1MHz at Root, 400kHz for any intermediate
> mux and 100kHz for D1, for example).
>=20
> I don't immediately see how to reverse that such that the set_clk_freq
> for the top-most level happens closest to the xfer on the root
> adapter.

I've now experimented a bit and think I've landed on this solution:

- i2c_mux_select_chan() will only lower the root bus frequency, this to
  ensure that no intermediate mux will be able to change the frequency
  (all muxes in the middle must have a higher frequency).
- i2c_mux select_chan() store the original bus frequency
- i2c_mux_deselect_chan() will restore the original bus frequency


Something like this:

static int i2c_mux_select_chan(struct i2c_adapter *adap, u32 chan_id, u32 *=
oldclock)
{
	if (priv->adap.clock_hz && priv->adap.clock_hz < parent->clock_hz) {
		*oldclock =3D root->clock_hz;
		i2c_adapter_set_clk_freq(root, priv->adap.clock_hz);
    }
}

static void i2c_mux_deselect_chan(struct i2c_adapter *adap, u32 chan_id, u3=
2 oldclock)
{
	if (oldclock && oldclock !=3D priv->adap.clock_hz) {
		i2c_adapter_set_clk_freq(root, oldclock);
    }
}

static int __i2c_mux_master_xfer(struct i2c_adapter *adap,
				 struct i2c_msg msgs[], int num)
{
	u32 oldclock =3D 0;

	ret =3D i2c_mux_select_chan(adap, priv->chan_id, &oldclock);
    __i2c_transfer(parent, msgs, num);
	i2c_mux_deselect_chan(adap, priv->chan_id, oldclock);
}

I will do more testing during the weekend.
I now have a virtual i2c bus with virtual mux drivers and virtual
devices so that I can setup different combinations to test with.=20

>=20
> Cheers,
> Peter

Best regards,
Marcus Folkesson

--jvosexET//3GfWY0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmPSPEACgkQiIBOb1ld
UjL9nhAAoWXpn7BR5ktipf8OeHDmccv+zlZeihJJjvfLz+woIz3DjpZlBicZIJB2
/3SDKjT5jLJYgynI9uRRw3LH/Nte8DYaZ+IvvZ8c1cRlHVAAaaOFr5ffjLZafMSP
GUWtop0BmIcfiwvLPCCeKvqnZNPmxM/XzpcXnOkf1llOU2hlpHLV4rPr5F5fJ94Q
P4ViEjceKPli6D/17JmQdcYh7SRm5bsmJ/rj9vfJbVLsVecWgElx645k5KLMTeGI
9U744hb2eHfc2fupF00VJhRIDH/cOLI2Yo9me1LvZB2qB+9qmVLTjMzOPJF36rPK
LRE9Ei/L9jAivUryEOy4GVUFYkpixQ9YIcvVtn+tXUPpWRoY/aC7C8EuIL7mkDiV
IYEcZCqL8se8FLze3KQNq07SUuodmBMFG9pJWUsZt8dvDxirDYIsJ9wgxpiQT8zI
Er2VzjQpccC5DkG54wrC392KrLWp2V30g41Lg/DtbzXZ87XNRcjDqDajvDoVbq1I
P2dNSpWPXeeV3G4+g5i1VmFaulnV0mCt/2XqMQd5TiIasydH6ns9ftexaXVNWPhW
XA0W2ZuSiR1DKERm60A1vu+rW2O3Cx6BWdn5UHN31byBnqWbe+1VqFJtZXb1qcEK
K+EpMQ0tXCQLHFiU7N1eKd6uMZbLNDezoylr/Md3PzZWR+eRnew=
=I/TP
-----END PGP SIGNATURE-----

--jvosexET//3GfWY0--

