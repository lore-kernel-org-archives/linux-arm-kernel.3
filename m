Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE2410775E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUuKxSErbsVuIxJB9EBHvpZHYxZGnraH5VCRfNINYl4=; b=vgc89LFPBTPIEadwoAJdn5DiKA
	GUVhT0/708WAJc0+Ukl06Gu9SEgGetyLsvABPLKTaNnsLGgjakjgJs6QUvviY8PWMx0GlVsZ8gPZG
	KqsbZHz6zXfu/NVHaqHh7aPnSW5IunvFPfHAsIPnU7m+ZdPWf2eOW9Qq5k7bRIiin02ndI0fkYrJm
	Or3YUTEOu8FkRx/HwWcvkoG/H92mZ2HvFwqXCgP/Mk0BQ8qA8VFft0CxCWR9r30SQjeKs84Gy56gG
	kyTauzVtRLT3tTGWRWMm1qgYIFPVP2VrOvXxgmJ1BbzZftAiTYDOk5Ir3UH5qrrpE5UCrepqTQ65n
	OVEUAMMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2u9M-000000090ZJ-2uLb;
	Wed, 18 Mar 2026 16:53:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2u9K-000000090Yp-2mUa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:53:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F4351BF7;
	Wed, 18 Mar 2026 09:53:31 -0700 (PDT)
Received: from [10.57.61.122] (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4D173F778;
	Wed, 18 Mar 2026 09:53:29 -0700 (PDT)
Message-ID: <6e7cd05a-2859-4225-a50f-07d62f84568a@arm.com>
Date: Wed, 18 Mar 2026 16:53:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_095338_741723_239DDAC0 
X-CRM114-Status: UNSURE (   4.78  )
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

And for those who like to use shrinkwrap the following YAML config
should work on top of the 2025.12.0 tag to pull the various repos. Save
the below as e.g. cca-v13.yaml and follow the usual instructions in
cca-3world.yaml but refer to cca-v13.yaml instead.

---8<---
%YAML 1.2
---
concrete: true

layers:
  - cca-3world.yaml

build:
  linux:
    repo:
      revision: cca-host/v13

  kvmtool:
    repo:
      kvmtool:
        revision: cca/v11

  tfa:
    params:
      RMM_V1_COMPAT: 0
    repo:
      revision: master

  rmm:
    repo:
      revision: topics/rmm-v2.0-poc


