Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED9BC79FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkYzynJf5cVxbx8MTrbUV4auXyzkkWaIKFDv9IbJPuo=; b=oMp5MEYUzwx7aC4VC+koBE23Ww
	ORNUwLKuGJTlrAkBjktKoEtpo6CIITgLv+CSnzRcHlUlYj0H5QJcfSMfk4ylWepOBTRLdqZANUXSK
	ko+8Y74M22mLt2NeaHdmK9Qe21CHITSAawo3YKt4zmgXGZ785qw0LIxktCTwumn4LKGM5gHGnUk/L
	YlVAT4mUHppRqfwPD76tqIDed7vEyRTKZY8t5YQL5uJ8ZTJ9H1u/udZ4d7dELx7UAxZML9lBq8ONr
	8VF8mwWqFvm971U3oXZvklbs8SJ6TNraegz/ofBgyNb96fc8JZlt7Zeqt+KG3cooEdgdmlrS1zMoe
	/3lvyCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnvO-0000000Bm25-2npT;
	Mon, 05 Jan 2026 16:59:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnvL-0000000Bm10-3GKc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:59:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3F93339;
	Mon,  5 Jan 2026 08:59:11 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E3AB3F5A1;
	Mon,  5 Jan 2026 08:59:17 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tao Zhang <tao.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v8 0/4] add sysfs nodes to configure TPDA's registers
Date: Mon,  5 Jan 2026 16:59:03 +0000
Message-ID: <176763230695.1199730.11535230216909917537.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_085919_851785_84B3CE85 
X-CRM114-Status: UNSURE (   7.47  )
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


On Tue, 23 Dec 2025 18:09:49 +0800, Jie Gan wrote:
> Patchset 1 introduces configuration of the global control register with
> appropriate values to enable proper generation of cross-trigger packets.
> 
> Patchset 2 introduces a sysfs node for triggering global flush for all
> ports.
> 
> Patchset 3 introduces a logic to configure the TPDA_SYNCR register,
> which determines the frequency of ASYNC packet generation. These packets
> assist userspace tools in accurately identifying each valid packet.
> 
> [...]

Applied, thanks!

[1/4] coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
      https://git.kernel.org/coresight/c/f9cc5b5a9e9a
[2/4] coresight: tpda: add global_flush_req sysfs node
      https://git.kernel.org/coresight/c/8e1c358a3b0e
[3/4] coresight: tpda: add logic to configure TPDA_SYNCR register
      https://git.kernel.org/coresight/c/33f04ead7c49
[4/4] coresight: tpda: add sysfs node to flush specific port
      https://git.kernel.org/coresight/c/a089d585a7f4

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

