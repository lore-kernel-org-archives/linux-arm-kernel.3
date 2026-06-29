Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qylp1+q58BKXjVYMlUJn3x4tvz3kf67QuXXQvLn3hVQ=; b=TYSkMOIulI95hUEe2OMS8qTkHa
	qAZ+jqckuNyjXAk0v04CtHtsttUH2PNjBofRA3G9WhhFhvMvi0kcdjAivGdC6fLDShBfRgmH/xvAn
	dj/IpYjrg9ixvYd5SA7i6ttEJYxkX6CSLNfxbNmqJdZRw98eaTPMze2WS/qisOWbuDkZ20icIEfNL
	pWiCwgy8nfjHpzTgID6XXKRwYimtGKNi57LyIFAwwyUSI+lThstib3L5IQhaTN3Glh35S0vQdCnjA
	/qhWhjY3icdiAvK+S/DoLFEcV1XqD5Y7tXLzXSW6mKnNc0Q6GlronMtLYTI+wkJCMTcKLjjK3Cple
	eX5VHtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6l4-0000000Dx7Z-3JRV;
	Mon, 29 Jun 2026 07:50:22 +0000
Received: from dd54918.kasserver.com ([85.13.167.58])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6l1-0000000Dx5k-30Qj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 07:50:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karo-electronics.de;
	s=kas202603021246; t=1782719411;
	bh=Qylp1+q58BKXjVYMlUJn3x4tvz3kf67QuXXQvLn3hVQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ecw7erenvWIYPBx2V7ZPPuTiP0QJvB7JeAWgS4GWnn8/503xZok/8BGzb9DeXRFBc
	 XeC7jO4MWatNjCHC1ECcBW6XrZdV0OBa382Qs/IVNEJ5dgLX3G92WP+J1ri7YIyWer
	 dwai6hyb94q6EmVN0GrRTOkeBo/h0lefqhkodnLOH1A79zFz1cvQTTHVYCYQsOCsz1
	 c62YtKjIwpqQE3i0RhHvCf2yilcCcl4J95W3ejucUfo5okw7f5V89GB8iMAPWRex8x
	 ZZ1n2IpEQXDTL/6Gfp4KBftpnC4mSJJIA2vDTx0WN8aEMFIQMHm9Gls1wkkKm9TBcP
	 0b7q1/LHFGtGQ==
Received: from karo-electronics.de (unknown [89.1.81.74])
	by dd54918.kasserver.com (Postfix) with ESMTPSA id 8485F7722430;
	Mon, 29 Jun 2026 09:50:10 +0200 (CEST)
Date: Mon, 29 Jun 2026 09:50:09 +0200
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: pankaj.gupta@oss.nxp.com
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank
 Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Frieder Schrempf
 <frieder.schrempf@kontron.de>, kernel test robot <lkp@intel.com>,
 sashiko-bot <sashiko-bot@kernel.org>
Subject: Re: [PATCH v26 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <20260629095009.3256f956@karo-electronics.de>
In-Reply-To: <20260629-imx-se-if-v26-3-146446285744@nxp.com>
References: <20260629-imx-se-if-v26-0-146446285744@nxp.com>
	<20260629-imx-se-if-v26-3-146446285744@nxp.com>
Organization: Ka-Ro electronics GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Bar: /
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_005020_219299_BB72866B 
X-CRM114-Status: GOOD (  16.97  )
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

Hi,

On Mon, 29 Jun 2026 17:51:59 +0530 pankaj.gupta@oss.nxp.com wrote:
> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>=20
> Add MU-based communication interface for secure enclave.
>=20
> NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> embedded in the SoC to support the features like HSM, SHE & V2X, using
> message based communication interface.
>=20
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
> Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
>=20
> For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> world - Linux(one or more) and OPTEE-OS (one or more).
>=20
[...]
> +	ret =3D se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
> +				  ELE_GET_INFO_REQ, ELE_GET_INFO_REQ_MSG_SZ,
> +				  true);
> +	if (ret)
> +		goto exit;
[...]
> +/* Fill a command message header with a given command ID and length in b=
ytes. */
> +static inline int se_fill_cmd_msg_hdr(struct se_if_priv *priv, struct se=
_msg_hdr *hdr,
> +				      u8 cmd, u32 len, bool is_base_api)
> +{
> +	hdr->tag =3D priv->if_defs->cmd_tag;
> +	hdr->ver =3D (is_base_api) ? priv->if_defs->base_api_ver : priv->if_def=
s->fw_api_ver;
> +	hdr->command =3D cmd;
> +	hdr->size =3D len >> 2;
> +
> +	return 0;
> +}
>
I don't see a point in having a function always return zero and
implement error checks that will never be used.

[...]
> +static const struct of_device_id se_match[] =3D {
> +	{ .compatible =3D "fsl,imx8ulp-se-ele-hsm", .data =3D &imx8ulp_se_ele_h=
sm},
> +	{ .compatible =3D "fsl,imx93-se-ele-hsm", .data =3D &imx93_se_ele_hsm},
> +	{},
>
Since the last entry in this array must be a NULL entry, there should be
no comma after the {}. This will generate a compile error if (e.g. by
patch conflict resolution) an entry is added after the end marker.



Lothar Wa=C3=9Fmann

