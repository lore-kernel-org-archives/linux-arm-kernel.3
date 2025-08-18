Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D531CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fJxmVZcQLhgd/yVaIJIP34roXzYWeJwZiiLAQ+Lkc7w=; b=eEwIgyTet0a4BifdPNPGxGrRRV
	d2cexu+piTQFDT6fZbFTDaTw04zzb3QxrzwBIiR/7jrNYKAoFBW1roCIpr86s25v7oC/5hKmQR8vW
	LLhlyho1VO9d6vfmL/itYCv9mPQ5HoyzxN8PjGKL+chLCnZP3e7tWaDqTeCmpa7KecALjjrTa4mX4
	V6fQAS8KGGrfOCgP9jhRiM3idkpZ0Jz0v9pq/JS+f8ls89Ex5Mk+ux9AfYV0z47Ad2PtVVpz4AqNP
	SCrsj2XFJT/lyf06dNXG8i7PqXI+E+fEabWx2tWJqKJSuVQDHdIMCh/GkO+z/08Os+3dYUtOJgI2e
	EA2W3cfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo011-00000007T2v-1EWB;
	Mon, 18 Aug 2025 13:35:11 +0000
Received: from mail.firmato.pl ([51.83.134.251])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unudM-00000006owM-2QeK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 07:50:25 +0000
Received: by mail.firmato.pl (Postfix, from userid 1002)
	id A198E24D61; Mon, 18 Aug 2025 09:46:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firmato.pl; s=mail;
	t=1755503291; bh=fJxmVZcQLhgd/yVaIJIP34roXzYWeJwZiiLAQ+Lkc7w=;
	h=Date:From:To:Subject:From;
	b=xccADN0yttLBgdXTwveq4ag3ltxwRzGc6Jal1rQ+G4OmxhKofKjkmUlfejCvwrBBw
	 hk/iz9hN3myrRWLiTZwsVxMk4LWxC6yUkkxbP5m7UooxZB0dt+TqiZcXV0CzLMDz9N
	 qrqmghDL61Nb+bsEv7Ni0whpbNGBwxx84K9BH/DhPqoBHSXuZwd8V7GxqXq+DowfoM
	 SlBuq7AGRA7Knb7BN2WPsPToy/66r11Nv1oKBzKPWSoahT0LzbCXV4jpCy+HO2y3YH
	 wTDpE1HXISyAJFRHVIFZZerOjesAITbwkY5z9YWbceKcy9fks799i2XhyTt6NTB5b4
	 a773jrGql3VXQ==
Received: by mail.firmato.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 07:45:39 GMT
Message-ID: <20250818084500-0.1.k3.2j9kh.0.d2487ncbkq@firmato.pl>
Date: Mon, 18 Aug 2025 07:45:39 GMT
From: "Dawid Zubiel" <dawid.zubiel@firmato.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.firmato.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_005024_905478_791AA06A 
X-CRM114-Status: UNSURE (   1.63  )
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
Dawid Zubiel

