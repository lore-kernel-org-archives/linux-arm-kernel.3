Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BB1C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 11:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4udjhVtkPvpeQ4By44W9lTmmyaXV2fwWY0xc+9IIdSA=; b=Jll55G7l12J+hGjflBTVJQzUUQ
	m7PGMd4W7K+T3+hEwBhleFdd/r+AkrxgO+GkvbZcgJB6V5h7byeLxbOO2JzLiu6DB4JLkbKM9go21
	ne30LWC4dQ+ahw3pEShPDmrwhVa4k8tSAdtjh4lBK5rM0KA/wvO1oqJqQ1fhiiCH4pKxyb/0UCUui
	dwyS5iAYaiNak8t4grw5rDK5HDaQ9ZrTSHxgtECA1tZkaAQEls4wDAZ4iuOCVdPgRKbtFTW7kIa3Y
	llpyOv5iCegx3l2LmqgzbKnhjnIf7FlU3dIM7W9WgEYqIWXUyRJfZa+wksS/t9rtVc7ZJFDz31hYY
	vMk68VAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFoH-0000000CbHK-1hvv;
	Tue, 05 Aug 2025 11:26:25 +0000
Received: from mail.capitalcraft.pl ([57.129.67.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujFld-0000000Cb7u-3eoM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 11:23:43 +0000
Received: by mail.capitalcraft.pl (Postfix, from userid 1002)
	id 9160D27059; Tue,  5 Aug 2025 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=capitalcraft.pl;
	s=mail; t=1754379969;
	bh=4udjhVtkPvpeQ4By44W9lTmmyaXV2fwWY0xc+9IIdSA=;
	h=Date:From:To:Subject:From;
	b=YlkG2QajLJOYyXuLOMlNgK6MUVxvFTgnD60fKWUT0tX7wPzvdRq0QAq33bqKc6IKn
	 ybaPhnTD9G1G3MZ8+s8IRtpuMu7RnYcEw5ERRt+0Inq3PwO/f3KszjQpcHN6NoAtXF
	 2vZTRt/RGIzkep8FG5GW99MK5UmCFjtrkKYd+uKtZqbiPsTXN+QRYivyEU2CDQZf4S
	 1a2HqCQM7Zba8ZJxHFiKw9NWdPOThCfo1iSHaywnam9QMIMAaNIOQ7nKlXuTvw61I5
	 veXByu/79ICanYeZCtb+jKGvMRg9xZjTeuiDxyuaJ3XBOIe/mUGBXh5ua1Zz00SmXa
	 JAwQ9hsYa20rQ==
Received: by mail.capitalcraft.pl for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 07:46:05 GMT
Message-ID: <20250805064500-0.1.3u.s6xd.0.osoop4q42r@capitalcraft.pl>
Date: Tue,  5 Aug 2025 07:46:05 GMT
From: "Karolina Dylkiewicz" <karolina.dylkiewicz@capitalcraft.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Prawo pracy - zmiany 
X-Mailer: mail.capitalcraft.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_042342_207381_C0D600FD 
X-CRM114-Status: UNSURE (   2.80  )
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

obs=C5=82uga prawna w zakresie prawa pracy to nie tylko dba=C5=82o=C5=9B=C4=
=87 o dokumenty i zgodno=C5=9B=C4=87 z przepisami. To przede wszystkim re=
alne wsparcie w codziennym funkcjonowaniu firmy i bezpiecze=C5=84stwo org=
anizacyjne.

W ramach wsp=C3=B3=C5=82pracy oferujemy m.in.:
=E2=80=A2 przygotowywanie i negocjowanie um=C3=B3w oraz kontrakt=C3=B3w,
=E2=80=A2 wsparcie przy zatrudnianiu i legalizacji pracy cudzoziemc=C3=B3=
w,
=E2=80=A2 doradztwo w procesach restrukturyzacyjnych,
=E2=80=A2 przeprowadzanie audyt=C3=B3w prawno-pracowniczych (due diligenc=
e),
=E2=80=A2 reprezentacj=C4=99 w sporach z ZUS oraz pracownikami.

Dzi=C4=99ki wieloletniemu do=C5=9Bwiadczeniu w obs=C5=82udze firm z podob=
nej bran=C5=BCy rozumiemy Pa=C5=84stwa potrzeby i proponujemy rozwi=C4=85=
zania dopasowane do rzeczywistych wyzwa=C5=84 biznesowych.

Z przyjemno=C5=9Bci=C4=85 przedstawi=C4=99 szczeg=C3=B3=C5=82y =E2=80=93 =
czy znajd=C4=85 Pa=C5=84stwo chwil=C4=99 na rozmow=C4=99 lub spotkanie?


Pozdrawiam
Karolina Dylkiewicz

