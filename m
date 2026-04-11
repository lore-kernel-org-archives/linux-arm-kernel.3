Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B770F3ED4F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIJfRWTrZ+07bUsnMvJoooyvlrKd0kozEHz7YY49teM=; b=2LqK0pkotzQitXvrm8OSfcbSOO
	KFzkIrTSqPGSROBg+QtPMQtXLfkMELntYVCdNcFmRw6+eAcsktG14iA1DsV6tGOKawPnxt348sdmM
	b9nqd2KQw4oVUrWS1xq4lH/CbMHoyVcokU0ZjhuGbTO7cW8ZOke3hdBmiFeygucQKtPlAgvQZPRZj
	KAEy+p2zI+BAO5OCK5FvLezemEVOO1OD8U+SVhIuXL5TlI4X3rrZnm337l6IL53xwzJA3dqYsVykb
	5QbOHh5VRHfgTUMuV0kRqJJ4brjytR0rTWrDcXaW2TnUslgaXilaovMMi3AapefY58BMSOFJzKyLn
	KPxq/48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYri-0000000DU5b-2UUv;
	Sat, 11 Apr 2026 13:59:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYrh-0000000DU5Q-01NP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 13:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7712F60145;
	Sat, 11 Apr 2026 13:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8A0C4CEF7;
	Sat, 11 Apr 2026 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775915951;
	bh=Wjrw/VJCjibWH2naGnKur4mOqCZG8mKaHZjp6H4PZQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwjsHGWC8+PIT63DO6+yO6erU5Z9LbIeuecuyPAYp2yC++QfD6Sa+vbi+hOMmb4hZ
	 d/nxx4V79RemQQtLY0gfInEbR3a+LIo5Gf8c0bfD/LhUZvLvyyN7poRXTTYgrp213Z
	 MHTVSX/re/Iiqt4y3LNWYOaiBKts49Z94sPKqglCUov5IgxJqx5udumZpII2YZy0Z0
	 ZC+Elvp3FmG7Z3xaXa/jIO8tb1RJnVCjCtIXpOD9Xy5ZWCQEkRY5YI0UXfBoKP3XTQ
	 fn/dFSouEjhQANv/RLJZ610seqWMmsNQcat3YLZhSwwyhu4KcQkvOM4fdebLKI6WG7
	 ti2+ktv8r1x6g==
Date: Sat, 11 Apr 2026 15:59:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski@oss.qualcomm.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] arm64: defconfig: Enable ARCH_HPE
Message-ID: <20260411-strong-mega-leopard-a6e423@quoll>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
 <20260410171611.2547255-5-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410171611.2547255-5-nick.hawkins@hpe.com>
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

On Fri, Apr 10, 2026 at 05:16:11PM +0000, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Enable ARCH_HPE in the arm64 defconfig to include HPE GSC BMC SoC
> support in the default build.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


