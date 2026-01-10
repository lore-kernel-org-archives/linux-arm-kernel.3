Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7724D277D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 10:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tFY9BCZESUAiHIiV3dh2jkRQ7AN00E2A4h5HVhSbPU=; b=stXC4AwkUyqox5D1ThJbY7NDUm
	clfR6ivaXEaDUVYnkSEq5ywaBBtAGJ1RpoTYkJExxyehyjXwPKDOQwsmoSlAmN4jnQJ0NDnB5aU3u
	mhjy68pHvdgSjigoN7LNlNJKTAIa793dDsQHATtI6lbpOC8xaoKHcfNGt2QW1Oao1cRJ9I56aulFA
	tUMoEqXorwq7tTt2cXN5bXC08tUqmUBFs8V0Tydbadeb4LUS7LB93vVcy4wdaERctlAGiiAdgkKKp
	FmNTb3KSjBz7Y1h1wI4U4A4m/tNj9Gvnj4BqOB3j6N5cEz+j+yAvKfuiUVTRmVoTpzUcWCZsjf23M
	EDb3y5SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veWNy-00000003P7a-0jZz;
	Sat, 10 Jan 2026 10:39:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veWNx-00000003P7U-0jZQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 10:39:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 279ED60052;
	Sat, 10 Jan 2026 10:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EBBC4CEF1;
	Sat, 10 Jan 2026 10:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768041595;
	bh=dp45UAvDX3D+LDpNdQ7rxwJJ7Dat2HjMmkqIdx1vX/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OHlLmRX4hLNZ3b0RgWa2z/hDviakBqbwIpUCxsoeWH+LbhiKvekoYBvExUtGcP4kP
	 0cgqeuTs2SUdaO1wPL6Sn3vnCTMraE1ycTZXF8IEi86nzZbDYtp/Q9iSR5wobFYYya
	 /eAnMJQpdeJyu6ugVvtzNpGzEBYpDYefdGZTwMYbxmuKlyUNuH+s2iizZjv98U6L/q
	 mYWUApHO5qIdyL7rfySj7u2z/0soNGLBH6h/eM4RnjH6OZ4g/IKxY8wVkWL7IT/4Vs
	 Dopxr1Da8O8ZmRtJQLLY0ZxQDdqF2Dq7Xdr+hf9C+BwppCmMuST3dMIqxyKJkmzdDY
	 c8/qJHjD2Mt5A==
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 0/3] arm64: dts: apple: Small pmgr fixes
Date: Sat, 10 Jan 2026 11:39:36 +0100
Message-ID: <176804152717.3568.6544517123602866395.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
References: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
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

On Thu, 08 Jan 2026 22:04:00 +0100, Janne Grunau wrote:
> This series contains 3 small pmgr related fixes for Apple silicon
> devices with M1 and M2.
> 
> 1. Prevent the display controller and DPTX phy from powered down after
>    initial boot on the M2 Mac mini. This is the only fix worthwhile for
>    stable kernels. Given how long it has been broken and that it's not a
>    regression I think it can wait to the next merge window and get
>    backported from there into stable kernels.
> 
> [...]

Applied to AsahiLinux/linux (apple-soc/dt-6.20), thanks!

[1/3] arm64: dts: apple: t8112-j473: Keep the HDMI port powered on
      https://github.com/AsahiLinux/linux/commit/162a29b58c5b
[2/3] arm64: dts: apple: t8103: Mark ATC USB AON domains as always-on
      https://github.com/AsahiLinux/linux/commit/f15cea4e84ae
[3/3] arm64: dts: apple: t8103: Add ps_pmp dependency to ps_gfx
      https://github.com/AsahiLinux/linux/commit/35e794fefd47

Best regards,
-- 
Sven Peter <sven@kernel.org>


