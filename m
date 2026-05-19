Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C5CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYc3rMuqtdbUPGsnap7XqFo1sI+Kxhzb65walmyAgxM=; b=SIZH52HjYgTA0CoqPSXhQaljTa
	uAQFRpLR80DeB3NcjC38o0fzcnbY+SDSdA7oSI/54P2dbG9TCc6mLeXWKGYjuwFr8jnIAt9oYE/19
	wyj9/et14V6xGyBr7LdHq8uL1XBA07owvKvPQfrJL3UdTfeQi+lD+X1FMWzmUpc6VokcNHfFJE93Q
	TvVxtkJmjxY99n1HioKliYPoknfAgzkapRx5yeHEVS6jVL+yciWRz2ZWzWU7E506B9f2kKbsNtloQ
	QEEUU2FJmMUjU8AGPzHUtfVYFsICMCw2J74D1N0G4E5lzfpiE0d6dtnmAnmgRo4P+Nd68mLn4LvDD
	Sb9FX2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM6S-00000001xIV-2bQq;
	Tue, 19 May 2026 15:11:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPM6Q-00000001xI4-1LAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B81AA43893;
	Tue, 19 May 2026 15:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FF3C2BCB3;
	Tue, 19 May 2026 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779203485;
	bh=2at4VulYor1uXp41+7kdU+pC5cibXA6o89H6Hc/QgJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tkDd8+lqTV6I+cj+nU7IpVfQae7SE9jvtrQl70Sk1tedxpIWa5sWv28HWx3DLmNfF
	 AGuaLcCRwGU2Pj7eE2CO5KZtGVlXlqV7rRKfsT6PRw3zBG+ErW+1vJTQuVsWyMaa7c
	 LMAOH0Hx6TMWZoI/qliSR1/Y6kuKooBIM4814qS0xowqjDhiDwk/NyfL9xpG72ZKDp
	 +cewumJuJH4XGgpLlXl3dAlp7GZXtoq8KkLtSSWSdVh2CdfJklWej2Ilj2NIEO6AMX
	 F/7EsuVLTU2IDnhaYlgzc/I3Mr+VXQJjiOSNUAI6iARZz7DHAazv6hN9TVMKp38z5v
	 y//3wn2+t36uA==
From: Srinivas Kandagatla <srini@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
 horatiu.vultur@microchip.com, daniel.machon@microchip.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260515115954.701155-1-robimarko@gmail.com>
References: <20260515115954.701155-1-robimarko@gmail.com>
Subject: Re: (subset) [PATCH v3 1/3] dt-bindings: nvmem: lan9662-otpc: Add
 LAN969x series
Message-Id: <177920348320.46651.10379422928987643121.b4-ty@kernel.org>
Date: Tue, 19 May 2026 16:11:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081126_381725_45985807 
X-CRM114-Status: UNSURE (   5.55  )
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


On Fri, 15 May 2026 13:59:07 +0200, Robert Marko wrote:
> Unlike LAN966x series which has 8K of OTP space, LAN969x series has 16K of
> OTP space, so document the compatible.
> 
> 

Applied, thanks!

[1/3] dt-bindings: nvmem: lan9662-otpc: Add LAN969x series
      commit: dbb14a8de386286bd986513c89eefedd8471aa45
[2/3] nvmem: lan9662-otp: add support for LAN969x
      commit: e5b013d742acf9894c9ec534bbc8ebf1a3dd3c64

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


