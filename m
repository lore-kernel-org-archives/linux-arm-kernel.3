Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35627C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W4cUhjFcmhZAGlCJ9yvwP79Ht1+Cn3EZA4uPRmdUjw=; b=zGV16EiuOEbcUgGom2Z7GSYQW8
	wenP3/5HRoX8Z4/NXuGovnu/SZBzYpniWTew27Q6lWDouAayK/ihlykn5OSD4O9snKaXj8qS/vE5E
	v5FCfyDUU3ubE9kA3Vbs24UnepTr5FDwvuBJUNNEKJsPTF+84jLCCYHDgDVFjSdeKxS/UzZ3PyBJb
	qEoDS8vU2LaFjW2Vxs1bzXV9f9k5O+WuAwdk1v8vtpTAx6z2WhEdtRQZM9o+M/HuepGSAeTfkvSNt
	+XJUw+KfCJ92T8iBVBz1dsZ8yPGMhMEmB4oyNA4ESq41OMAksm6mIy32A/ZLDG3qeG6R830uHNHXy
	kwJ6rbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbje-0000000Ex7K-06wy;
	Wed, 06 Aug 2025 10:51:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbed-0000000EwNk-3Oo2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:45:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBC431E8D;
	Wed,  6 Aug 2025 03:45:44 -0700 (PDT)
Received: from [10.57.2.47] (unknown [10.57.2.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEAD53F738;
	Wed,  6 Aug 2025 03:45:50 -0700 (PDT)
Message-ID: <6b4380a1-02c0-4f80-a11a-8af1c99d8b17@arm.com>
Date: Wed, 6 Aug 2025 11:45:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/2] coresight: Add label sysfs node support
Content-Language: en-GB
To: Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_034555_911237_F4751485 
X-CRM114-Status: UNSURE (   6.32  )
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

On 06/08/2025 11:26, Mao Jinlong wrote:
> Change since V9:
> 1. Replace scnprintf with sysfs_emit.
> 2. Update date in ABI files.

Please note, this is not going into v6.17. This would
rather be v6.18 material

I would recommend, resending the series at -rc1, with
fixed dates

Suzuki



