Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D30CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TgsJAPG+gvJuGo1mADyM4jldixKGYBoLgCB1sss4qk=; b=tAYur6c12ph8v1hFoZefEgRmXh
	iFF7ITcrBRx+yYonUBFRvqmvXnoBjfShkY/9WYyZgPbbwUIPvrjGSF8POzpU7QClCIzBGmALTAOkB
	PaM8BLdqt2l/ULlFF6gqAcXZIMeab4FcIMiKHA/62M3x5lsjzkW8y+i+m0LytrGKCapqxzZohAOLH
	7JYjagU+yfudLcJYjvzJaCl05c4Wt/snrE9c5tIzeOCA1rMeWR60wG2rmMik/5upEB66pGB2sBsfU
	98ehT15f7UgPNQQwfYlNfzosgRtrwN8dDxl7UuHFSn+EpibI8qdYOfgYy05H5LAERSw3xChAP9Krx
	/Vif6SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKNI-0000000EFMO-1012;
	Wed, 10 Sep 2025 12:56:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKNF-0000000EFKD-4Bvg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8TgsJAPG+gvJuGo1mADyM4jldixKGYBoLgCB1sss4qk=; b=lkR1tk78PoV+Tma7HPr7R4vg4F
	89G9DYvsE0UEMbP3/X/fB068fW1Iba2c7JfnYajxoZlZ7vXiPSUusxi4rdETc8BwDacD0hfzRWikb
	F324HDIyWpZl/15fv3FvAq5siiiSaVLPbOmBefKd7SYlI8uqISsyAdq9a5wMbuSPg1Ss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwKN1-007wR1-Mv; Wed, 10 Sep 2025 14:56:19 +0200
Date: Wed, 10 Sep 2025 14:56:19 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add NVIDIA VR144NVL board
Message-ID: <3114a51c-47a2-4b67-8965-33841ee87fd5@lunn.ch>
References: <20250910040601.240162-1-donalds@nvidia.com>
 <20250910040601.240162-3-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910040601.240162-3-donalds@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_055634_048660_47058E37 
X-CRM114-Status: UNSURE (   8.14  )
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

> Changes v2 -> v3:
>   - Removed unused phy-mode property from mac0

> +&mac0 {
> +	pinctrl-names = "default";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	status = "okay";
> +};

Oh, fun.

Please don't do that. At some point Aspeed it going to clean up the
mess they made with RGMII delays. And at that point, it is very likely
your board will mysteriously break, if nobody remembers it is doing
something probably no other board does.

	Andrew

