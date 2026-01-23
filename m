Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBA0D74EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jInqTd3a74ez3Jl8XPNqyjEQt1VtVc3t2+918HZZw/Y=; b=GoquH1CLu+a4evbYFAvTUpct8G
	WPNI/xZEMEBXvfXZYw5gbpMAvpcveIU8jV3XNq6wEHhGHBW2utO53sYjRcg2AaWPdR1QUoxW8GHwM
	wHdo7qa1QnMVp8DYH6IeHPaxvxWvLE+/31TwTuJ1wSSYyFsUQ5gmalu4ry/1QoQ1/4ofHFQmlKgQT
	p8ufyITpfbm0MW+Reo3X7rdcbNqBBc8bpphTcePbwZQe4xKOnVaPzpnzkj9BWwUGFm+Z8yPMnFxy/
	6QtDyxXFwNspRwKFrRSifbcLX+6F3YcCcyadJvJXqwXnpP0cvxsR1JqSCoY3mYp1ACYQtuf6oTDDQ
	NukEhF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJO9-000000097MS-3BlR;
	Fri, 23 Jan 2026 15:47:57 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjJO6-000000097M0-0Pmu;
	Fri, 23 Jan 2026 15:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jInqTd3a74ez3Jl8XPNqyjEQt1VtVc3t2+918HZZw/Y=; b=RDjbljVmDsNB4Eqjcoro9l54TN
	/qPpOqSBY7odJcj3RLh4U0Q4qt0kHslfIH31K3QqeTsVDn98YPr2/eIQxHQNtaCaytuXLVzUwnwdt
	gQXKm9YLPH2UZvTcJLL3USdb5hG/gANOHt5zowwJJ8oaSZflhjEP47l2mFkfIivuvaeD3+8Hor4Oe
	V3vEVk4oR7QqtdljQWdJMDDL7Aome7yy1m8vRkGb4+EpeSUnl9xOKeOeccz2rHD54yF9TsnmQ4Bt+
	P1hnrIa3IgK8L/QrRF2eyGRsb3YtUiqrdg/1lyrJcHoyiWoRTWjcn/HQi4mtJpwPXt8jgaIYwFsec
	7iTDL6iA==;
Received: from [189.89.57.42] (helo=[192.168.18.14])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1vjJNw-008xVd-UU; Fri, 23 Jan 2026 16:47:45 +0100
Message-ID: <3cf75fc2-1a20-40ba-9d7e-f3ef50a95d0c@igalia.com>
Date: Fri, 23 Jan 2026 12:47:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
References: <20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com>
 <20260116-v3d-power-management-v3-2-4e1874e81dd6@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20260116-v3d-power-management-v3-2-4e1874e81dd6@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_074754_139953_82E28266 
X-CRM114-Status: GOOD (  13.98  )
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



On 16/01/2026 17:19, Maíra Canal wrote:
> If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
> HSM initialization, which would result in a bus lockup. However, those
> clocks are consumed by drivers (vc4 and HEVC decoder drivers,
> respectively), which means that they can be enabled/disabled by the
> drivers.
>
> Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
> drivers when appropriate.
Acked-by: Melissa Wen <mwen@igalia.com>

But it'd be better if Stefan or Dave could check if we're missing 
anything in the firmware perspective.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 9783385d5859836898683209e320fcc928dfdc71..41f058bf44e8a5257e4b2a90389b5e9525f2fffb 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -139,12 +139,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
>   	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
>   		.export = true,
>   		.minimize = true,
> -		.flags = CLK_IS_CRITICAL,
> +		.flags = CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_HEVC_CLK_ID] = {
>   		.export = true,
>   		.minimize = true,
> -		.flags = CLK_IS_CRITICAL,
> +		.flags = CLK_IGNORE_UNUSED,
>   	},
>   	[RPI_FIRMWARE_ISP_CLK_ID] = {
>   		.export = true,
>


