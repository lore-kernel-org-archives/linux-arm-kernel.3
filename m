Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA23D26D60
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNZHqG3Xm6vkud9EVOnwNGhNBU+QEgmXYcFi8RcnhwU=; b=lJaq7wGUTg/cQy4EONrVOvVffr
	QdhRnG5RiZfp6pv2+Gj3N9yDLAgmiagZciFbj9khqF1A69QViAQn0vSLaxPaIebiteQxcHd30/Rlk
	95tAtqAa68iwjJF24lJkkpahConhdnF9uTUUSlFEhGg4dsGLRodV5cIWY4wI8Pvk3uaG81DRxDtpF
	2jTXI27xdrcTuwzKQs7Z9Vat8oR4nll3lA3LhHvhJhlFQweKqUf2M2eQVnYIYqsmFHKD/3mhfHwnG
	sCXTaB1vY23fJNEQWGcRh3/Jsibk2p4BYtxHhBI8zZnfXJx92lawn2uIIu6OSlOGiomFabO7T0urc
	uUq7c2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEbN-00000002WD7-2rlH;
	Fri, 09 Jan 2026 15:40:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEbM-00000002WCy-1Hhb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 15:40:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54F2360150;
	Fri,  9 Jan 2026 15:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E34C4CEF1;
	Fri,  9 Jan 2026 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767973235;
	bh=8/gkUfwwZJrRj+SPpQSaq8Ay11oEHSxAGRxo9DBOD84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oFlJgdk3ibMMND4ievPiDy6aEkBo3xB4ICejo7/pX83THYsD0K54kUILmc/SDss0q
	 K11mkJ8+BHAiOfL8gEYY5DHgkvsWmUVi21/Y/5xdY07xlacXKqWHfFglPt3RCz02vK
	 OEvJdbjIk4ZtJIF/U2pYFXNzXTquprGY8KHOt2f37f9rs2a8sY1vFSir51a7WBePc2
	 p1U+mEQuDCesU9LsFMZmpGT1uyHFBPfKT0Cx3FZ4KVwyyiXUxO6nZens8GGsGxxUq6
	 jihTZCS7cojDpv7C//a6B71WzST6IzTvUknbrLUMNj6qXdfyoKw/xOc2TKKqEuHdQi
	 SDYW80vnBHF5w==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251225080241.3153453-1-wens@kernel.org>
References: <20251225080241.3153453-1-wens@kernel.org>
Subject: Re: (subset) [PATCH] mfd: axp20x: AXP717: Add type-C CC registers
Message-Id: <176797323317.1819213.6217143202199150737.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 15:40:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
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

On Thu, 25 Dec 2025 16:02:40 +0800, Chen-Yu Tsai wrote:
> The AXP717 has some extra registers related to type-C CC pin
> negotiation. They were missing from the original submission.
> 
> Add them for completeness.
> 
> 

Applied, thanks!

[1/1] mfd: axp20x: AXP717: Add type-C CC registers
      commit: 7a4c13c592225cd6728ec33056bb8252ddef1617

--
Lee Jones [李琼斯]


