Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B65EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 00:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcqbGk9d6SDu4x8AGaJmmx3o96nRQb0AmZrxv6dTatM=; b=4w1rSlHu5oui3zMLvdOjFat5ze
	MA/UVaeRrhwiwgzKg9aWtZWHprwwr6x01/mreWaq3XQj/cFQ+K4qAG5QUakmyuD5WpDMoFmWfWtB1
	VcWVtWn3OIeGz9Sxxz1E/H1uP3gIp2DI1ROdOC/l2J/3hx78Dqe0Fk/rpDh7VgDIpuKjb0c9gGmg9
	Ng0luAg0HvNtW6Bx7UZNprEBU5vlSmbUh2PAY0C8s7riiPcZF/xxWkjqe09VASadbOlkb+V3+KgKx
	4gkRvMoATrQsMUPCUDp0PKyCpmknHZ3xAELvkOyVShXyndIj2URrAOhR8L2xA28Q2ZaVePd3AUrEN
	80DZeReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzkfz-00000004xbZ-0fYm;
	Fri, 28 Aug 2026 00:42:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzkfx-00000004xbS-30cL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 00:42:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 15B3F415AB;
	Fri, 28 Aug 2026 00:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6EC1F000E9;
	Fri, 28 Aug 2026 00:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787877751;
	bh=UcqbGk9d6SDu4x8AGaJmmx3o96nRQb0AmZrxv6dTatM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhQo9+wmf+lLIF77jOUiJOeSuq9moUzUbJO+22e3twcBjhQ7Xd4XUiuNpmCAk/cwL
	 82ca3LrmB8sdYmmBeh65bUid/CmMwijtKwX+1IE3+4QZPgXG+gbFDiloyHay9imaSN
	 vnyOr6R+qoaGsNIPOxnC9nYgDuvZ/THK377FvR1DbI0fmSNyemZmaH653nSbM+YqAy
	 w91Igx2UUfY7uPD85+FoneTf4KF8GRdSclXE7giyRYuRkv9TgP2kSz9NvEC0HEQJfj
	 vomTmAIPj8VaLPm51ym7393eSGHTAZAGWSDBVjzNmUPj8vIwwsHJmfryAjesNqzzA1
	 O346oIxuIqafw==
Date: Fri, 28 Aug 2026 02:42:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: xlnx,xps-iic-2.00.a: Drop bouncing
 mocean-labs.com
Message-ID: <apDZYXYKUwzSfFoP@zenone.zhora.eu>
References: <20260826103042.147735-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826103042.147735-2-krzysztof.kozlowski@oss.qualcomm.com>
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

Hi Krzysztof,

On Wed, Aug 26, 2026 at 12:30:43PM +0200, Krzysztof Kozlowski wrote:
> Address info@mocean-labs.com bounces permanently (reason: 550 Host
> unknown), so switch the maintainer to Michal Simek.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

merged to i2c/i2c.

Thanks,
Andi

