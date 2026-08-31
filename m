Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FA3C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwl8/hF34tetbtwlwHSRa+CpiXrag9vR7WMw0ULvTQ8=; b=rH5FXZjAKCr+n4JcF4jlHAqpyQ
	ZCXoRiUicdin0iaDQkbZidlwjt7OsW4NZLIVuacM4PbQllNT+2EIPqOg9N3c5dNzNMM6xkjVuepaZ
	d9uFP79wVc5jkyeDxWMpExUiYX/5jErq16c2dxvrp6pcgDBdp81ydtV+LAjIOdIV6F90Qk0x2cpi7
	tdNWGBLJq2D8JMGrGb4p/uOLEEXcukmdieiQDutelT07Gt6Shh/StBSQjfQHl+UCCfaXumZ9HPhr6
	Exj/IpuTeY3ei/LfkiXqneX/6gYyCWs1pFSEE80eyuZgQaBiRqTSz6YiSbSYNijZ83YPPgWSZJ8b+
	eu3xrPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zBX-000000096Ps-1jyp;
	Mon, 31 Aug 2026 10:24:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0zBV-000000096Pa-3WS7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 10:24:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D199E60212;
	Mon, 31 Aug 2026 10:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ECB11F000E9;
	Mon, 31 Aug 2026 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788171852;
	bh=uwl8/hF34tetbtwlwHSRa+CpiXrag9vR7WMw0ULvTQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M4DkrJ6dvyvBJRCIkpzZ+GWEOyVQ4Q2MTA6Vz7nYwl3byHOHL7e+nHJsusVTIRlg+
	 K3xAEldi4EQXGCkFY5G3cosNWCAEICsyddi312kqD8WUB4Dx8m9xT9LoWMedbepOPw
	 OcKjw4HKPYMlOQRJ8nYgeqiLIQC+eQi7Osx4vEta7cBTRVJT/WRmcPQGxWJMZjRUsy
	 jR04rVKZMndmLMQ4fskxHokVLnSbSM2cVHyuWaSIPrUOi3hSr9XSdyY+PcVM7im/n5
	 b/m0uOOfDDfUHNjtMNcqV9C7E8DhDBfG5O3a9JKm6IzqsQwMT0YgtMF3hQlE59Giae
	 SLHWThypzVq7g==
Date: Mon, 31 Aug 2026 11:24:09 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation
 with tabs
Message-ID: <20260831-tentacled-prudent-aardvark-794027@sudeepholla>
References: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Sat, Aug 29, 2026 at 09:41:22PM +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

