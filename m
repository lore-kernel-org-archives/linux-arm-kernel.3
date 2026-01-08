Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AE8D1D48C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsllUFe+eLlkr06gWQLuqWqQWiIToSIg1UhH/Dzyr4k=; b=vd53n6UsPJRdIBjtMR5zTPSlR0
	XrRhQ1jlrdRdkf1wHW/vioYbxajf25zykpj6986LQTc6czmOFyk9U8JSEzPZB9hEcnOPMRwNWzMd5
	OIe27nNNf/sFDYNEnvxgAwE8l7NpYUcX3FWM1tYW+rVkSoUuc6W2nznHFzJGF4Ias5VAGJu9zcqvV
	7/AOYjTPjpq+eVPMk6U9WM14v+UFzh2/ZgTSkzCDyIxCHiuV4EuUtXVP1zgsKel8bxKCGBdQagiP9
	cGDWVObVMv/IViZRvEsUiDXfhvL/247MAjt35C7qOC5k0IqJ1Yd6dwZJ0U8s1EAqpiaPYTI5FjHc1
	iYy9ZSLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwQJ-00000000oCl-3QSG;
	Thu, 08 Jan 2026 20:15:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwQI-00000000oCe-2H5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA38260130;
	Thu,  8 Jan 2026 20:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAF72C116C6;
	Thu,  8 Jan 2026 20:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767903357;
	bh=w3ns41X2j9YcbCC/Ab57NoK6rddbx0g6MGo+CbaUMmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=clUFWDVrU90Xs52DJ44rpCuPjjkivn59SbJ4mWCuyP6aIDITw2My4hka5y4Sejj0n
	 jrPkZ9qppK05vivrjXjdKg8e2fyDawH1pmA062zucaUODcrbhvPGIVk/R3pTgowS+7
	 nErVNfPd8gUKqSHbY+v8ENdJ7vqkMOpoiFCTbZiQSAcJR3u+Hhl3lpMoa38qrJtTRl
	 1HQxNcUoE20m4yie5kvOJ4pGwyT02vh2MXLzm9laKqSiPsjKD0ZJ36BwlzTybpotJm
	 mcUfAJqsDZI4/ek64/1fUISxwDcZzcmjwcWkr1o2F9iDuYjMLJMcKuX87vSQ4Fzcgl
	 UiLi/FoDTxY8Q==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a
Date: Thu,  8 Jan 2026 21:15:38 +0100
Message-ID: <176790311758.49068.4809828865435473528.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231-b4-j98a-j99a-dwi-bl-v1-1-24793c2b99fc@gmail.com>
References: <20251231-b4-j98a-j99a-dwi-bl-v1-1-24793c2b99fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 31 Dec 2025 02:30:42 +0800, Nick Chan wrote:
> iPad Pro (12.9-inch) uses DWI backlight, while the 9.7-inch model does not.
> Add DWI backlight node for s8001 and enable it for J98a and J99a.
> 
> 

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/1] arm64: dts: apple: s8001: Add DWI backlight for J98a, J99a
      https://github.com/AsahiLinux/linux/commit/591cf7900da5

Best regards,
-- 
Sven Peter <sven@kernel.org>


