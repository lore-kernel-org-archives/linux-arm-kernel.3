Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D66ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 17:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iz+DPTJta0/KLHF0Sec5orULniUFm7rdfsUd0Jm1tA0=; b=pFVLbYcsddywACya9shhqq3JNH
	T3x6ZfnHRvhSBBtYIuTiN7r3iGUefrOjpL5J+owaL2HT6YK8Ct3/7qpdfsfDM4Fjvyk3AF3d2xsOa
	z/y1OIF1W/ND0pxM4LO78omqPtFv+7RYOhfsJ/fCeShcjYsdGPytMU+cgPTy0yyszbxfhgi7AKgHP
	sl34/xP/9QEGs2oAu11K/v/X2FHCfqrv4kluE4QgjIBWZVcPp7sANcHjeCiZLEqHHP7B5P8TqhFNc
	oP1dMxCXhH40IUW5A4H9wskaAK++BedjbaMyH9zs891H1JMCPp1INjYnC0kxdXjmb9chS1e6yllY7
	q4UjsNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYRtq-0000000CRC8-11Pd;
	Sat, 13 Jun 2026 17:12:02 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYRtm-0000000CRBn-1hO5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 17:12:00 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gd2x321nbz9tph;
	Sat, 13 Jun 2026 19:11:51 +0200 (CEST)
Date: Sat, 13 Jun 2026 19:11:46 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexandre Marquet <tb@a-marquet.fr>
Subject: Re: [PATCH] ARM: dts: exynos: Add bluetooth support to manta
Message-ID: <ai2OYGlCx0x4NUs8@archstation>
References: <20260408-manta-bluetooth-v1-1-b7658e78359a@timmermann.space>
 <653b640e-8b61-4c60-a455-63a400b308e7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <653b640e-8b61-4c60-a455-63a400b308e7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_101158_587392_70C69D8D 
X-CRM114-Status: GOOD (  12.83  )
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

#include <atomic>
On Mon, Apr 27, 2026 at 03:49:34PM +0200, Krzysztof Kozlowski wrote:
> On 08/04/2026 13:56, Lukas Timmermann wrote:
> > Enable the bcm4330-bt device for manta boards on serial0.
> > Also adds the necessary pin definitions and interrupt handling for
> > wakeup.
> > 
> > Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> > Co-developed-by: Alexandre Marquet <tb@a-marquet.fr>
> > Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
> 
> Incomplete/incorrect DCO chain. Please do not reorder tags. Git does
> them correctly, so you HAD to change them manually.
> 
> You send the patch or you apply the patch so you must commit with sign off.
I developed the actual patch based on his findings. We both don't really
care about who is mentioned first or anything.

Sorry. Yes I rearranged stuff. So it should be:

co-dev: alex
sign-off: alex
co-dev: me
sign-off: me

Correct?
> 
> Best regards,
> Krzysztof
> 

Best regards,
Lukas

