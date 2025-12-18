Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDCED6ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwoeNAAbHD7xUl98UjGIXtUUJrSnY8KTjPcajcsfzDk=; b=i2y3/b65nPO3A7+u0QcPkuEliq
	Ck2EVeq0B6tZ5SoBHs2E5uFw6sgn6aVcTAWA3ySTlo8XZFk9SAT6sZRAOvoBbH04RN8klmh0Is22J
	TzHpbdBHRnMUx512b6TYCdap+SEpiT5QYMn5JYENUjFO3NjlwFTtjiAG+AsKm34lSkX3zd5aQHjTJ
	gWm7Idc2OCqVv2vySA4k8LMZ2BlB+lyu6kSd4vfYbg7VPfci3hpZvlwoduoayARZ8aDtS3YFdo+As
	j/VgVP87OkQC4DamgQLaurOBEFkoYL88+3UsSr6O6Is4WCB0GhRzkqp31CWR+1XcI7FSJ1cSZwxox
	h35bzHRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBME-00000008Ev7-2Or4;
	Thu, 18 Dec 2025 10:35:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBMB-00000008EuL-1QaH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:35:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61EBAFEC;
	Thu, 18 Dec 2025 02:35:30 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 962393F73F;
	Thu, 18 Dec 2025 02:35:35 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1] dt-binding: Update oss email address for Coresight documents
Date: Thu, 18 Dec 2025 10:35:21 +0000
Message-ID: <176605409291.630972.15776682739253158062.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
References: <20250902042143.1010-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_023540_038412_EA4BFCE2 
X-CRM114-Status: UNSURE (   6.01  )
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


On Tue, 02 Sep 2025 12:21:43 +0800, Jie Gan wrote:
> Update the OSS email addresses across all Coresight documents, as the
> previous addresses have been deprecated.
> 
> 

Applied, thanks!

[1/1] dt-binding: Update oss email address for Coresight documents
      https://git.kernel.org/coresight/c/7009646d937f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

