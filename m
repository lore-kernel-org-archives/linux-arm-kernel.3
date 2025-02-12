Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B950CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGkw64b7wyEF8sHf2WWwJUD+Cc1oomA0aUrhv9+r+yc=; b=Ebsa9OibBZnL7o+T+Hg5uN7mhl
	uus6gljxjKMfLwXNgdE28p8EZqvN9dKFocnbM3DZbq/eOuDaH+T7olS4KpkObgvJiAdnj6UB6pOXv
	d0UpLMEPRchwHmif39spG5GmJiKdBdI6j+r7SbVVmKJ9l2xXXjDKvuQxNKtGNUE9UkVGjdme1sIR5
	vfMM5Uvwsxkw5+ZO8JHUThK6aC3g3HyCguBQCGFZy3MSSeSUC5rVmeEG5S7WJfQ67Lkk7EFiozG1E
	5IodqJgpYUT41PKhFDG6ADPD72l9TWyA4/b6NbRl8FGvVij9g8G4ilfV2sVLN4yGBoY+MZQBO6vmp
	EKE0x5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9ar-00000006uX6-3uMI;
	Wed, 12 Feb 2025 10:03:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9Dk-00000006pA1-1TCK;
	Wed, 12 Feb 2025 09:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CGkw64b7wyEF8sHf2WWwJUD+Cc1oomA0aUrhv9+r+yc=; b=j8Ppe/UxcrxSwOtCPCWyt2qHUi
	Cgn/Ie0uAt3kMo8l1PfAAptBtdf6OMa9IffCXoqnxnTn6Qv79hPIsnnjnYm+F0MuAwv0FsWYbJlPZ
	5ylRKkaYmbtsEh7eQ8fKETXiGqH8tucUWB4YDpXDbQKtwGleWVHXb9gZ5O4//vSCSyuRh7LMCOiJ5
	rpCYpPgYTWD0siiQNoR9bILx63mX5GKl5GuIsNJ5ZEoJm/UVaM4tLTpeHkP4ku6lRczvEQqdxpBVg
	Iu5paLLPC/m6Mar7ZAX31UH1EuJbvlwqQ9PWHvaOWRFNEZQZ9hrsME4kd6q7dHZ+UGWQe3op0tgeA
	MaxVu3PQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ti8x4-0002Ai-GR; Wed, 12 Feb 2025 10:22:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v8 0/4] Orange Pi 5 Max
Date: Wed, 12 Feb 2025 10:22:28 +0100
Message-ID: <173935214367.1388667.11082246445597459804.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250109051619.1825-1-honyuenkwun@gmail.com>
References: <20250109051619.1825-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_013952_385367_5BE97EEF 
X-CRM114-Status: GOOD (  11.66  )
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


On Wed, 08 Jan 2025 23:16:14 -0600, Jimmy Hon wrote:
> Add device-tree for Orange Pi 5 Max
> 
> Orange Pi now has 3 SBCs using the RK3588 SOC. Refactor the common parts
> of the 5 Plus DTS so it can be shared with the 5 Max and the 5 Ultra.
> The 5 Max and 5 Ultra have a similar credit-card sized board layout and
> will also share a DTSI between them.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max
      commit: fa15cc73121279f93757ec76312b0d0b73f7462a

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

