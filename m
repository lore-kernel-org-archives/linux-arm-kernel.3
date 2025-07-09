Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45CEC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=; b=UOjdpWGasiphQibrEhr4POSfw2
	Ycs8E4N1aXwsIu3lqM6Ar/+Ave9DJlRBzMcy4XjZqyXNr/uVsNOAS9nBGmuZOj3gkjcWJVJsBbGvU
	StNVpCpF/E3JTYDrGGjiNf3qRjtxRg1kv+PSX7d6mOCOo1Qb9a0m/WTaffrNbZP1XNCz33ooLdyz3
	KK/dg23zQ++flvi+HyPFaEq0/Ik1KNoEQI0k9roHBID2u3jeek3/D7o6Xdy3pu4kltc6A2V0RIskI
	Aq1ku/WrpG0il7JybX+6FqwF4khaH5QDkyUW0SRlZ+s7VQ//bLZxGcZoNVeosYJ4AkAiVg13uCeIs
	Mi608mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQqo-000000085Io-3bHr;
	Wed, 09 Jul 2025 09:12:26 +0000
Received: from mail.bizovo.pl ([217.61.16.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPHr-00000007ox5-3nrf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:32:17 +0000
Received: by mail.bizovo.pl (Postfix, from userid 1002)
	id 0D4AF830D0; Wed,  9 Jul 2025 09:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizovo.pl; s=mail;
	t=1752046268; bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=;
	h=Date:From:To:Subject:From;
	b=cLPEtZ8C8i3Xn+RnahJZpC5wHl/CGH7y8x21MehCrW0lQ2EEbtwtRB9liuVcu/saZ
	 3DgxXw2iDHyrewVaq242Rt0/QGHDCNqt66d2pdkk51XsvuNsB7EU2OSFeCp2hJ5ply
	 Et898SkcBnITPEoXpz/OsBndMMzXPCPqnDfzCV1IwFmOLSwwWNQSdddZbqI7M09fMo
	 PAc0OYTE7BXa4Kftsn7eEUSl+YyNY/HgS30I77D0XnrTziJ2KDEEWS+EbTyYTDMyGz
	 drsyYGjVxE4e/KyML5p0h6ShSlbKhfrmLu5Aj443b7viGq0waeiaM7JiqDsy88W3pK
	 YhuDOKJwH3i3w==
Received: by mail.bizovo.pl for <linux-arm-kernel@lists.infradead.org>; Wed,  9 Jul 2025 07:31:04 GMT
Message-ID: <20250709084500-0.1.8v.19c07.0.hpp534t96i@bizovo.pl>
Date: Wed,  9 Jul 2025 07:31:04 GMT
From: "Wiktoria Bielaszka" <wiktoria.bielaszka@bizovo.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Zamro=C5=BCenie_ceny_energii?=
X-Mailer: mail.bizovo.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003216_610826_FEC3213C 
X-CRM114-Status: UNSURE (   1.80  )
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

Dzie=C5=84 dobry,=20

czy planuj=C4=85 Pa=C5=84stwo optymalizacj=C4=99 koszt=C3=B3w energii ele=
ktrycznej w swojej firmie?

Chcieliby=C5=9Bmy przedstawi=C4=87 nasz=C4=85 ofert=C4=99 XPOT, kt=C3=B3r=
a mo=C5=BCe przynie=C5=9B=C4=87 znacz=C4=85ce oszcz=C4=99dno=C5=9Bci. Ju=C5=
=BC od teraz, mog=C4=85 Pa=C5=84stwo uzyska=C4=87 cen=C4=99 ni=C5=BCsz=C4=
=85 o 40,9% w stosunku do obecnej ceny ustawowej.=20

Nasza propozycja obejmuje lata 2025 i 2026, a start wsp=C3=B3=C5=82pracy =
jest mo=C5=BCliwy od zaraz. Gwarantujemy elastyczne warunki umowy (3-6-9-=
12 miesi=C4=99cy), zapewniaj=C4=85c minimum formalno=C5=9Bci.

Jeste=C5=9Bmy pionierem w sprzeda=C5=BCy energii w cenach RDN wed=C5=82ug=
 TGE dla ka=C5=BCdej grupy taryfowej. Przez ca=C5=82y okres trwania umowy=
 zapewniamy Pa=C5=84stwu dedykowanego opiekuna, a ca=C5=82y proces Zmiany=
 Sprzedawcy i wszelkie formalno=C5=9Bci realizujemy za Klient=C3=B3w. =20

Ch=C4=99tnie porozmawiam o tym, jak mo=C5=BCemy wsp=C3=B3lnie zrealizowa=C4=
=87 Pa=C5=84stwa cele energetyczne. Prosz=C4=99 o wiadomo=C5=9B=C4=87 w p=
rzypadku zainteresowania.=20


Z pozdrowieniami
Wiktoria Bielaszka

