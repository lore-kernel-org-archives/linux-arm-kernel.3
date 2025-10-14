Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FBACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCohG/Y/vn47OyyqdNFIC8e2DykRzRGIMwtADytc7xM=; b=yeWHKUhEgRFhbTrabEo+XhFtJG
	xfcHYi+xi6B7xU43qCGCv7MC/8U/mTSjCMXj2m9KMEuZZLgceaDWK6ej6HtnRlVx8RdRsvBScU1CR
	/+6OPm0ylNrCIT60JJuwK9pNBeQt2+Zm/ueQUi4mPEd10u+bah9asQl1fsRu7p9r0LYnNvnAew1sL
	6SpM2sW5eK3B+VuFSBTjEQycdLWtH2TNAsTOmkuRhgwnlrSArwJS6wwor98FYxgWm2Av86bCx9C9O
	J0s3T6dwV4p2szC+N7x75rIoBPv7c6aqote6PxozyIo8hdZSk4kM66kmDT/h9SQT+evIDJo7FebI2
	MAuoBOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fSJ-0000000GXGG-0i5O;
	Tue, 14 Oct 2025 13:52:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fSG-0000000GXFr-0hkv;
	Tue, 14 Oct 2025 13:52:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B96D7405D3;
	Tue, 14 Oct 2025 13:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2079DC113D0;
	Tue, 14 Oct 2025 13:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760449963;
	bh=ssjsTqzEfEBT1gonGkyIguCeeCG6cNnHwZVkHgfQfPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyKslMt/Re73fKUgxWghdCYgF6656EvZDcTyasrTDRkn8ySxcPMqGtip7mgtwyOZ0
	 FBo4JuZ9fy5ala5yvrDcQuEkonoIDKOCSj8lE+Ag4AWeLpMAQpFalh0gKb8q7/a34C
	 vxiDUQ1U4Gre0vU3WwCZYwSLOxM2vA88recW2Bpuz7V3TqhG7mGf/rRtCAdNm4BulP
	 e88nzCKJhaQUBhAgvvYO9r6PGnWwacWNgraqXc3k6ZW1gJAQ1iYaNlZ/p1LNk7doo1
	 zZx9NatAG/BSJCKF8FktW7e9mWnbxyHFIuAKr3xFrh58dahsuoie4ygFDpZY/Iejop
	 AbnYJlcQZk04g==
Date: Tue, 14 Oct 2025 15:52:40 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/3] net: airoha: npu: Add
 airoha_npu_soc_data struct
Message-ID: <aO5VqDegyOY9fVEK@lore-desk>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
 <20251013-airoha-npu-7583-v3-2-00f748b5a0c7@kernel.org>
 <aO4LL8racazLjjzk@horms.kernel.org>
 <aO4WmeuoAcZLFSBo@lore-desk>
 <20251014134609.GA3239414@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PckbZYlHLnwOdPvs"
Content-Disposition: inline
In-Reply-To: <20251014134609.GA3239414@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_065244_494549_B77F4E28 
X-CRM114-Status: GOOD (  33.83  )
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


