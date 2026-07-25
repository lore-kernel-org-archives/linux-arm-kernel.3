Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E4C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbuOFMkRxVms7r3kOq3uKHo3i0x3RXBbHFMyv0ZkPOY=; b=1Zok0FwgPFby1cLKry16QTLgmi
	rH1VHYjRx+rDblvjbAE1gJO+PVP5d5V33U6B0qPtyJPEdaSv5VnmcF/fyTj2V/JRW7TyHny5LaJ9C
	pAEE2Giy3oUw7rpqy9aVHV5XE41Fkr1InnWeiAdOGorztGQHW6APmA5wN1r3j/Kl1zdaVUCQCHMeu
	8WscrC52O5mnrGhFnyICgECBggaXw7f9AzQYKPoMV0BltMw/q+OvHCxbSmBkZK2TKJfX4QYOetsE1
	QT13fqSDZpeGZ9b0Eeb/pypYNqV/hKrIdyAnrRx+yAB14Lioj+NQgTm3kbI/RCPQFVueTQir3VSov
	1kqxGZkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfIs-00000000XY6-2bA8;
	Sat, 25 Jul 2026 16:32:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnfIr-00000000XY0-46jC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 16:32:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E962660A6E;
	Sat, 25 Jul 2026 16:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBD21F000E9;
	Sat, 25 Jul 2026 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784997164;
	bh=PbuOFMkRxVms7r3kOq3uKHo3i0x3RXBbHFMyv0ZkPOY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=Blh3Kg3cpyk2cVpsB/dGUXJYZFf1ZXEnLLQqr+x4JWAO2kprTrUYGX9rkH//iAqaf
	 mr1M2s0Fif4uPhmA49xKX8Vh5J7k21ZUzxbOcnKoKUdqs6wmt3T4Lt7BfiB1qdMdAj
	 yHiYIxnSoywZALOls02EXBZpD9twbc8Ukzk8g65OtRn+vp5h1+tYARiKMUn0pEm+xp
	 jaBf+bHzis7jZ6yuZLrDli1/JnexlgKGqRkmfYcdQReYBBb0vPi55Rs3b4y4CtoC6V
	 02Wh26942jtBEDpXbu7w1hQNrxLMrdGtPUN5UsfSRf+AqsS8hD57KGZz3A1KHbXwhp
	 9BOWVAjfpfj/g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101942.341681-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: arm: Correct indentation
Message-Id: <178499716080.107055.11425228685012031040.b4-ty@b4>
Date: Sat, 25 Jul 2026 18:32:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Mon, 06 Jul 2026 12:19:43 +0200, Krzysztof Kozlowski wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).

Applied, thanks!

[1/1] ARM: dts: arm: Correct indentation
      https://git.kernel.org/krzk/linux-dt/c/14f816138bdcb0e0c00f4b82be75d0485af22b30

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


