Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CA3E94121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 14:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTvNXWgljMnF3QE6v5ajNosqfD7MxZByYJnBQCnqEIg=; b=eMgFhV5yi18akEkvOeiQcSZn0x
	8mDENfrr2R9/Mzg5DvetrpoH2JYunFB4qJi+CLP90+hSQtijU7ha5XK0qz4+L/QKXrttY5yNYDzF+
	/Q1Ha/NC4gb6dlD7yl9sbefa5GH27ecX4a/DFdGGOF/M17eROxElGilgDQuvjoehOHWl1phIzjtRs
	ITKwqFKaUiVGbHmyG/a5Psj/Gk+f3R2Hup1+eF7mCQTbp1U8CQGengYjZ3bggTdG7RI9/PMhxdPMk
	wQN6wfyhv8Lkjk/BiYjro4d75OxMPcVazHnSvo2CXaIOF8h9HyowCaIdVOkzaiUHwarjwesc8w3ql
	2pg490Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKp-00000004u7G-3teT;
	Tue, 30 Dec 2025 14:04:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaKo-00000004u5E-37xW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 14:04:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C097A6000A;
	Tue, 30 Dec 2025 14:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874A2C4CEFB;
	Tue, 30 Dec 2025 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767103465;
	bh=Mmt0uCsWzDFQCwyCperldqiej6BGHm3coCvPMoSehHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzGOQz/PUXCcMsyjqPFy/fjPWTbA4VPlxFw2z4zZzc8o+VCV1w2gJwK2iOlWyFtv4
	 +T0w9dJD0Uc4V3iSYm2dXCe7pth4xwb8tBqSpdFT8/hI6m2g+aNONXZFO1RN3zYGeF
	 +1Go9dv2o6EuC7BGXPwGuC7CVjtXwiB6CqBbLDRhnQ9oSd79XJF4QipsvDqd4ZrcZv
	 rr+mFkB92Q+OAVqVGrEh9ol6qbNzmCgEUOpwyZsz+O+gSjuU8mgPDFTydpPU8U/fW8
	 b/mWpL8zcASsDnklPYyuL/CNM6mSjHjAdZiZCEre+zX4xy9jLaI39Z5MGUAyIltkPH
	 v3YxWagHnxMPw==
Date: Tue, 30 Dec 2025 22:04:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx: imx6sl: fix lcdif compatible
Message-ID: <aVPb4UNGgrc5qzlD@dragon>
References: <20251223222435.538096-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223222435.538096-1-andreas@kemnade.info>
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

On Tue, Dec 23, 2025 at 11:24:35PM +0100, Andreas Kemnade wrote:
> Fix lcdif compatible according to bindings doc.
> 
> dtbs_check tested only, a glance at the datasheet shows that it should be
> the correct fallback compatible.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thanks!

