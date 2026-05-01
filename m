Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 13:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQtDLqGsZjoDzSVQIxvTmNZ2ajJZSGNTznF2jEorpds=; b=BJ3YSQ5iL7WOlCAMw4rZu7Qu+x
	OdK5fxVnkF6UWx7mZ8kfGt6iouu8Ft9CGCrZCvEywF+TtAfUn6Dzu86oQIf02yEcTY1IEoVW2kVa3
	q8GiSGU4R2b7Vj9RFvEFJ1X0V3fVEvmPEex8KCJimPP9QemKj7KMf9ngYPnNDrLCC88b7JBEEhyZ8
	GCrxSRZXOl7ug/kfuqYtBo9vhe9Ry4Zs2y2NxXbHwO5vCAPoYzihBo51jjpvaSmCQSZOnHJ7tERS+
	q+oQrxnbu5YtiqMAYivpMQIy4dr5OKP1u3UrUwH7kYsTmoXvIkxUUrMCniRalxItmwTOhiiYuP6/R
	PhdY2jgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoJB-00000007C5O-40MB;
	Fri, 01 May 2026 13:53:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoJ9-00000007C54-174U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 13:53:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E9D176B;
	Fri,  1 May 2026 06:53:23 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E91803F62B;
	Fri,  1 May 2026 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777643609; bh=KQtDLqGsZjoDzSVQIxvTmNZ2ajJZSGNTznF2jEorpds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEzd/sjzC2dPVHu3nprfoqREEEiGhfQmn7h5MvDT0MywLxLpgdGbXBuGy19a7aJTK
	 Rs7ZEHA+Ow96sCTAg2JIO/1EyrEF1fkJSIAqn5jNtt5oEdyczXaYtXbDFWE1645ZBm
	 aN3Boqs/ONjkAkWyDTrQCY/kQINHh02DZwhBOCOE=
Date: Fri, 1 May 2026 14:53:26 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v6 00/13] fix several inconsistencies with sysfs
 configuration in etmX
Message-ID: <20260501135326.GB2674113@e132581.arm.com>
References: <20260422132203.977549-1-yeoreum.yun@arm.com>
 <afSi0pJgGKAhBnYC@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afSi0pJgGKAhBnYC@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_065331_352689_1ED2ADE0 
X-CRM114-Status: UNSURE (   7.35  )
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

On Fri, May 01, 2026 at 01:55:46PM +0100, Yeoreum Yun wrote:
> Gentle ping in case of forgotten.

This is on my todo list - let me finish the task in hand and then I will
play a bit this series.

Thanks,
Leo

