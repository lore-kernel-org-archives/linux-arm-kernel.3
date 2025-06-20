Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FACC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Atg3Rc7cRXeCIh8YFwspecN95/uWyzn7dtCK3EZcIY=; b=mioIPQZG4amsIRzeRek4RwENvu
	W59t37nmF4r62a0n+eGvrpBkIxMaCD8QjSCH8uuPoH764xggzx4p4LT96BWn9E+0OX3+8wkZYp8Bk
	HdtCnf9L7x4gjg/xKigNQiKsPibFluR24m46wUz3D4ZXc33jLsLuYSb77Q8unilaWaDEEoS5xuypY
	s2lixX3Gb1VQydpLPPxdCucLokiUT4+copOMpwJ1Qm/ibck63LGQixHuILHD80qVr78eDVxKPRbxF
	xEkHV7ZfAZwUijfEsVGQ1Xqo3D+emLzW6sYTdKytrn9G0LhvNO3hqzYExt4a5PmFzjJsffIFGhKor
	47Kx5fFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWqh-0000000F0tY-3zJ0;
	Fri, 20 Jun 2025 08:11:48 +0000
Received: from mail.wintix.pl ([151.80.129.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWiH-0000000Ezqx-2x6b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:03:07 +0000
Received: by mail.wintix.pl (Postfix, from userid 1002)
	id BE5BC263DC; Fri, 20 Jun 2025 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wintix.pl; s=mail;
	t=1750406504; bh=5Atg3Rc7cRXeCIh8YFwspecN95/uWyzn7dtCK3EZcIY=;
	h=Date:From:To:Subject:From;
	b=riuvLPeWBJZ2rURaufH5U+F0Ydkq0DQ5Hp7IBjnKwxrETuiO+D8zNERw05okvo7MD
	 7Tf9/jPuJ0dwMKx1UYeQA8vRJUE6pNzwbBmzy0xVIXW0aTmyKMq855mRxnOxFdNos/
	 TXBKmRaLhrMsy/2eahLh3YWk39w8rKNH+oDh11yLANdcowk4aSwVW/0Rcv87kspaWA
	 8sG8/Xy+vZzfds3mE3XDgvh6zqe73DnbJDawZTe935WN4woRaObbg3sv+ZjXTBv5uK
	 Eb6T42ICUe96ETn5eIky7o7qpr/GeDRA+RovFyo6waZ1KLDhuqJm1YJgfR39jhMIAw
	 z+6JihP9NHFsQ==
Received: by mail.wintix.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 08:00:31 GMT
Message-ID: <20250620064500-0.1.7t.fg7q.0.wj4k5f9ih2@wintix.pl>
Date: Fri, 20 Jun 2025 08:00:31 GMT
From: =?UTF-8?Q?"Adam_Szcz=C4=99sny"?= <adam.szczesny@wintix.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?=E2=80=9EJestem_zainteresowany=2C_ale_teraz_nie_ma_czasu=E2=80=9D_=E2=80=93_znasz_to=3F?=
X-Mailer: mail.wintix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_010306_423915_867E0CBB 
X-CRM114-Status: UNSURE (   2.01  )
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

=E2=80=9EJestem zainteresowany, ale teraz nie ma czasu=E2=80=9D - jak cz=C4=
=99sto to jedyne usprawiedliwienie handlowc=C3=B3w w Pa=C5=84stwa firmie?

Jestem przekonany, =C5=BCe temat generowania lead=C3=B3w nie jest obcy =E2=
=80=94 pozwol=C4=99 wi=C4=99c sobie pomin=C4=85=C4=87 marketingowe bana=C5=
=82y o "rewolucji w sprzeda=C5=BCy".

Przejd=C5=BAmy od razu do rzeczy:
Czy w tej chwili rozwa=C5=BCacie Pa=C5=84stwo wsp=C3=B3=C5=82prac=C4=99 z=
 partnerem, kt=C3=B3ry przejmie na siebie weryfikacj=C4=99, kto na rynku =
realnie interesuje si=C4=99 Pa=C5=84stwa ofert=C4=85?

Oczywi=C5=9Bcie zak=C5=82adam, =C5=BCe nie opieracie si=C4=99 Pa=C5=84stw=
o na =E2=80=9Edeklaracjach na s=C5=82owo=E2=80=9D. Ka=C5=BCdy sygna=C5=82=
 o potencjalnym zainteresowaniu wymaga weryfikacji =E2=80=94 rozmowy, kt=C3=
=B3ra pozwoli Pa=C5=84stwu samodzielnie zdecydowa=C4=87, czy dany kontakt=
 zas=C5=82uguje na miejsce w lejku sprzeda=C5=BCowym. To umo=C5=BCliwiamy=
 - tego wymagamy!

Je=C5=9Bli temat brzmi interesuj=C4=85co =E2=80=94 jestem do dyspozycji.

Prosz=C4=99 o kontakt lub propozycj=C4=99 terminu na kr=C3=B3tk=C4=85 roz=
mow=C4=99.


Z powa=C5=BCaniem
Adam Szcz=C4=99sny

