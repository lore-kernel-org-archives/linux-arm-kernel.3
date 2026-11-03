Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0845606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 05:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=skxCSMJA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P2qwO9Gt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=; b=skxCSMJArL102j
	dJvk/vOex9ZQUwNJTq9Vt1P779Tdwr/cDKAzIwXf8OOtJ2Kb93QSBWUZyGeqibOBqjpsbd+SlHCet
	kwOUubarEdxcR8J1bNu22OANneGi1GvLR/L5dBum8GY6Ktx80arpTPMcVTGSp6PGJWRlSJ/IbSorL
	97MM9ZyssU8wgFrbx8wUDB6CuNNZ3LnoSraZ2foqAIceYGrbp20fewoE8nk/pD/g6+Mq3l3Wvn5YM
	J/9JRaLT33OXERsP5Pmum/AGN7nzdd+TiSrAFcb8xlOxGwkBXrxJm8Fkbl14OULMfk8aVHWYrZTSF
	iaSz36By8qdB4MnMSAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6wL-000000017qG-2SCE;
	Tue, 03 Nov 2026 05:20:09 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6wJ-000000017pu-25iW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 05:20:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c40f29667e6so570850466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 21:20:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793683205; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUYmGhHff57pWQ906kb9UMh/jhbtIobmP+66lfl8MH/2MhUh+jgoKiApzbGg6WQKs4
         v9dOi/x+TyHDOEYhz3nKu6gog7IRc/pJyKKEjb7gYR2oAxW6IeJwzvtcx5BnmPVhFZYb
         jqAP54AFxl9gtk7Gk/KIcMEy4XKU+AcaObNepDunmkAzLKBk3YXroTOaQkimdG9Xpbvh
         d5SbwQJWfxc38V5J2HAKJUE/HoCurRXg+upfuyjhfo+j6ml/DuEO4spxw/MQkGzLs1wS
         FjHdTnXFpP2eMmrdQnFns+r71y2HoEMRkB3/cWoKO29BItMTwNc2Du3o1Vut2LHGEFS1
         02Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        fh=R08t1MifUurTZ1VtSzjwI2ihdtvnI3A1CEDu+hSidME=;
        b=GMSx4vGMUFUA++UDBIqPp8YaotPrugk8rL+fDIlwNJHqVvbKTnJRaq1W0Q7gUHxlFV
         rMIwam5Lj30bNjQMUbwqhG7rr7E0QhOlbM13xzev7RpmUo5xmqRsX2NwVUTwtglUz3j1
         ervm1MZ8L8PjN1mDBw59cFME4DQwYzJpBEDaKnQdN6Y/qA+aRYBnfcAbkCWhaC4BZqtY
         2CvwDNqhJo+qcrn6t6PJXDZ8xlVPgZia2cr1s6C2JzBIDkcOD8YP2VGeoRXv3gfLifZt
         ZKf45vCA96kqmMzyFPElADFfJUe3jQLoghnqzLfTYGSh7AD/9M5QL1SjgS66pbItrufE
         IuDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793683205; x=1794288005; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=P2qwO9GtERtjvHNHqkQybOyqkduvjnDA3zCfUvURQCLp88/7SfzeMdVpUgQ4JoO+4k
         eAR/EmIb6zjsB2kLb7OaQIT/d8x/vejbe7tXTaGqB6ZFI44VOw3R+HVF++aA+bS9Troe
         bPprH7vJ0EGx37sJEPxso6nIaJPndnsJ32qJRpw7JMD5SbNh0DR+P5SUfVkHDmx4suNe
         tLj+J2YOFmXxwML2N6wb6ZwrMb6DBRaHrZNcU1bFQcYeAb3SL+Pu4ScPlKnat6hH0A7+
         zxL1rWTs9vVBrk4nB8eXGxnK7Kz+T5LNifygikPaWqVn1jOEf8SLRbB53RFs2jyQT76n
         vi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683205; x=1794288005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pDTsD4t56MeX2uV9b6GeWSndHvaDFEKKyK2s+LL9ewc=;
        b=d6R+3Y2MeJZrNAzCHq7GVoFtXBl7hKZdaRdKdHnjZt26dRIb0r6AA22DatUxshptI6
         z0y8KHdHC9R5EJfpQaVVhX9A3nmGD88Hv817Yr+BJsA0od9/S6GH/k8CpOxom8zvdyvi
         qIn/493aWeiSP+TeJLHf5wuaheN/CIJawtbafjiN5K1JmcRosWA/y4oAC4Qig1tA/TRo
         dmW4aTD6e0IPFL37OkSTKg+PSlJMU8I6Um3Ph2gCdsBMMFonu5zhbqFuoZIF/37WcDDf
         vMN1UqF1y4QFMpQRna6Cva4oB/FZAChPqN8wDGnPSV7hQL1V818tS1jInivOgCFfFiO1
         7kDw==
