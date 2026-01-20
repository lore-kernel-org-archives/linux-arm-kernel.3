Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2994D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++C4BR9kRhIK6ZGnlEciRqdKbN7OqMlfx3AqNBoVUzA=; b=r+btmnFTpCJO6K1UBNaM7AsyP0
	8DWvEz9v5OS8Ol1FWU8Riy7qGce1fybo3bxmtZIGPAwrg/aWsGsLEv/TvDDHUrPmFH7KmPENgCAZF
	Ul8970yvGZNjaHJbgGxWAYWbBoYIbhennzLvUzXHdn9+f59r/xt+feNu6vLdxZcPYfGxfajUWIZZ1
	GNYpIHhUq2MZtxXjyx3CMM4+kxgtl6Z0kUofTyzUOrpwgD2WPM53vMOrlNLbilO6AkdXhNWGd5ldt
	Y9ehTX2FvMnUDv4Xi4+qtuUq8xoPfiX/thGeVRm6nGzrdopXBbLB8OkOfB22Z2N5uEFmV6Wz4Z/8S
	pKyEI0Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8RQ-00000003Ywy-1H2Y;
	Tue, 20 Jan 2026 09:54:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8RO-00000003YwZ-10d8;
	Tue, 20 Jan 2026 09:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=++C4BR9kRhIK6ZGnlEciRqdKbN7OqMlfx3AqNBoVUzA=; b=chN0uBNGfRCR6oDPEmcJiKgGJZ
	efQsN0uVcDkL3qsvoMhlIa/4HMAB7M9xKMPBpD53U7IIUnqkqW4CPxDO1JaEI5IXI2yi8UjA48H5x
	aCqJppwjTtZRwjXloMyB4y82KxagOqUAjpMYSg0DHNJFRmL7KxXAPQ2lv5hZMhfocABapHpEB7Cg1
	ZGwlBAR0KdyorLhgpUpTOJoZB4LNToCw4cBFUhqMIcAYfpJo36XXQAqIA9qb/BD8+we1EJtkxwzVu
	FTdwuA23yEPU1peSEOWzFSlZ9dWJGcbbaLAXTmnzNe5jHnJ4Kf4ZUeE3sp9jd3w5eN06vX5Do/E5j
	ieZdoo5w==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vi8RL-003Kkl-4R; Tue, 20 Jan 2026 10:54:23 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: dts: rockchip: rk3036: remove mshc aliases
Date: Tue, 20 Jan 2026 10:54:21 +0100
Message-ID: <176890285667.327842.5975737500132048199.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
References: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_015426_282323_36294FF8 
X-CRM114-Status: GOOD (  10.60  )
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


On Fri, 16 Jan 2026 22:05:24 +0100, Johan Jonker wrote:
> The use of mshc aliases is deprecated for some while,
> so remove them from the rk3036.dtsi file.
> 
> 

Applied, thanks!

[1/1] ARM: dts: rockchip: rk3036: remove mshc aliases
      commit: e546c69ac54e907d0c33bc1fde55689db301981f

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

