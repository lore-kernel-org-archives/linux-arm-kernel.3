Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01754C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJiBv8XSAbDejvyWt6h5EOr/JgFNWZ704rR8tn5DIpI=; b=gV6M98XHypFj/WBiR0S3J9NkYn
	RFTGa6ddqWkUF7ck4fd42UOR4BNJPXuwUreiiKTh6TU72/QPJNzPHQsDK6Fbn5dkAr6WWg1cO9o88
	C+ZwfQ7eT7cmrCDrWmhAoLrcvrRF9vTYBzgBcgT3T11OoR9gTtG8l8I1u3JNZ5af3PMTPgsmCEZdq
	5Mx4NW/ORD6nIC1Y4oVTd24pdQzqxZLxrv+Fhsuy3E+UyCOwAB6zbjW2PodAjBwGLkTBkOeMswXIz
	BwNLUXFy4t2D0EuTyeEeNyJVCxE3uhkojWo5S9i4Z0I2W0zjlSIGTeuHUhtmKFiMcHhIjF6QypyqW
	QNkt/42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoPV-000000086lE-0c93;
	Wed, 05 Mar 2025 13:03:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmZP-00000007nXE-0Evg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:05:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4267BFEC;
	Wed,  5 Mar 2025 03:05:59 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CBD73F673;
	Wed,  5 Mar 2025 03:05:43 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Jinlong Mao <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v15 00/10] [subset] Coresight: Add Coresight TMC Control Unit driver
Date: Wed,  5 Mar 2025 11:05:31 +0000
Message-ID: <174117263579.1942819.17038167511866554035.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
References: <20250303032931.2500935-1-quic_jiegan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_030547_144193_A46232D6 
X-CRM114-Status: GOOD (  10.16  )
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


On Mon, 03 Mar 2025 11:29:21 +0800, Jie Gan wrote:
> The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
> registers to control various features related to TMC ETR device.
> 
> The CTCU device works as a helper device physically connected to the TMC ETR device.
> ---------------------------------------------------------
>              |ETR0|             |ETR1|
>               . \                 / .
>               .  \               /  .
>               .   \             /   .
>               .    \           /    .
> ---------------------------------------------------
> ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
> ---------------------------------------------------
> Each ETR has four ATID registers with 128 bits long in total.
> e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.
> 
> [...]

I have applied patches 1-9, leaving the DTS update for the platform.

[01/10] Coresight: Add support for new APB clock name
        https://git.kernel.org/coresight/c/dc872c5f
[02/10] Coresight: Add trace_id function to retrieving the trace ID
        https://git.kernel.org/coresight/c/c367a89d
[03/10] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
        https://git.kernel.org/coresight/c/182e8c70
[04/10] Coresight: Introduce a new struct coresight_path
        https://git.kernel.org/coresight/c/3c03c49b
[05/10] Coresight: Allocate trace ID after building the path
        https://git.kernel.org/coresight/c/d87d76d8
[06/10] Coresight: Change to read the trace ID from coresight_path
        https://git.kernel.org/coresight/c/7b365f05
[07/10] Coresight: Change functions to accept the coresight_path
        https://git.kernel.org/coresight/c/080ee83c
[08/10] dt-bindings: arm: Add Coresight TMC Control Unit hardware
        https://git.kernel.org/coresight/c/166df2a1
[09/10] Coresight: Add Coresight TMC Control Unit driver
        https://git.kernel.org/coresight/c/f78d206f

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

