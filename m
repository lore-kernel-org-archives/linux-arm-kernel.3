Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EA2CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=; b=EPXXaK/5rdbbVXefTydpHQLvyJ
	5A4Fg1/KBWi5Mzpfvv3cDcApKWH2XlF5s9np7p6GthJuDKe1U4BdqwigyJ+r+VVmauu6P7IqUS45l
	SuwSjO2rL1TmI9aEF52uC2iXuRft8X9VOLGSYnCkNeFm88mUHivxwRhoPKJselec2uk7/YQ72v/Dj
	f+CnX9RBL+QMZFSMfhSstjGpPC4J7qr3CFjWT9gaeX75Iqelrz62TbsitfyDoBuUj5N/6UbrIvqnI
	iecrT4iRKmSxZbZbaUvhkQUI0VvjwYDTVpMuXvvoblkVTxeCZLWh3EjmmIKVt8ZfQV2fdj7GqMOvH
	M9BPEcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71I-0000000G6hV-0xTy;
	Tue, 21 Oct 2025 07:43:00 +0000
Received: from mail.zynotix.com ([79.137.80.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB71F-0000000G6gD-3t2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:42:59 +0000
Received: by mail.zynotix.com (Postfix, from userid 1002)
	id 2C54925222; Tue, 21 Oct 2025 09:41:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zynotix.com; s=mail;
	t=1761032501; bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=;
	h=Date:From:To:Subject:From;
	b=KRxGv3URZV0H73/VEoTxCojft2+P14BlYjqCWNVK+zpk/YCtmxTjBh24MouCwx4Nb
	 dZTdlPIuuaAFiFGRmcS2bUuzNs3FVCK+NpE8fqNtRYYrD6bjb9dQD5aVVvW+9UAWNK
	 KsmHSCnZd6UD/WEdY5/7kHGjCkKI+DcONXWZaDEn2XaiogG0/sWFsQjo53BZ9D6H1n
	 7X3Hx574dg7XIQltUAzaUnp96Obf6zAqxgjbIVL6cXk5XMcqt58Xb97Gkp6Kx+XU8U
	 LrvzvIV0gMr0HU0ekP59Tkm3uu5iZ+sbpZqPhWODQTKJ8sTimXUHz7qgn1ggFvnEsT
	 Nk7A1d6mcfKCg==
Received: by mail.zynotix.com for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:40:46 GMT
Message-ID: <20251021084501-0.1.ck.un93.0.jw8op9jyvk@zynotix.com>
Date: Tue, 21 Oct 2025 07:40:46 GMT
From: =?UTF-8?Q?"Magdalena_Ko=C5=82adczyk"?= <magdalena.koladczyk@zynotix.com>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Informacja_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.zynotix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004258_106530_1E24ECB7 
X-CRM114-Status: UNSURE (   1.51  )
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

prowadz=C4=99 biuro ksi=C4=99gowe, kt=C3=B3re specjalizuje si=C4=99 w obs=
=C5=82udze biznesu Pa=C5=84stwa formatu.

Wraz z zespo=C5=82em zapewniamy wsparcie, kt=C3=B3re wykracza daleko poza=
 samo przygotowanie rozlicze=C5=84 i procesowanie dokumentacji.

Redukujemy do minimum czas i =C5=9Brodki, jakie nasi Klienci przeznaczaj=C4=
=85 na obs=C5=82ug=C4=99 finansowo-ksi=C4=99gow=C4=85 i kadrowo-p=C5=82ac=
ow=C4=85.=20

Z racji mojego do=C5=9Bwiadczenia przy wsp=C3=B3=C5=82pracy z firmami o t=
akim rodzaju dzia=C5=82alno=C5=9Bci, chcia=C5=82abym przedstawi=C4=87 kil=
ka warto=C5=9Bciowych i sprawdzonych rozwi=C4=85za=C5=84.

Czy mo=C5=BCemy porozmawia=C4=87 o obs=C5=82udze Pa=C5=84stwa firmy?

Pozdrawiam
Magdalena Ko=C5=82adczyk

