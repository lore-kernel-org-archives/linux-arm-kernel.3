Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27E9C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tPEnjAap/3p3U8w3G2ymq5iG9k5ydSQT5DdCklloro=; b=SC+U64PEqpdtjHtDdn2FbjZESe
	hoiBA2DaWo4T+M9br9tC62gHjJJfD3KiQvPeIKVMBFZ9P1oHLqmbem0KmNphP6eO2UQ+97rWqPWKB
	0QwHFpBLPWumUaZKLuTd13fyiYkH1ZPoqDSjgtODfatmd2ndk2YXBhPEvCk+4lded4Wuxvo7CzkWY
	2/UAqD7GrYFVPqkuuGHLWmf3uNDg+F6TZtnxmIaMsgjvOudDlTwWdHI+mwjjWkWyjzwkQ9ISQ5d6d
	Mk2b1D4cyU8Q0bknDR9VQD9LJdvmTR10Igyked0wytP1KOXpAo+vnHt2SUbk89EcvHJrBibxie3vx
	AMuLsT6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGmy-0000000Frxw-1QJS;
	Fri, 27 Jun 2025 21:39:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGY0-0000000FqRq-2MNJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB933A530A4;
	Fri, 27 Jun 2025 21:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D36FC4CEED;
	Fri, 27 Jun 2025 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059427;
	bh=fehMFCUH3KhEvqug73PruZYf0DWjeC5huA3vs4xluvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIbR7wJxsoQ2rLO7sLKmjmIZZldXRZBpd87m1W75o5prHIx+izgNVU8bZEdbzHXBW
	 ZZUYGQDdAIzAuzzi0XEi9VaUTeeVExdf2IPFhB1Ge4Wdf3EDci/QLLCasu040YZwtu
	 DQgEGJYMjPwAHe7CdZBm+U+VeYgOIje//Aif6Nj9ziM+8vNih8PySLntqLX7Q9eoyh
	 PuIKXHQbCUgaQpzmE96lbs569yqxH0HxBN6XkdWkz5wRvyEW/Nay8y6hB43LSRgDBh
	 I+1HBRYDt+kSW0TS6byUQuQ8n7EAbDA6PKNXZqQB2O5+fENwExEpF7g9sTx+cpRWb4
	 AqLIUIjhKGc/w==
Date: Fri, 27 Jun 2025 16:23:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: soc: renesas: Document R-Car V4M-7 Gray
 Hawk Single
Message-ID: <175105942561.167972.12432748886572793893.robh@kernel.org>
References: <cover.1750931027.git.geert+renesas@glider.be>
 <b4283a68aa01c82d4435ee8334093dcbdf5bd4d2.1750931027.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4283a68aa01c82d4435ee8334093dcbdf5bd4d2.1750931027.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_142348_662924_CA6077DA 
X-CRM114-Status: GOOD (  10.13  )
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


On Thu, 26 Jun 2025 11:51:32 +0200, Geert Uytterhoeven wrote:
> Document the compatible values for the Renesas R-Car V4M-7
> (R8A779H2) SoC, as used on the Renesas Gray Hawk Single board.
> R-Car V4M-7 is an updated version of R-Car V4M (R8A779H0).
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


