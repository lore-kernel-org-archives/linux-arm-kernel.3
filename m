Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A40D29DFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASfauueh0XdWrVonVrlS9CUPp8nU14MBJWlVvobTYkY=; b=2FCFbh74r//p9iM7K51LgaaCLC
	jrQAFThyFi0QVAJIdTwWYlFxjQIC+hbWiLK9R6y8stxb4OLF5V3J0bNuSwXB1AH3CTWXroBvemUDH
	qCAXZrvpUG9mIaFEgFolAW2Cl4m+CaYwvuz/Gj1ajqzoMB3oZvJWtI+Lv0yjXLq203jxHlJPIgi8N
	4g2dMPj2tpAtqctvAMMzuEK+7zvz8jIjpZVpPBlSHkw6YYZQnc354pTY1ivu3U9RVaCNge1Nzz8jr
	unwhWgib3N6jVyiek1kdceUm8jmRIopc3RezqhWlSQlmXZzkTWM1fTILo9oRA8ydCbbq53+1a2nP1
	7So3543Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbHC-00000006sRg-1hIj;
	Tue, 13 Jan 2026 10:05:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbH8-00000006sR6-0Y5g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 10:05:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25DCF497;
	Tue, 13 Jan 2026 02:05:13 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9488E3F694;
	Tue, 13 Jan 2026 02:05:16 -0800 (PST)
Message-ID: <dcbeb11f-bebe-465a-be4e-2461d3efc21b@arm.com>
Date: Tue, 13 Jan 2026 10:05:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/30] KVM: arm64: selftests: Remove spurious check for
 single bit safe values
To: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-27-8be3867cb883@kernel.org>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251223-kvm-arm64-sme-v9-27-8be3867cb883@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_020522_209097_7AFC3F32 
X-CRM114-Status: UNSURE (   9.10  )
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

Hi Mark,

On 12/23/25 01:21, Mark Brown wrote:
> get_safe_value() currently asserts that bitfields it is generating a safe
> value for must be more than one bit wide but in actual fact it should
> always be possible to generate a safe value to write to a bitfield even if
> it is just the current value and the function correctly handles that.
> Remove the assert.
> 
> Fixes: bf09ee918053e ("KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user")
> Signed-off-by: Mark Brown <broonie@kernel.org>

Yes, this assert was unneeded.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben


