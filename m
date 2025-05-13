Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA891C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nfhj8eAvuqjUHQP7Lt/JUNtMAXiHgwb2E0FbLgm85Zg=; b=ZrXm/bac12jZMVIX0LpvPGi0B9
	Y/sSK2dpC+yApMkCeyqK064VOuwHc0L3DT/lLgUITznSN+5ziaM/hIHgFYKZqp1+zq7Lr2kyWhHmW
	W5o4FGOSxs1HITuBRrycz806llp/Ma7CuIdFxEBDDUtNo9qwbrxoRP1k1OhcE7Cn+P8oTpgp+YIsX
	uwBR/6fOaObLTriaozWKOqbXXsT8LCW505+zMTMsvKAVEH1NXM0Mn3GEOqyYrD7LmBnf5fpJIrKFz
	FLGNhvpyHF/LKSx0dIUgZ8Uvokxd9QTuNWxLVaryCYtmEVsLMmzPpFUjd3d7Qp/9T6xrrCjDwDKra
	bfm0Q3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqqy-0000000Ce97-02X2;
	Tue, 13 May 2025 14:43:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqop-0000000Cdi5-3Wmk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3ECA5113E;
	Tue, 13 May 2025 07:41:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B98213F63F;
	Tue, 13 May 2025 07:41:17 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v2] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model
Date: Tue, 13 May 2025 15:41:10 +0100
Message-Id: <174714724795.3607672.3411861765856358209.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512151149.13111-1-leo.yan@arm.com>
References: <20250512151149.13111-1-leo.yan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_074120_854821_89A85657 
X-CRM114-Status: UNSURE (   6.72  )
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

On Mon, 12 May 2025 16:11:49 +0100, Leo Yan wrote:
> The FVP Rev C model includes CoreSight ETE and TRBE support.  These
> features can be enabled by specifying parameters when launching the
> model:
> 
>   -C cluster0.has_ete: 1
>   -C cluster1.has_ete: 1
>   -C cluster0.has_trbe: 1
>   -C cluster1.has_trbe: 1
> 
> [...]

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/1] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model
      https://git.kernel.org/sudeep.holla/c/6332351622db
--
Regards,
Sudeep


