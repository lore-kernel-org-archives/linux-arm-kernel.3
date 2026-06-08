Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59410CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hOv2WR62QjnJEbsw0u0ks8guZvL8FT8c/MaXSI+xMo=; b=vVmMJC6nqZYeCYEuwI4R2FBKxg
	DnHjMt682pD3WfaeYxEsFGCNqgAJzqJcGHkIPXknB9cRVjfz0rKBFajvwDX3WABApyn4Z04fwYOlz
	c0psFNpUdlRahD1k0zV2fOPpvUCrnbqVpmWwgUJfBCOB0kcZaA9Bdfr/1F/lEE2pN2Tvud6IqV/1F
	MZnbbzlkzgWK/bfKDkU9WBbSc2lRA638fsnX5+sr7HX9nz9rPGk0+dPbUq7Lsy3yM0rpGcKJLFuT1
	p1PeOuwK/8odR8bmonO789Yrf/AgIUSfbGYjQvBuJ7dxqQqy6HRYDaM/1mbPcvvyy8YS9tiP5mzWD
	6B2sVhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWok-00000003GHk-1SU7;
	Mon, 08 Jun 2026 10:02:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWoj-00000003GHY-1WNz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:02:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C59D6001D;
	Mon,  8 Jun 2026 10:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D587E1F00898;
	Mon,  8 Jun 2026 10:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780912968;
	bh=1hOv2WR62QjnJEbsw0u0ks8guZvL8FT8c/MaXSI+xMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fbdbmTSIUZrRIhyXG1SnbJ0wvlg/SOyLtdjkpdcwnrkYYTPq/Asd7IlReWZ05xy0o
	 ClZLxGFdwoc2lqnxRMItKhmcOwidesuMV71raM88b6IAbXFEGp5CucpS3WA4O9uZ8y
	 uT6pqfoWVjFIFIz57Zqv6lvMzWYeBwTMxVALU3sQ0ujCOFLBj8/jB/JlYmYbN63WKU
	 OjITsjSW9xiwdwGcI53Vsc/IF+yvkExpcAnMUbQfmIqzP39FenRBFUL5C1FWC7U7fT
	 nqenmYK7arSNLrn4KaQDtvD0ckdyL0+ZCfJl1sk/HbGWkNekEpWH8BERULXnb+13Ty
	 +Mv0N6yRoQDuA==
Date: Mon, 8 Jun 2026 12:02:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add
 Nuvoton MA35D1 QSPI
Message-ID: <20260608-aquatic-alluring-asp-b5fcb6@quoll>
References: <20260608025009.1504971-1-cwweng@nuvoton.com>
 <20260608025009.1504971-2-cwweng@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608025009.1504971-2-cwweng@nuvoton.com>
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

On Mon, Jun 08, 2026 at 10:50:08AM +0800, Chi-Wen Weng wrote:
> Add a devicetree binding for the Quad SPI controller found in
> Nuvoton MA35D1 SoCs.
> 
> The controller supports SPI memory devices such as SPI NOR and SPI NAND
> flashes. It has one register range, one clock input and one reset line,
> and supports up to two chip selects.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>

DCO mismatch.

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


