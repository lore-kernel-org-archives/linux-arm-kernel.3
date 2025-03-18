Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB3EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WvnC7tPRCiTGfBn03Ur3Jt4abVexUVYYSSyZJJAuRc=; b=RfcPHDA9Me3IJZUgepsRDGGMej
	p/QV0UVp/jFjMWv4mYY2MsVpXmRfV/5sTp4eq2aLmaMNB5dj/DzpiRA+maJtaHyJG3LqdBK3b92vK
	0fFGcq3tjLMB2UH32z+Ss0cYXylnxsUA5E8WMxul585TY0gDU8fAjIqP6ceC5TCsHfG7Anit1SD2D
	QKxFnFhimeEangX9T66Q5wmdiiGdQgortJAgGou/Td6ic96o/WnwsTHdV/wOTo6PoODFK9DEQxcP/
	g1KnXgy/iA8d9flxICurRnCnHqO7gKnNzb18lrXznU+ljmA5Fe0g8jCXfXqFbGMa5G96Z7o4vL1uv
	saCuuvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXe5-000000068bO-0ayX;
	Tue, 18 Mar 2025 14:10:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXcN-000000068NO-32iQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 14:08:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6WvnC7tPRCiTGfBn03Ur3Jt4abVexUVYYSSyZJJAuRc=; b=f3xxU78PYsEzV8e2vE0hjY8cZv
	QKGKQ4yxcn4g3xNicVzFoSWgnFFV1ZoBWr+f9vM5TNqt4pQD2Po6rMn/LPNl7SVnV2FE2uuvFlOpN
	cyDov92u2+PhX35F580TxmzowUuc1mQq4S10h/4A14p6+6NOKebs6wvL+/R0eW9a6K+I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tuXcG-006GhC-8b; Tue, 18 Mar 2025 15:08:24 +0100
Date: Tue, 18 Mar 2025 15:08:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, robh+dt@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Subject: Re: [PATCH v3 2/2] ARM:dts:aspeed: Initial device tree for AMD Onyx
 Platform
Message-ID: <fdd969cb-aa2d-4d55-949e-e2631757221e@lunn.ch>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
 <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318041224.1693323-2-Rajaganesh.Rathinasabapathi@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_070831_758756_E765D12F 
X-CRM114-Status: UNSURE (   6.10  )
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

Does the PCB have extra long clock lines to insert the 2ns RGMII
delay? Or are you another victim of aspeeds broken MAC/SCU driver?

       Andrew

