Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1C3C71141
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//KIOgJjM01MpzgegQDtwvaHYoc3AqWti1AbtH1NP7c=; b=p5Mw4nmj9h8ylqUIxq1TeOfcPQ
	fGFHNBD1K3NVBv95nufdNMTlKrCiuA/LBys0Jk5Yj/xLP4TfORgdj4W6tuDAD1H18JU+GRdyR4VR5
	xkwRSmvzFHki2NvwDdkAMBY4MtUYCnTZR2kRI8xlSnzLGMx/gynXOLi98Kq+6A6HIFa6/6sMJSRiy
	9/Rgj3qOQSfOqtD1ZVQuYvlvXDe74k/jpe2zkFJy19/ANKPGLyCQmfseMNy4CLn32K0w2FZB1OynV
	yF1vPJst3dGA+1RZT0lf7HobQLlF5bPzOmSvBugZODyytMN+VCwWKn700tK3Zdy/ow3KlrYwNVxt5
	3lyadGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrJ-0000000DPX0-04vv;
	Thu, 12 Jun 2025 13:20:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPh4o-0000000DGEg-0dYE;
	Thu, 12 Jun 2025 12:30:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749731436;
	bh=xMj0PeXUpejsICB72qzZq/FU9wUca+EJE4sWUqWhTeA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pdr3jsG8LEBbrTq48ZzhTF8vjLwU0K+gNO+X2iv7Gdtf7LmKBdaFEIz5QMWdeccwD
	 GLCxrTWkvx74UkGx64K3aPq/B4r5m2wWanFUdRsvxE/zkUcEWjvmC0tdmaSl7DthRD
	 5BeuUwEdjAOZP363EEtatAdEPq2wvbL19UMWfJpDqLJEWqCebJY82sVUPdY5Cah+Bp
	 d6wLrrwIXhisc4G9pCT8qm9/8yoDg9PO+QNBA6isGJKMkProKjiDrtP+vHW8of9oIv
	 T0bBlbb2VBZy8YlsWjQe1n9JNo/CshEopiXzxi9osJgM+NETN7+2eF9RvK13lDKGw6
	 5cndkuogjgGWQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48C9D17E06BF;
	Thu, 12 Jun 2025 14:30:35 +0200 (CEST)
Message-ID: <85cb44fd-f597-443e-81b4-e259513aec9f@collabora.com>
Date: Thu, 12 Jun 2025 15:30:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Fix HDMI output on RK3576
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <3011644.e9J7NaK4W3@workhorse>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <3011644.e9J7NaK4W3@workhorse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_053038_345926_07401819 
X-CRM114-Status: GOOD (  15.12  )
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

Hi Nicolas,

On 6/12/25 3:13 PM, Nicolas Frattaroli wrote:
> On Wednesday, 11 June 2025 23:47:46 Central European Summer Time Cristian Ciocaltea wrote:
>> Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
>> char rate via phy_configure_opts_hdmi"), the workaround of passing the
>> PHY rate from DW HDMI QP bridge driver via phy_set_bus_width() became
>> partially broken, unless the rate adjustment is done as with RK3588,
>> i.e. by CCF from VOP2.
>>
>> Attempting to fix this up at PHY level would not only introduce
>> additional hacks, but it would also fail to adequately resolve the
>> display issues that are a consequence of the system CRU limitations.
>>
>> Therefore, let's proceed with the solution already implemented for
>> RK3588, that is to make use of the HDMI PHY PLL as a more accurate DCLK
>> source in VOP2.
>>
>> It's worth noting a follow-up patch is going to drop the hack from the
>> bridge driver altogether, while switching to HDMI PHY configuration API
>> for setting up the TMDS character rate.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>> Cristian Ciocaltea (3):
>>       dt-bindings: display: vop2: Add optional PLL clock property for rk3576
>>       arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
>>       arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576
>>
>>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
>>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  7 ++-
>>  2 files changed, 49 insertions(+), 14 deletions(-)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250611-rk3576-hdmitx-fix-e030fbdb0d17
>>
> 
> For the whole series:
> 
> Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> This fixes HDMI output for 4K resolutions on my RK3576 ArmSoM Sige5.
> The DTB checks and bindings checks pass as well.
Many thanks for the additional testing!

Regards,
Cristian

