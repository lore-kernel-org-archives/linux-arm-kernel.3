Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA9BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Ypm6y7ZKylmt+LLSoRbqubbSgcxk/DBQX1Rd1Ot9F0=; b=2UabXKoSX6q0bZ9uN4b2L5/7iL
	97nyBk6eQXheRObQ4eq7b3TWd9+BM/ls0B28zHJmquNKRXh8r81IrPGx6GpbSpnI4OeCV06wPKSff
	ivcv7W2S6pgvXFxeXqU+1Z98xjT+aUbqlGydSqK3Wch5h9PHlhd0XeHrXJxEjgF3RTg/JWy6dIYst
	Fpm1AHt0B2or6RxZwlKobUaZ9eIr9ec+jnzQeU/zzMB3Q3Frl67urphKw8QZHN3B7uUbg4LWmKm4x
	xjWggKukUAhv9noow1bKYmq/pN4RW9GRx9NcZTg1W1MNMJjVZmVeDlPuaN5dk/0gz5a5hihivzQj/
	9c8RdWag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBg-0000000Fu8B-23ji;
	Wed, 14 May 2025 17:46:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEfm-0000000Fgwh-07qq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61B60448C9;
	Wed, 14 May 2025 16:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CA3C4CEE3;
	Wed, 14 May 2025 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238973;
	bh=brXOYswinxGc9zNxJS+g8Vd8CqyPeWaUnE83d41Ku18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k/fSFZRORoFBup1Snyn+SeKDGYCEECWw363pSW6gBLqgOP9PjK/r1+S+j+S+WrkIu
	 YpZ3zgNdHBWvupgf9o5hIcut2OLbkyRXXAlyzcZiPqcx7LSNEzprV+mVSv9sK9yEUo
	 tAqHQNhJ4/fzQ0tFkZRkY46cEbYIyQoX3P9Xq7k7OKtYekOp+1oN+qUdTt0a8V3t5C
	 jENl7ykzfKl24NETgb53UsoZs8YIRNWSHrxahyx3+N+cDOlomXwtUixe/aGIWUUFQU
	 Y6oEdyZnT3dXP2Bzr7FzJHEVgRsoBPYbdau2fA4xlSXnUf57/nOdAU2aTakaNZ8sGd
	 Q1dIzM5rMJJtQ==
Date: Wed, 14 May 2025 11:09:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
Message-ID: <174723897079.2456289.5773292846282460106.robh@kernel.org>
References: <20250506133118.1011777-1-thierry.reding@gmail.com>
 <20250506133118.1011777-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506133118.1011777-2-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_090934_096206_EA8F3D4E 
X-CRM114-Status: GOOD (  11.11  )
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


On Tue, 06 May 2025 15:31:08 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The PMC found on Tegra264 is similar to the version in earlier chips but
> some of the register offsets and bitfields differ, so add a specific
> compatible string for this new generation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


