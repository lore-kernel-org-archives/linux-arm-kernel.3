Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90D2C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqmtgzPBncZEMRO2d8cE2MGb0LERXNEQmTQuzXuj/AI=; b=A+5c4O/1it4Awp+wYn7SmppIAb
	Hsxo5WmFwY2LRTxDdhJlr06M4Io6fBubFLV8BKWR4ZEAZxRlKOnk892s4x/tICKHjro9xgqAZIf0z
	kTvg/UFO3ATgxdkI9sBu5sJt5jD6l2dC8APt1PxmQIST2vLqfMqHYL5riaRj0Yo6E88KlsntDrQcB
	ohtTCT6MX6Jk+TQPMw//wzgXGYDYtRIr3el2Ide9sG7P9z2W1aG11zw3p3kAT8OJ1GqH6fvG1e7vo
	q2bQxqRmU63++hJhb7cq/rVZ8DQCXCEM23lAk86EftbG6Rkqw41kU2sem8WUnxSXU3svym20awrip
	lRpdNPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Im-0000000FuMU-08OU;
	Wed, 12 Aug 2026 10:35:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6Il-0000000FuMI-0bEZ;
	Wed, 12 Aug 2026 10:35:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49DFA60A88;
	Wed, 12 Aug 2026 10:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F911F000E9;
	Wed, 12 Aug 2026 10:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530914;
	bh=KqmtgzPBncZEMRO2d8cE2MGb0LERXNEQmTQuzXuj/AI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AfLkYVyfGTIYmy+S7st1151b23Xy+xY3bWWxuaVHuqqo/z/0IXC4lEcFGRR0VWwQw
	 i81X2EBDwaKXpCWtvaOK+XT0MJ9mmbMi7gqRBSuCGCZ3mk1hc+yzsArgjTri6jEiWr
	 yCELNoUO/63kQ5Guz13iDRsdzhpE0uPiHkujZDXgaOsWK2h8YvS7JOPoRJA7wi0SJ7
	 JCUE/2/u5CNB6EWqcomUEeOuKKkHFaSrXJ9aYvT08t9V6etLmzhAcJfTykOxsAjQIa
	 cWA/DDCz6VWJYqc7LXJ7VD3Gwenkewi7aLhZvA6ign4LCWvvAVLm4rQn676EWZvu/O
	 jqIlpDPi0PITw==
Date: Wed, 12 Aug 2026 12:35:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
Message-ID: <20260812-smooth-artichoke-kittiwake-f6e85e@quoll>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
 <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
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

On Tue, Aug 11, 2026 at 04:20:11PM +0200, Luca Leonardo Scorcia wrote:
> 
> > We do not take bits, but identifiers of resets.
> 
> Currently the existing mtk_wdt.c driver does not use a reset table
> that binds identifiers to bits for any of the existing devices. There
> are a bunch of mediatek,mt*.h files under dt-bindings/reset [3] that
> point directly to reset bits instead of being indexes.

Many got accepted unnoticed, many times we did not care, but the point
is still valid - pure hardware numbers do not belong to the bindings,
because they do not bind any pieces of code. The proper binding header
constants bind DTS with SW implementation, so two pieces of code. Not
applicable here.

> I can introduce a reset table in the driver, but it would break
> existing devices as those bits are referred in device trees and they
> are often non-contiguous (e.g. [4]). As before, it could be done by

Then these bits stay as is in DTS but bindings header is not needed. You
can have of course DTS header, as we did in the past multiple times for
such hardware constants.

Best regards,
Krzysztof


