Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2410BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5UxvB6KfjIQQ9vcy2ViEfnEL4yNziORneo0YRHrGMM=; b=vHtsonl1H97dac0eVdPtMfQXlB
	yzAHNL1taZVvmyjbIKhlh9ZxOyOHjUSSZPMDjZBc5ulH3tZ06MLAvSGJvftKWZuHjR7Qx2pSuumCm
	QJfoFzn+1U+TcbhWrSpcfcTrVUISu6ats+rhp+W+JyZHNEHVmPqF1YfGXnGwQ2/M0FIRQeTvetnza
	TEd5MtKAKD05epCLhFLMSjMBlEKYmSQmkLvD/dvf11WWowtGJZtLfTYExYojT9K71gzLODYgfOhwD
	71iMXWhNISBGB+MHi3GSAq4LI6YAwDzhl3MnmLuQw3CM113Fv/gcPEf3XiiE2hpsDCrWl7KtFDJYJ
	1DnlOTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHy2-0000000Ghlz-0OMg;
	Tue, 05 May 2026 15:45:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHy0-0000000Ghkp-0OVR;
	Tue, 05 May 2026 15:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A939D40265;
	Tue,  5 May 2026 15:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B54C4AF63;
	Tue,  5 May 2026 15:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995947;
	bh=Io3H5cRDi6lIxGPJ6ywue4ZtccMZ+LyJ2jiiMPzzy0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TvD5dUmLdck3YbVwQ+saUCNM/UrQqJ/ltP7Z7cxELkyqNDvsWDUOAuljny2uD5d+Y
	 RwYMABnD7GAQkSZnYqY9TWsqygRvidZrC5nH0QG+XPVHMqotCDRXtK8VdGZx6uW4BV
	 kzI3EX/afx0weGJDB19kH99nNKq+YU9TFausm37Z4bNcjxIPPkgzYUc6rUF6PEhxtz
	 /WkucTb8Fl3PJ6pICEuP7cYbnn5pmNdOGVoWTORronzq48XrPsnHCUqTmwycHfFQIe
	 cqRF4Da8Ph4dP+xVjEVNl2JfVrBq27Etjg5jzJBeFoRo+O1f4dMhex3jzRWbFC+and
	 kDI3Hcd22W1Fg==
Date: Tue, 5 May 2026 10:45:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-phy@lists.infradead.org,
	kernel@collabora.com, devicetree@vger.kernel.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v4 01/16] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
Message-ID: <177799594467.2982056.14981232958921836425.robh@kernel.org>
References: <20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com>
 <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-rockchip-usbdp-cleanup-v4-1-7775671ece22@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_084548_155602_F1D63AF0 
X-CRM114-Status: GOOD (  13.15  )
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


On Tue, 28 Apr 2026 18:13:40 +0200, Sebastian Reichel wrote:
> Currently the Rockchip USBDP PHY is missing a documented port scheme.
> Meanwhile upstream RK3588 DTS files are a bit messy and use different
> port schemes. The upstream USBDP PHY Linux kernel driver does not yet
> parse the ports at all and thus does not create any implicit ABI either.
> 
> But with the current mess it is not possible to properly support USB-C
> DP AltMode. Thus this introduces a proper port scheme following roughly
> the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
> with a slight difference that there is an additional port for the
> USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


