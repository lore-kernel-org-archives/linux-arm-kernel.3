Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1242E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 08:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=; b=xNNSEtSy0BnbzCjQtSxphagG2d
	ddCaNnfNATJv4eq0uxcxS2O427JXvpuZRKNCd/uYjfDWXFjAn381BhpcXLvbxBbve1GY17KutSko6
	E5kCBPLz7V4UJf17CJO3t16aeFAyBvKcn/IE4okY/Fo2rDAbl2vBbeASZISZg12pIQIZA5OqrJwAi
	ZR4XGYXRZfkeTZbpMUKKUs5yq9bJ0uZKsLhImPcgXIyrgUaeIcpQiS9i4oZcQKypGD8ilALvw8nAv
	uK8HGTmTTfA2fnmC5enk93Rh8JMZQc96/cFbEa2wyjFtD75dZYPtLmiHyuCB1z1825J+inT33sSen
	QE/K+3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbjM-0000000DUGj-3Ysk;
	Mon, 22 Dec 2025 08:57:28 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbjK-0000000DUG5-3RZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 08:57:27 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id E35EFA5EC2; Mon, 22 Dec 2025 09:55:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1766393761; bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=;
	h=Date:From:To:Subject:From;
	b=DXhYELPVCQUcDbRzavfWuASsbuXSeRHRe4Cjp8ihYBtw3WsMHn2JhpPXxaQz+gs2u
	 Ox8uKU26xLaEh9CCc/wkkdPppvXTC5UoTiJwAJM5qr+5Wx1Modl2aWA9mvz1HFk8GY
	 cUyNUVAtzy0Q3EhJdzpUkdi3j6oyREd5AMbSeY+aKecBfALBi4BgPOgkgiYSL8vsNC
	 n9MAU5xshxiIfhLR3UZKailpiUVVbTD6uAn6tNAjQrINJJIrlUPLGofYwEi/xndzgN
	 GhgCwaG1yUleamuNJFrv0ezclXSe6sOifhF5iGLL2HqCXufkPNTBIJ1nxncBJjc3x4
	 SvK0+Q+xklekA==
Received: by mail.vexro.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 08:55:52 GMT
Message-ID: <20251222084500-0.1.pc.4shx6.0.w6gldrnq76@vexro.pl>
Date: Mon, 22 Dec 2025 08:55:52 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_005727_001547_F28E8EEC 
X-CRM114-Status: UNSURE (   2.99  )
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

czy istnieje mo=C5=BCliwo=C5=9B=C4=87 porozmawiania z Pa=C5=84stwem o wsp=
=C3=B3=C5=82pracy?

Dostarczamy i wdra=C5=BCamy system, kt=C3=B3rego efektem jest obni=C5=BCe=
nie koszt=C3=B3w za paliwo, szybsze pokonywanie tras, skr=C3=B3cenie czas=
u dostaw oraz wi=C4=99ksze bezpiecze=C5=84stwo kierowc=C3=B3w na drodze.

Prosz=C4=99 o kontakt, je=C5=9Bli interesuje Pa=C5=84stwa poznanie mo=C5=BC=
liwo=C5=9Bci lub bezp=C5=82atny test tego typu narz=C4=99dzia.


Pozdrawiam
Adam Drzewiecki

