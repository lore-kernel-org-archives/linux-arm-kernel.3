Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E9FFA0C43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gvy51nggAqLi0h1l+z5mN0jWtZ6SLLjUoZXHF5ECXw=; b=XZIvBXSS74mVqZRAD5Ck+xJu7c
	TcZ+lOq7HOkGcFMLVYGW6MQYVeC8tyP6YRKIl+LA5cjcqqA2ygSK8lGhVv19G9Xzwn3sp0VwkEjsp
	Cqbe9gReXS1EyKv16bFuTGAFB8chIu9tQi/IeNNx7t/WVlJt7KXYMeTT/brW0dfZBfdjGwjRjRuB+
	GUT3qNyhJWyk3djTp5a42cvhIZF4qLtlHPhwgeF88NiQSYOmP5O44f3FRMaXqLtPm+zyGoujhTlgX
	i9BT2vdmBYnoyD6b+r+zqDn+biZes9nNtU9gWvGYb4YswejTyKKGZGcDAIwkn0ZtADB/bnoapBhuY
	VVJNrrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvFX-00000000lpG-00GJ;
	Wed, 15 Apr 2026 08:05:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvFU-00000000lov-48YS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 08:05:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E334FBA;
	Wed, 15 Apr 2026 01:05:18 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B50603F86F;
	Wed, 15 Apr 2026 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776240324; bh=4gvy51nggAqLi0h1l+z5mN0jWtZ6SLLjUoZXHF5ECXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ad7doJp7O02yGI0Q1Sg7Od4VSoketgT8GM4hcp57UD4e2UZFPt7Q5HsWRVTcIgRrH
	 LRqwSnJyv4sWz/8BFX0TR4iIzNXso22iSYp606GLrCyKElkpIrVbMhoKEDmr0MnxcF
	 8vZvFeY9AkNCHYWfZaw8gHC39Tb6A78TrOPrvlkY=
Date: Wed, 15 Apr 2026 09:05:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Yingchao Deng (Consultant)" <quic_yingdeng@quicinc.com>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/4] Add Qualcomm extended CTI support
Message-ID: <20260415080521.GI356832@e132581.arm.com>
References: <20260325-extended_cti-v7-0-bb406005089f@oss.qualcomm.com>
 <9772e300-06cb-4892-810c-bdcf6251bf9f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9772e300-06cb-4892-810c-bdcf6251bf9f@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_010525_078678_CE9A80BA 
X-CRM114-Status: UNSURE (   5.64  )
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

Hi Yingchao,

On Wed, Apr 15, 2026 at 11:22:49AM +0800, Yingchao Deng (Consultant) wrote:

[...]

> Gentle reminder.

This series would be on Mike's radar.

I will also look into details once I finish Levi's series review.

Thanks,
Leo

