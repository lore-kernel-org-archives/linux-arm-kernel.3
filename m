Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 15:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+NPRc3pxS/F2qlIp2S0rI/vJl3kJSiHMCR2dukHW7yE=; b=SquobWNRK3wZ1B4ifFtvt+hTTl
	K9QctSBAziNSsk7PNRGO9QSphpTWVWYWQTjvii6RjJP8qVXXNnfgk5Dq4WV1NDX8RcX1sHeKcokLK
	IBV0qzheeXpnkEnoCDxU0iSFTY+yNnqXj4OAixVLJxlNkgpVaJYnsF5wfve66DmzsuRywQ8D5jVRB
	6Umbbi8pQF5Y3EjmQBi+9AqGmVdbm0J1TuFvpVEf5z5If7sJBxCDx1sJcF8tygX+Ok4Kvb2Uzgd7/
	F9+GflxjFu1TnFWYW5N1I2Sg6yndykh6u8aKiu6EdQieQgLOg3c+dgPkpXSBOhayixBxi9rhCii5X
	ujkRCyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZOq-00000006dib-1yEH;
	Sat, 11 Jul 2026 15:13:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiZOp-00000006diV-1T6G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 15:13:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FD6760052;
	Sat, 11 Jul 2026 15:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A8E1F000E9;
	Sat, 11 Jul 2026 15:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782830;
	bh=+NPRc3pxS/F2qlIp2S0rI/vJl3kJSiHMCR2dukHW7yE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kmuXmTNOg6J8DA+cGQLawuhxBUNOPVqHL6KdB2BnjRNLvWsoc+nQcck7ZBbX7JP1g
	 4VfIDEZ8uRY3AmC2p9JRiGDjFUm9b2OxaY9Tb9piqxplenYe2CAsTrm+GqDEemZzkz
	 iGH+pSfan8RHjzty1+WENNPYyyTCKdhheDgFR6JrrnNm+4TUIomNlYwR5m0jONAbJF
	 DSur1B9r1GVfWIuBuVmaEsXZrLTgcRlRdFK9NaglBzYOADw8UaoAhLLNcMo0qRKQqu
	 rBrYJtF4YRgdroRVSFhcSGSeIUWHCE2dCwZg9eBDcSbiySg77deooRE+beuJpYw5Wn
	 yGyXGW1NEFYMw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] soc: qcom: Kconfig improvements
Date: Sat, 11 Jul 2026 10:13:46 -0500
Message-ID: <178378282267.119479.4576908957568734087.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Sat, 11 Jul 2026 15:25:00 +0200, Krzysztof Kozlowski wrote:
> Merging
> =======
> Defconfig change (last commit) depends on earlier changes, thus that
> patch could wait a cycle.
> Alternatively, everything through Qualcomm SoC tree, but then please
> keep these on a dedicated branch in case defconfig has to be shared
> with soc tree to avoid conflicts.
> 
> [...]

Applied, thanks!

[5/5] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
      commit: 86690b3fabd66970e43f1d1fd4a9ed641850b924

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

