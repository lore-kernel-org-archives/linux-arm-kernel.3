Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03CBCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HqBw6IJjjhWmX9IjULM9zUwJkQUnzyzPDEdXhc0NseY=; b=FKM0PNfbz0ppv4BJFTtgl8ef1l
	mbjVv6N3+QcUyqk2hC1obdC9/VzrrCHSyHhFpsf+unIla9cocHwfJx7r4xedkBSQfFlCvTuVY558L
	/99BWBfEzHo4FoA6ksZSb5Xuj0a8j98gMa8liLDrowJQB6dS+4HBWrlFQtbo/NXWDAmH+st7rnF+A
	2ivpLrmXQ8or4wCBCRc4tKZ4uuCX1JJdoPa20QcrEWS19DQ5akKEypss1uoYSBMBybbEUE5jC5OEr
	cRGCj4mYfO0bLaqSmcc2DL2/79kofwAgR0GBtTJCZ4cquNCP2E+klSgjlmgL0ZfjJiZQh2g0p0Z8S
	BQREOfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IXH-00000003mQO-3cQd;
	Thu, 16 Oct 2025 07:36:31 +0000
Received: from mail.taskedia.pl ([164.132.227.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9IXE-00000003mOX-1tu8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 07:36:30 +0000
Received: by mail.taskedia.pl (Postfix, from userid 1002)
	id EAF194729C; Thu, 16 Oct 2025 09:36:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskedia.pl; s=mail;
	t=1760600179; bh=29YVHHbrli9hU+E8sZ8/0H23hGAmqTbAMfI+9Asx7Og=;
	h=Date:From:To:Subject:From;
	b=Kheyp+HuaxlrS6ugvoM17O4gAK8qJvHAt1mG4sgjr9WTFur1aV1rMFseKuS0om8nd
	 TvUpgOfx+532hiS8cPbrJ14jwV/AjRNNTYgzx7hhxCjNXXD38kYUR/SU9PLYi3G0xs
	 G7NJSbXSfGyGINUNCrM5oGGZLSWBTNRN1Rnf7vbXs+aUNaC2hTTRakKk6CTmK1rCE/
	 P7w4Ss8hlAvkWJlo5ehMdwWGgoYxx1bbtBBeUjQDnUHFiRTJ0IEZ+GHEAU8IJsOy5E
	 eSMTKokpFb+WFaRW9se6vtrYP7HB9us0AVfg24rEjjUsN+h8W06Obxdul3bVOxzlGS
	 aF8dMFQ6bBLxg==
Received: by mail.taskedia.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 07:36:01 GMT
Message-ID: <20251016084500-0.1.gh.1mu13.0.qzaq95v1x9@taskedia.pl>
Date: Thu, 16 Oct 2025 07:36:01 GMT
From: "Filip Radelecki" <filip.radelecki@taskedia.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Odzyskaj nawet 5 lat podatku CIT/PIT i sfinansuj inwestycje
X-Mailer: mail.taskedia.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_003628_850867_2DA5BB73 
X-CRM114-Status: UNSURE (   1.24  )
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

Szanowni Pa=C5=84stwo,

czy wiedz=C4=85 Pa=C5=84stwo, =C5=BCe firmy produkcyjne, przemys=C5=82owe=
, przetw=C3=B3rcze oraz IT mog=C4=85 skorzysta=C4=87 z mo=C5=BCliwo=C5=9B=
ci odzyskania zap=C5=82aconego podatku dochodowego (CIT/PIT) nawet do 5 l=
at wstecz dzi=C4=99ki uldze badawczo-rozwojowej (B+R)?

To realna szansa na odzyskanie znacznych =C5=9Brodk=C3=B3w, kt=C3=B3re mo=
=C5=BCna przeznaczy=C4=87 na dalszy rozw=C3=B3j przedsi=C4=99biorstwa - b=
ez konieczno=C5=9Bci sk=C5=82adania wniosk=C3=B3w o dotacje czy udzia=C5=82=
u w konkursach.

Dodatkowo, planuj=C4=85c nowe inwestycje - takie jak:

=E2=80=A2 zakup nowoczesnych maszyn i linii technologicznych,
=E2=80=A2 budowa lub rozbudowa hal produkcyjnych,
=E2=80=A2 zakup grunt=C3=B3w pod inwestycje,
=E2=80=A2 wdro=C5=BCenie instalacji OZE (np. fotowoltaika, magazyn energi=
i)
=E2=80=A2 mog=C4=85 Pa=C5=84stwo skorzysta=C4=87 r=C3=B3wnie=C5=BC z ulgi=
 inwestycyjnej, kt=C3=B3ra umo=C5=BCliwia odzyskanie  =20
  nawet do 70% poniesionych koszt=C3=B3w.

Po=C5=82=C4=85czenie tych instrument=C3=B3w daje firmom przemys=C5=82owym=
 i produkcyjnym unikaln=C4=85 mo=C5=BCliwo=C5=9B=C4=87 sfinansowania cz=C4=
=99=C5=9Bci inwestycji z wcze=C5=9Bniej zap=C5=82aconych podatk=C3=B3w.

Oferujemy bezp=C5=82atn=C4=85 wst=C4=99pn=C4=85 analiz=C4=99 kwalifikowal=
no=C5=9Bci i pomoc we wdro=C5=BCeniu ulg.


Pozdrawiam
Filip Radelecki

