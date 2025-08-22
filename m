Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6748CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=dYmWBq3+6O024v1gabBSWLYWPX
	i7WFypDscs7QhNqJhR4d6KorDJhQ5PWAu0282caUP1G3bg+xfgAwNmOC60ywC9JEI/QO7o7NDM++I
	ohaEGQx/b692ijr5voTohDUcDvn1AFFJEnGNhqnJj9aDtJ9hXg4J6TteHa0z4dtVMLa/H8np5pKYD
	R2zh6wCtiNAE8ItdIh7d/3tGFxTmr2o+k0liC1ZBkE97su6uP5F+ebeWSB/tnOO+WgJYvvacFMzjQ
	saJmzhWnBJ58GGtmfFJ8BJuX7b1QHftkk5nDB56lha1xGqIoKZrbO1g6mF2ZcOfVnPWBjaUFR3XSo
	TuluGoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSci-00000002mkf-03dE;
	Fri, 22 Aug 2025 14:20:08 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upMuu-00000001uMO-1L9s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 08:14:33 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id C891A4F919; Fri, 22 Aug 2025 10:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1755850354; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=IimTwgHgA0QjZSGXp6IGdm5fjLRp7ZyjU0arBGUxEITpkeC7vXqj3e0Q+4lqcTpZE
	 Iid5yv9kmNx+7VL20QimvzOGAJf/C52B02gr3D6AM0Tr8I870DsPhCf4yGcZd+QhMT
	 9D/dHgi1On5FjcfWvQgyPp5LsliAsEGX/u4Ydb/KxY7G+LnIQ1sgHdUQanISUv5NCI
	 xu8g8dxa3X9jmxw4RlMXX+3Ji0SJ5QDpUTHeD7L6ZlHTUw6X/gIJv4bAd+o8ziXvLd
	 1+PiUFZ1to51xqzw0srtjRMXRNiXmTpep4XzkQrZvWGJ9IyYKCWwXpNYHxKw6HTlcg
	 wLmtrXuUI0IAw==
Received: by mail.fintara.pl for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 08:11:05 GMT
Message-ID: <20250822084500-0.1.bf.39y31.0.n7n1jffpel@fintara.pl>
Date: Fri, 22 Aug 2025 08:11:05 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_011432_495529_909AD51D 
X-CRM114-Status: UNSURE (   1.89  )
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

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Pozdrawiam
Dominik Lotka

