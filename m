Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE64C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOZdkojqjI7bPPPACXNLxFq62DGmOK9QW8kCLaGyRfA=; b=YoY25m7AmIrTAde8rND7itmi65
	NfSajq+p7dgsZ66uHHQhR4GCtNWRErPMATBs6BfhkVTcU2zyErujgGV6mD2Ti0DewZcSq56N9WJVJ
	iJtkji6F0HRI9J6ZZugHZ2LAcyGHHmNRagEfgbFTSQjWnp+0vSdknZ7t+ZYBu1j1+3OD5Sat5jDF5
	hhC9yIX7G26n++VdCYgvwFiKjiCEvESKp0H9HG/OJ1Dnb9iZF8LGCWSsSWLW63auqeJSIlvVPR1f3
	doC1qiC5fAJQw74ZFrwnADQOAVSw9AIQQSOOb0QqPF5r190zfcyrfBJF2333lZoUMepSYF7GbkAE9
	DRDgn4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ag-00000009edW-1y5N;
	Mon, 31 Aug 2026 14:39:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Af-00000009edK-1ID6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 14:39:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C9303438AB;
	Mon, 31 Aug 2026 14:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6082C1F000E9;
	Mon, 31 Aug 2026 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788187176;
	bh=VOZdkojqjI7bPPPACXNLxFq62DGmOK9QW8kCLaGyRfA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NXIBTTz/qrXk74eAMRgTXsxAO5/skQr3coJy+dQLqzNUTCpPDBlbFWgtnRm364dL8
	 8oKKSCw0/fs8Cvj++EYltGCuXO3/Y24DxlZaarfYZrnCB5HZuMcia5X4cPM98jlwHZ
	 wniHK07f9qN297+f2BfbE9Oj74XeZwY/yorI/EkMxBfRpNwJgEasa7tS5qHRUm+4Wo
	 JdOtlfj5M7zQvlEKITEc9s3nGxG6lS61ojobcou7Rk5l8WcY7qStSaUdmFUcEMGscY
	 HVS4U4RvXhsekHUPJtSeCvg00+9mB7sZCUTWWnzouwEK9sJh/6YPlOIkqtkl3NUIVD
	 SlBI4ToH/wg5g==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sven Peter <sven@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: apple: Fix cpus node indentation
Date: Mon, 31 Aug 2026 16:39:22 +0200
Message-ID: <178818713419.102394.18003296593525183600.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
References: <20260830-b4-apple-dts-fixes-v1-0-cc20f8445754@kernel.org>
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

On Sun, 30 Aug 2026 16:22:06 +0200, Sven Peter wrote:
> Just a small series to drop a spurious space in our dts file. No
> functional changes.
> 
> Best,
> 
> Sven
> 
> [...]

Applied to local tree (apple-soc/dt-7.4), thanks!

[1/3] arm64: dts: apple: t602x: Fix cpus node indentation
      https://github.com/AsahiLinux/linux/commit/011d96a065f6
[2/3] arm64: dts: apple: t6030: Fix cpus node indentation
      https://github.com/AsahiLinux/linux/commit/1c7e2a0cfc90
[3/3] arm64: dts: apple: t6032: Fix cpus node indentation
      https://github.com/AsahiLinux/linux/commit/db6fccb5a422

Best regards,
-- 
Sven Peter <sven@kernel.org>


