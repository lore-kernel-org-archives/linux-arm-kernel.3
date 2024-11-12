Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D395AD42BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HN6UMDiF/G3BBYUogMzlIKxngWjRV1hUrd09f9fTtk=; b=XcjRfucppY+N8BjgEc897VEbth
	jX36T6eG3t3KmD0KaCEZLg/O4wbZY3RDFCusW5Q/bMX61iI7F6SBXplH1eb7IuZQilZtW0kbK/c6E
	csUQGSS6wWZLYy3DRIJi9AaEFtgdDT1Q+zAQV+LKmxlzUhCuC4FhSwGxt3MHIRfam0BC5RmJ3I3Xm
	2Sy8QrC9652Ri5qbs/Ab+zdzH37LUWoRfmHpHLWNMq8h6yvZJxOI5yvAap+t7Dq3dRYLcpIxmwbWi
	B9485+nsfNddTdvsdyqqM48bw6mMxH2SKI/WhQ8thtuEcaFXbGw/+7/QUbqwVvC7iRrqgRhtQ0Eff
	N1v9v5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtTe-000000045ay-2Xny;
	Tue, 12 Nov 2024 16:10:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtQe-000000044vg-2vAt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A7AEA41E20;
	Tue, 12 Nov 2024 16:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 815A0C4CECD;
	Tue, 12 Nov 2024 16:07:41 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] kselftest/arm64: Avoid detecting spurious PAC key collisions
Date: Tue, 12 Nov 2024 16:07:30 +0000
Message-Id: <173142698242.893467.5937732812824342152.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
References: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_080744_894746_DBBD33BB 
X-CRM114-Status: UNSURE (   8.69  )
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

On Mon, 11 Nov 2024 16:18:54 +0000, Mark Brown wrote:
> The PAC tests currently generate a very small number of false failures
> since the limited size of PAC keys, especially with fewer bits allocated
> for PAC due to larger VA, means collisions in generated PACs are
> possible even if the PAC keys are different.  The test tries to work around
> this by testing repeatedly but doesn't iterate often enough to be
> reliable.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/2] kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
      https://git.kernel.org/arm64/c/27141b690547
[2/2] kselftest/arm64: Try harder to generate different keys during PAC tests
      https://git.kernel.org/arm64/c/91a6533811bb

-- 
Catalin


