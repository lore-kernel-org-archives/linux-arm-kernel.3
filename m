Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF86CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEN5xv9iVuBPNlQlEpzhnEYMSj1eYJ2EPJyUm2o7+S4=; b=djeefSCzfy4dquj5ChKsO/bkWx
	ZMbxvKmkFg+V5qjMbUCtiL5VaCPpQK3AEPX/AWjEJvHmpb7kiaL/gJtX85y8blDOsT0otNob2Vsbh
	qcFgA/5bW+moGCD4As62tFIQgXaI7x1qJ7ou+AwiNcj7tcixk3P93mHi5CtvuRLpKq7MuTO9nYvv8
	BYQ8iF2zJE3eK6av/pA8oF+DQiHRFQN7gnRxwWU14nlkE4krUve/qgnRyl58tEyngE2upIvQoysrh
	Jwp/H5Kte02lHmyuXIuZlSHZZUgcsAo0RtrEHpX59r+gJYlZRF/GHNLc1jBu2Pcur1osyAvJSc9/B
	B/oVe7Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppX1-00000004seG-1jyX;
	Sat, 23 Aug 2025 14:47:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uppS9-00000004s0v-2uaE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 14:42:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D04B560007;
	Sat, 23 Aug 2025 14:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32572C4CEE7;
	Sat, 23 Aug 2025 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755960164;
	bh=z7ApHOWPs6UIakCI3RaTZXmAyFE6OH6UhPbV+KeOM7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBgy0cNdc34iJlNsbMepjFb5z58s7yJRiVrdERfLsDg5SRsxGjpRxetzD3JUDWlI3
	 aOQWD7/QoV7cxhMkg3p+nUkr2zsgsSMcrr6qZfXbStNryjYShPRo6UlnGdWLVvzd4q
	 BBIIabMm1xprDDpTCvAuo9KRh4VhifV1/iV95cjn/hXmCLyevz4pgzb8gUmNYLwvVB
	 bmgT2S/UdShVGOXePXv6Gqs1g2qr1EFL5dIWiYX/FJlbdVLGgKSAyHNCBoSTJKg3S8
	 6GI75t8+3EDMNqzHPWb4TlrjASSmJNsdyY4r6RrhdngTw8NKndxdk8wDXAoREetjnW
	 DwtK8rYfEtshQ==
Date: Sat, 23 Aug 2025 16:42:40 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Ray Liu <ray.liu@airoha.com>, Mark Brown <broonie@kernel.org>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/13] spi: airoha: add support of dual/quad wires spi
 modes
Message-ID: <aKnTYNsaBIkh6OBS@lore-rh-laptop>
References: <aKgSY7bOrC8-qZE3@lore-rh-laptop>
 <20250823001626.3641935-1-mikhail.kshevetskiy@iopsys.eu>
 <20250823001626.3641935-4-mikhail.kshevetskiy@iopsys.eu>
 <aKl43hTJJVqRE3Rt@lore-rh-laptop>
 <68130d82-edbe-4e23-9538-733f9c52123c@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gHh2E/ssa1RMJrZx"
Content-Disposition: inline
In-Reply-To: <68130d82-edbe-4e23-9538-733f9c52123c@iopsys.eu>
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


--gHh2E/ssa1RMJrZx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

>=20
> On 23.08.2025 11:16, Lorenzo Bianconi wrote:
> > [...]
> >> -static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl,=
 u8 cmd,
