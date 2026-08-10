Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CF2C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2aXjqlZJY2XwQyr2ijzNBco1TPxhbOhA17EK33gL+8=; b=Z82juj8O4aT7P1YFavyUDW+bXs
	uaa+v9x8z2HPDCDKGo8QBqoz3GCTBf3lDQBIOX1LhtM2N+nyhX9svzBMahUC55yhA2oFn9WniKZFV
	EZOCfoxuL15Up/0OsIuBVWIF9R/au+iJrPtPUjryuHDI/nBUfKAirwq3vTWDoFk4hVhCLIhufCEcJ
	G2gDDy44kn/Pini3f/ALxLT/MqAM0DkKRLQiHCR1zuS7iPbA36MskEtNkwOnDUplzAl7VmZJQbnwY
	YZzDXQeyDOfI1wAEg4hc8TwdNoGDribsh0y9avhmF8Mv4uGT3cEK/Zj46iCJ8KiIZ7LvOM8WqOIyo
	+9D4Z8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXxB-0000000Cvxn-3QlE;
	Mon, 10 Aug 2026 21:54:41 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtXx9-0000000CvxM-00B8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:54:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33E7B118B78;
	Mon, 10 Aug 2026 23:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786398871;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=s2aXjqlZJY2XwQyr2ijzNBco1TPxhbOhA17EK33gL+8=;
	b=K/GW74Ru5ot9a3m/bT05DxW85NNDE0yfURz2sZc0MKygnSX81Ci0BzePTxVcRO7ASJGtNU
	gdunC+TNEmo2SYi2/HBp0XDdaAq1B+yLSosDTcFCKtiQGb/PY/cBFm6O6z80dyny0zaRId
	w7ibNbzQqOLRmwKg4ixkeWnmmYNOkfL4BdimDjZ3l3w7VstBmCfLGx5LElVNBqIWy6Mg/6
	wVx/+Sv0bZBAjGAM/UWGO+iIGfk5m+YkZsPZq4U/n5Gg6cp8/6aH7snmFlN4JedH0SObxe
	mNqIa0+QP6zmTw7qhkq96QjdHAghr5+cuca2H07y/h/vooh631qhsCDxld5aWg==
Message-ID: <c5bcaa73-97d2-465c-b6cf-aea3e339d7f3@nabladev.com>
Date: Mon, 10 Aug 2026 23:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: Select HAVE_SHARED_GPIOS for ARCH_MXC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Fedor Ross <fedor.ross@ifm.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Rutland
 <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260810213456.1268831-1-marex@nabladev.com>
 <anpGRPJwQbt6UMZx@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <anpGRPJwQbt6UMZx@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_145439_185097_64C3F0FA 
X-CRM114-Status: UNSURE (   9.58  )
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

On 8/10/26 11:44 PM, Frank Li wrote:
> On Mon, Aug 10, 2026 at 11:34:38PM +0200, Marek Vasut wrote:
>> Some NXP i.MX platforms use shared GPIOs. Enable support for them by
>> selecting the Kconfig switch provided by GPIOLIB.
>>
>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>> ---
> 
> Haibo have similar patch
> https://lore.kernel.org/imx/20260730-can-share-silent-v1-2-63fd603f943d@nxp.com/
> 
> But I hope the SoC maintainer provide review/ack-by tags
This patch keeps the list of select-ed Kconfig symbols sorted, the one 
from Haibo does not. But with that fixed, the patches are equivalent.

