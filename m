Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEC7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bhPO2CKs;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tl06RuP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=; b=bhPO2CKsyqE2yE
	wWLi/l45J7aTFCDKysQB8Vykn8y0BI8fXqevyaWUWX9QEAkG8Ehmt+P88HrsGK+hJY5mtDB5IQ+aN
	DISXYjKl0tx9nav2c/O2rn5gdhDtdgs+tiKkucsOseKGZgXZyFZKwH2liPiUERaoQJq8dQ6olX4FM
	4/lTUciIT2B0rLuuE2vRKhNdYFtJ0o1TRb58KZDeB1YukgU3SgUVxEKqko17uELxTBBQCIGq5i8QS
	icRgGXEAzh2mURmkLkHfyjQpPzZ8tBIJAxPmmyVvXmjA+d7auklE9sihbwln7FdbeXwHA/SFDF7mH
	WRtc0eJzlQQktsckQSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtt2-000000067vK-2kFM;
	Wed, 28 Oct 2026 02:59:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtt0-000000067uv-1qV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 02:59:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ea138a3497so2247225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 19:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793156373; cv=none;
        d=google.com; s=arc-20260327;
        b=caVpa4HVrkrFAHp5ID2bgHXYlknGOCzgi/ynMS5WzK8QkVQZxEXesa2NhNUFKPinnh
         ZP0Vajl6C7/jNk8SfCpBkdJxfrOcpvnHxEvop+rHfLRoLbsHZTXyi7ljtPK+jkrjlCIG
         LqN9vFv1LPVB2CcDeNIOlOSaA6Dm9DgBV6hl86+ypyfgBoRryuS1LUB2kKCUdEsQG6Yj
         xxRYjRhiyP7W0Uyg13Oz0ipI7nSaemdU/DGMRzK4h3MkEo8e6NFi92FmxB4otyh//zqT
         NN7ej9cI0bqiVPZwJWX2ilaFE5OKKAchKNvZGe7MC+JwURMoThtfWoYfXcNs+PkFwNVU
         CFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        fh=/BaEZuirbnAeUoe87iiJeyqC82JT/38HoupWYeHAgd0=;
        b=oyKLC3xxXkzZ84YPTqi/qQ+Y/aAExBrvfxd5M4J5fiyZd6kP/UcafFjBhayxB76hR8
         ijMzMT8OKYbUHlATNopZxoQJNv9kl/BoLObiy1flshllAYafTErK43NJ7m/4mivX1Sgc
         fSNGUgrYK27oSUbjtQN5sOAV0PQhEibcgpeVMeiZM1ZTkYirkmZteP3HQvTXtuo8VQ7u
         n9VIT9Zn152tw5+vN/SH+be5NEpLGSnYX2P6+/+ukXYTeyi8NCMGYeMzG30i8ySKDIRn
         YNhxfv128z7xWFRm53nGVQ3VmnrGTBo2GJ9e862yI+9r2j9cIO9ZfUVaMkPvbG6YEFdn
         cxNg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156373; x=1793761173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=Tl06RuP3IL2u1kq+QYSVKKDLJq5deixr6R4CjJjU5m5wIW5VzwCBsPBJdlFKwGbp4y
         +mb7Pfh2TLvJQZ+oYISgARy8U1NI7sZxqSTKEv6dW2K7+yx+kUnAVFt3W2rjDb/S8YrW
         V/NihSYSk+4MjjT9HjA3Y7By9YK1BM4iGIt7uxw+I+iw91Xs9X9+os5TFZcKW8HSs9RK
         /O+ABNIz/Nz9K8zKQ24c7P4Sqa5jbu+iVwYxFrsON87Vpx/ukEUD5hI/n3zfaMCkItpw
         OMDw+XHdcco5miiiW3arnArcIenXJBaJwy8B3Wm/5r0rLJmmrvCy9Q6SXLP2pRDlqieM
         z+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156373; x=1793761173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2DPmyi1uKgewOwOxe3WhQYBJSJPRynqMh4U5o6K2t4=;
        b=AG6iatMEyCkQqMdsBXnDVWCsiEcETrQFcphdTSeelogajPBiKN4djPmwuOzoffednT
         u5GjlSIeC6VXaVuupwJwGiFtpG8lJC2xjjj3Tybe61Xad8GZS24DM/7UIG95BYR8vG9z
         S+2KZ260kNXvxC5UDICXNdoICAc8syK7jz35j3UWTDCrvPYxBgD/VCP8JK+faB58+OpV
         VAEFN2oMdR+snMPJ3LDGAjnSUUgwzIz+JQtEDL7UP0QB2pUB5ETcMbh5ln3yILwWnhxI
         tnPafadcP6yUqNb5rpsYg6Xj2aQoZH2dYecW5OW9IfZv2+FiJyqlMvtUHB+dbPgaUI0c
         U8ug==
