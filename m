Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA5FF327AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r61Icmn053BSK2zDSfBIwvT55BvK1xCTRbRC0hSjr/Q=; b=VQzMhyJLzEAf/VEkAvnegfvr5n
	X+XGcu/a5IYzzzQlr9/UHf73wTn7uSp8jp5WSPW+77SP/jkC+H7chUDC6+Dl7aN1K5Bbc4DLYHd/f
	+rZZkGrYlevClaxcE+4detk2mzYgEqdPm6s7u49Edow3qx8gPEa9l9LhG9POSudX5iolgY9ZH7jn8
	URjNUSmyuKN7yjjJZsyPWmoE3XRBGxAg1vIUWMQR2jlEOclSDNMPJpvR9HTSU4yeU5B7kr71VanRx
	H2uYvq+8YCjbzwnrESMHyNMikF54zMTiqEJM8oWjNjpylPTYTolplIhWPHfx/CmawZKgXvQHdV9tZ
	3r0lYZzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4nT-000000087Cm-2XXH;
	Tue, 21 Apr 2026 06:41:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4nQ-000000087BP-2ahZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:41:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3AD12454;
	Mon, 20 Apr 2026 23:41:08 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 167B43F915;
	Mon, 20 Apr 2026 23:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776753674; bh=aSKjL5TnbEV9vUHbdqBDogitHSncPdYaQ3kiFtX5vfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVUuysf7GeSMRYHf9k6YcssIuWh4WyCcWaBK7o+PG9iCypZ3JSm2/SsXhWvWiA5vZ
	 YpyGBcS8CrX27DmGEkPKXTZTb9Yc71rUXZOFwKunYmRpOiGX0DbObPOTYex1cCReF7
	 OLBcwud/ZY/3cLOeR+jLWF7jxiWEWnLkTcygyEmI=
Date: Tue, 21 Apr 2026 07:41:12 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, suzuki.poulose@arm.com,
	mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v5 05/12] coresight: etm4x: remove redundant fields in
 etmv4_save_state
Message-ID: <20260421064112.GA929984@e132581.arm.com>
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-6-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415165528.3369607-6-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_234120_804503_12B57EC9 
X-CRM114-Status: UNSURE (   6.91  )
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

On Wed, Apr 15, 2026 at 05:55:21PM +0100, Yeoreum Yun wrote:
> Some of fields are redundant in etmv4_save_state and never used:
> 
>     ss_status => trcsscsr
>     seq_state => trcseqstr
>     cntr_val => trccntvr
>     vinst_ctrl => trcvictlr
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

