Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5B9D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uR0qBBya9n2hn4KShocfNDVywMEZPCsXXnuryu43XLU=; b=3ZmMGgVC2mPurNKT/n/Cjl1/Lk
	xShDJJSp5F8Z8AyjQ7NxQZgV2aU5ajvUY6ew5Aqmb7hdoivj3eGFMu679pQFf04VYtdhhXlfegKav
	MR/D5zXzhVqnoBfQ8eDsdyiSyPnHJcmyh+JsezS3ZCWnuWGD62yd0LkCwJ8I5ziy8PqsgN/j0yCAE
	FUvk27MvS67mSdGX/NKl/UsQ61jfsq8L4TPMq2+y9FnNQPuCDhoRM2f5Ify1PT+UtpFkqpmx9gyp9
	St7soBhA+yH9Fgj20ny+zJ61JIvXehytj+6N4LgOdtk/dRaey+tcUtU9hGNit0PN6Zelxd2vHwQPb
	l18Ipm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhTH-0000000H7bI-1lcX;
	Thu, 27 Nov 2025 19:16:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhTF-0000000H7ao-4AAV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:16:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE445176A;
	Thu, 27 Nov 2025 11:15:52 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 789993F66E;
	Thu, 27 Nov 2025 11:15:59 -0800 (PST)
Date: Thu, 27 Nov 2025 19:15:57 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org, Ben Horgan <ben.horgan@arm.com>
Cc: will@kernel.org, maz@kernel.org, Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH v1] arm64/sysreg: Remove unused define
 ARM64_FEATURE_FIELD_BITS
Message-ID: <176427094645.1018621.8573989847783838741.b4-ty@arm.com>
References: <20251125102732.1494863-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125102732.1494863-1-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_111602_070474_67EEEC4F 
X-CRM114-Status: UNSURE (   6.15  )
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

On Tue, 25 Nov 2025 10:27:32 +0000, Ben Horgan wrote:
> The define ARM64_FEATURE_FIELD_BITS is now unused and feature id
> fields don't always have 4 bits. Remove it.
> 
> 

Applied to arm64 (for-next/sysreg), thanks!

[1/1] arm64/sysreg: Remove unused define ARM64_FEATURE_FIELD_BITS
      https://git.kernel.org/arm64/c/27abb1ee5a4e

-- 
Catalin

