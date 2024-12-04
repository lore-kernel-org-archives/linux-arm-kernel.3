Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8478AE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 13:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tCqYe90BOLiCH21svkATMt4Xksp55kyfV7J5iRG07w=; b=kW5djc0Xiav/1GGHXDzPquG2Oc
	KJYN/wXPSJ2avbi8kRp3WvTFM8RUregqwL9OVh3OOXZuLBtZJqKvcD2Bu7FYR8uRWTEQjFk5jvLlJ
	6aT5El0bV+o22F49Duidn34qwymcy//ep4qgunfbzARmYZfmluat1cK1kzr6lanPJzxMsSJe+9ApX
	Kp9hYdhOOIp7qHCXfK0oKFoaINmuqf5bPqsJiXj5oDYIemcBygCiSaYLgQdE5EziKYTjJSoE7v3YL
	dBIT5/CDrEFQzhb9C8JG13ov7fP8cNlQARY1Nol3/2dTCJ9zayV9AzNs8gN89RFTK1+tHunPgeOkz
	iPHlSEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpik-0000000CiW8-3pzE;
	Wed, 04 Dec 2024 13:47:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIphk-0000000CiKB-19px;
	Wed, 04 Dec 2024 13:46:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D76C55C48E2;
	Wed,  4 Dec 2024 13:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6395C4CECD;
	Wed,  4 Dec 2024 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733319971;
	bh=ENM0SClxUt2lPvodmnrHzeLBV9BDJq1owuP9D1ySOsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=neemGZuEgTiKvdyK2nqqBYB/8qfQ02WQDlv9wzIByn8tp5P7+i8Bvs1enmvuyV708
	 2y+DTLhmxW610fCYgDcKAGG1exv2oRBeJCd+yRhFI3hAakWRmsWRFDbnoxEkUyxJql
	 6ybJkg/fRNts42khtGnjNb6KibyexaOwInuQ2AcYCGUVBUFlYOyDdfT4DP9kl/thF7
	 tf3lDdIN5Ldml9S0Tf7i7Qfz1gitRo4lTNtBsBDGAJAGA5fRtcUweosP505AR1vY0P
	 HbYaYO4wVYkJ+HHS85KZPM/1k8ODE8AfD1lLGjL4v9cGhehM3cwvqdpaYGwe71Kxsp
	 eRmjIsDwlthpg==
Date: Wed, 4 Dec 2024 19:16:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
	daniel@ffwll.ch, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, mripard@kernel.org,
	kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com,
	alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v18 2/8] phy: Add HDMI configuration options
Message-ID: <Z1BdHzfcnj6XJ9D4@vaman>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <64f6885b5a5ca89c8214b3138cb58c3133ac2109.1730172244.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f6885b5a5ca89c8214b3138cb58c3133ac2109.1730172244.git.Sandor.yu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_054612_354120_A4EB9257 
X-CRM114-Status: UNSURE (   8.17  )
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

On 29-10-24, 14:02, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

