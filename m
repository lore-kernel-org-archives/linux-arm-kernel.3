Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF814CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FCzysB2PP/ptDx3tP/4JcOcfRh43sgPZpbfU/iP6tzM=; b=mJ8LUyKqMDW8Jm2kIRflszYxVM
	afAdynu4FWQeaUiVHD1jpdbLoWLZMKjD/KxPvyZuIRYgtqtf34AsL6Deej9GwI8fSxvuu3P+0S8VH
	0OV6l8vjOFTfOJK1MGLoJ0MbaDQXwvu7R+ukJXmefludnj8EqdkCyef4xTS7ZZ+dZs2wTYxV9mVp4
	keUT/HlbyxPcO0Nw/Ax+slK2V4/zMEWxX7E++EmVEORhdMkD3vTqURzHc5q3cnDbCybU5Fwd34xlM
	9MuVYzIhEjF/ZiPnoVzzOGFxeSTsMGVCb0aLV5Gz8K8sedY5HfNm0WItN4PrpA2sebjwWX1VfH8hd
	9sNqiReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90mv-00000001ZoF-1Ref;
	Wed, 15 Oct 2025 12:39:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90mt-00000001Znp-0VWC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 12:39:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 841B6625B1;
	Wed, 15 Oct 2025 12:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF81C4CEF8;
	Wed, 15 Oct 2025 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760531966;
	bh=O4vy5PSXyIGPiDBPil6snETDgyGJ9ca0rxgId+YGngw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aADQLKwn0O0etKEqQQ+te27f5Oajw9gR9Exbma95Xn1NrWBIo/sS40/JhgBFHYNPq
	 zuJi90mAD3JBoVaZWRht4dAbJvomp0Ynmh/1RwE4PtotlI9jDhsdDEv1JEMlbcpFnf
	 Geo6XGPmXHW1prv+ZSjTV3NAJYD2YoMYT0f4SI2wRAe/3ykfGrtKEhEVKTTtXlFnyb
	 XXv955yEJKhW5MqOUKOpmD3U5LoiTcNHisZrU9fStcr0ZtunBhk9kvqRSEZXsxHME7
	 oNmbA1ZXd87mLoyJ8aIgfeCrSoDcx7VhNgdOg7pv5sVvtAYaDZv5rz75Xcl59zPy/2
	 OOgbiVL/zBA6g==
Date: Wed, 15 Oct 2025 07:39:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	andrew@codeconstruct.com.au, krzk+dt@kernel.org, linux@roeck-us.net,
	wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
	joel@jms.id.au, linux-arm-kernel@lists.infradead.org,
	BMC-SW@aspeedtech.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: aspeed,ast2400-wdt: Add
 support for AST2700
Message-ID: <176053196354.3197283.4565101517229903275.robh@kernel.org>
References: <20251010080315.816628-1-chin-ting_kuo@aspeedtech.com>
 <20251010080315.816628-2-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010080315.816628-2-chin-ting_kuo@aspeedtech.com>
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


On Fri, 10 Oct 2025 16:03:13 +0800, Chin-Ting Kuo wrote:
> Add support for the AST2700 SoC in the ASPEED watchdog device tree
> bindings. This includes:
> 
> - Adding "aspeed,ast2700-wdt" to the compatible string list.
> - Extending the "aspeed,reset-mask" property description for AST2700.
> - Defining AST2700-specific reset mask bits in aspeed-wdt.h,
>   covering RESET1 to RESET5.
> 
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>  .../bindings/watchdog/aspeed,ast2400-wdt.yaml |   8 +-
>  include/dt-bindings/watchdog/aspeed-wdt.h     | 138 ++++++++++++++++++
>  2 files changed, 144 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


