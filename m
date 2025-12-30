Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287A0E9411C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgfNvC6Yth6si0scOQCKLeG5u6HMnoKtu1Fe5pRdVp4=; b=gaoVaJhNmCt6yeeUx3gVxFvwTA
	K5PZ828o8O13oP2a9kPhm4ffgyYKN1e1vKWPrwHi+PpriQx9/ghr7bJyXR0knl9W0vFyeUb63uD3X
	iV/hZyuaBPzScQp64moxeoEuiMbqWn/la/LhYMZrOK4AW5sbYWkiiOktbIxrIQuuAa6kzqkyE/pJv
	67QQ53o1qJQwNkckJ5l51Vb5w5yTbWwvWd3C99rED86y9ufRIHBEhTnNzuBSGmSIqTwnaYYNt5IGk
	egZM8QQ0sCfw7tH+U358EIDtBi9/4iYdsktY0YRkZkGmYyPNh1xHy3nia2J4emOeKvXD4zksSsTiQ
	HcKT+ZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV0u-00000004ZOI-3e9N;
	Tue, 30 Dec 2025 08:23:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaV0t-00000004ZO8-2O74
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 08:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E74C6000A;
	Tue, 30 Dec 2025 08:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073DBC4CEFB;
	Tue, 30 Dec 2025 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083010;
	bh=CBSNqPUfBsonpQprSCEMmf52XfKbGB0nMPiewYw9A24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svcrcOA6caumjQ+6+BYNwp/0FgyDszntytFs+x4h1z6C/31KtJVt+MlduTVfSoalO
	 z4g3xC3iN4yTrelbaA+4D8kO2KU8x82yOQHAjD4vyjB84NP92qrOsFJiBRUFOpZc+R
	 z6+/aOIuNhaleiPJe0NpOG0XQO5TO8fIJlRY2UB1YJMb4Iw29KzbGnUilRcXJz/kal
	 1B5S47EKTmPUaW3RUr+785hDRHOM6HoZM5YTfB1YGT/K+dyUjXsM7vjKT+6opffJdU
	 hlYjTAOtIx0X3U/UzsMvpAcYePuxwYcokuDM3EY9/vg/MBBhWem1PIzAcPTvyWP8xX
	 KA6Uyv6TGaY/A==
Date: Tue, 30 Dec 2025 16:23:20 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx8mm-tqma8mqml: remove virtual 3.3V
 regulator
Message-ID: <aVOL-NbrSOme1_P9@dragon>
References: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216133110.905950-1-alexander.stein@ew.tq-group.com>
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

On Tue, Dec 16, 2025 at 02:31:04PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> BUCK4 rail supplies the 3.3V rail. Use the actual regulator
> instead of a virtual fixed regulator.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied all, thanks!

