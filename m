Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F284BC83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=; b=QDKVGj+N+NoV4ps9mz2VEo6YUv
	hu91xzUFD0Z6CcN6SNVuob3atYaa+4L8z6WPwWjEr62ImTfmTmg4Sre/1lDlq5f36PYxqIPSqK+hw
	Cijgs0/p3iijAQTjC3O6iETg/oMmDUXOcZ3n78mnqSeRFHM7zZ37Nk8O3WTTt4RNMvoHJkP2WC4Wk
	GjDTFCQyj3MspoG0lYLwXShPK45LNKIIoL5Eego7jA2Vf8E2kk3RGMJs2M9jLTToAZJq6Wl/jfidp
	MQfbXq/PNMFiCLfvmISe/PUWl8EK1LR2wWTGhoSXzRK9735HBsxRwrzFxeGCICykUSE3igbVQX92K
	4VwYioWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnWT-0000000BKqN-1hXa;
	Thu, 10 Jul 2025 09:24:57 +0000
Received: from mail.growora.pl ([51.254.119.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlys-0000000B3yc-1vK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:46:12 +0000
Received: by mail.growora.pl (Postfix, from userid 1002)
	id 68FF92448E; Thu, 10 Jul 2025 09:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growora.pl; s=mail;
	t=1752133564; bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=;
	h=Date:From:To:Subject:From;
	b=WCX2HD3XzYVmwl/Mb0VNGinNfEYKzkY5jEa4+H+nbMrykqN0ObsuTfPOVZWmZcqtt
	 /ZU9PplvqbcgJ8skD/y1eDtnhQaSek6TRH2/X/6rLr2qJnR7ocXqgL+fEdAvsnLbYy
	 +D0bBDymhmkznLVHBcF0Y8UbZJFNwL6sVfxF0cTWdbonH/9NniBrHoqC1rqEGmObsP
	 JJyk3wfgOxt3FjX+vBnalmF8SeMo1ju7+QCjUZzvTg0rxX+s6gdgO3YklY6rn2GboN
	 KKz/fHvxJe9OeWwCPlThBLGz1p6PGydEWIiMYa5rst5Y8uWjYQWFpo3lrcSbmM9t2T
	 Za6GM07fyhb3Q==
Received: by mail.growora.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:45:18 GMT
Message-ID: <20250710084500-0.1.kj.26cek.0.4mmq3bs5t7@growora.pl>
Date: Thu, 10 Jul 2025 07:45:18 GMT
From: "Mateusz Hopczak" <mateusz.hopczak@growora.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Wsparcie programistyczne - termin spotkania 
X-Mailer: mail.growora.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_004611_199446_AB34C3C5 
X-CRM114-Status: UNSURE (   1.73  )
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

czy w Pa=C5=84stwa firmie rozwa=C5=BCaj=C4=85 Pa=C5=84stwo rozw=C3=B3j no=
wego oprogramowania lub potrzebuj=C4=85 zaufanego zespo=C5=82u, kt=C3=B3r=
y przejmie odpowiedzialno=C5=9B=C4=87 za stron=C4=99 technologiczn=C4=85 =
projektu?

Jeste=C5=9Bmy butikowym software housem z 20-osobowym zespo=C5=82em in=C5=
=BCynier=C3=B3w. Specjalizujemy si=C4=99 w projektach high-tech i deeptec=
h =E2=80=93 od zaawansowanych system=C3=B3w AI/ML, przez blockchain i IoT=
, a=C5=BC po aplikacje mobilne, webowe i symulacyjne (m.in. Unreal Engine=
).

Wspieramy firmy technologiczne oraz startupy na r=C3=B3=C5=BCnych etapach=
: od koncepcji, przez development, po skalowanie i optymalizacj=C4=99. Dz=
ia=C5=82amy elastycznie =E2=80=93 jako partnerzy, podwykonawcy lub ventur=
e builderzy.

Je=C5=9Bli szukaj=C4=85 Pa=C5=84stwo zespo=C5=82u, kt=C3=B3ry rozumie z=C5=
=82o=C5=BCono=C5=9B=C4=87 projekt=C3=B3w i wnosi realn=C4=85 warto=C5=9B=C4=
=87 technologiczn=C4=85 =E2=80=93 ch=C4=99tnie porozmawiamy.

Czy mogliby=C5=9Bmy um=C3=B3wi=C4=87 si=C4=99 na kr=C3=B3tk=C4=85 rozmow=C4=
=99, by sprawdzi=C4=87 potencja=C5=82 wsp=C3=B3=C5=82pracy?


Z pozdrowieniami
Mateusz Hopczak

