Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABDFC98322
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 11:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN4w6fHkkzoF8VBfe/UUIVNrkadCi2VHk54LmzRusYk=; b=QvUK8oGk2rueqqy0/9FDX4bxLx
	b/CzrOv7NTyn6qecpSJ/DQw9pXrodhyUaIEJtWZ8Empn6K+lRM0P9JsebM/kV2eClIayXgZZgcsIf
	jcr/Y1heTHnwBTdhE2NIx9mzTgLb4q3WW2TsFnjCowqjLB+YxOIqLhVBuASGg6XeBqq2/8vLObq2o
	YZkmM47r2Km8O7TjMyYRvesOeBFLrKio8lEdvV6TcD0vCp/XJPPgXjPdsLqWxBRFhCJzychvvT76K
	V97gfyJENJwwqZihXSOEDV0h6T30cxatRCE+GefCRmUWfA7OGJBOa2MFO5wZx6tt/XhxdoyBLWvb9
	EirvValg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4gW-0000000FVoc-0NjO;
	Sat, 17 Jan 2026 11:41:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vh4gT-0000000FVoG-10ZC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 11:41:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 64EF343B7A;
	Sat, 17 Jan 2026 11:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B106AC4CEF7;
	Sat, 17 Jan 2026 11:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768650096;
	bh=EN4w6fHkkzoF8VBfe/UUIVNrkadCi2VHk54LmzRusYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fvUx9qF3hvnb3/Q/mfpJM59biZ7WYrRxHlItmeM8adSbMfxNjwKfQH0Z9OmyX8k9i
	 tFDqAEeJRZANJD3LqIE9PRvwJcewc+ebK+uvXJt+xRD6Q8af1dsZHxg85oDSqB7wbC
	 8l/dMevV3LrzEtjE/VTnvHAmCG0Kwnw0rz+fuPH4As4bdKl+yCjGEd1I68n/OaEgeP
	 +tEQOrg71A9AXaF4GjTdyhJguKIrdnOtz0TFlAAKQgG7vIThJY9Ld3Xhtcz5vJTQSR
	 JZOWKDOQD810chHMstzwskLLBmKrZZ3MkrAqTivKUrR0MYCSyaJ79xpqkU0TablI1N
	 Uh5qFKXP4+b1A==
Date: Sat, 17 Jan 2026 12:41:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Mark Brown <broonie@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Andrew Lunn <andrew@lunn.ch>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] spi: dt-bindings: xilinx: make interrupts optional
Message-ID: <20260117-polar-rat-of-current-adce4f@quoll>
References: <20260117012136.265220-1-abdurrahman@nexthop.ai>
 <20260117012136.265220-4-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117012136.265220-4-abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_034137_301461_C59A6C50 
X-CRM114-Status: UNSURE (   7.12  )
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

On Sat, Jan 17, 2026 at 01:21:36AM +0000, Abdurrahman Hussain wrote:
> This makes the driver work on platforms where interrupts are either not
> provided or broken.

Please slow down with your patchset. One patchset per 24h so you will
actually give people chance to review them. I just posted comments for
your v1.

Also one more note (please address v1 comments first):
Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Best regards,
Krzysztof


