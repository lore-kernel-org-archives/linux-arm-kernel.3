Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD827C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 07:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X+wkoA4YOELW9s6cx2H1FfY99BwZ9fmdzIT3K0wvljE=; b=sQWEO0w2Xais3yvS2LUQoHjSb7
	V2d6evdvr3xo6vgswf0gVSuJPP/wHTyvx8z4hs+Npee9J2Z5yW2K1JKONkE1wZyHLKOUggTP36IdZ
	vUBsglnY0ltTkpLN98FGJMCUqBOV4u2PTauwVz9lBO9ImepFuoNmowmynhL4JELTC2zZUqJR5uOb8
	qkqFyVfEC7EDsl5HeFwJjCVfC0t8sCMaPLv0ppq+2uuCGd7TKMe/p1OAjl3pAejSsBMdCVZSzwNUq
	jfVlI5Fdu1mXj6C0v+ym/4WXCMhMYUJHRCCCOhA7z1+48UxYENXLtPoqlraaMk/2d4L8avYckT1JU
	DM+uK8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY5V-0000000FDFC-0Z0f;
	Thu, 29 May 2025 07:54:05 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY3L-0000000FCyi-2bR7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 07:51:53 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id A686623A56; Thu, 29 May 2025 09:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1748505073; bh=X+wkoA4YOELW9s6cx2H1FfY99BwZ9fmdzIT3K0wvljE=;
	h=Date:From:To:Subject:From;
	b=h67vH4d0aIp5GZJe9LZ0CcymPsn2e8IDLjwZx+XbWk3Ub5A6hCG+FgpAL4Cf5mhMa
	 H/We/ZIYHk/gJTrD/pZnmEYTJsLUahQ1fwdkV61dx+K9UYgDJdmitT0P6Gc4NqB2em
	 tlLCc0Oy7tDrXKP+gOjUikxqiDr2QM+mnbfgqLmE6LvWG/4YtPhObhg9lw0knhz/3R
	 mN399eXvPimVmuelwlP2CbHN/TWA4+K5Ru8lRTbTksw3NHKbhYUOQejEuSbP7H5Nq4
	 KYvd0XzXiFO1PBtb2ef9VSh2s5pV6enW8VV7yW+PzIhflxNo+RbHNnuwQgsygXhdwh
	 w6dn3XydYVaxA==
Received: by mail.scalenook.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 07:51:03 GMT
Message-ID: <20250529084500-0.1.gx.221iz.0.sbujfqkn8w@scalenook.pl>
Date: Thu, 29 May 2025 07:51:03 GMT
From: "Renata Nowacka" <renata.nowacka@scalenook.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_005152_347760_41B21DFB 
X-CRM114-Status: UNSURE (   1.46  )
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

chcia=C5=82abym wskaza=C4=87 Pa=C5=84stwu mo=C5=BCliwo=C5=9B=C4=87 zarz=C4=
=85dzania benefitami w =C5=82atwy spos=C3=B3b, poprzez nasze intuicyjne n=
arz=C4=99dzie, jakim jest karta lunchowa.=20

Nasze karty oferuj=C4=85 wygod=C4=99, oszcz=C4=99dno=C5=9Bci i zdrowe wyb=
ory =C5=BCywieniowe. Dofinansowanie posi=C5=82k=C3=B3w jest korzystne dla=
 obu stron. Karty lunch to dla pracodawcy realne oszcz=C4=99dno=C5=9Bci w=
 postaci zwolnienia z ZUS do 450 z=C5=82 miesi=C4=99cznie na pracownika.=20

Kart=C4=99 mo=C5=BCna do=C5=82adowa=C4=87 dowoln=C4=85 kwot=C4=85, a niew=
ykorzystane =C5=9Brodki nie przepadaj=C4=85, lecz przechodz=C4=85 na kole=
jny miesi=C4=85c.=20

Mog=C4=99 przedstawi=C4=87 ofert=C4=99, kt=C3=B3ra pozwoli zoptymalizowa=C4=
=87 koszty i zapewni=C4=87 pracownikom po=C5=BC=C4=85dany benefit?


Pozdrawiam
Renata Nowacka

