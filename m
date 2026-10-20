Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DAF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iLdDx+Yu;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XSpicyqP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yBpYK6f9+BQc1jfH9gnbyxvMmUX+zfuIeLZZeZEI9k=; b=iLdDx+YuW3aYUkvJq7A8OJHDgm
	g4fDfMkPqXzJJi3lHbTSAVxkPpFnT0vr6VfMHX24UqtGEpxY/pZvt96XLX1l1ipzbY44NvaJMnYRE
	6ACsSy1TP2eOIWjVA43Yxcnt9lwb49NGa6CYgqCMHrDrAC7vshXcMKv0X8jsYv4b/TC1PQRKCRqH9
	xVcaBFRXIQOb1oRGxlTo7qacnKwzAm2SjmzfMXj83s87va0he8auxCDsEvUJYWgXZUu2/4cFGamtg
	u6SHvOYP/zDoXPmzcwSrAtvq0HEVBbEF6VkRIu16ats+JEy4+t78jZMSRNMJVkvDOw/DU3m16Dwgb
	K42lT3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4i4-000000096FP-0yok;
	Tue, 20 Oct 2026 07:56:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ4i1-000000096Et-2ZRh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:56:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F35AC402AF;
	Tue, 20 Oct 2026 07:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172331F000C4;
	Tue, 20 Oct 2026 07:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482992;
	bh=6yBpYK6f9+BQc1jfH9gnbyxvMmUX+zfuIeLZZeZEI9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSpicyqPmNSqeH++6HRdytarODu/exKco/o/qsDafdEoPMwxX8It4rUqwJgKAkLwO
	 cpT327eV3TDaXuxd8axPBlXvoUTWhzWHFzX5iGgE2wVMlS4RnCTNXvXxshxyXNzA2N
	 IKOULCUIKtrtDfk9w79kziaTUL0GgUhMRd74MaRseywtcQxyo/yg3YlCbW3VrgfaM4
	 4U4Ie1Pkwx6N0ojg3F9QUUY5ZiO74CcBCYHdFpAQzGAgpQHtwihKLptOWtyxv0X+pL
	 sYXUGky1ZpBg9jNvXDzs2lLJxbm0/sUIUMcHZ00HbYhyzkwErPJlF0TDJ8CdIavhzz
	 fl/I3rR0r+r1w==
Date: Tue, 20 Oct 2026 09:56:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add i.MX937 FRDM board
Message-ID: <20261020-impossible-coati-of-domination-93c946@quoll>
References: <20261019-b4-imx937-frdm-v1-0-76d949a61954@oss.nxp.com>
 <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261019-b4-imx937-frdm-v1-1-76d949a61954@oss.nxp.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 07:10:32PM +0800, Joy Zou wrote:
> Add DT compatible string for NXP i.MX937 FRDM board.

So where do you explain used imx952 here?

Best regards,
Krzysztof


