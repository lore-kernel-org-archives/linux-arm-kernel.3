Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A7DC636C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xCbFUq1gz5ivzs3NGEktR0CddjRjW7flgd1V8byi/98=; b=w/NVqGHU11U4W3nJ3xYnW14gli
	hkfF/tBTtqVNn00XJpkLhJ38Ze9Fm6P6+idBJPl6nexqk0600hr+XYL6MbReXjgVfZ30Kfwsq/g92
	LCzpZPEXJNs6diw75VbKA0E4o/fVAYomqXHGsdZOSE/XHSAwVozbIjWUjQhDvIBQXu4QBRBTsUAAY
	e6AneUST1QjxLMswDwT4P+GjKUubFkMS+tNILdCrkGvi6fvLBXDUH1xcwsN2aHzXbr1YL6WG9iN1O
	09EqUlYyaLFPqK75P8Ue2flffugU5Uv9nT9oVgVQnpwFk+t28ejoLBEYYZZrwg4+6pJV0jZTyGBUg
	Z9Uh4I1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI6r-0000000GzwR-0TwS;
	Sun, 22 Feb 2026 22:39:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuI6n-0000000Gztm-1sNX;
	Sun, 22 Feb 2026 22:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=xCbFUq1gz5ivzs3NGEktR0CddjRjW7flgd1V8byi/98=; b=bpXAbppBRntuOXTB91zOXoUrzU
	FcBQNixaiLIAJ+hynP0b2tfS0bPDIZ0RhEVtui818OlSsTXA0Tb2QIWpSbMlyOh85Is+GSTRJ7BI3
	rQu6Tco63lQMXAav3HivByrywzSxx0BsyRUMhc8ai64yxr9KlqBYWTguc0NvZphhUF/6YAPaldUZH
	I+XfISQyU8LrnuBHNp/023T1Iwp2dHQ690ek76WlFgvVNSpR7BlB73Emedc9sLEOmFZqMb0miTCyd
	iM5UyVbMjJOsuZt/6+LPbYz3ucb6Tn/YlRDKOZCFXaBinzHlCjDhb9cYsvf9bhxGLyGnpHGTQt8RD
	dBTxt1wg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jan Palus <jpalus@fastmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"
Date: Sun, 22 Feb 2026 23:39:04 +0100
Message-ID: <177179992296.1861430.12010317621406351425.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260210120142.698512-1-heiko@sntech.de>
References: <20260210120142.698512-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_143925_552666_36C13354 
X-CRM114-Status: GOOD (  11.27  )
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


On Tue, 10 Feb 2026 13:01:42 +0100, Heiko Stuebner wrote:
> This reverts commit 6d54d935062e2d4a7d3f779ceb9eeff108d0535d.
> 
> It seems there are different variants of the Wifi chipset in use on the
> Pinebook Pro. And according to the reported regression - see Closes
> below, the reverted change causes issues with one Wifi chipset.
> 
> The original commit message indicates a "further description" only and
> does not indicate this would fix an actual problem, so a revert should
> not cause further problems.
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"
      commit: 29d1f56c4f3001b7f547123e0a307c009ac717f8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

