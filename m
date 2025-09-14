Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21682CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 16:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLNKj9YOYJuCD3g6kMgks76wanJBy28lRvSFBCKvJjk=; b=ts76DHtjcbe/inZiNPAduXsaGW
	oe6AfxvjC3vW8DhnvFIGXwfMR6WuAG6ttHd8IfKtzbRcvuVDjH279QWpOUZ3af1n5fd9l0yml1fGj
	kLNfFuggm9r4785FW8rbYAUmXasn9J3k69bHhqy53bD8KYyy8PRYOdTAcN5phOkxe2mqRaoFJJ1OU
	7yJeV5zBreJFTtX6Sai+NJl3z0s4aH7NDgGy9ZR5LmP55Kx5YIRcQXPDgO17jJV9Vn/9OuPSWs4Be
	spXfZsiXQVF+cHb0ncS7iVGFpAcFdENYKrK1g72xPp3ObIKPHDKpCViXFCmR87BAES6Rgo3zEEd9f
	SIIBjukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxpbx-00000001qje-2Xpc;
	Sun, 14 Sep 2025 16:29:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxpbt-00000001qi4-221R
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 16:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5EC343FAC;
	Sun, 14 Sep 2025 16:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2FBC4CEF0;
	Sun, 14 Sep 2025 16:29:49 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 2DD115FCBF;
	Mon, 15 Sep 2025 00:29:47 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250913102450.3935943-1-wens@kernel.org>
References: <20250913102450.3935943-1-wens@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: allwinner: a527: cubie-a5e: Drop
 external 32.768 KHz crystal
Message-Id: <175786738718.280883.11594143436051438631.b4-ty@csie.org>
Date: Mon, 15 Sep 2025 00:29:47 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_092953_553402_136C7F59 
X-CRM114-Status: UNSURE (   8.37  )
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

On Sat, 13 Sep 2025 18:24:48 +0800, Chen-Yu Tsai wrote:
> The Radxa Cubie A5E has empty pads for a 32.768 KHz crystal, but it is
> left unpopulated, as per the schematics and seen on board images. A dead
> give away is the RTC's LOSC auto switch register showing the external
> OSC to be abnormal.
> 
> Drop the external crystal from the device tree. It was not referenced
> anyway.
> 
> [...]

Applied to sunxi/dt-for-6.18 in local tree, thanks!

[1/3] arm64: dts: allwinner: a527: cubie-a5e: Drop external 32.768 KHz crystal
      commit: 9f01e1e14e71defefcb4d6823b8476a15f3cf04a
[2/3] arm64: dts: allwinner: t527: avaota-a1: hook up external 32k crystal
      commit: 3d5e1ba00af8dd34ae1e573c2c07e00b5ec65267
[3/3] arm64: dts: allwinner: t527: orangepi-4a: hook up external 32k crystal
      commit: bd1ce7ef6aef4ee7349eb3124166e712693650ce

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