> >> -				   const u8 *data, int len)
> >> +static int airoha_snand_write_data(struct airoha_snand_ctrl *as_ctrl,
> >> +				   const u8 *data, int len, int buswidth)
> >>  {
> >>  	int i, data_len;
> >> +	u8 cmd;
> >> +
> >> +	switch (buswidth) {
> >> +	case 0:
> >> +	case 1:
> >> +		cmd =3D SNAND_FIFO_TX_BUSWIDTH_SINGLE;
> >> +		break;
> >> +	case 2:
> >> +		cmd =3D SNAND_FIFO_TX_BUSWIDTH_DUAL;
> >> +		break;
> >> +	case 4:
> >> +		cmd =3D SNAND_FIFO_TX_BUSWIDTH_QUAD;
> >> +		break;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> > Since this is used in airoha_snand_write_data() and in airoha_snand_rea=
d_data()
> > I guess you can define a routine for it.
>=20
> It's not the same. It looks similar, but different constants are used
> for rx and tx cases.

ops, I missed TX vs RX.

Regards,
Lorenzo

>=20
> >
> >> =20
> >>  	for (i =3D 0; i < len; i +=3D data_len) {
> >>  		int err;
> >> @@ -409,16 +433,32 @@ static int airoha_snand_write_data(struct airoha=
_snand_ctrl *as_ctrl, u8 cmd,
> >>  	return 0;
> >>  }
> >> =20
> >> -static int airoha_snand_read_data(struct airoha_snand_ctrl *as_ctrl, =
u8 *data,
> >> -				  int len)
> >> +static int airoha_snand_read_data(struct airoha_snand_ctrl *as_ctrl,
> >> +				  u8 *data, int len, int buswidth)
> >>  {
> >>  	int i, data_len;
> >> +	u8 cmd;
> >> +
> >> +	switch (buswidth) {
> >> +	case 0:
> >> +	case 1:
> >> +		cmd =3D SNAND_FIFO_RX_BUSWIDTH_SINGLE;
> >> +		break;
> >> +	case 2:
> >> +		cmd =3D SNAND_FIFO_RX_BUSWIDTH_DUAL;
> >> +		break;
> >> +	case 4:
> >> +		cmd =3D SNAND_FIFO_RX_BUSWIDTH_QUAD;
> >> +		break;
> >> +	default:
> >> +		return -EINVAL;
> >> +	}
> >> =20
> >>  	for (i =3D 0; i < len; i +=3D data_len) {
> >>  		int err;
> >> =20
> >>  		data_len =3D min(len - i, SPI_MAX_TRANSFER_SIZE);
> >> -		err =3D airoha_snand_set_fifo_op(as_ctrl, 0xc, data_len);
> >> +		err =3D airoha_snand_set_fifo_op(as_ctrl, cmd, data_len);
> >>  		if (err)
> >>  			return err;
> >> =20
> >> @@ -895,12 +935,27 @@ static ssize_t airoha_snand_dirmap_write(struct =
spi_mem_dirmap_desc *desc,
> >>  static int airoha_snand_exec_op(struct spi_mem *mem,
> >>  				const struct spi_mem_op *op)
> >>  {
> >> -	u8 data[8], cmd, opcode =3D op->cmd.opcode;
> >>  	struct airoha_snand_ctrl *as_ctrl;
> >> -	int i, err;
> >> +	char buf[20], *data;
> >> +	int i, err, op_len, addr_len, dummy_len;
> > nit: can you please respect the 'reverse christmas tree' here?
> will fix
> >
> >> =20
> >>  	as_ctrl =3D spi_controller_get_devdata(mem->spi->controller);
> >> =20
> >> +	op_len =3D op->cmd.nbytes;
> >> +	addr_len =3D op->addr.nbytes;
> >> +	dummy_len =3D op->dummy.nbytes;
> >> +
> >> +	if (op_len + dummy_len + addr_len > sizeof(buf))
> >> +		return -EIO;
> >> +
> >> +	data =3D buf;
> >> +	for (i =3D 0; i < op_len; i++)
> >> +		*data++ =3D op->cmd.opcode >> (8 * (op_len - i - 1));
> >> +	for (i =3D 0; i < addr_len; i++)
> >> +		*data++ =3D op->addr.val >> (8 * (addr_len - i - 1));
> >> +	for (i =3D 0; i < dummy_len; i++)
> >> +		*data++ =3D 0xff;
> >> +
> >>  	/* switch to manual mode */
> >>  	err =3D airoha_snand_set_mode(as_ctrl, SPI_MODE_MANUAL);
> >>  	if (err < 0)
> >> @@ -911,40 +966,40 @@ static int airoha_snand_exec_op(struct spi_mem *=
mem,
> >>  		return err;
> >> =20
> >>  	/* opcode */
> >> -	err =3D airoha_snand_write_data(as_ctrl, 0x8, &opcode, sizeof(opcode=
));
> >> +	data =3D buf;
> >> +	err =3D airoha_snand_write_data(as_ctrl, data, op_len,
> >> +				      op->cmd.buswidth);
> >>  	if (err)
> >>  		return err;
> >> =20
> >>  	/* addr part */
> >> -	cmd =3D opcode =3D=3D SPI_NAND_OP_GET_FEATURE ? 0x11 : 0x8;
> >> -	put_unaligned_be64(op->addr.val, data);
> >> -
> >> -	for (i =3D ARRAY_SIZE(data) - op->addr.nbytes;
> >> -	     i < ARRAY_SIZE(data); i++) {
> >> -		err =3D airoha_snand_write_data(as_ctrl, cmd, &data[i],
> >> -					      sizeof(data[0]));
> >> +	data +=3D op_len;
> >> +	if (addr_len) {
> >> +		err =3D airoha_snand_write_data(as_ctrl, data, addr_len,
> >> +					      op->addr.buswidth);
> >>  		if (err)
> >>  			return err;
> >>  	}
> >> =20
> >>  	/* dummy */
> >> -	data[0] =3D 0xff;
> >> -	for (i =3D 0; i < op->dummy.nbytes; i++) {
> >> -		err =3D airoha_snand_write_data(as_ctrl, 0x8, &data[0],
> >> -					      sizeof(data[0]));
> >> +	data +=3D addr_len;
> >> +	if (dummy_len) {
> >> +		err =3D airoha_snand_write_data(as_ctrl, data, dummy_len,
> >> +					      op->dummy.buswidth);
> >>  		if (err)
> >>  			return err;
> >>  	}
> >> =20
> >>  	/* data */
> >> -	if (op->data.dir =3D=3D SPI_MEM_DATA_IN) {
> >> -		err =3D airoha_snand_read_data(as_ctrl, op->data.buf.in,
> >> -					     op->data.nbytes);
> >> -		if (err)
> >> -			return err;
> >> -	} else {
> >> -		err =3D airoha_snand_write_data(as_ctrl, 0x8, op->data.buf.out,
> >> -					      op->data.nbytes);
> >> +	if (op->data.nbytes) {
> >> +		if (op->data.dir =3D=3D SPI_MEM_DATA_IN)
> >> +			err =3D airoha_snand_read_data(as_ctrl, op->data.buf.in,
> >> +						     op->data.nbytes,
> >> +						     op->data.buswidth);
> >> +		else
> >> +			err =3D airoha_snand_write_data(as_ctrl, op->data.buf.out,
> >> +						      op->data.nbytes,
> >> +						      op->data.buswidth);
> >>  		if (err)
> >>  			return err;
> >>  	}
> >> --=20
> >> 2.50.1
> >>

--gHh2E/ssa1RMJrZx
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaKnTXgAKCRA6cBh0uS2t
rD5rAP9q+OLLjrD024OMc/m4rI8znbC98tVfeHNtJZR8xHLcpwEA0u4O/FmcPXPG
MLZwtSE4dYcqa9hdaW66/QnKUaqtjAA=
=2Ox2
-----END PGP SIGNATURE-----

--gHh2E/ssa1RMJrZx--

