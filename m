Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ED3E67497
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ykcLnQHoy4TBgOsVn7fcmZI+JCdvHio3fBYC0hkFHk=; b=WoAT5NClncH5ZkPYxkeZ8+SXWb
	yOU/vG26H31NBBydsqhat+kycaB9NU0CDy8sZcRDTeecQCB+9s9AfuhJB7LlWrvaLqNouyLxtnN9/
	E7Rc/McBQbUv2aT5HpyI498Hf/ArLQikKIDy1mbZ79Lh0Xs04iM5aKQ17yKuFqVn+EWeB67n0KjLm
	sI/bBvi11H+gaqp73YyTGBN+i7lvhYlrj5/pe+ytO9XFtomM95KXqphs7pUN5+8FJaXPrB0832lvR
	gEr0mdy/H3Oo5S+Ln/+dyNEW7Yrk8TPIzOVC+TR4WVKyibq2wOKo5OlJ1CAdLKwS8LZNfWSKUm/rF
	i8tSqZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcnf-0000000Dalq-3PlR;
	Mon, 22 Dec 2025 10:05:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcnb-0000000Daks-1oYa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 10:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CCE0D43837;
	Mon, 22 Dec 2025 10:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F80C16AAE;
	Mon, 22 Dec 2025 10:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766397954;
	bh=zGq4ggfr/5r3cP3TvgM/5sBKvQSbzMvvoNBA0QQ30YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vNSADsoUF89PpeoLNUdTnWQGG7vbJMAG9szZBOiIBVwIvEMQ3AwtJVwhnYR/Uusty
	 WBxN8i7XVKk+QPtnPGNF0/+1S58ZY9WlYg0iTW/EyPiRywdsaFvPizShvzDxXfwDJD
	 Em5Akox4RSAF4ZXMNhI3z5hjmg2QMixD/iEYvvT7f217BjzT3y0WQfpMGq1OYLL9QI
	 /uV4C4CPIEWNtFgBam/8yqnd7tonw3M8x+RP3qJ3xAfRgyCGsYnNLmjd6HtbZABCJB
	 SiHAQ5h+GGtdfcslUfss+84uEcsDCf1Usz4WA/mcwrzKPl5fhBmby3DRJ+pT77SLBT
	 n1AE/z9hA1Sgg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251216191212.2879226-2-robh@kernel.org>
References: <20251216191212.2879226-2-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: vexpress/v2m-rs1: Use documented
 arm,vexpress,config-bus child node names
Message-Id: <176639795130.32569.11857070217126257109.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 11:05:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_020555_703987_EDEC1622 
X-CRM114-Status: UNSURE (   7.51  )
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


On Tue, 16 Dec 2025 13:12:12 -0600, Rob Herring (Arm) wrote:
> Update the arm,vexpress,config-bus child node names to use the
> documented ones. Most of these were updated a while back, but I missed
> these.
> 
> 

Applied, thanks!

[1/1] ARM: dts: vexpress/v2m-rs1: Use documented arm,vexpress,config-bus child node names
      https://git.kernel.org/krzk/linux-dt/c/7dd84bbec273345bd5735f6917b93eb2a7d9c0c3

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


