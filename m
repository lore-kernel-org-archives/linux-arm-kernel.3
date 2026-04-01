Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483D1D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytA2kd1RB/+wR6dn1IfViYkHiSDaondsEz+thKRKQ84=; b=V2O5SfUswyCUmLmpZlRSDZAK4b
	C3iqEuIoSKO2v7Jfjcz1+iC3PlmR8WtoNYkjkTsBTffeqvS0gTkms0XQ08xHCI+uAzLEqdZQ+1fqU
	fMfvByPlB1el8n0NDO+J00BB+CUdkJXTxefnJ/BYy1OFjC3c9oMEIsm2elJL8e9aFVjMRQdS7F9mC
	HH4eakPahMZaw+svDGtvZOjipIvpmw5syPFYORxPmpWlF8weaEgUGJNGm4Bz+SPR3FyGwiZbAMoqg
	D+A57ziiAbyLdpapGlHb7XXFDT0cqXfFesSUzt012WP0Am30t6IaP8hysk+QDXLv9tx25Soeq1QCB
	3tBCdUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tb9-0000000Ecg1-1Fcr;
	Wed, 01 Apr 2026 11:18:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tb8-0000000Ecfo-0fwl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:18:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 450B06013D;
	Wed,  1 Apr 2026 11:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FBEC2BC9E;
	Wed,  1 Apr 2026 11:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775042337;
	bh=pqNx+XdtPue5P43Is5uBQ98Y3Hnw2hNKyF4NnEidEuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6oS+NydJKP4lXpWPkASVFtY5WXa0O/JO/D/heCZxpU+PkyKjeKDmEQLCroEgRlMv
	 HJBEFEom5beps9aXJNLv1+B+olD1ahAaW/7+ztVrWTb4LT5swNtakIfoZP/FkaIATL
	 7TKyFL3a/yiGhHBOu30hu57nD55Nn/LWpJVTaD6bkr7/GwvcINdILaERDKKszoss7W
	 W2jKFzvmcKvea97oBFB/xFSmDUraaTVYmilXAtQvPqGgBaKREh/aK0u8WWTpYM/DwB
	 dP864TdNZ5Uash80Rrw6l6vwmNql6I8rZWmYGoYc9aHkFeQ8+mQP+lqkMvDD+sSROh
	 8IeaADUWM9plA==
Date: Wed, 1 Apr 2026 13:18:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org, Rob Herring <robh@kernel.org>, 
	Gregor Herburger <gregor.herburger@linutronix.de>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
Message-ID: <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323190239.1890505-2-florian.fainelli@broadcom.com>
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

On Mon, Mar 23, 2026 at 12:02:39PM -0700, Florian Fainelli wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree-arm64
> 
> for you to fetch changes up to 0acb1de2b4df426a62dba33bcd80f3939636f97b:
> 
>   arm64: dts: broadcom: bcm2712: Move non simple-bus nodes to root level (2026-03-20 10:17:30 -0700)

Patches were good, I wanted to merge them, but then merge complained:

	Can't check signature: No public key

I refreshed now my keyring with kernel.org and the same.

I think the same issue was last time and repo is non korg, so nothing
seems to improve.

I am moving on.

Best regards,
Krzysztof