X-Forwarded-Encrypted: i=1; AKwUvBwC79rNWAvPWhOlwipa0/WZLbu/sQdykvwn/wjWSV6lCt0PWLuTDlZs/TknnB3MOmkz4L76tDPTmHIYDRd3bkg/@lists.infradead.org
X-Gm-Message-State: AFq9FYI2qG9yf363aO15BK1swmDki4fXZE83i+KCcXutLGEZPCWlZhXh
	PJADibrbQ/+UpheCIHvf29NRY05QZ1IF71vOvTyzRHbYobpsrXaiEvGpRY11X7FHxHCJNVDEBu4
	dHCaR2IAjCFbdOVudd2pjTNWsc4VW+w4=
X-Gm-Gg: AYBFou3+S8B2gOTdZhsno+9igkGYSkXcV/MmfPsxQUlmJa9yxMY+tq9jCXjGrgXlnuH
	yyAJHiS2F0Grgkn+y2ghZ5Jzz9NbnHHgagSn5DSzJoRVEPT5thFRfvXBlfRvBkhSlGcev/WLiee
	D2xNwUIecDz4DW0ff5+SM5cCOxqq/bcFq0M3ylQ8phyMTGyovvp5+m7m22dhE+N/O19u/dPE/6a
	xq12ISiV6pvmM0afxd+mu3a4f9JWbNuu+CVdpevFh2unf8xhYX2OvWBqun0kHQ+3YCfPe5yV4o3
	7DMuFS7JsPXCisLfsoq8WdRV6v8zKB7pBjOMRV30Y+gNln0bnF+G5iPAj5Qi7LJUyJ6f9Ot0Rat
	F6um6rWlofqaxAQRHw5UFamTW7A2e43T96hcT
X-Received: by 2002:a17:902:e889:b0:2e8:3566:b53f with SMTP id
 d9443c01a7336-2eb003bf1f6mr12865955ad.33.1793156373309; Tue, 27 Oct 2026
 19:59:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026085352.4009534-1-shengjiu.wang@oss.nxp.com> <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
In-Reply-To: <9b6c85f4-5881-46d8-b247-ae6bbfef8f91@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 28 Oct 2026 10:59:14 +0800
X-Gm-Features: AclHuK-tGLoHs34jMEzH16dC5P2hcrMRxMtYOVpGan1D-YWjOsuDop2uhxHPtLo
Message-ID: <CAA+D8ANey+JLj1v0wLh9cAWCD93Pg+gFoH-FwZU49f4-6zS7tA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx952-frdm: support AONMIX MQS
To: Chancel Liu <chancel.liu@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_195934_480055_19B7E5DF 
X-CRM114-Status: GOOD (  15.59  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 11:01=E2=80=AFAM Chancel Liu <chancel.liu@gmail.com=
> wrote:
>
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > Add support for AONMIX MQS (i.e. MQS1).
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../arm64/boot/dts/freescale/imx952-frdm.dtsi | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi b/arch/arm6=
4/boot/dts/freescale/imx952-frdm.dtsi
> > index 7785eb1a68fc..750046e1a5c4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx952-frdm.dtsi
> > @@ -222,6 +222,12 @@ cpu {
> >               };
> >       };
> >
> > +     sound-mqs {
> > +             compatible =3D "audio-graph-card2";
> > +             label =3D "mqs-audio";
> > +             links =3D <&sai1_port1>;
> > +     };
> > +
> >       usdhc3_pwrseq: usdhc3-pwrseq {
> >               compatible =3D "mmc-pwrseq-simple";
> >               reset-gpios =3D <&pcal6416 8 GPIO_ACTIVE_LOW>;
> > @@ -390,6 +396,70 @@ &micfil {
> >       status =3D "okay";
> >  };
> >
> > +&mqs1 {
> > +     clocks =3D <&scmi_clk IMX952_CLK_SAI1>;
> > +     clock-names =3D "mclk";
> > +     #sound-dai-cells =3D <0>;
>
> Above 3 properties have been defined in dtsi node. No need to add again.

Yes,  will remove them in the next version.

best regards
shengjiu Wang

