Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683AAC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 07:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=; b=339sjgYtXYkIBq4+3drtrIN5yr
	b0Q/FN0mOnoftzd2sjIxhFgeKZJz/1Le3EX0Wtl0/mA7VOGManD0kB4UFn86eDU+LgdxlRgrxhr+p
	4OcWrD2n3iZHiLsBH+MWIRZjGu7xjMZKQyphQqchjXgdmiBw0rmZ+LJ2cfaMN8YriiGUAkQtFpVzy
	lkRcKq1OAeywACQsQIjegnUPFX3oWfdaxmssEcQRcZcQ9klrXPDjO7CxFHCEDzY9FrYtoGm4c7gl1
	m768kW1j1ep2VtFrx0cxVMt/RVhgJalU00ivCB3FsE6pXwTSgC4Gz+S9S+BTAJ01AsLLnQAJrCI0c
	9yrfaDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiq04-00000009rgx-0Pnc;
	Mon, 04 Aug 2025 07:52:52 +0000
Received: from mail.quantro.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipxU-00000009rOq-48cT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 07:50:14 +0000
Received: by mail.quantro.pl (Postfix, from userid 1002)
	id 92FA124A09; Mon,  4 Aug 2025 09:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quantro.pl; s=mail;
	t=1754293456; bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=;
	h=Date:From:To:Subject:From;
	b=r93TbHxV5g/0uk0wR0uDrHR73gvYfae2gLFaK4/uALLhN2ALN7Pywp9Ug8dcGF50O
	 76g60ffjhI1dr6fDU2nGHobylj0M+qFldPOgv8826MY/Q5HMPu752GvRlw1FHnt1qE
	 bJ8n0RrlLr2N5ucsxfQBmYWYzbnKaXLi0bzcAlnvznNkjqg3UyTJNl/GNqTXWDtEzR
	 Yjv91du9UDzuQuvTtbgzJ4MusLEMooBgtdyBLDPDSoNGVQF5ifOz78XlKe5uwiXO8n
	 cr4NmEFYDL3lOdaTU8Q0HbxWfGuG0oAddrs50nfYM3q3AUGgMoCxcrcdbNhJAZ1X3C
	 2iO4Fj/XgKK5w==
Received: by mail.quantro.pl for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Aug 2025 07:40:55 GMT
Message-ID: <20250804084501-0.1.j5.633dm.0.x04n0nzh3m@quantro.pl>
Date: Mon,  4 Aug 2025 07:40:55 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@quantro.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.quantro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_005013_301030_CEDF5028 
X-CRM114-Status: UNSURE (   1.96  )
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

czy zastanawiali si=C4=99 Pa=C5=84stwo, jak zwi=C4=99kszy=C4=87 zadowolen=
ie pracownik=C3=B3w i jednocze=C5=9Bnie zaoszcz=C4=99dzi=C4=87 na kosztac=
h zatrudnienia?=20

Obecnie jest mo=C5=BCliwo=C5=9B=C4=87 zwolnienia z op=C5=82at ZUS a=C5=BC=
 do 450 z=C5=82 miesi=C4=99cznie na ka=C5=BCdego pracownika poprzez dofin=
ansowanie posi=C5=82k=C3=B3w.=20

Za pomoc=C4=85 karty lunch pracownicy mog=C4=85 p=C5=82aci=C4=87 w restau=
racjach, zamawia=C4=87 jedzenie online, korzysta=C4=87 z cateringu czy ro=
bi=C4=87 zakupy spo=C5=BCywcze. To doskona=C5=82e narz=C4=99dzie motywacy=
jne, kt=C3=B3re tak=C5=BCe wyr=C3=B3=C5=BCnia firm=C4=99 na rynku pracy.

Ch=C4=99tnie opowiem wi=C4=99cej na ten temat, czy mogliby=C5=9Bmy porozm=
awia=C4=87 w najbli=C5=BCszym czasie?


Pozdrawiam
Ewelina Koprowska
Senior HR Manager

