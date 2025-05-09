Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39941C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfEelIj+BBvQA3qNO9D9UmBF4ba/BqaL4KcD9NEPvFk=; b=lZ05cVH0vPPKPGb7sKsP0buEHX
	TJwZp6tz3Kpk3sr3G3nqSMldSA1eTE/sb3wr06+fV1frJmOa5F1kXRMu0Ij6q4RD+yLmlXAaKRbqL
	ByFbNBN6+/ilmmhHGbTyX5zSb2YpiXslXMe2kv+mOIq37lKWmN54O0Aoe9ucDQNUMV6wn5nD5Nknr
	OI00oGJezGJ0KowOciPhbTNGgkOrw+8mynw1YHVmMcARZwg8/CF0FYzMQ9Ptr60zK5k2VkVhPpHGt
	4dlaei3620sxVkiruHISAotTfVnVBKVKPgapwRLkz26OhR8T/Z6HELMcfxFCTik5ROeETtoh+3Ljo
	OybWoaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOAe-00000003qev-1aCA;
	Fri, 09 May 2025 13:53:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNLJ-00000003gL3-46gx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AfEelIj+BBvQA3qNO9D9UmBF4ba/BqaL4KcD9NEPvFk=; b=b4Qbd4mFlKccaQ6pTjFzKmIxvJ
	7UxlLabbpE8L6hNRiAZYvKuJCdyW7pRWF2sUuETLFxviVxZ3x8ELYu7ZHKYUCaev5kVwGpcwxtfR0
	WEwO3aOlmgx1as/vK5eSKGBJSE+3BiN8PPtG/Lr74jl+Xd9s2wsOV7G4JuNEiJFGQRQU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uDNL9-00C70E-Uz; Fri, 09 May 2025 15:00:35 +0200
Date: Fri, 9 May 2025 15:00:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: Re: [PATCH] ASPEED: bmc: Add device tree for Meta(Facebook) Clemente
 compute-tray.
Message-ID: <d8e561ec-e600-4b51-b901-6fd125eef8cc@lunn.ch>
References: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_060046_015035_AEF97787 
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

> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";

Please see:

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

Aspeed are supposed to be fixing their MAC driver, which is currently
broken. You might want to apply some pressure to them to get the fixed
merge. Until then, you should drop this broken node.

	Andrew

