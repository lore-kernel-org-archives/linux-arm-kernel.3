Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5562CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 07:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C466Soiyc7PE+BjDcL+dY8Zp6o+u8OKHxnynx2bmrho=; b=LOpEtMdAN3oQhP5TUJzwgQ47r/
	CWnXlvbsvpGZ6KpuG6cogmSCfTtWi5RyKTk8cWEs3buqF7hF4VXdpWfcYbg13GtXjS0D/BgMYQk6i
	+RaQXYb4I01l9nFbL2Zn/aGHlI+lFBYNX9eQtlkJ/C2J+2VPDVZvHfqJq6SnD2vcXjS9pR7C5iMNp
	56Yr8TdlKRKQ5jcT3nfph1XeptNHjXwhY4+wpEMlaIE+WPwvMTM3sMrQqGXQj8nv+azMaK2/MOjyO
	7fY8KByJ1TEgHUTx0fMUBnE8Q6XEyehyEqm4uREC1eFT9mMkSdVZOTdG6wBasxfx0EAQZceZnnYrC
	By2aDwZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXD6H-00000006wNp-1LNy;
	Wed, 10 Jun 2026 07:11:45 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXD6E-00000006wMu-1vgv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:11:43 +0000
Received: from francesco-nb (93-33-119-89.ip44.fastwebnet.it [93.33.119.89])
	by mail11.truemail.it (Postfix) with ESMTPA id 02EFA1F973;
	Wed, 10 Jun 2026 09:11:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781075500;
	bh=C466Soiyc7PE+BjDcL+dY8Zp6o+u8OKHxnynx2bmrho=; h=From:To:Subject;
	b=YLXyy1rasTXaW9KYzP6V1ymLFbPNXR+/kWVDSZsbhev2xaXuybQ+gFlD64tJiYKYd
	 X1wUK82EEd0o6W2ssMbvuJCTvI/qXcdSoqDnJVlSrILJoIUEq14J0Tbpby8CFO9nXo
	 RnuPKnjQJilNHsWQZDOW4Prpc1RcuYg1CXDFb7S9PXvd9UDlNORV7X/ACdyhcBCLnF
	 WQNZ/UMtl1wW4Hzdcuu0uUDycvB5P2Tiv89JFDQW5+QLjHPd3KjR8BsIGS5Fp3x1Xh
	 onUNDKPqnuaNT3v+/ocLF4PXGKHT3E1V+gLWOz02tTn3EzY/9X/x5h/kei6ddBb0qx
	 AkRuSYCYW826Q==
Date: Wed, 10 Jun 2026 09:11:33 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Vitor Soares <ivitro@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] arm64: dts: ti: k3-am69-aquila: Add display and
 peripheral overlays
Message-ID: <20260610070736.GA24495@francesco-nb>
References: <20260602115123.1324474-9-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602115123.1324474-9-ivitro@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_001142_665781_3F8C7078 
X-CRM114-Status: UNSURE (   7.09  )
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

On Tue, Jun 02, 2026 at 12:51:23PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> This series adds device tree overlays for the Toradex Aquila AM69
> platform. The overlays cover display adapters, DSI displays, and OV5640
> CSI camera modules available through the Toradex accessory ecosystem.

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>


