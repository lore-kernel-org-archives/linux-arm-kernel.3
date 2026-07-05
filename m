Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB463C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ME+6HlD+08OSFpQWIBYN3eSrff9bfZygMLpwYCEDWAo=; b=iU97bkKA/hD7KkbsoU9X3pjKkM
	NDEYU/cWyklf2ptSkOrJNHz2z0ijPsg/Abxq2d+3ys4X7RM1XTVDXgEH8wyZ5at1Pp7hBHJlaEhUb
	Jxv+A3Xc1a8HUVfD+wJCxMXF5pAbOeErYB0HOcuSD5dOetgOi4IfeMQw1fz6xAf+yv6iUyvvrIOSt
	jjuZkpNLkNl74HtLZOWoYAImUWAR8UPacWqDRltt4EihQe24FFS0o2Tv8tsyontqcGGoV1gMaclkn
	8OoRmrGs8vhHzIvDRClDlnDpaWf1HZrEO6HC8Awq/EUV9vcuUCQpRYMmZX8k4+3Ym1RvHElPQDTOM
	aFmrkwxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNqr-00000009OFs-0L37;
	Sun, 05 Jul 2026 14:29:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgNqp-00000009OFl-3jgU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 14:29:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADC444389E;
	Sun,  5 Jul 2026 14:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93C81F000E9;
	Sun,  5 Jul 2026 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783261781;
	bh=ME+6HlD+08OSFpQWIBYN3eSrff9bfZygMLpwYCEDWAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IpbWHNL4aDE28VUq7IZtUjfCn/nl9ZeT8TI5RezI4FqO61dP6vpN3LUIztZD5X/Ix
	 JdqMyS3n/L5rY/kTYGAhgsRu+GB4YlQD5QhkGF/3Cg0DjBmlKr+gbudAZfi9/sNRc/
	 52SQQTO/hUuZzMGGipFVTAjJg0zjI1nulzuT8lXYpK/V8n4VO3Rz79FoaW4jowZzZ0
	 CpxilAAHS23Fu4CfTNd05JnzDRPTy15IaWw9vtumtN+pXvRqPgguepv2l/lxqgfH/k
	 4D6OE8qxhfdN94LFaDakfO2GQIbH9pAp3aCqbPtdubX29XemcBUuGxp/RC7PPjDCje
	 Gi90nllJfFWiA==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Peisach <jpeisach@ubuntu.com>,
	Michael Reeves <michael.reeves077@gmail.com>
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: apple: t8122: Fix I2C resources
Date: Sun,  5 Jul 2026 16:29:27 +0200
Message-ID: <178326164442.9177.5710655356580684765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260629-t8122-i2c-fix-v1-1-cec044001550@gmail.com>
References: <20260629-t8122-i2c-fix-v1-1-cec044001550@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 29 Jun 2026 20:01:01 +1000, Michael Reeves wrote:
> Correct the MMIO ranges and IRQs for T8122 I2C controllers.
> They were mistakenly incorrect in the original commit. This
> fix is required for i2c dependent hardware to function
> correctly, i.e. audio codecs.
> 
> Tested on J613 (MacBook Air M3).
> 
> [...]

Applied to sven/linux (apple-soc/fixes-7.2), thanks!

[1/1] arm64: dts: apple: t8122: Fix I2C resources
      https://github.com/AsahiLinux/linux/commit/09780b4b4bdc

Best regards,
-- 
Sven Peter <sven@kernel.org>


