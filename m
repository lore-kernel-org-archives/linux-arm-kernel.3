Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58666CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 01:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s0IvEn0QduM+NAryTI1PSdqYWmoLeqb5O++XMz3oOw=; b=TkVNjSxAy2e93HThx0NFuCGFeh
	O9zf57X5CoeU5M1kEid6j/VGRk5sh5rJaCUntkwK6AzITc8vkRhRcCn2neIJx6oP8ca7A/nxYdD/M
	tyNjMz2xzcv5P6MCGD8QCKrIpdqlUvzvu3m20VfClupBwXiwMu4Zkus/9L7uuxQUzhY3bLZeejmeO
	PJcmvPxuU3JRRCDKE3Oz0KoRS1r25IPNnUVreEZBK/68DPv1n/5PDT1VTGhWzqBZJ5ZbWsglqC1cI
	g7gVm/EYBeYAQbAIbnAjZ9gWi7KNwuoMVOxgZBitPoFhgmg+VXcNdwZeiKmAwTh4Qntm+vFp7ZBH0
	L3N2rG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9hr-0000000HOqK-18on;
	Tue, 19 May 2026 01:57:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9ho-0000000HOpl-1ZQd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 01:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779155822;
	bh=+s0IvEn0QduM+NAryTI1PSdqYWmoLeqb5O++XMz3oOw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fmsUIgxthdrTTcu8M50vmX7XAI/IclFp2ZBtqRSo+0ldwe6FoGrnvbvaZQyB0bCUY
	 8GO4Zq6vJ+9h/Bb2E1wYtLqQKYNLrBHMw6D6/OGayZ65QnINC+NGwD9Yv8utM4D33u
	 xc/twRHI5UE0I8ba5Nh+ZuR9ArK7HGt+7iUo/kIBmo7J1QVVpaHYC6K38/EQOvJZqC
	 m1b4AJ/UPwop5RYahz92TT0XHcrZjVTyyVNqTj7gtXAahIzOCeGRjW0koF5IykJFdZ
	 /dQ1wU9L+t1LZk/C562JZXRz2Xl/43QCV1CfCqceJs0FIdvEL7S+/vO3VlRqDAJBD4
	 IIyjJV+/Xsnvg==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9E2946025D;
	Tue, 19 May 2026 09:57:01 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Rex Fu <Rex.Fu@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260518-anacapa-sgpio-edsff-thermtrip-v2-1-e43b1847b2dc@amd.com>
References: <20260518-anacapa-sgpio-edsff-thermtrip-v2-1-e43b1847b2dc@amd.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: anacapa: correct SGPIO names for
 monitoring
Message-Id: <177915582159.2591185.16167968978393310497.b4-ty@b4>
Date: Tue, 19 May 2026 11:27:01 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_185712_614691_2931D7BC 
X-CRM114-Status: UNSURE (   9.45  )
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

On Mon, 18 May 2026 18:00:40 +0800, Rex Fu wrote:
> Update several Anacapa SGPIO line names to match the existing platform
> hardware design and the signal names consumed by userspace monitoring.
> 
> The previous names did not match the actual Anacapa SGPIO usage. Some
> lines were named as CPU or CPU power-good signals, but they are wired and
> used on Anacapa for EDSFF presence, EDSFF power-good, boot EDSFF
> presence, and thermal-trip assertion monitoring.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


