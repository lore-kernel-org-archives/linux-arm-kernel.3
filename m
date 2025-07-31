Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FCC87FD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mM0SYcEmH+rkhJTkbsCQEMP7KWgfNw+z0fXf7NRQTAE=; b=umI654nnDb9SvQxd3dWbdasx+x
	PMr7AnTFxVDnLM4UhqfvzcMuqFyP0GkdLDU8O4uwfNEiAIbSbat3vR6CqJG3kKyRfPp36px6TFN8L
	iOAPFD28s79gQRo7YBtwhmkXRLx8IXsFMDBygnplLqJUZAqBVp46/QDIRgZKH/SRD80NpSWDEdCG5
	ljN+FQlJLIVsNyYZSqp/K6n4w9Xx4kmg+FHYSZC/2FXj8va7aVliR77QZ2/zFpVI5+VtV95PPQmtI
	t+Bf3LvwYl+uikN0oXmeX0Bm6EXUv+ZKBDizmN2THMEtREneTP0jetNShrDnCoFHJYhlOImv8PxiC
	UdHQ687A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdB-00000003HK7-1Eiv;
	Thu, 31 Jul 2025 09:31:21 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPIv-00000003FG9-2mxu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mM0S
	YcEmH+rkhJTkbsCQEMP7KWgfNw+z0fXf7NRQTAE=; b=W0kfqLOGdhib0oRQitme
	iXr7j7Q70IQ0j7/21WXdldyhIEjz9Rx2pbDiP/svC3kYVtT4MUhQ/SKs7Dupem3n
	h204xsS+o22tgZgdZCJUVuoGLftWSnfVB1bF+J3FCqzcJe+DNdE4CB59RrA3NcBr
	YyxWQ2e6rz0Ubgc3kLnIKL5nfYpYuqgfYV/NqdzDOouObn3gRsqFogX7UTFZtwAE
	0RY/oxu05JP92JQTzLmC/w9fcsvGqZrlj1cmWKviWFTP4wgAmjdn70N6OTHM5IL7
	9+CLtqlQWxG94Vp8HE4qgZFLGtpHUjFNr6ltSlUkkdA8ZDWhatXvABTFWqF44ryc
	Vg==
Received: (qmail 276436 invoked from network); 31 Jul 2025 11:10:21 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jul 2025 11:10:21 +0200
X-UD-Smtp-Session: l3s3148p1@6p7GAjY7vOYujnsl
Date: Thu, 31 Jul 2025 11:10:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced
 article
Message-ID: <aIsy_L5Jns8x-yXU@ninjato>
References: <280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280176885acf46d117a0ab9a02c314e2b5cf250f.1753950938.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_021026_575067_0F481390 
X-CRM114-Status: UNSURE (   7.69  )
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

On Thu, Jul 31, 2025 at 10:36:59AM +0200, Geert Uytterhoeven wrote:
> Move the article "the" before the full name of the board.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


