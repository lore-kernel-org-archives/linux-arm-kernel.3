Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A56E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 12:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWQT1YFPKuGaJwuWPDoCk0EDhIvtFAswXl6M59Arurw=; b=uWKo5u2UuJTMcjXtd958+NU7i6
	a0/+HC0dcgDpf3QMkE9pDJ8QuN6GtOlLa9jDDY58ulc5OOCJlI9RRo7J8MPjg1q+yn2o+huC9V6TZ
	3v7z6Yk2VUkZ+yjY58ihu3nRXhF6oKqjb1diCHFLgeTgzyLt0x76ctqq1xx9xDLlsUd+Kz5G42vs7
	1vfDteYbH3R49lLcrEAUyXrTt5JAaAkCWX82kZ3lLtxTL6fHosx0NPIdnG+L5mTXOWTY/uuYgFhKZ
	cVMSwIRO9voRss/4S2DTaE/oxKdyhlnD06iEtiuXJ8DogwybFNZL1IIt9zKnxRkv3aEwMQmbPUECc
	Nq5Ldx8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCqU-00000003iaz-0PxM;
	Mon, 29 Dec 2025 12:59:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaCqS-00000003iaq-1VCz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 12:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 703B46000A;
	Mon, 29 Dec 2025 12:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66275C4CEF7;
	Mon, 29 Dec 2025 12:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013171;
	bh=UE1qaCpa8Xzfpci0DbcJIkq9Z3U1GQTGZeeLueNA130=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABcy121yrODltMJwHB3214c8IPI0KZCrt34YETZuwPWx4zjMTkV6kW41vtvqvmfMC
	 cQbDU/n6XSKaj7CBDKQMU+2ci/fgh2C0wZ4nAwnID1znUG2NbsV8WzKSVox1ONCuRB
	 erE0nNtJKjqXQqjawBb+AtY/8MrymEiEUAtc/MPEs34xndD088eqFutYpstCl870Ay
	 nTHzttsYAvVXKEpja9m3IVowdJkEtsdBJlADt48+MtUshiAaOpdkvuO+8+YEA2hdWz
	 DARwyKlTvvluZ/jMW8mEG4LIHnLfzvxVFLk6WlrZZ+gW2Q3WYfPFqwyaoPLcQoZsNP
	 JosKaLPxrKQYQ==
Date: Mon, 29 Dec 2025 20:59:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, krzk@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, marex@denx.de,
	Markus.Niebel@tq-group.com, y.moog@phytec.de,
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Message-ID: <aVJ7JxBxsnEmrbSq@dragon>
References: <20251123181444.266030-1-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251123181444.266030-1-rpimentel.silva@gmail.com>
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

On Sun, Nov 23, 2025 at 01:14:43PM -0500, Rogerio Pimentel wrote:
> Add device tree compatible string for the i.MX8MP FRDM board.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>

Applied both, thanks!

