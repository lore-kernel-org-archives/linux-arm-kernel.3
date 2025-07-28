Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD41C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 05:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2x5SOCwxdR4XiWwDvt9rrfDdFDSecmOBWYEDgHUIkE=; b=bUuiLGRSBVqBSDPclk+Jl2/RRx
	oUDPnabLIVstzNFyUU9Lpl56T2DScobeI3pZJVUzMs5nOMFETFc/4m1uEH4aDaUUqjtlG61ANtJ7N
	MelvDm+tvLVfg30pBNu+xEgDWip874gh+qVe0gLxUmQyMxR/fwBnKSY8kWyawJxlgSKZVN0rsz2J2
	66oo4fW6fqd6NotYQiJBesLIYYDSA7FpKPszv9BGx1s3At+faG3zTOvzgI+rmbJJqsxuUoCTD0Zdf
	TDpS78G/ATwOZLyNZKv6y3AhMqkArD++pRIAfUAAKJ++sKra0MHSKWasGeBaAOQDjhDMVDvcjIP9K
	XTa0m2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGHq-0000000DeXV-2Bex;
	Mon, 28 Jul 2025 05:20:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugG8o-0000000Ddir-1fcF;
	Mon, 28 Jul 2025 05:11:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42AAB5C5803;
	Mon, 28 Jul 2025 05:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F09FC4CEE7;
	Mon, 28 Jul 2025 05:11:12 +0000 (UTC)
Date: Mon, 28 Jul 2025 07:11:10 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Erik Beck <xunil@tahomasoft.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
Message-ID: <20250728-dashing-discerning-roadrunner-bc8b87@kuoka>
References: <20250727-linkstarpatch_v4_6-16-rc1-v4-0-0dfa7aa06ec9@tahomasoft.com>
 <20250727-linkstarpatch_v4_6-16-rc1-v4-1-0dfa7aa06ec9@tahomasoft.com>
 <9ebd9797-8d92-4799-bb8d-59a796e6043c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ebd9797-8d92-4799-bb8d-59a796e6043c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_221114_561732_1673A370 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, Jul 28, 2025 at 07:07:32AM +0200, Krzysztof Kozlowski wrote:
> On 28/07/2025 02:03, Erik Beck wrote:
> > Add device tree bindings.
> > 
> > This device:
> >   - Has not been supported previously in the mainline Linux kernel;
> 
> Irrelevant, drop.
> 
> >   - Is a single board travel router made by Seeed, using an rk3568;
> >   - Has four ethernet ports;
> >   - Has four USB ports;
> >   - Has WiFi (MediaTek MT7921e);
> >   - Has a real-time clock (rk809)
> > 
> > Base commit:
> >   - commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494 ("tag: v6.16-rc1");
> 
> Irrelevant, drop. This should NEVER be part of commit msg, because it
> makes no sense once applied. It is not even true in that moment.

Also now I see checkpatch warnings...

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


