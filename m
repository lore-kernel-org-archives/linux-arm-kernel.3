Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D4EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7o3YuGVnQOdnGK8jRKxer0B+KC8nUUYAhUy4Vbmmrk=; b=LasXUm7dcmJdU53JmFYPecCVTx
	P8cG81f83EdTooP7pyc5pyeb13d4TK5iHWm5owX6p3J9IBXJZxyBnXTq8iBzxwXDcRuUlx2tK/MiD
	HFzCtLk343cXBUZIGh/WImtu7tH9b3qOCbgTPhuLJPQt944XREjoM6FCn487FYIWc+wLwW6Qcav6C
	7w8KsWfn0xFsAN5Q2ShFxQ0fgwsuZIf6DeM8emCGUxg59lCPLZiKgpeIttrgAR/UM5Tuq4zK0QsJj
	SVs44kjjzXvQcxsMXNijSiXTjS1RwaBbBwAX8fBLt7lOtSLyEAZsWwLkqw9C00Mfe7wVwIVY81Gwz
	6g4Dl4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4V6-00000006eSd-0mob;
	Tue, 11 Mar 2025 18:38:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4Du-00000006blZ-36Co
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:21:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1926A46121;
	Tue, 11 Mar 2025 18:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F8EC4CEE9;
	Tue, 11 Mar 2025 18:21:00 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Yue Haibing <yuehaibing@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/fpsimd: Remove unused declaration fpsimd_kvm_prepare()
Date: Tue, 11 Mar 2025 18:20:58 +0000
Message-Id: <174171719963.3723629.1526900223897615698.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250309070723.1390958-1-yuehaibing@huawei.com>
References: <20250309070723.1390958-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_112102_843795_79EED460 
X-CRM114-Status: UNSURE (   5.49  )
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

On Sun, 09 Mar 2025 15:07:23 +0800, Yue Haibing wrote:
> Commit fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host
> FPSIMD/SVE/SME state") removed the implementation but leave declaration.

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/fpsimd: Remove unused declaration fpsimd_kvm_prepare()
      https://git.kernel.org/arm64/c/31208bad3937

-- 
Catalin


