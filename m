Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D42C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkVfS0K/HCG53carimPNY+RNYNmwCtr9z/a+duBZkbY=; b=m6/3Ckyw6IUBNkEtF6nupE/YYH
	BB4UAeI0TyKHj/9ltSR8Hx7ytiMV1a0MM+0+eNbxyMQgSSWLf+6NZOsguRflliCtXNPiWVbAiJFtG
	WIn1d1re4iBX1/eNsiPQvkwPyzccaKbAxLgMAhfaPuXCpElEOuJlNGQW5q4tNb/k/BfCkOKEdjgy7
	t9QMdzml27jl9oak/yz3IsTbizL3x3sFefv9VznjzQ5DkOI6ZyiHqtrLYnwyVSbJG2+vvb9ye5k1R
	wnmebubLhBgXqRWB3FXP0f/opgVluKjKcjkGZmJ0O7jVzp5uYJnZkwregZPITAPgG+/bWpV6oEFbv
	Rb2VUvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9TQ-00000008gVj-1uKO;
	Wed, 16 Jul 2025 21:15:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8MA-00000008ZKo-09SQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 20:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=EkVfS0K/HCG53carimPNY+RNYNmwCtr9z/a+duBZkbY=; b=aVd+l134yxHndkHhTItFKp2BXY
	eM/DThAQA6KDI5APDGUTdUUzpSGY8ohO2PTGS1eUgtd/H6md9t4FJvB58l9tVREMc+mWgc9QRmL6g
	mSmFMArWtqaf4Lqs3Gf5DYF+ne0rGkgDD5czKlwlhxTgJmOgir/pss03Bkb9bXKySxWs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uc8Lw-001ijI-7I; Wed, 16 Jul 2025 22:03:44 +0200
Date: Wed, 16 Jul 2025 22:03:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Deepak Kodihalli <dkodihalli@nvidia.com>,
	Ed Tanous <etanous@nvidia.com>, Leo Huang <leohu@nvidia.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0
 for BMC network
Message-ID: <17cd5195-29d7-44db-8f3c-474dc5c3486b@lunn.ch>
References: <20250716-update-gb200nvl-dts-for-new-hardware-v2-0-9a1a916f461d@nvidia.com>
 <20250716-update-gb200nvl-dts-for-new-hardware-v2-4-9a1a916f461d@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716-update-gb200nvl-dts-for-new-hardware-v2-4-9a1a916f461d@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_130358_079766_754BFA82 
X-CRM114-Status: UNSURE (   5.85  )
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

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-id";
> +	max-speed = <1000>;

The MAC is using rgmii. How can it do more than 1G?

	Andrew

