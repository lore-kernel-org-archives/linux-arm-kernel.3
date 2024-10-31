Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CB7D767F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN8Xg10U0hJwzdbYn0VLyyefwmZ46aiJ79KkG/dl5eA=; b=hbzx9LoIk7YRR7Uno64/Wwh1Yb
	jSKZxoiQsUGUd9FP/hC4qJwGQLrfy7aS4/EYx1Y9N2BWdfOYqbmzbJx6TUTMc9Dh+Nns4uYNhPSds
	hkqXgpfVpKkn0YGL+0NtiSPfFPO3il0oVhc+0Hn9l2GAo2+JYI7/DP/Ahg1PfdVGE25sEkkjd9bs5
	PtDvKxBIk+lAirhQV3Ek5KfSSOyhO7Vg27pA96K9wHFrUCHvvZjwKIZ2Cv6enwhSWMxO0jXtUn3mN
	tyJQaj1tpr7ew/1eFmUCDcBYacgVQ3bBmSbzCa5rBMcDMQQegMru9NF1jdncxb3R2XYyVovYB5hdr
	/6Rzx6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6aW0-00000004aOu-3vGf;
	Thu, 31 Oct 2024 19:07:28 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6aUK-00000004a6H-2Bpe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:05:45 +0000
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 88002206941B;
	Thu, 31 Oct 2024 12:05:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 88002206941B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1730401542;
	bh=cN8Xg10U0hJwzdbYn0VLyyefwmZ46aiJ79KkG/dl5eA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=hpo6SU0afc10BLlq+7xOtaqNTlNryyZQ1hVTr2+F0JZkMwx6tqTL8xrReF0N6K2rS
	 vHSMJHOSxp9ExDGq/GZb95dKbKIUW276jmEdymGvMLyCodqFAUiZhHl17EitlPUL5+
	 XN7PgRReK+aW6PF7Bcp7ugC2kCaxM5XtYbtJB7r4=
Message-ID: <fc47d535-ed52-4ca5-80cc-30003efdd464@linux.microsoft.com>
Date: Thu, 31 Oct 2024 12:05:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: Re: [PATCH 0/5] Add new headers for Hyper-V Dom0
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev
Cc: eahariha@linux.microsoft.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, luto@kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 seanjc@google.com, pbonzini@redhat.com, peterz@infradead.org,
 daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
 bhelgaas@google.com, arnd@arndb.de, sgarzare@redhat.com,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mukeshrathor@microsoft.com,
 tyhicks@linux.microsoft.com
References: <1727985064-18362-1-git-send-email-nunodasneves@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <1727985064-18362-1-git-send-email-nunodasneves@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_120544_648480_8C753C11 
X-CRM114-Status: GOOD (  18.53  )
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

On 10/3/2024 12:50 PM, Nuno Das Neves wrote:
> To support Hyper-V Dom0 (aka Linux as root partition), many new
> definitions are required.
> 
> The plan going forward is to directly import headers from
> Hyper-V. This is a more maintainable way to import definitions
> rather than via the TLFS doc. This patch series introduces
> new headers (hvhdk.h, hvgdk.h, etc, see patch #3) directly
> derived from Hyper-V code.
> 
> This patch series replaces hyperv-tlfs.h with hvhdk.h, but only
> in Microsoft-maintained Hyper-V code where they are needed. This
> leaves the existing hyperv-tlfs.h in use elsewhere - notably for
> Hyper-V enlightenments on KVM guests.
> 
> An intermediary header "hv_defs.h" is introduced to conditionally
> include either hyperv-tlfs.h or hvhdk.h. This is required because
> several headers which today include hyperv-tlfs.h, are shared
> between Hyper-V and KVM code (e.g. mshyperv.h).
> 
> Summary:
> Patch 1-2: Cleanup patches
> Patch 3: Add the new headers (hvhdk.h, etc..) in include/hyperv/
> Patch 4: Add hv_defs.h and use it in mshyperv.h, svm.h,
>          hyperv_timer.h
> Patch 5: Switch to the new headers, only in Hyper-V code
> 
> Nuno Das Neves (5):
>   hyperv: Move hv_connection_id to hyperv-tlfs.h
>   hyperv: Remove unnecessary #includes
>   hyperv: Add new Hyper-V headers
>   hyperv: Add hv_defs.h to conditionally include hyperv-tlfs.h or
>     hvhdk.h
>   hyperv: Use hvhdk.h instead of hyperv-tlfs.h in Hyper-V code
>

What is the model for Hyper-V code that has both guest and host roles
where the corresponding hypercalls are available for both? As I
understand it, those are supposed to be in hvgdk*.h.

For a specific example, IOMMU hypercalls can operate on stage 2 or stage
1 translations depending on the role of the (hyper) caller and the input
values provided. Should a driver using these hypercalls import both
hvhdk* and hvgdk*? What about hyperv-tlfs?

Patches 4 and 5 seem to draw a bright line between host and guest roles
while the reality is more gray. Please do correct me if I'm wrong here,
perhaps the picture would be clearer if Stas' suggestion of a new header
file is implemented.

Thanks,
Easwar

