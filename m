Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45284C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKq8Pd+IrYIhmTfjiXM0xc9evQeYupJSgiTwqknNByo=; b=pBYmv+/ZPdeHElOmCD6lMAF0qi
	tjXoAd5lIVxTBmtEhAB3cRsg0wHtGtH+3r3sO6iVuAAGjSs3SuorqAfie6hKrppLOSa4qsKABCVMr
	Qiexi26/auwow9gld/Mc8Usp2y4dXBsh3JL5brwjO+9T/koa3gMWQ9fGFrt109u+/tKGjuyrXQdGT
	HesWtkZB+NEHPse3Mu7Do9Nmx1Jt7S2TbR+D+hlnib4Eqwph8zodrpK0S+f72BwIdPLhzGg93SIDs
	ajlZ+gX5wo1BgZeoqtzwaqtu1ZoS5b9Gx3eDhSZfa8CnmhQjdVTGVJEQdH6AGKUoEs3iuVUobRuYF
	FzcjBEig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uCW-00000004MCO-17hd;
	Tue, 22 Sep 2026 06:42:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uCS-00000004MBx-2AeE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:41:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A926600CB;
	Tue, 22 Sep 2026 06:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528831F000FF;
	Tue, 22 Sep 2026 06:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790059315;
	bh=fKq8Pd+IrYIhmTfjiXM0xc9evQeYupJSgiTwqknNByo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=elvscenEAu6o081RV3og1212GNvhKmyX/daXtm1XcRH2EPQp4bfKtFwkpeVA0Kz0j
	 HwsTmqS67zyLJFRUF0S34sUltwPk6TpgYMbixF6+dVIDt/7hpvU0q/GtoIof3kH9yf
	 WUn03LXrmE+WTs9TOF50ohjP0VqCaj9rifYv11G3EfxyYfJJOq8k8a4cc4VYiyVNRc
	 p8Wu+YxG3CT4IkAXfm258ay+t4ODvk2GRbgs6VVVUDIewzt31s0hMPkbMGC6iqXoHz
	 NPmerFfeVmzcOhHr4bR8UPBWF9kMAE/5hjOTC5smPk7Wbcw3wCxXm6JvHIK7aDQvBZ
	 FgXWp/sW/aXhQ==
From: Sven Peter <sven@kernel.org>
To: Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/13] dt-check-style strict fixes for Apple M3, M3 Pro/Max/Ultra
Date: Tue, 22 Sep 2026 08:41:35 +0200
Message-ID: <179005928268.4871.7584482094844751159.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
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

On Mon, 14 Sep 2026 10:40:30 +0200, Janne Grunau wrote:
> Hej,
> 
> this series fixes most dt-check-style issues in strict strict mode for
> Apple M3 and M3 Pro, Max and Ultra device trees. These device trees are
> small so fixing most of the issues helps to check that new additions do
> not introduce new dt-check-style issues.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (apple-soc/dt-7.4), thanks!

[01/13] arm64: dts: apple: t603x: Fix all blank line dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/eaec5e1207c1
[02/13] arm64: dts: apple: t8122: Fix blank line related dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/aca5ce9bfb0a
[03/13] arm64: dts: apple: t603x: Fix child-name-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/c7513cd44e08
[04/13] arm64: dts: apple: t8122: Fix child-name-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/29cf25245028
[05/13] arm64: dts: apple: t8122: Fix child-address-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/2448980d56e5
[06/13] arm64: dts: apple: t6031: Fix continuation alignment
        https://github.com/AsahiLinux/linux/commit/030d45664eb6
[07/13] arm64: dts: apple: t8122: Fix continuation alignment
        https://github.com/AsahiLinux/linux/commit/14ed3757881a
[08/13] arm64: dts: apple: t6030: Fix most property-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/bd48cf6ef754
[09/13] arm64: dts: apple: t603[12]: Fix most property-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/d9ac2af8714b
[10/13] arm64: dts: apple: t8122: Fix most property-order dt-check-style issues
        https://github.com/AsahiLinux/linux/commit/8578146c48d9
[11/13] arm64: dts: apple: t6032-j575d: Remove unused "framebuffer0" label
        https://github.com/AsahiLinux/linux/commit/be0bd5b0d880
[12/13] arm64: dts: apple: t603x: Break overly long lines
        https://github.com/AsahiLinux/linux/commit/d8f5ecdd7712
[13/13] arm64: dts: apple: t8122: Break overly long lines
        https://github.com/AsahiLinux/linux/commit/6b49aa53f416

Best regards,
-- 
Sven Peter <sven@kernel.org>


