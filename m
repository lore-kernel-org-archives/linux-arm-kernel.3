Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC82CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZusX+BNL3GFZ6oyicfGXGuznB6KnQFM8wrGuGn7o5I=; b=ASmuUfukaUCMYusBcobV0e3gZZ
	OPynv1UBwfgIab4ryYcLsgWIDb4KVwgUtRM5q+jGRy6V8EHk+ocwNxmWnuHomkCcY1dELJ3Iqk5uK
	iMgGkE5ZTVg4Qa8gTYI73Wwgt9jGg7wDhlWXEyifKm/vtPnHsxB0c6T4UemZSxq9XyfpUDPN4FD0V
	ZFV75JyVo4MpPF2FqkagYw/5T2y68WKeKOQrCmI8EFCYAoQHN1cyju+oMSaKtTMmZz4Xpn+HnxIdF
	ESdWd73qsf/5ORIjo9AVQiYgCztoGZhUPM+oR2Bsw5SsUlPVmGcSfgAedeUSDvtmx5k2OCOWAJ657
	RBgcOpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIuoO-00000007jMb-3q63;
	Tue, 11 Nov 2025 20:17:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIuoF-00000007jID-0Tkm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C244D43F23;
	Tue, 11 Nov 2025 20:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E428DC116B1;
	Tue, 11 Nov 2025 20:17:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	ruanjinjie@huawei.com,
	suzuki.poulose@arm.com,
	ryan.roberts@arm.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: acpi: add newline to deferred APEI warning
Date: Tue, 11 Nov 2025 20:17:38 +0000
Message-ID: <176289222849.1642362.17029538474789995390.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251110212102.816724-1-osama.abdelkader@gmail.com>
References: <20251110212102.816724-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_121748_864886_B89C2F2E 
X-CRM114-Status: UNSURE (   6.38  )
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

On Mon, 10 Nov 2025 23:21:01 +0200, Osama Abdelkader wrote:
> missing newline in pr_warn_ratelimited in apei_claim_sea
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: acpi: add newline to deferred APEI warning
      https://git.kernel.org/arm64/c/420cab015503

-- 
Catalin


