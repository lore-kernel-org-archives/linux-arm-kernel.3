Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86BBEB48E8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=; b=a1MdyFmwMcf4yurcVMgaLNprel
	LI/EzcvUhVUws/JxtL3WAV2XdKum1v/mT8+zkAJ2iszTjimSLO5w0h+LS5z0zHSnbk7ps+8E+WbAf
	46d0xNj4Sjb51IXrUXcKaxZGMMXQGeASbpJho4lX/WVgfmjZ8z0gMphJ1Tz/WtuTarpR2fxAxEKYN
	GeLaQdQClryBAr+/MWGlJPvEBo2UuX84KH32Mb2GfhG+0wrx7y/nnQKva4yQ470bMRn/VktRRRgYE
	Kqk4ConKVKyosp/khhb3o0JsdJFFDJqGaXgCCWbqwFT2pJY8ABSCFQ3lnjvIAWPTzBEfIaOFb7ZTJ
	PMz6F30A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSW2-00000001n69-2qIw;
	Thu, 12 Feb 2026 08:57:38 +0000
Received: from mail.venturex.pl ([141.95.86.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqSVy-00000001n4V-33TP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 08:57:36 +0000
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id DE3B9245D5; Thu, 12 Feb 2026 09:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1770886650; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=DGAqiXwslLFIC9NwSohr0H3fV+H9fWYlzgEe+NRTu+iTeH3XNlAsYUgcbEjjF5E6d
	 dKrZJvUFgA9BQvTsuUGcxRFENENWQeruww9o0d7hSMO2o7o+YKI7C3WN4OxJRejYnb
	 rd9E6TSd0AAM6SVdeWsDCgSVZmQ+vf8JkfBY7uSz0QBEZtIHfNb0ZXomx/T2yXpxbt
	 Rm3nyAMwiPEra+cRNnCZ1+CegmP7qDFafyJNhdyoanRaJuur6m/XyeOi+1s4fuhonk
	 NeySwyajKFB9e4X5/DGdul83VAkRJzHNL/7Q+pj/jUR609rZjBp+V0Ipj9bAXtbcu9
	 9IBNepOEK9pUA==
Received: by mail.venturex.pl for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Feb 2026 08:55:59 GMT
Message-ID: <20260212084500-0.1.cn.2mjyh.0.a6aw24bh72@venturex.pl>
Date: Thu, 12 Feb 2026 08:55:59 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_005734_919748_A41FEA9D 
X-CRM114-Status: UNSURE (   2.58  )
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

czy byliby Pa=C5=84stwo zainteresowani rozmow=C4=85 o mo=C5=BCliwych rozw=
i=C4=85zaniach dla swojej firmy i rodziny?

Nowelizacja ustawy o Fundacjach Rodzinnych otwiera przed przedsi=C4=99bio=
rcami zupe=C5=82nie nowe mo=C5=BCliwo=C5=9Bci ochrony maj=C4=85tku i plan=
owania sukcesji. Fundacja Rodzinna pozwala oddzieli=C4=87 aktywa od ryzyk=
 biznesowych, prawnych i podatkowych, a jednocze=C5=9Bnie zachowa=C4=87 k=
ontrol=C4=99 nad swoim maj=C4=85tkiem i zadba=C4=87 o jego trwa=C5=82o=C5=
=9B=C4=87 dla kolejnych pokole=C5=84.

Co istotne, po up=C5=82ywie 10 lat od wniesienia aktyw=C3=B3w do fundacji=
, roszczenia o zachowek przestaj=C4=85 obowi=C4=85zywa=C4=87. Ustawodawca=
 przewidzia=C5=82 r=C3=B3wnie=C5=BC liczne zwolnienia podatkowe obejmuj=C4=
=85ce m.in. dochody z dzia=C5=82alno=C5=9Bci gospodarczej czy wynajem nie=
ruchomo=C5=9Bci.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99, czy chcieliby Pa=C5=84s=
two pozna=C4=87 mo=C5=BCliwo=C5=9B=C4=87 stworzenia Fundacji Rodzinnej?


Pozdrawiam
Miko=C5=82aj Rak

