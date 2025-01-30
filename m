Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D26DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5E8vrIUiwgp840jedrOdXiCw8U0oFfDgQrEtzVFZfOc=; b=GWdFgjMxYTYRH4B9xljkPnTqhR
	K2jIJ5p9TG6WNZITaDhafOWy6M+85ozX5vb5N0ZVal4tmeviQzW7tDhYpID2Dd0duFOPE7rlMxhkz
	9dAIM41tMRP1tPO4EwdJpwvSx4eEHLORnxG0YE4l5CdHBWq/mvqYO9YO2s6vkh0mQnWAx8hSjOLdA
	q7ep1QZHiFmt1JXZIgGitB4Cqw20HczAkg377Z865uCoEL1iMnqUkeb/Zd579HxOhO6bAnosPwJAr
	LvJQFKKVfMcIDZb3kOMmKoChgItXbNlH+8kg9bYWHtFN00TGXDLLO1HCmZ3YdXclHJO2KPIrF9h9t
	pZ2/R+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdU9y-00000008nzH-3fEW;
	Thu, 30 Jan 2025 13:00:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdU8g-00000008nsR-3hd9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 12:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5E8vrIUiwgp840jedrOdXiCw8U0oFfDgQrEtzVFZfOc=; b=MlCi2LRb2mWc5JZ5udEuozKHrC
	/uQEVXaO0BkYpAZjsY9bePbaq3SNHAO+iW+Uv/CV7mF2+mJO4IYQhH+ufOF0bDtNNYk7kM08pz6aS
	3tl4DU5gMbw/KV/6wEUeVIo3fNnMfet8Mc1J6DyVR+STmnmUDiTKTvRqi45DtfBRjL0g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tdU8U-009PNy-VX; Thu, 30 Jan 2025 13:59:10 +0100
Date: Thu, 30 Jan 2025 13:59:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: dts: socfpga: Add basic support for Terrasic's
 de10-nano
Message-ID: <d375f621-1502-419e-bb99-658ca2fd2b63@lunn.ch>
References: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130074553.92023-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_045922_921445_EE3E5644 
X-CRM114-Status: UNSURE (   7.40  )
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

> +&gmac1 {
> +	/* Uses a KSZ9031RNX phy */
> +	phy-mode = "rgmii-id";
> +	rxd0-skew-ps = <420>;
> +	rxd1-skew-ps = <420>;
> +	rxd2-skew-ps = <420>;
> +	rxd3-skew-ps = <420>;
> +	txen-skew-ps = <0>;
> +	rxdv-skew-ps = <420>;
> +	status = "okay";
> +};


For this part:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks for making the change.

    Andrew

