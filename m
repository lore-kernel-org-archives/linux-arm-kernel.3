Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CFCC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=; b=FQoKzABj4XILf5O3Ia872zyA8e
	CJBje88WZxbpmU/JzzRayiApyJfzYE4UOYh5yZsZ1CfF4toR+Do4R8707XFp7qESEtaB3NudTmeUm
	EUjJUv+InfMktbuT5tk6TmS3f8vQqJzSUGIPZXU1uj8vOpUDmZWso0KOX3MlHgjP8ElveK6MYuzbq
	ymRT4XaWUy6AqdK/WxCq3vrs5XckA1vWJ7RIIfWRTCQh/ueD0l3jOgFvGD/hlh4AKs8dGwPSfqxTG
	P0EHE00c7OZu2cXhIrngHxhqX/89ZrRoGGnXtxUsGpISi9LE8yYZa962TOCG1wa5t3LVqsuATIhD6
	LBCCuNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udl75-0000000GVtE-14eR;
	Mon, 21 Jul 2025 07:39:07 +0000
Received: from mail.growora.pl ([51.254.119.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udl4e-0000000GVOE-1jya
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 07:36:37 +0000
Received: by mail.growora.pl (Postfix, from userid 1002)
	id C7FB522DFC; Mon, 21 Jul 2025 09:36:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growora.pl; s=mail;
	t=1753083394; bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=;
	h=Date:From:To:Subject:From;
	b=Ku7Y7JcSIodBrvMuEasOGhCd8c9QeoEUil/k6k7c9Qw/VmLVRlZaZHi9UhXNWGy6s
	 E5192Bis8rypNjZykNCFUAMDJSkCKSb79u87KhCIfPbqr6v4desu2SOjvJmJJVGZcD
	 iB57JXrFrnnh0yZMfL7+vikmh5vpore1RrnUK+VZZY40nAjI+oYuOsJ01cAxcthGwL
	 8sUWTS4EkInJ4cchCg4E27oLb0ZA9uW61E3VowyXEhdNIG6ZpaA3cl21GtSqyMmexL
	 qV0PZxaGcj80/l0gae1xb1CCZmHcD9qR1mgqq3A2EVsPi5DE9DCzRvu2JvQ4Dp3sIM
	 QUNIC0+LGZDqg==
Received: by mail.growora.pl for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 07:35:59 GMT
Message-ID: <20250721084500-0.1.kq.29q70.0.6ji9q5np19@growora.pl>
Date: Mon, 21 Jul 2025 07:35:59 GMT
From: "Mateusz Hopczak" <mateusz.hopczak@growora.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Wsparcie programistyczne - termin spotkania 
X-Mailer: mail.growora.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_003636_597103_00FB188F 
X-CRM114-Status: UNSURE (   1.98  )
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

