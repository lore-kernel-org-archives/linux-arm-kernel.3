Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1E5D5B870
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gF3wyhlmta7Ho8rkDOvPc4bBIPEAjNGdCMZAhZdBnI=; b=DKQmUpLhK1E4NzeSWYN8xGLCoE
	P8MxiZKLZaHI3QQ+vmfbq79gN7olu7TB0DxhF9XSyOo4Xv7BLbcnRCoqe/laFBnrTW0KELqVFW2dT
	WwTDHO2z4hAx9lrySvUG75KVfj/82cr+veDkMKEWO46BnJzT5xyZx+7ag6JuHbs+cDcIAZoOTodDM
	0jRIvEZBe+C6ZvuE0h5MaviRIm/du+sJAe0FX6DXBlA1CNa1/RycIg7Pfvpn7fOenhkiL718OJCGg
	GoyqKiBQTmPrLqKpf+MbhZ9B7V6tj0LSvPP/thUNrYrLO/a41pHFLH1RtGmZPhqusciDOHSI02y6R
	n8Grirdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGCP-00000004In1-2p14;
	Mon, 15 Dec 2025 21:33:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGCM-00000004Imi-1e8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:33:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DE8CFEC;
	Mon, 15 Dec 2025 13:33:30 -0800 (PST)
Received: from [10.57.78.22] (unknown [10.57.78.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3AD753F73B;
	Mon, 15 Dec 2025 13:33:36 -0800 (PST)
Message-ID: <be79ca29-0233-4397-b3b0-38686512bc83@arm.com>
Date: Mon, 15 Dec 2025 21:33:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 02/35] arm64/sysreg: Define MDCR_EL2.E2PB values
Content-Language: en-GB
To: Alexandru Elisei <alexandru.elisei@arm.com>, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, yuzenghui@huawei.com,
 will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Cc: james.clark@linaro.org, mark.rutland@arm.com, james.morse@arm.com
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
 <20251114160717.163230-3-alexandru.elisei@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251114160717.163230-3-alexandru.elisei@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_133342_483684_2AD90406 
X-CRM114-Status: UNSURE (   9.74  )
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

On 14/11/2025 16:06, Alexandru Elisei wrote:
> KVM will make use of the different values for MDCR_EL2.E2PB, document them.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   arch/arm64/tools/sysreg | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 1e7b69594f04..0de8af0e0778 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3851,7 +3851,12 @@ Field	17	HPMD
>   Res0	16
>   Field	15	EnSPM
>   Field	14	TPMS
> -Field	13:12	E2PB
> +UnsignedEnum	13:12 E2PB
> +	0b00	EL2
> +	0b01	RESERVED
> +	0b10	EL1_TRAP
> +	0b11	EL1
> +EndEnum
>   Field	11	TDRA
>   Field	10	TDOSA
>   Field	9	TDA

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


