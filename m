Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09095E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwEqlKRKVFLW0nKoyrXaVB3XlJ2udE3kXaiQtI8k958=; b=fLnZBGQNHnpeFWGuOKUirMnPXX
	hpJ/icU9lL+6Ol1hXXPfvFtALA58TKcD9A93alUnsNIu/RkkoeWqHRrD0HDJg7fojn9ADgWLyoHkb
	2Y/0MRWmT080iKjLADDBwJgtgMO1xiRqoNiydxltEdGyQXItxRkvlR5X2cYNatoR5O2LK9j7Z95CL
	FDg+7CgqdhHej044z7UHEMUAVB0jFRwRK3i/Ao5FtTiVgY3pFSBFiGW13gYY3+0Sy1eqn5N0oksIn
	2dFDF2qgi7yJT2l6rQ+Lriev+QN8aMmZtepFaLjCQJK4BhaJqI/EZXgMe7bjwW6CkW02WOsBCqSaa
	NTG0ku3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpLL-0000000BS71-37un;
	Thu, 09 Jan 2025 10:00:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpK5-0000000BRxz-2IAJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C664A4132E;
	Thu,  9 Jan 2025 09:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FFBC4CEDF;
	Thu,  9 Jan 2025 09:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736416768;
	bh=5sWHctMBLzN4RbYP/rFTh0bZoUqmreP+M2uHEzQOFfM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GUrkiXPe7nd1AeCU60gKOm4/1iLacvOoWZjuRz1pqGP4qEk2/1ep54YsFCcNpNEjV
	 9GY6tysynLWRkUjVkTG7wOntDV/rp+pE8P4y8wTNulVfSBCYr3DHe4rtpNeQUuHXp/
	 lmc8r8rgu0sZwC8/Jz4aAS0p1eyVgMXSC3iK34di5tK3e+pZuOGBbfHxGY1wOFbGKc
	 RZAXVRTYabht2/ZUtwleigxuoWE2Zt5n2rZjnsfpXm+XCYbJlMgsMr21CbZMjwvwZl
	 re35C03QsEPmfJ8BGIpOUjUoabMmBY6UjvqZre/H4t+fstUkn5vhwUDnD2ot3q3RI0
	 1n30zcE6eEG9Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Charan Pedumuru <charan.pedumuru@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241218-matrix-v2-1-f3a8809ee5cd@microchip.com>
References: <20241218-matrix-v2-1-f3a8809ee5cd@microchip.com>
Subject: Re: (subset) [PATCH v2] dt-bindings: mfd: atmel,at91sam9260:
 Convert to json schema
Message-Id: <173641676617.2552178.14439346339961145074.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 09:59:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_015929_696069_D84694EC 
X-CRM114-Status: UNSURE (   6.84  )
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

On Wed, 18 Dec 2024 09:24:54 +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> Add a missing fallback `atmel,at91sam9x5-matrix` for
> `microchip,sam9x60-matrix` which is not defined in the text binding.
> 
> 

Applied, thanks!

[1/1] dt-bindings: mfd: atmel,at91sam9260: Convert to json schema
      commit: e3f17f8b55e76ed06a092cb8d187d3dba5102ffa

--
Lee Jones [李琼斯]