X-Forwarded-Encrypted: i=1; AKwUvBzGi02hD/tKImgMEJLmZpmmNxdr+mo7+k5EtuGSgRxjUMtTfuIZh4K8ulFUxw38QpRxRtSg/vIoCm/hIfSo/x1r@lists.infradead.org
X-Gm-Message-State: APuU4Z/ONJfG/ObLr4pssUKr0MqdbuhjMMBrbulO/dYyCESIxixFHYSL
	QMKGyCEYF5fbZfVDTLZYRL5x9BA+dypwa2MBROv589WepfWHFhB/ywnIDea2kThNsAdqtALcHnc
	QiMtsLDU0gy5UsDa/9q4inL0vBpeYL94=
X-Gm-Gg: AYBFou2GIa0voivXDnJGoE2a8maWVdzA+zN3TYCP5rTrXXdCu+wMqyPMZZ75LVirg7O
	N9G8OfZnB9G4d7h1NRrHWwqaVQspN9bqTvJZ9828dso+eD0XUD6bF7JSX/6BLlFxkeG0C3/7MMQ
	XmCs+s998ChoLQTujYu6evbrpW9NL9rHEzgOizhuO/TbdZiTWvGg4qNoieqNl1qc4dHoecnDpVP
	AvL0OKv7atXbQMxllTnvTILLReIexbecY15UBe2JhibwpxMdVIjJ/R52GfkcQ7+zyruhRcPQTKQ
	8ynCR4lQSgm7MYxD4DuRqFbn0EXjU9B+egAEb+PwRbKP7kEGuZFFwkT6y4X/Oh6sm+itVJgvkVQ
	KG54hrLFVOhze1KATO9+J8hiXLMmsAUcXianMv7N/Xsf1uHmaYiagK8QrGEM=
X-Received: by 2002:a17:907:1b27:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c4ca7ac00e2mr960824566b.48.1793683204767; Mon, 02 Nov 2026
 21:20:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com> <20261102-tough-brawny-rooster-a3d3cd@quoll>
In-Reply-To: <20261102-tough-brawny-rooster-a3d3cd@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 3 Nov 2026 13:19:37 +0800
X-Gm-Features: AclHuK9QcK19DBzWKX6U7B2jdmB2traqMfPAukSvaMhLFGEyPx_6lzhivdpXnb0
Message-ID: <CAA+D8AP+=qDya3JDPTn0WYTG6xvoc=ORqkTF5FNWvArgd3DB6A@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_212007_579908_48C66DD6 
X-CRM114-Status: GOOD (  16.14  )
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

On Mon, Nov 2, 2026 at 7:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HIFI4 DSP provides an additional debug reset control that can be
> > used by the debug interface.  This patch adds the `dbgreset` entry to
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submi=
tting-patches.rst#L94
>
> > the `reset-names` property and expands the `resets` array to allow up t=
o
> > three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.
>
> No need to repeat the diff. And if explaining more, say something
> useful.
>
Thanks for the comments,  I will update the commit message in the next vers=
ion.

Best regards
Shengjiu Wang

