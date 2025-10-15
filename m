Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC576CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wi1EwQo/dG68GeDrjYwpMT11dLZoRMkzwMdoXACjbmg=; b=IRc7c4x2y5OAxsiePqGpFHy6lN
	Kkq+5tOfcYRhw88InXtEZwA4cAdm+xCo6cOYCVKJEQ3P5pet8sQXL3VThLyX/+N7laUq9zZWUfKvu
	vKeaupq3eCMiGT1lDIvCtLdixV6qibrv+XM2I9w1ZWy89ohP0Hhkotf1u9YhrWyZ9o+MMEdHaaF7j
	vUt0dxcHhQj+gAT+3kk/hJR8T0DXSJGqPvMSLqnVMvJLvAWLF+x1yGwTQmBJM2ahqn5tsqtkYhgCC
	rQdISdUEk4YUz1WqFjQI41bRnjBUVJ+nKc3/kcLcu5sTGM1w30ZyTgH/6JucvyX4NxS/RA+jiRIJ1
	6DUIdfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wPY-00000000qMK-3zLR;
	Wed, 15 Oct 2025 07:59:04 +0000
Received: from mail.bizial.pl ([141.94.21.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8wPW-00000000qLI-3lZa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 07:59:04 +0000
Received: by mail.bizial.pl (Postfix, from userid 1002)
	id 71B03237FC; Wed, 15 Oct 2025 09:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizial.pl; s=mail;
	t=1760515138; bh=Wi1EwQo/dG68GeDrjYwpMT11dLZoRMkzwMdoXACjbmg=;
	h=Date:From:To:Subject:From;
	b=JgRGUMZVW+0reXBGlslJ2dimGmIs5P0ITSZ8UV8O+A6hAtG/cVabkmZtkOoc3IBRO
	 UD5O7gkYvLaBs4lO2nxwW3GpAsXEfsXcV3wHkrP968itD/5KwhIp74jICIvav5xmyn
	 MO5Ibx8lMk5+ktKEZh/bLfxsAd3pOx2/wQYMD3tK9s9OzNaEHvcfUXLRZTZYQIYjYb
	 9ISeEmOH1aAsn1aS1d/yATiN8/iQ7UNlSiIf2qjIzq9O0RjXcQfLJdrSv8BGYqlOIV
	 ZVGM0Uo57jsKefXNojqNQOKJFDImvzNfNrv+Q8TsyeGDp/x4Ve+iEYGYjb1adjwTo5
	 CqoMHejulGAoA==
Received: by mail.bizial.pl for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:56:05 GMT
Message-ID: <20251015084500-0.1.be.26gmv.0.orj5wtenkt@bizial.pl>
Date: Wed, 15 Oct 2025 07:56:05 GMT
From: "Kamil Lasek" <kamil.lasek@bizial.pl>
To: <linux-arm-kernel@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.bizial.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_005903_222828_6E839A2B 
X-CRM114-Status: UNSURE (   1.89  )
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

pomagamy mikro, ma=C5=82ym i =C5=9Brednim przedsi=C4=99biorstwom obni=C5=BC=
y=C4=87 koszty energii elektrycznej dzi=C4=99ki monta=C5=BCowi instalacji=
 fotowoltaicznej.=20

Aktualnie proponujemy bezkonkurencyjne warunki wsp=C3=B3=C5=82pracy, od p=
lanu poprzez realizacj=C4=99 a=C5=BC po serwis.

Prosz=C4=99 o informacj=C4=99 czy mo=C5=BCemy przedstawi=C4=87 propozycje=
 dla Pa=C5=84stwa firmy?


Pozdrawiam
Kamil Lasek

