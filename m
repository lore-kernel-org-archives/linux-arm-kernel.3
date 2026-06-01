Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tq9hC/3pSjCU1zQh1hrpFiGfKgYq/LkIGM+ulqsQyiA=; b=4qHEGZYFXEraVC3ayzgS96NwTZ
	mYtuJzmWsCRtPdNE9l0lbN/84sCbOgS57GrmS3Oj62q/Xwt1D210D/SnUDB2NXRco7CyW+16rxe0o
	bbUZo+NVrkaV+JBEUqX6GlbRwpaxM+zKSRwVUBxwerAn6f/HqgpHRPTXfsQi/4/bjIbnVkdKhtNhO
	Q418h2UJXnGI7MkdhuWoBvEzTHb+kHawfpUCXP9zXstF/qEevLL5qdtrhIHKBRWQm7a1KHfsbyRVx
	xMafIpDKbHjjsyo1N1myC/7E+QYUwDk7K26P60sPoMJotNg9IRVYTQTAuMlsxBCfw6YpMNKqsatQt
	cqkxo1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8J4-0000000Bip0-0vC5;
	Mon, 01 Jun 2026 19:28:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8J1-0000000BioN-0aS1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:28:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AF7C40334;
	Mon,  1 Jun 2026 19:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EEE1F00893;
	Mon,  1 Jun 2026 19:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780342090;
	bh=tq9hC/3pSjCU1zQh1hrpFiGfKgYq/LkIGM+ulqsQyiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T7HvLvVOibi7qLus6vM4bZcU/nYKtFxRDkObZU4Ht6bjnAvszWEQaWIE7f3lghyIN
	 JJy7Nkxjyh196lRU2i44LmfFaBu4j75sVgtwkQFtOKctxO9UWvnC0wJjMkpziwbBhE
	 RL78lH7nm5ttrkft3JDArP2TxydubsfCNRQXstUb8LvJ+ItghrBrYCGbPz1/iJuFZE
	 884xhIC7/yhZvkL21KoTwua5HEf8//gMzUsFtJ5FF7HjGM5Dia1nhmsbsnrR08g/Ql
	 smWOIDdem/8ePu6Ik1FYG9j+QhoaHU5VzByUaJa/GFgY1N+yYnAHic48Jhnsa6iQRZ
	 TtzbXfCrhBeBQ==
From: Sven Peter <sven@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Michael Reeves <michael.reeves077@gmail.com>
Subject: Re: (subset) [PATCH v2 0/6] Initial Apple silicon M3 device trees and dt-bindings
Date: Mon,  1 Jun 2026 21:27:52 +0200
Message-ID: <178034193517.3711.18153194478204531400.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
References: <20260505-apple-m3-initial-devicetrees-v2-0-b0c2f3519e0e@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_122811_194878_467965AE 
X-CRM114-Status: GOOD (  11.58  )
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

On Tue, 05 May 2026 13:02:38 +0200, Janne Grunau wrote:
> Hej,
> 
> This series adds initial device trees for M3 Apple silicon devices. The
> device trees contain only a minimal set of hardware not going much
> beyond the minimum required for booting kernel and initramfs and
> verify via serial console that the hardware and drivers work.
> The hardware with the exception of the interrupt controller is
> compatible with the M1 and M2 SoCs and the existing drivers.
> `make dtbs_check` fails due to already applied and dropped apple,i2c
> dt-bindings change (commit c5f25f5800f5 ("dt-bindings: i2c: apple,i2c:
> Add t8122 compatible") in
> https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
> i2c/for-next).
> 
> [...]

Applied to local tree (apple-soc/dt-7.2), thanks!

[1/6] dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
      https://github.com/AsahiLinux/linux/commit/0407ad56fbbf

Best regards,
-- 
Sven Peter <sven@kernel.org>


