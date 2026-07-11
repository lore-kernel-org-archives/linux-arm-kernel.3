Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30187C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 16:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uc7rJd18EDppqVGAeMwc5Uq93urxmdlU917bXG2fWU=; b=ZRUV01NaMglKtu+pBFbwB0tDTW
	7OkKwSbKvY9UUcP/h1dRi2PcApOoZ0Hm0zx3w34x5COyfIn7/923r51MO2Ge71PIBtYdqZC6h4Scc
	OLibHWPVIuBvVR+adQiZIxt7TnctwY8k6N/5KRvaSJprhaX+Jr1r43B6oJmnEM83VT+U0dNhm+aid
	3TXB0gDtsPvQUyA5s2nqShUQDQzCTLlau70v/c71dSldqfks9icWU6rMI50MfO/H5MNF9JieKW8xE
	abMx6m4U0x3Kp84DTsPnWPBWG2BMYzWAClv8WsrgZTtvOuMnZizjrDLVg5vBUOaGfsrQM5l6QGXst
	jbvGwpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wias9-00000006hh9-1rKE;
	Sat, 11 Jul 2026 16:48:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wias7-00000006hgz-36CP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 16:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CABFE601D9;
	Sat, 11 Jul 2026 16:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08AC1F000E9;
	Sat, 11 Jul 2026 16:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788490;
	bh=4uc7rJd18EDppqVGAeMwc5Uq93urxmdlU917bXG2fWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dpIYMSbYP6OhuuRrG/dJrwgysxLKciZh1wLRhYoxaTyrqDMeWSebky1ZYd+R2dlo/
	 F7voVVpVgaMld05AFvo6uFwfuRhEGp+EvrXvcM38WoXTMFyLzs1XxXPAbZA/ei3P14
	 rUL+OGYD33GwmLiZVMpNco74jRXSG+Z1em16DynzzYEp9as1YFeiNvjrA9hFmm6nrE
	 8h8YW0AMSfH21Ybjd+SmlNTRGUAnTWW3N3ZgNNCSk3v84ClbBsw8bVsfH7+ZMqURBT
	 mjzLaEQT69via6fIX+glg2Jx4TadOdYTywdcC6JZTSSvk/Hc8ajNezASyQj4ieOE+v
	 fhrc81t3pjyvQ==
Date: Sat, 11 Jul 2026 11:48:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/5] soc: qcom: Kconfig improvements
Message-ID: <alJyHU1C-kHzuC_p@baldur>
References: <20260711-qcom-soc-kconfig-v2-0-4a907e064281@oss.qualcomm.com>
 <178378282267.119479.4576908957568734087.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178378282267.119479.4576908957568734087.b4-ty@kernel.org>
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

On Sat, Jul 11, 2026 at 10:13:46AM -0500, Bjorn Andersson wrote:
> 
> On Sat, 11 Jul 2026 15:25:00 +0200, Krzysztof Kozlowski wrote:
> > Merging
> > =======
> > Defconfig change (last commit) depends on earlier changes, thus that
> > patch could wait a cycle.
> > Alternatively, everything through Qualcomm SoC tree, but then please
> > keep these on a dedicated branch in case defconfig has to be shared
> > with soc tree to avoid conflicts.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [5/5] ARM: defconfig: qcom: Drop Qualcomm SoC drivers with defaults
>       commit: 86690b3fabd66970e43f1d1fd4a9ed641850b924

Sorry, I tried to unmerge this again, to avoid ordering issues between
Kconfig and defconfig, but failed. It's actually been backed out now.

Given other changes in drivers/soc/qcom/Kconfig, let's merge this last
change at a later time. 

Regards,
Bjorn

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

