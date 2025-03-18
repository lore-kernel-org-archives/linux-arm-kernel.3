Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DE7C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 18:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iguVmCV3+e0iktCJiQX2Pt4HvULaD7BI01tc98Ba7EQ=; b=iq00wUu2UOXeGmo4HTlktqj6G9
	QUyKIbYQGDRl0ayu9LM2XQMCJTWVqsAVXuNnz/4r2Vw6KRLsWhbxFUkUnbBiDLpfXBn3stHWpa4a3
	LjEK1jg45QaYTsEJ6V7QvcfOmaqu97hNIis1vmoEs5TwFyRnCHJzzrZwIZHLPZljW03xI/ZRTzzZW
	+/xW4QoFRBCcNFYgRuyJeM9Lbz8LpimRL2a5cj3JJ5gAE9oD1gUL0Zd9APcVpk8PmOtDHFDF5Epjx
	7yUF6sgdx3+DtYpzVNbIixUkofTs8KNCSLbVmHcvUcloFru2kgPN5euiarGtIPKCwi1KomUQBYkkw
	qhMZ5xig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tubmP-00000006oVP-1Ljh;
	Tue, 18 Mar 2025 18:35:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tubkh-00000006oMs-11dK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 18:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iguVmCV3+e0iktCJiQX2Pt4HvULaD7BI01tc98Ba7EQ=; b=RMxWdN2A+yps4F+Jz/2Bu2jjSe
	RnJciZfoyRh9njrYyXR+wAngSHAUdkwjGUYjMb8VDdkOK1sTv1ICcsje0dJ4iLwyUuSsARc7HdRZz
	vLDyrvv6iYeLoo+VI1G/ZCA8OinwMWRoLt3Db7UhfZtUmmPco8jDdOjHYvOXB5oTT7PQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tubkT-006IOL-Rn; Tue, 18 Mar 2025 19:33:09 +0100
Date: Tue, 18 Mar 2025 19:33:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, robh+dt@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	jothayot@amd.com, Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add Initial device tree for AMD
 Onyx Platform
Message-ID: <472a4f78-24f4-4bfd-bf99-8b1194bfe8f0@lunn.ch>
References: <20250318174730.1921983-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318174730.1921983-2-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318174730.1921983-2-Rajaganesh.Rathinasabapathi@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_113323_279728_13BC1CA7 
X-CRM114-Status: UNSURE (   6.32  )
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

> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";

Still broken. And it appears you are just ignoring my comments.

Sorry, but:

NACK

There is a discussion here:

https://lore.kernel.org/lkml/20250317025922.1526937-1-jacky_chou@aspeedtech.com/

There is also IBM in a similar situation to you:

https://lore.kernel.org/linux-arm-kernel/20250108163640.1374680-6-ninad@linux.ibm.com/

and NVIDIA

https://lore.kernel.org/lkml/20250312045802.4115029-1-wthai@nvidia.com/

Could i suggest you, IBM and NVIDIA work together to get Aspeed to fix
this.

	Andrew