--PckbZYlHLnwOdPvs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 14, Simon Horman wrote:
> On Tue, Oct 14, 2025 at 11:23:37AM +0200, Lorenzo Bianconi wrote:
> > > On Mon, Oct 13, 2025 at 03:58:50PM +0200, Lorenzo Bianconi wrote:
> > >=20
> > > ...
> > >=20
> > > > @@ -182,49 +192,53 @@ static int airoha_npu_send_msg(struct airoha_=
npu *npu, int func_id,
> > > >  	return ret;
> > > >  }
> > > > =20
> > > > -static int airoha_npu_run_firmware(struct device *dev, void __iome=
m *base,
> > > > -				   struct resource *res)
> > > > +static int airoha_npu_load_firmware(struct device *dev, void __iom=
em *addr,
> > > > +				    const struct airoha_npu_fw *fw_info)
> > > >  {
> > > >  	const struct firmware *fw;
> > > > -	void __iomem *addr;
> > > >  	int ret;
> > > > =20
> > > > -	ret =3D request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
> > > > +	ret =3D request_firmware(&fw, fw_info->name, dev);
> > > >  	if (ret)
> > > >  		return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> > > > =20
> > > > -	if (fw->size > NPU_EN7581_FIRMWARE_RV32_MAX_SIZE) {
> > > > +	if (fw->size > fw_info->max_size) {
> > > >  		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> > > > -			NPU_EN7581_FIRMWARE_RV32, fw->size);
> > > > +			fw_info->name, fw->size);
> > > >  		ret =3D -E2BIG;
> > > >  		goto out;
> > > >  	}
> > > > =20
> > > > -	addr =3D devm_ioremap_resource(dev, res);
> > > > -	if (IS_ERR(addr)) {
> > > > -		ret =3D PTR_ERR(addr);
> > > > -		goto out;
> > > > -	}
> > > > -
> > > >  	memcpy_toio(addr, fw->data, fw->size);
> > > > +out:
> > > >  	release_firmware(fw);
> > > > =20
> > > > -	ret =3D request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> > > > -	if (ret)
> > > > -		return ret =3D=3D -ENOENT ? -EPROBE_DEFER : ret;
> > > > +	return ret;
> > > > +}
> > > > =20
> > > > -	if (fw->size > NPU_EN7581_FIRMWARE_DATA_MAX_SIZE) {
> > > > -		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> > > > -			NPU_EN7581_FIRMWARE_DATA, fw->size);
> > > > -		ret =3D -E2BIG;
> > > > -		goto out;
> > > > -	}
> > > > +static int airoha_npu_run_firmware(struct device *dev, void __iome=
m *base,
> > > > +				   struct resource *res)
> > > > +{
> > > > +	const struct airoha_npu_soc_data *soc;
> > > > +	void __iomem *addr;
> > > > +	int ret;
> > > > =20
> > > > -	memcpy_toio(base + REG_NPU_LOCAL_SRAM, fw->data, fw->size);
> > > > -out:
> > > > -	release_firmware(fw);
> > > > +	soc =3D of_device_get_match_data(dev);
> > > > +	if (!soc)
> > > > +		return -EINVAL;
> > > > =20
> > > > -	return ret;
> > > > +	addr =3D devm_ioremap_resource(dev, res);
> > > > +	if (IS_ERR(addr))
> > > > +		return PTR_ERR(addr);
> > > > +
> > > > +	/* Load rv32 npu firmware */
> > > > +	ret =3D airoha_npu_load_firmware(dev, addr, &soc->fw_rv32);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	/* Load data npu firmware */
> > > > +	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
> > > > +					&soc->fw_data);
> > >=20
> > > Hi Lorenzo,
> >=20
> > Hi Simon,
> >=20
> > >=20
> > > There are two calls to airoha_npu_load_firmware() above.
> > > And, internally, airoha_npu_load_firmware() will call release_firmwar=
e()
> > > if an error is encountered.
> > >=20
> > > But should release_firmware() be called for the firmware requested
> > > by the first call to airoha_npu_load_firmware() if the second call fa=
ils?
> > > Such clean-up seems to have been the case prior to this patch.
> >=20
> > release_firmware() is intended to release the resources allocated by the
> > corresponding call to request_firmware() in airoha_npu_load_firmware().
> > According to my understanding we always run release_firmware() in
> > airoha_npu_load_firmware() before returning to the caller. Even before =
this
> > patch we run release_firmware() on the 'first' firmware image before re=
questing
> > the second one. Am I missing something?
> >=20
> > >=20
> > > Also, not strictly related. Should release_firmware() be called (twic=
e)
> > > when the driver is removed?
> >=20
> > For the above reasons, it is not important to call release_firmware() r=
emoving
> > the module. Agree?
>=20
> Thanks, agreed.
>=20
> For some reason I missed that release_firmware() is called in
> airoha_npu_load_firmware() regardless of error - I thought it was only
> in error paths for some reason.
>=20
> So I agree that the firmware is always released by the time
> airoha_npu_load_firmware() is returned. As thus there is never
> a need to release it afterwards.
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>
>=20
>=20

ack, thx for the review.

Regards,
Lorenzo

--PckbZYlHLnwOdPvs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaO5VqAAKCRA6cBh0uS2t
rKOOAQDpkKyXdtPwflpBidM62ACL3W06z3Xjas/GK4+Y4rraYgD4+VvRgWRlYY8L
iT7Okq7FVtyyot/ZH4Lpb3VEMvSlCg==
=CTji
-----END PGP SIGNATURE-----

--PckbZYlHLnwOdPvs--

