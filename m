Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE51BC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apiZD2MHe0pEihsryLo9DY3yMjFctlM1u7cKb+3+eHk=; b=jKD2lgLF95TsDnCDG3R7/1RDvP
	vFbETpQ8l+xuU2Tmo4W6ArP63PJChOD1KtwsJK5sEgJoBeWapUbY6ZvrQ6fy9UvZF0LwfAYAhMxJc
	E8ozWdXz5gNvSRSiGQoQBncgYPNSFMp4phA5MxQDwfnjFDlM76K6pJrGIQKj7a6/dMDBXSF70McAH
	7r0JaXjqsAhA8pl0VIwu0XiJQfBc2FKz/AThARsoeufWzicfNZVRBUCRudGGiaeCTGINrhrJZ2f5+
	mNK3v4GE+q3ay+L9GmNcWGPNDS8AGewcn07JYUvU5S47i4oTFM1Y6/QQESMSezcp9tKfngQgdhIM0
	wEs7fB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wFb-00000004x4D-34PD;
	Mon, 21 Apr 2025 18:52:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wBx-00000004wj4-0vWg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E93705C58B9;
	Mon, 21 Apr 2025 18:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F51EC4CEE4;
	Mon, 21 Apr 2025 18:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261307;
	bh=Ijp7OoJM/SjB6q2/JnLqH5xk2mnKjD6u6f/PtjXw0Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tO9jNT0GXs+9AfF7VttwbdUVOSuc8TE9HieRsrqdAvjZJGCauWzD6Jcp3PTIhDB1T
	 2jFghVVcKbNU8nZPuX1B5oiS17mWCsKtNI6KL9gSMPhkspTWRJT/AVsYWUPolatrhv
	 cs5EW0f1iNLJ5Li/nW+Zkmf2WDgWfqqcR9ccoGKqMu37/8xnpkWbk3AYv+8Jtr8Gny
	 8R+Da2XRcbWUEbYkj0qBmlblSl2XhpfV54B93RsGQ1UXtufeyd51lrv4EK5se4PjBc
	 1jQKL3B4mf5WG1st5UD6v+I2qaGwYbHZDBfoJFcX+n+26HtBSUkCVwBJ+Pk1wNmOsV
	 UxfoREzuuUg4w==
Date: Mon, 21 Apr 2025 13:48:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: add TQMa8XxS boards
Message-ID: <174526130447.2607883.13343591293403394303.robh@kernel.org>
References: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_114829_313306_FFE609E1 
X-CRM114-Status: UNSURE (   9.51  )
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


On Tue, 15 Apr 2025 15:32:58 +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@tq-group.com>
> 
> TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
> They are called TQMa8XQPS and TQMa8XDPS respectively.
> MB-SMARC-2 is a carrier reference design.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


