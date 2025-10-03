Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F90ACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HqBw6IJjjhWmX9IjULM9zUwJkQUnzyzPDEdXhc0NseY=; b=PC3gfmQ7HCGgODdMbtz+2SwhWa
	ETZ6ROdQrrTK/7RmaHkfFCTU4UxHQnvXboG3IOaMDKfKw89NLj07U0eqvhdyrxXcYkTf7LxPUfrer
	opU1Ld8VI0YW1rP0ya5KQiaayltKiya4nyuG4pD+LRmTUPJ5jad4uElyo87rsCf+JjV3AY7ipJvH7
	CBN/hDaQQhD9jsvbJZI176hURTjg2RJ9SOtmvAwukOg27T7oAOdzsY1USet3ap8PPbtjrhuQFlveg
	wUW4THu6lkqtgRa7ChkQVgOcjoSEE7mp+TUxNNTb/cFQAN6o3mD4ILmsseHiNc+hn7bCy+mKPKW4Z
	zx2bS/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4aGM-0000000BobI-2Iiv;
	Fri, 03 Oct 2025 07:31:34 +0000
Received: from mail.taskedia.pl ([164.132.227.82])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4aGK-0000000BoZ2-1kVk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 07:31:33 +0000
Received: by mail.taskedia.pl (Postfix, from userid 1002)
	id D6DBB47532; Fri,  3 Oct 2025 09:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskedia.pl; s=mail;
	t=1759476685; bh=29YVHHbrli9hU+E8sZ8/0H23hGAmqTbAMfI+9Asx7Og=;
	h=Date:From:To:Subject:From;
	b=lmlFmF6I3SXdER5TpnGKLj9+/YFRne4ZQPVtM7BJU0REaEpCxmjv+Y096k/SXgl0+
	 W1fLIaDFpBESiCZ9aZ8v8doJmqkHUL7gmZsrMorwklIwYf7XcOxXtRozWvVMoBARlt
	 YdnqhQJhzcfcDgHHKpGLXG1ICgomL+kNqfT1JSJ8nG+u5n93BNF/g1ZSye0l3iEC6S
	 /j+FnovJM5SOn+cqoLY59+0N/gJcbR+6rBgK1Qq922boHBjYllGG35cNvP60j+wI4B
	 DZqlv4BNbz6t1/9FGqTmC9VF9j3hTx4TpZv2UO9r2bvfL/ZExf/TnM9xPVovjLJvdO
	 qPoZvrE45iRtQ==
Received: by mail.taskedia.pl for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Oct 2025 07:30:49 GMT
Message-ID: <20251003084500-0.1.g8.1klzf.0.rl53cuqx9m@taskedia.pl>
Date: Fri,  3 Oct 2025 07:30:49 GMT
From: "Filip Radelecki" <filip.radelecki@taskedia.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Odzyskaj nawet 5 lat podatku CIT/PIT i sfinansuj inwestycje
X-Mailer: mail.taskedia.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_003132_750590_EAE17A96 
X-CRM114-Status: UNSURE (   1.70  )
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

