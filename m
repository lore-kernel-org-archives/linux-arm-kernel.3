Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA49C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5wtHyNdN9y5JnnetPBoOCyUNOyX7UvzCKhyCrZZ1gI=; b=jAzo2vy0hTc6kq/llGNEUPvmJn
	wmzxVljipw+sr7YEhaxvathc31FSPmJEj3emdpvWXjDKUPg5qOddtTZzNT1Q7WOEogOIJJmI60kNu
	7SHW9azTzMAt7U8zW/8lgE0AjgP0gtpITnRaD+GW+fP3drgMRTmzkfdpepewPJeQtvcmsB3AG56cj
	jkZekGTV5IZP0c+GOzjCYGmPagAPdbiF6kA2/A47jhr+uYSS6egKA2WUfL28J+pbiyNqFCc7jL/1P
	kXMuNxtt5lXDNgMgmpGQ5sd1Qz7mswctexadwV9iHLz8KSEnISFc93D24NWzbuTB7sCVrSDBReCVV
	DCPCgE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmOk-00000004mQy-1Box;
	Wed, 02 Apr 2025 00:56:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmN1-00000004m9H-1ZNZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 00:54:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF25861126;
	Wed,  2 Apr 2025 00:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A460DC4CEE4;
	Wed,  2 Apr 2025 00:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743555258;
	bh=/0zz4PKfcfSmXN/45Xp1mSPvrRuJjBxRJOJ/lyfE7UQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RCsLNG9aVi3V82xZ/6oEZSNsQF3BjRuXv1neERksnDPnGCtMulh/64xNESG3RWsLl
	 yf30ngBuNOZsW+CbTIph1qQZBntJlB18XYzKzp5dyS1/AB7kBXnukbZviRs7IAECxw
	 ZNx6Y8FUXHYOd5lx3/UHBVueom3RJ8c4bKNyUCHJUXhbqQsIUmU6hgrCIaBvIMW9nk
	 jTENZXw45YJD8S3MXD7LQTYNs4QNntCXh61n7h0tI+qrlM3PAiQ5tujo51WezBgp5l
	 sc+mIgxrTiyPa6Jp9gXUUniAF6io3Au2Smjys6blKdV/JkBfCdwuI0cSoOVbDMjx8M
	 9ZUuwkPdBbcuA==
Date: Tue, 1 Apr 2025 17:54:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: <Ryan.Wanner@microchip.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <nicolas.ferre@microchip.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/6] dt-bindings: net: cdns,macb: add sama7d65 ethernet
 interface
Message-ID: <20250401175326.1b0ae7d5@kernel.org>
In-Reply-To: <392b078b38d15f6adf88771113043044f31e8cd6.1743523114.git.Ryan.Wanner@microchip.com>
References: <cover.1743523114.git.Ryan.Wanner@microchip.com>
	<392b078b38d15f6adf88771113043044f31e8cd6.1743523114.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 1 Apr 2025 09:13:17 -0700 Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add documentation for sama7d65 ethernet interface.

## Form letter - net-next-closed

Linus already pulled net-next material v6.15 and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are currently
accepting bug fixes only.

Please repost when net-next reopens after Apr 7th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed


