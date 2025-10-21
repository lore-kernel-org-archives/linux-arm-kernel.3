Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4571ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVH8qj8Pg0otsfGSWfNaf2orFhrbu2S797ibxbYfU1o=; b=Ud6wDWFtOaVpzNMG7YDVJ5YhYv
	1F5myRid4zJztKsm5dOVPtyDduuRRnHun3pLbwV3oiVEWMyhGnq70Sg6FhZaiq7X6ypaN7a3S0gFk
	+yC63NKinOouOwQaT/lleuM0fAyvlMvhQMQiQto0T2Yo4ak1IwN/q5L9AKQlRvvMAaQQN6EJRNxwO
	rpmkWZAFiPeC38FT1ThXTDdrtrBityLSGwHgcUc8ySiAaKKmkWRB0McYhQbcOMd4jv4ANC82tTY0B
	DG7FASEHahsGBhVntCmzYKNwmS+8VwaAlFEANgYCW1EGEpD3BMEMZlzyrL+72yBSUJq4x/OoeN5OS
	8WHm1WhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7nw-0000000GHsE-2EUY;
	Tue, 21 Oct 2025 08:33:16 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7nu-0000000GHrm-1qiN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:33:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=wVH8qj8Pg0otsfGSWfNaf2orFhrbu2S797ibxbYfU1o=;
	b=ZMisxgFwfZYcUxQVgOeJ8r907ZvHQcT3D08YfXgNn0ihnWGJZcHh+PCWeTEuW/
	LGIH2YC/aIhi/PZbv3FmY8n0az1rD0T71PjmNsvS0L1AAFtdcm2nZffuot/zOEP2
	7evX+vB1UfaNzgSg+ZV6rCLhTEEg34mPwvoDIKXa2uLm4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3d7A9Rfdo_wZeAA--.47555S3;
	Tue, 21 Oct 2025 16:33:03 +0800 (CST)
Date: Tue, 21 Oct 2025 16:33:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-15x15-evk: add fan-supply property for
 pwm-fan
Message-ID: <aPdFPdXD6MhZRvQZ@dragon>
References: <20250919-b4-imx95-fan-v1-1-c9127bd975e9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-b4-imx95-fan-v1-1-c9127bd975e9@nxp.com>
X-CM-TRANSID: M88vCgD3d7A9Rfdo_wZeAA--.47555S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxwvKUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNB943Wj3RT81VwAA3J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_013314_779180_AF314D4F 
X-CRM114-Status: UNSURE (   7.42  )
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

On Fri, Sep 19, 2025 at 10:27:04AM +0800, Joy Zou wrote:
> Add fan-supply regulator to pwm-fan node to specify power source.
> 
> Fixes: e3e8b199aff8 ("arm64: dts: imx95: Add imx95-15x15-evk support")
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Applied, thanks!


