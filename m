Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEFBC83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 08:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=; b=VGk2Q3bH5DjoJXr1D19N8DVSH/
	7Ts2IiS5uTcajrE60Jw3wux15+1ZVFLz7PyB0inbe5GSBQRTqnHbT7PvSPxwl8ZWi34WlIInYJNpH
	xjwbavkZxlQvpEn9NsEdoG/IPwmTDeaH4HKmcZc99yRr1GVCMEeEFWWqAZRAEgxcda8Bjwc6bgaHo
	YjOyjq6L2A4dyghlAs3XGonUxeL+qIn/YT0dWW/3hiqab5p0tIA0QatrU6T7dpNZcef/Ure4NeAdo
	zOUMgtLuXdRIo3bk4aw688Q8VOnVb5KdI8AHFJtehxJXS5ZWHNoLUtxScU4czOJASkor/CGGe8kCU
	NoBJkPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWskG-00000007b8x-2qyx;
	Wed, 02 Jul 2025 08:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWshw-00000007awG-3IOf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Jul 2025 08:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=; b=JAlRI4xlgxtJVXqS32IvTktL8N
	JJXmDPIn9W0CjitACw6Hl52uAQHSz069G8/vGxFVkcpm4axTJZ4Rp/VvbmjwA1QN7QlulbIPuimGL
	Lyv1ugepgiVdTPPtRdkQcKF4Mn610nDFe3VQU7A9AlmH9rNIDf+tGonFttqiqk5Al3on50djUHVq6
	esSZt2rlzCDlF0xI3hUSACu7o03833tq+gfxNbtSn/drX42knGNuMjC9FjChbVZrp9ifi18ae1pFI
	cmC7VnlmstZBe02wV6/yHljIzf8HGRaxD/te7UPTBBaHJV8N9MjZEiXUUcp8eOCiY+MXhIDZS+1Kq
	S6dEzcHA==;
Received: from mail.growora.pl ([51.254.119.49])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWsht-00000007JPJ-0LQl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 08:20:43 +0000
Received: by mail.growora.pl (Postfix, from userid 1002)
	id 6670324A11; Wed,  2 Jul 2025 10:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growora.pl; s=mail;
	t=1751444160; bh=RSy3akR1+Z0TK1MqUcCTAhuNDshd4oA9g7Cu4aFIABY=;
	h=Date:From:To:Subject:From;
	b=PebstD4rzyC5xbNgiuJcFq8TuHb7iXSuLGVtDGTYwZ9Ecby9HSXhsocgI7wvF1pab
	 CPR0Nb6Gge8WFXuSEwsCRjTT7W6IUrA6A9Kew2lBPTUPMQZ0dWlS9ePD8SX7adB2qm
	 aKH8fFcgG8hjQOwoMVtAWkH5FTupomEDJPqZ44TF45QQaVEH00r9j7rDOO4BmGnaMY
	 tW9xA5slrPA9HHnWWxHywkY2b88OhYanawxVU/WmqrqIky+eDzGb6uBNGhAyWz6ZQK
	 eJnnX9oELR2IJQJv7D0piJhW193C5swEwarjl3eqKexCUbr6Amda6H6p1mN/C5i0Li
	 g/cKpjL93uJGQ==
Received: by mail.growora.pl for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Jul 2025 08:15:13 GMT
Message-ID: <20250702084500-0.1.kd.23o1l.0.i7lw6gtcns@growora.pl>
Date: Wed,  2 Jul 2025 08:15:13 GMT
From: "Mateusz Hopczak" <mateusz.hopczak@growora.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Wsparcie programistyczne - termin spotkania 
X-Mailer: mail.growora.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_092041_602185_C7B88BC5 
X-CRM114-Status: UNSURE (   2.43  )
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

