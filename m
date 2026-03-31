Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6DBFF60FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcC+5B3cGuoNFwsEjmASCaCjzLNqyQa86IEUKfYfw9Q=; b=gtlh8SYzi7JeiHAKS1Z7bIK8yX
	UuP1vbipz9zMyUVRwYCYj9ahxm8T0asZbFgI7ZFlUuwa4KTssKwsE3jaUxIlR6Etoe2RTvW9yArdr
	amj+1NSVUfElOxAMUukE05c25OcUiy3UBeP5TvdzRM8bX8/+0Gdt1464VFzj4muBfOd6q0NUDjwVk
	V7i/aTab2krJcwhKVL/fkXtdHlLXdjxD/lrZ6E/afmU9MQxroWg8DKeFXpxEAOx0mJuQ8ERXSraMR
	kaQ1d7q3QfYb4nyqLexOXnbouxxq6XaB94vc1Y9cWqRT2KVpDD29FbHApSqfE+PWSW3AxoUueyJ1Y
	AgyC3guA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Wmx-0000000Cojr-2trO;
	Tue, 31 Mar 2026 10:57:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Wmv-0000000CojU-18df
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:57:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82CE7497F;
	Tue, 31 Mar 2026 03:57:28 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F38423F7D8;
	Tue, 31 Mar 2026 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774954654; bh=tQyJeQHQrsCASSctos3zX5Da/f0X7BfAlqqZceKvDe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=irmmsoXj2gvBxsxgQIOlXsePY6DIL7ZHpCJMqs4eFUwQ7AMbz64gGeid+MLQEZ2kB
	 gfHhvqoc5FLK87AbbjdwHof9xRSJQkren3+4a5/RTRVCLAr6NN3gwWJK9J6pOzNCxv
	 LFSioqSRy/5aWA1remSu06xpNuLJdfMoobf76v5c=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v4] coresight: tpdm: add traceid_show for checking traceid
Date: Tue, 31 Mar 2026 11:57:21 +0100
Message-ID: <177495463317.3339161.13644663254441838804.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331-add-traceid-show-for-tpdm-v4-1-ed3dda24a562@oss.qualcomm.com>
References: <20260331-add-traceid-show-for-tpdm-v4-1-ed3dda24a562@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_035737_455628_FCBD1F29 
X-CRM114-Status: UNSURE (   6.24  )
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


On Tue, 31 Mar 2026 18:05:22 +0800, Jie Gan wrote:
> Save the trace ID in drvdata during TPDM enablement and expose it
> to userspace to support trace data parsing.
> 
> The TPDM device’s trace ID corresponds to the trace ID allocated
> to the connected TPDA device.
> 
> 
> [...]

Applied, thanks!

[1/1] coresight: tpdm: add traceid_show for checking traceid
      commit: ec687ba84000d7d50cf243558041f6729d1d8119

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

