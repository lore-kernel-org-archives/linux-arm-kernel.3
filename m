Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703ECCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e81CTbQc2/9D/pRIcWDYZ3++FviWIY/4m9w6lRn1Br4=; b=Vku6QPl7C2JwGB8WvtiIZO6AUy
	qy9BAnluLRk02vGlXC/tBaoWBxz2bz7xTYOrwk7da90rVRxo3/vyb+nbfAVnvpcu1bsDFzanaz3uH
	J8WE3CnPEL1cYe6ji6HnSs8AVKgXS3fe6o6J6thY5GpmPKKcC7aChfx8xOZRTEXCo5QsC0cxIM/vt
	Q4A1E07TAwmEq9DnAozBw4J+VLq7/YUtvPtNAWGRpy84GJjvB9R+ULpBjCEzvCxMQEyetVlQBceGy
	EuneUPFSVOSFNrW3po1LSar3uVxtEJPcCBfDW5/BLOAN7CMdHhfWfT6g2h6os/mlTrppzXBFlt96G
	9db+0Now==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3fC-00000006cTs-1d8A;
	Fri, 29 Aug 2025 18:17:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us075-000000061p3-0Dfw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:30:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BFF6644E4B;
	Fri, 29 Aug 2025 14:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7CFC4CEF0;
	Fri, 29 Aug 2025 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756477798;
	bh=Yns9bavo72CG4gNmrewLrs/gA3MVFABLZslxaAFREJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQP95uGpYWjOh0/WvGngenn519PhBUV2JOOu7M/vPRfYt/jFyLuONC3cJk2dxWtXi
	 ZcM2TerOGx3V6Az0+uTaZ3ezgTQIJVBq5WWNvKL9ukiu8Hgj4oPOXpiWdx8HjnhP6U
	 huDGcJKaGEMRpoXBEQhlt6QOxgZ2VGexAhMmOm+X8/4PlRqmpJio0IatvIT9jmjlbT
	 oS/v3gVau/6/z6IvdaRM21bnQQkIoxhDJMUb9TvBchmpG56npOcTrwERoB7ejm21th
	 3GIRUoSC+wrnAozzV3/DpKtjBGymoH7zoiIf5sYSEQBnc450c5FxpYKZonEKfa+7JV
	 me13JUApqexUg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1us06u-0000000008d-0bA7;
	Fri, 29 Aug 2025 16:29:48 +0200
Date: Fri, 29 Aug 2025 16:29:48 +0200
From: Johan Hovold <johan@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Jan Palus <jpalus@fastmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: quirk: fix write to string constant
Message-ID: <aLG5XFHXKgcBida8@hovoldconsulting.com>
References: <20250829132152.28218-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829132152.28218-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_072959_108369_487C13E6 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, Aug 29, 2025 at 03:21:52PM +0200, Johan Hovold wrote:
> The quirk version range is typically a string constant and must not be
> modified (e.g. as it may be stored in read-only memory):
> 
> 	Unable to handle kernel write to read-only memory at virtual
> 	address ffffc036d998a947
> 
> Fix the range parsing so that it operates on a copy of the version range
> string, and mark all the quirk strings as const to reduce the risk of
> introducing similar future issues.

With Jan's permission, let's add:

Reported-by: Jan Palus <jpalus@fastmail.com>

> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220437
> Fixes: 487c407d57d6 ("firmware: arm_scmi: Add common framework to handle firmware quirks")
> Cc: stable@vger.kernel.org	# 6.16
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Johan

