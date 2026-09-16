Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E676C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OPwWv4AfwkFq39V089XU003s80IMC0/zFIA+U93f5M=; b=ybIvDhNXpyNiP+iRxnuuredhni
	XcI4OgoXTIwaE+1BHG47G+Yj3a7yejVkvqy/0DMm6PYbMl56Pv2juo5dzhwh/WZvyJwE94e+Y33Ao
	5KbnVeC6xicjxZLrknT9XZfQZ9IGV7EPF4s075nt/47AkZQIqcGqL5XHiOUkRlLOvXoJoupjAX048
	wl8ao4gcu2GAOqxWSWY2lKMnFRq5r4SgLhxKLTHYPW7qXwEBbj1a9sWQ/DViSQH/xQypaxqiySQul
	6wSJEkqbu7yo7fbsZ3piRoFSMa7Oge0KIz4KpgAEmS2ILf1lj9MaGKZ1292oG9EmftoLm9t9Djwak
	iXhU2pNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lDq-00000008juL-3pLi;
	Wed, 16 Sep 2026 08:42:30 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lDn-00000008jtS-1f0P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:42:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D8B54E40664;
	Wed, 16 Sep 2026 08:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CFC560337;
	Wed, 16 Sep 2026 08:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 877B111C7B017;
	Wed, 16 Sep 2026 10:42:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789548141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4OPwWv4AfwkFq39V089XU003s80IMC0/zFIA+U93f5M=;
	b=Bpdc10DatMCnwRbwWi8+UBAKw5prouFsN7Ih4oZn9tpTkxd1Xo9qwCeNt5IlSyEM0FjOI1
	SmDKqNyoh/ojJFIIqS8h1uVlzEUIBOLowUiFwBi6MIohK/fjulTIsHObpvIi+43OOd2GUz
	3OA9r+t62na8+V0y6vStdwj5HsDr8K9mmPVu27YVhzYJsvZOgtV1tiDdiG/HRh5wysP2SO
	d6rOn5KzmGq80iBCShgb+C8ZqS31sh9/4jxx8lgTlDX78vkkEPt3NaJ1NqUDsqo333AJLr
	WlSWR85JhAXyfBFu4mRVVOHdYATZySwkkk/dCiRj2lp2RqFbDgcr9yWjdTwAYQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260813092836.38367-2-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
 <20260813092836.38367-2-francesco@dolcini.it>
Date: Wed, 16 Sep 2026 10:42:13 +0200
Message-Id: <178954813308.214898.387135284303615232.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_014227_580551_73C25EC5 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, 13 Aug 2026 11:28:31 +0200, Francesco Dolcini <francesco@dolcini.it> wrote:
> The DPI output of the LCD interface can be configured with a bus width
> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> endpoint, specifying the number of parallel RGB bits connected.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


