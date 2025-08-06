Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D61C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 01:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJIT0RKIFHGb2UNWgeL4YzLrs92/FLX3uGi5Yvs8A6Q=; b=yptXXrwyzkCYuhSr07B8N0YieE
	bJ0rQf+Bm29POUbggeIXlq8HwPKCIDTfvLy1ocQohKyams6zK6cp7CBYBZdI+VP5v7/JT8LZQqar9
	T1x4izcLvcYedqY+jQdzh4d2jYZIvrE8JwDgvdia8fTkEvRBwRhqc4rHDtAXoFvMI5OypiODkPwKz
	A5GopQyts8AGGziP6EwIxhPHfIEJkeN6acaEZseWJuJsRCHJeAvKM4k6+Dk4WLdgPqp9WDYMXma6U
	fc9lasrvn2w6WTm30NgI41lvfg2cocqDMrzMJ1M/5nIDTuOTUOeBkhCf87112dfAc1wRONfUNgLKE
	D0IgF+eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSeU-0000000E6Cb-1RL6;
	Wed, 06 Aug 2025 01:09:10 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSbs-0000000E62a-2xME
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 01:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754442382;
	bh=gJIT0RKIFHGb2UNWgeL4YzLrs92/FLX3uGi5Yvs8A6Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TZ81NPG0Tpthj1GIOe4bGS2Jubcfz/OZCd47fs81p3MHlpHRx/JE1InaYGm1VNmOk
	 eegoZnSabX9UsZBc5kuxapDFz38wPr2kJfNLamgqMfqaKGt9KBOM3d2zV2xQJyPvbH
	 RcgE0jDa5P6hZTKSC762wBbswZAcGQr8R7iyf/uIF1qA5VFEJlMytsYQnRMuquWltS
	 MsooPpG02HSaArN3UPkzb16C464yxUmRG92PbOAQrrKI6UZ60k0uHV50kfPsphAoWj
	 uKxxH8XDDXSROrQApO09PBPyG1UTiK5scUtVKJnisHowTMYQrzGg/7kWXkIswrJZoQ
	 PFRrzAFd7f2Ig==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3982D67B49;
	Wed,  6 Aug 2025 09:06:21 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Tan Siewert <tan@siewert.io>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250803151822.68080-1-tan@siewert.io>
References: <20250803151822.68080-1-tan@siewert.io>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Convert remaining ASRock systems
 to NVMEM layout syntax
Message-Id: <175444238112.266976.6701389016981871511.b4-ty@codeconstruct.com.au>
Date: Wed, 06 Aug 2025 10:36:21 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_180628_944870_F6D7727F 
X-CRM114-Status: UNSURE (   8.50  )
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

On Sun, 03 Aug 2025 17:18:16 +0200, Tan Siewert wrote:
> While investigating an issue with an ASRock Rack platform, I noticed
> that most of the ASPEED device trees using NVMEM cells to populate
> MAC addresses still rely on a deprecated NVMEM binding syntax.
> As a result, the MAC addresses are not populated from the
> device tree/NVMEM cells properly, and an address from "the chip" is
> being used instead.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


