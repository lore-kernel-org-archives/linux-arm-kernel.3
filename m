Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB70C624C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcOB6tYMsVoM0Bt7BP1vZOGhe0rRy62AX70ya1Muik0=; b=KJLgVKzTkzhTG+pg/OuoMb+g7H
	hD3KWZdAXIEaqW4sLx6HDF5QGJtxjmbJr3BpArdL+bXCmTfXI/bm8eBktWyo4ms2rNpmOfZG51Z5u
	4wDM2ch9Sy/ReOV+u2h1IDy8Cov2Nn/BywkrLuYgpMjQ2Kjc1zoiW5dVUoxu9zYtErtKf0SzEwfgD
	gt2rp25XhuLDtT/PJHZUj7AY7DMlFAe2tssWdMGiKPm/aNQPyC/i+Ot9mqVdqJ15RJoHZvpdu+aNn
	1B5KQMXdhypA3lQ07U3+KrE/qOj49LzjWfNgzag+6pj8v3x+r4acOiHxyTzWfJ5Z5pfsp8k6eUdH2
	275coldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzVw-0000000CaaD-3q6l;
	Mon, 02 Mar 2026 09:24:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzVu-0000000CaZ6-10S5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 09:24:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2F5814BF;
	Mon,  2 Mar 2026 01:24:19 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 288123F73B;
	Mon,  2 Mar 2026 01:24:25 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Elsanti <santiagojoseleal27@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mike Leach <mike.leach@arm.com>
Subject: Re: [PATCH] drivers/hwtracing/coresight: remove unneeded variable in tmc_crashdata_release()
Date: Mon,  2 Mar 2026 09:24:10 +0000
Message-ID: <177244343076.1680574.6923083572593250437.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228222344.288639-1-santiagojoseleal27@gmail.com>
References: <20260228222344.288639-1-santiagojoseleal27@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_012430_322933_6CC514E0 
X-CRM114-Status: UNSURE (   5.16  )
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


On Sat, 28 Feb 2026 18:23:44 -0400, Elsanti wrote:
> The variable 'ret' is initialized to 0, never modified, and returned
> directly. Remove it and return 0 explicitly.
> 
> 

Applied, thanks!

[1/1] drivers/hwtracing/coresight: remove unneeded variable in tmc_crashdata_release()
      https://git.kernel.org/coresight/c/061c39a17136

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

