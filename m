Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDA8D6ACED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQiVTxf/UxO0RL9PaIKxyv0uTI1jtIF12yFkdyua/hw=; b=CptKF80D/7kevZ2S8r6dA+BJJA
	03kPO4Qp+YRvQhdpUJAC3uG9ffpUMPjwygbJX3TIYGW+QjEhEYA3EnuYqqWipMX4iN55ol/sZBpo9
	Xle/J2TG14tks4GrUSLKvpdg2c5oLxvWuUTiECr7lJVyYBXAb4DlLa2nmtNCoO8/NAbXpqwmVY3dx
	T+odT1hZrDkpyZyQZ+f/POy/CGH2iauXATdiLgoGQ+oEUQXbX7IUg+5A4ieZk/RuBWcbQOOPmSPyH
	Kc8uW4z05XEPMum1SwN0z0VEBHI/5piAlV3hMvWGorQwyOoNg4jypKrp46m4aO2weMLP9vk+a+U0X
	S15Gd6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCKd-00000008LvA-3Ttu;
	Thu, 18 Dec 2025 11:38:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWCJq-00000008Kis-2WAz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 11:37:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B0F3FEC;
	Thu, 18 Dec 2025 03:37:09 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 890373F73F;
	Thu, 18 Dec 2025 03:37:13 -0800 (PST)
Date: Thu, 18 Dec 2025 11:37:10 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, maulik.shah@oss.qualcomm.com
Subject: Re: [PATCH v2 01/12] dt-bindings: arm: coresight: Add
 'qcom,cpu-bound-components' property
Message-ID: <20251218-silky-skylark-of-purring-20faa5@sudeepholla>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
 <20251218-cpu_cluster_component_pm-v2-1-2335a6ae62a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-1-2335a6ae62a0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_033718_740119_A29C2CD4 
X-CRM114-Status: UNSURE (   8.99  )
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

On Thu, Dec 18, 2025 at 12:09:41AM -0800, Yuanfang Zhang wrote:
> Introduce the `qcom,cpu-bound-components` boolean property for CoreSight
> components (TMC, Funnel, and Replicator).
> 
> This property indicates that the component is physically located within a
> CPU cluster power domain. Such components share the power state of the
> cluster and may require special handling (e.g., cross-CPU register
> access) compared to system-wide components.
> 

NACK, and the rationale expressed as a question:

If unique compatibles were required to determine the power domains to which
devices belong, we would have accumulated numerous additional compatibles for
every IP block used on new systems with even slightly different power-domain
configurations—a scenario that occurs frequently. Why, then, is such a
requirement considered necessary in this case?

-- 
Regards,
Sudeep

