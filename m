Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD24E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 05:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmWPQyjFRGq2DUlJdZzT4Pg3mAFKTaqENTg3HM7bGXs=; b=yVegz7OxAFf1E7SgxmSy17KgFl
	kagVDmXKP6jmAyUwm0rUrij16RbLHYRhHvRFajh0g210K2hGcXHii/LMN2InGzLZmdZiVFFSkfS5W
	YPNaNxcptksvxDoZzisPECOmM66OpuYa4Bl43/PXiJpZre2g7KZDEpfSokW/NC5tm7r5qJY3iXzRZ
	am8OdzUIa7wgZ5+j55zrHUKAFNC/OQ+4zjOEl24HYeKyNWBNceaIVmBqDCj1P/Be8PlkqmgtllbMs
	qJQbDDhIkRsvrduX/FuMUuUDeO2IBwRh/jxo5gm3XuWe+Ie4c1AAq88E1DkcXxsaqyUGGF+d3WEyg
	lGk+LVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQhD-00000000b8h-2ffh;
	Fri, 06 Dec 2024 05:16:07 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJQfr-00000000atD-3FKh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 05:14:44 +0000
Received: from [100.65.0.192] (unknown [20.236.11.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id DCC3E20ACD8D;
	Thu,  5 Dec 2024 21:14:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DCC3E20ACD8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733462083;
	bh=fmWPQyjFRGq2DUlJdZzT4Pg3mAFKTaqENTg3HM7bGXs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Hvh0dBNKckDBScVZZN9FBPxjIwxRPRWAjIktBLN2y3fC5OvW2S67m+oj9qsZDT5hY
	 5k/by83lopTusK+LIkgRxkvpxQHZO4xGi0XNZqz+P31Fxv45dLNto6oVXCgd8Spwwi
	 Q6b3836tPEjA0ievdJvUdmCOWAGIQMGjSvBrFuZA=
Message-ID: <92399e62-e07b-48eb-9a96-9747ad5b6eb7@linux.microsoft.com>
Date: Thu, 5 Dec 2024 21:14:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, mhklinux@outlook.com, decui@microsoft.com,
 catalin.marinas@arm.com, will@kernel.org, luto@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 vkuznets@redhat.com, ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 horms@kernel.org
Subject: Re: [PATCH v3 5/5] hyperv: Remove the now unused hyperv-tlfs.h files
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
References: <1732577084-2122-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1732577084-2122-6-git-send-email-nunodasneves@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1732577084-2122-6-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_211443_842014_CF7283BB 
X-CRM114-Status: UNSURE (   7.61  )
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

On 11/25/2024 3:24 PM, Nuno Das Neves wrote:
> Remove all hyperv-tlfs.h files. These are no longer included
> anywhere. hyperv/hvhdk.h serves the same role, but with an easier
> path for adding new definitions.
> 
> Remove the relevant lines in MAINTAINERS.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> ---
>  MAINTAINERS                          |   3 -
>  arch/arm64/include/asm/hyperv-tlfs.h |  71 ---
>  arch/x86/include/asm/hyperv-tlfs.h   | 811 ------------------------
>  include/asm-generic/hyperv-tlfs.h    | 883 ---------------------------
>  4 files changed, 1768 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/hyperv-tlfs.h
>  delete mode 100644 arch/x86/include/asm/hyperv-tlfs.h
>  delete mode 100644 include/asm-generic/hyperv-tlfs.h
> 

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

