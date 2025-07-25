Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FBCC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4AzPA4imFGQrEGNvNR0YShzxEl94SAkwl3qrBl+aPMc=; b=0DYkXjSsSdT06u8CPAEOJDd9mt
	AzrGxNzIZ2rnukSimptwfJieJyTuP9TKptMe1xaPQbWgF4NxGsXJoRPEXi8DSKGZPWQ8ayq5qBbtD
	UkIZYHSe/ZFk8oVVIYT6GelcECDDYfCagiOYXzKaS4o2hApi2VPgVfsBJzl8CGTZB8TDgaUs0KF0K
	DdhAlOb9PGjLOeiuqT7QgVYJ+PLKSvE5eswcdT4C7zO7i/sq1g0r6wUir3KWoGLjM+V3MAm15RA1j
	KuV7n1+Qe7OcwndtI1f86LuHujzsuxBWtU6Dvq4QXSAD54sd8l9S8U029wW8YNvn2kT54Y0ND/TaS
	dqyhOQXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDfU-00000009LQD-436g;
	Fri, 25 Jul 2025 08:20:40 +0000
Received: from mail.launchiq.pl ([57.129.61.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDb0-00000009Krl-1KQJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:16:07 +0000
Received: by mail.launchiq.pl (Postfix, from userid 1002)
	id 966BC25638; Fri, 25 Jul 2025 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=launchiq.pl; s=mail;
	t=1753431357; bh=1nV56yiRn7w88ZKIfi9xMzQzsEglWEb9KKVoIWzOJTA=;
	h=Date:From:To:Subject:From;
	b=m6+rziN/WUcL0ifWmhOssVDjxt+NuYYORFuko6n/B2JxBgZXHLSCeeoPctY+l00O3
	 4xNo1fyM1l+w7/pzeaBX57XYdxRZFMTLgkUUvMq8+QaqObLINlqAmqkTLR5dNd8BCI
	 rkpPKovlTSdv148aA0c4771uRaA0Og9tcCRDsH/J+/ubM981clpdxaPS6KZjLPXjGa
	 bFCTt5mJRLKKlnoK4TVQJy/RZRETePNEhNpYRWAYVqwNTdQM2JdSv6jPyspJuzt9N6
	 IFDlMaFoSmpLz1oP93TQDKxkA/AEgYokPEheXlElmwqlyjXB3e8JrMbPjnQ4CL+qLf
	 aQssSGEJWSFsw==
Received: by mail.launchiq.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 08:15:14 GMT
Message-ID: <20250725064500-0.1.3k.afqb.0.5d83nujyl0@launchiq.pl>
Date: Fri, 25 Jul 2025 08:15:14 GMT
From: "Grzegorz Sutor" <grzegorz.sutor@launchiq.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Umowa vPPA - termin spotkania
X-Mailer: mail.launchiq.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_011602_628356_379F63A8 
X-CRM114-Status: UNSURE (   2.68  )
X-CRM114-Notice: Please train this message.
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

Dzie=C5=84 dobry,

mamy rozwi=C4=85zanie, kt=C3=B3re pozwala zabezpieczy=C4=87 korzystn=C4=85=
 cen=C4=99 energii na d=C5=82ugie lata =E2=80=94 bez konieczno=C5=9Bci zm=
iany obecnego dostawcy i bez inwestycji w instalacje odnawialne.

Proponujemy wsp=C3=B3=C5=82prac=C4=99 w oparciu o wirtualne umowy PPA (vP=
PA) =E2=80=93 to rozliczany finansowo kontrakt oparty na cenach SPOT, kt=C3=
=B3ry:

=E2=80=A2 stabilizuje koszty energii na 3 do 7 lat,
=E2=80=A2 wspiera realizacj=C4=99 polityki ESG i obni=C5=BCa =C5=9Blad w=C4=
=99glowy,
=E2=80=A2 zapewnia elastyczno=C5=9B=C4=87 zakupow=C4=85 =E2=80=93 cz=C4=99=
=C5=9B=C4=87 energii w sta=C5=82ej cenie z OZE, reszta  =20
  rozliczana na bie=C5=BC=C4=85co,
=E2=80=A2 nie wymaga zmian technicznych ani formalnych po stronie Pa=C5=84=
stwa firmy.

Wsp=C3=B3=C5=82pracujemy z przedsi=C4=99biorstwami zu=C5=BCywaj=C4=85cymi=
 od 3 do 30 GWh rocznie =E2=80=93 g=C5=82=C3=B3wnie z bran=C5=BC takich j=
ak przemys=C5=82, logistyka, handel, automotive, IT i data center.

Ch=C4=99tnie przygotujemy bezp=C5=82atn=C4=85 wycen=C4=99 i indywidualn=C4=
=85 propozycj=C4=99 kontraktu, dostosowan=C4=85 do profilu zu=C5=BCycia e=
nergii w Pa=C5=84stwa firmie.

Je=C5=9Bli temat jest dla Pa=C5=84stwa interesuj=C4=85cy, z przyjemno=C5=9B=
ci=C4=85 przeka=C5=BC=C4=99 wi=C4=99cej informacji lub um=C3=B3wi=C4=99 s=
potkanie z naszym specjalist=C4=85.


Z wyrazami szacunku.
Grzegorz Sutor

