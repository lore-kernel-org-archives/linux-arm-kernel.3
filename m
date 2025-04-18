Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD2BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eSJm/Npzu3mJaqKFf4E2O8Iq0yp1wSbzpO1gR+fotM=; b=kMUUyD5wmw+6KreC/s7tr3AxKt
	ffxrw3i9n+D0i5ykRDs7iUGGyIOrWrd5sJfkI4VMsrWoZW19utiDvwue1Z+3e/1r607xPGV63fVfl
	bzE4aICoav68JfdlUIbpVJCKkX8tmlmLcU0toQYw3aQothge5MIPiqepBY1v/XrhSZqdbJ++Z0pw5
	WS0QTOY9nnvZEh9d2dcqFNv7Fprjq2lp1+rcyrA6sECHPGJIjqotNAuwO2WeQX/chLvY820LW4Ia6
	WPgJQYUj07SuwJJsPtM20+ZM+XGkzQfr0oq52naaTGl7wgdIObPtX1CZ/ub8QLdVchuCM9SznWAKk
	hdKUvv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hJQ-0000000Febs-0ASO;
	Fri, 18 Apr 2025 08:43:04 +0000
Received: from mx10.gouders.net ([202.61.206.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5guI-0000000Fb6I-1Nak
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:17:08 +0000
Received: from localhost (ip-109-42-179-120.web.vodafone.de [109.42.179.120])
	(authenticated bits=0)
	by mx10.gouders.net (8.17.1.9/8.17.1.9) with ESMTPSA id 53I8GUi2025346
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 18 Apr 2025 10:16:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
	t=1744964191; bh=HfserAq17Skx9yyn4OaPzK7uT4AvLX10etymwSKfJyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=SUX1l7iq5GXdFIVtE3I/1BV7D+Sgu/UQNrXCYzhokqytgNZdNokEHtylOwbpWhRs+
	 Z4jTpSNooYriaXFEAC72nh5+Mm7sSb26VT5UHZX5I7BXf3kAIpogIaVn8TGRCMyCzV
	 kOuO1LIWxnP5BO1159QpMrZSajcIUV/jGi5S47XA=
From: Dirk Gouders <dirk@gouders.net>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 03/15] arm64: dts: freescale: imx93-phycore-som:
 Disable LED pull-up
In-Reply-To: <20250418063104.2202085-4-primoz.fiser@norik.com> (Primoz Fiser's
	message of "Fri, 18 Apr 2025 08:30:52 +0200")
References: <20250418063104.2202085-1-primoz.fiser@norik.com>
	<20250418063104.2202085-4-primoz.fiser@norik.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Fri, 18 Apr 2025 10:16:25 +0200
Message-ID: <gh1ptpkhpi.fsf@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_011706_976196_357275A3 
X-CRM114-Status: UNSURE (   7.70  )
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

Primoz Fiser <primoz.fiser@norik.com> writes:

> There is already an external pull-down resistor on the LED output line.
> It makes no sense to have both pull-down and pull-up resistors enabled
> at the same time. Thus disable the internal pull-down.
                         ~~~~~~~              ~~~~~~~~~
Sorry for disturbing, but I couldn't resist: the above somehow
contradicts the subject line -- at least when reading this just by
chance.

Regards,

Dirk

