Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D521D6C2B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 23:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUpNtKBO55SwqeajqXNHSAb6dK5HJjG4C/KjU7LlupA=; b=ZHbwdPJikTKUhZx9m1cT/Xgwfa
	j3iKgHwDJhR0N/yPkRdKE3g45nXb/ChwMgFj+WmQWJKTzOuPQbvoZC25l075re5gkUT5LiLONyH1D
	DKAOSRdfcA2LxCHI301UUyah9NIQhNzBuI95Vm36/+PK1ggAv0PZqSxBy2+mhu9vGXmjkd9SGYY6I
	8hCr1OwoaGp7Ree1QFFgrj6Le23ZPJvM0s72vdydhvfwLrVlJn6K7pfbIH9T3lyzZTlh+bPyis0MV
	McCJXpzWO4b4h/G9blljQFC/XgVHN49BFGYmR9I1p5HhvbkHaS+z8ubs3JuxQrvKjU+SZB3xgXYsr
	e18F06pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDXJA-0000000Dwbw-3NMD;
	Tue, 19 Nov 2024 23:06:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDXIF-0000000DwWy-0dLS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 23:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB0865C5912;
	Tue, 19 Nov 2024 23:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AECBC4CECF;
	Tue, 19 Nov 2024 23:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732057557;
	bh=OIoNxLDCOzrdaa9jbIZT+h3utFjaNUYz0bqcF6/FqxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n//8KXFkkiBLonTstOp31vSec6z4+l7k1l01Bal5VonWbRFPTlRhqo071EhlXixsI
	 6myHYmNoU4jdMy8LG4D0Cusng4IBx1QyJIO1YdL+ohsJFwZVKpA7IqgbdHQIVTz4Mb
	 P9S6XBrcl/JgKy6jsJMd9Ol/9/xQTrH61nygqNwr0n1QaeAXY0CM/cDmPNE2WJJ24c
	 txea/HMb8HkJgD5jRY3lqYWZr0WwnjWFuVwLN0ON1PDZRPj1fxoYC3tmckMgfuqXGA
	 QCDjvIFoXBlgwLeZ4Q5Se3cDgNWZdt38+SzCkKV4nga7GwktKGg8iQGhmuwUtusJIV
	 UmJ39In3RJyHw==
Date: Wed, 20 Nov 2024 00:05:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, shubhrajyoti.datta@amd.com, 
	manion05gk@gmail.com
Subject: Re: [PATCH 0/2] Add atomic transfer support to i2c-xiic
Message-ID: <w33x6o2lhqtuboxsw5g6uvvoqqvrdu24i2iatzynl5o5ezfwah@cbxtdne7dr7g>
References: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011104131.733736-1-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_150559_229498_6D0ADEC7 
X-CRM114-Status: UNSURE (   6.79  )
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

Hi Manikanta,

> Manikanta Guntupalli (2):
>   i2c: xiic: Relocate xiic_i2c_runtime_suspend and
>     xiic_i2c_runtime_resume to facilitate atomic mode
>   i2c: xiic: Add atomic transfer support

I've read this several times since you sent it. I finally decided
to merge it to i2c/i2c-host.

Thanks,
Andi

