Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74599CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tka9Ot491SX4ZF8oVEkI5gIl6ySJps8F9a7/sAbKzbI=; b=bvDi2lHj0PWNhh7XH1VlDXehHL
	SC1XoNlD2d7C87Xwce57Oq0ilTah/yjfMlqFt0L7saVjFGko6YumELL8ocZZgTn6Rg1+42eks/eKL
	XhNHqbjo/gCiXuEdC797y5mYchlD8iwBiE0sTAjy2QlRIBW3ApRPh3D8TavHBjEC/Tl75bevT9l+l
	DHACe46Bt14nNR89bMEnEyI5P7pbrwr+J/TAN2FpXMNks59fJzfPX4BXYk0mxYYMwgPHJZm28/A85
	XDnorKkxrfpD9InSEfeS+db0+TSivkloYtH1kmS9GqxBkEoE5otU2qVgPCpqoMGI1Bo8VvDN3uY1L
	Bv03IbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VsD-00000004fRZ-2Xpz;
	Tue, 30 Sep 2025 08:38:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3VsB-00000004fQ5-3aYs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:38:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089D21424;
	Tue, 30 Sep 2025 01:38:01 -0700 (PDT)
Received: from [10.1.28.41] (Suzukis-MBP.cambridge.arm.com [10.1.28.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E44203F66E;
	Tue, 30 Sep 2025 01:38:06 -0700 (PDT)
Message-ID: <e21159ef-d438-4944-adb3-eb8e7c801d9e@arm.com>
Date: Tue, 30 Sep 2025 09:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, ilkka@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, mark.rutland@arm.com, treding@nvidia.com,
 jonathanh@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com,
 sdonthineni@nvidia.com
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
 <20250930002604.346306-2-bwicaksono@nvidia.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250930002604.346306-2-bwicaksono@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_013811_958058_811582CB 
X-CRM114-Status: UNSURE (   7.25  )
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

On 30/09/2025 01:26, Besar Wicaksono wrote:
> Add interface to get ACPI device associated with the
> PMU. This ACPI device may contain additional properties
> not covered by the standard properties.
> 
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Repeat: Where is the user ?

Suzuki



