Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D754CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Aug 2025 18:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq1PAeKV1s4YmLBR80pZHsmgpoZjucg9Fy7oCVrjUFc=; b=b/ZKQNhIEuYjfOj4O9uE/7plpv
	FCHA8qHoKRPrbDen5PwBk0rU/thLW1wLpGYqz971Ms2cCHSmE3D65aF/ccA+aSpzl7ZiYCVR0fGEX
	MYkvYtfqE4y+BsQ3xEeo2yy1a0KQAHAutpZExHpqty9F0GZ9qH3mwfwcjdu/IpG+nQ6YRcyg1NfZW
	ijJ/FIlWxxWTEZ2pPDGwCcWBIChM8ViNko7crhY08wayLVGWy7KfZgDbgthN+jBhOHvwrLY4sbSTu
	V1Z/p1ZbdyuBypavZCy2npwbzCECUghuN1alV8/Mpc0ptrRHGD43+QH8qyde7yMkqqrN2qf2QM8QX
	XF8fwskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFeC-00000006SdV-3m0q;
	Sun, 24 Aug 2025 18:40:57 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqFXl-00000006RzE-0miu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Aug 2025 18:34:19 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 9666C1C008E; Sun, 24 Aug 2025 20:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1756060451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eq1PAeKV1s4YmLBR80pZHsmgpoZjucg9Fy7oCVrjUFc=;
	b=B4VU3iGTH9nM/JqJF4J+vybBadFPzi6y5LR/UqbO4j3SefwKu6bw86OHvi0Hv4THWNA5LM
	Xh+5LbdIoGBkbgLUoj3Xl6l9W81w1Bwq6uM52kYhR5p1QB43MKEksANjoZXZNa9yTeWCWl
	ZoErlrdWU2y/VUduG+HDJh9sCQaBLPM=
Date: Sun, 24 Aug 2025 20:34:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Nobuhiro Iwamatsu's email address
Message-ID: <aKtbG1xk/8sbyHmW@duo.ucw.cz>
References: <1755663767-1612-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="moKA/m+8I1Jc/KOW"
Content-Disposition: inline
In-Reply-To: <1755663767-1612-1-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_113417_668911_0D3F9997 
X-CRM114-Status: GOOD (  10.80  )
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


--moKA/m+8I1Jc/KOW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> The company's email address has been changed, so update my email
> address in MAINTAINERS and .mailmap files.
>=20
> Signed-off-by: Nobuhiro Iwamatsu
> <nobuhiro.iwamatsu.x90@mail.toshiba>


> index 4bb3a7f253b9b..328b04f82dac7 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -585,6 +585,7 @@ Nikolay Aleksandrov <razor@blackwall.org> <nikolay@re=
dhat.com>
>  Nikolay Aleksandrov <razor@blackwall.org> <nikolay@cumulusnetworks.com>
>  Nikolay Aleksandrov <razor@blackwall.org> <nikolay@nvidia.com>
>  Nikolay Aleksandrov <razor@blackwall.org> <nikolay@isovalent.com>
> +Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba> <nobuhiro 1.iwama=
tsu@toshiba.co.jp>
>  Odelu Kukatla <quic_okukatla@quicinc.com> <okukatla@codeaurora.org>

There seems to be typo (extra space) in <nobuhiro 1.iwamatsu@toshiba.co.jp>.

Best regards,
											Pavel

>  ARM/TOSHIBA VISCONTI ARCHITECTURE
> -M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +M:	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visc=
onti.git

--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--moKA/m+8I1Jc/KOW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaKtbGwAKCRAw5/Bqldv6
8j3iAJwJWCnZC/1x6bmybPkhEm68FTqfXgCggl6QXqnEit2A6S8N/QTn8TOCtG0=
=trmY
-----END PGP SIGNATURE-----

--moKA/m+8I1Jc/KOW--

