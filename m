Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F1AC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQmIsxeFEkSdP7cV18xIm97UzDqoTEAEGcDHNI/1RsU=; b=x31/gAZYvROIoeHLheIRyDQwHP
	ap/7NPZbTMy93lseoZjzlJq9Co2jdN/pqorSjXxkoZs4t2HR+5SWwGDfPtH+XGSoB7QykEGmPJWx3
	d1tKtf8irRRoh5glC0CaL0ubzo2y67xcDoOIR2X2UhetjzaLx7dzLA3aA+Ni4iI6xGqjLbvfIQhUW
	uRKxHeQQOYo+NnWPsMZaT1jztp1EfvsqXhI56D14QizQSduBCCq5HyRvMqrZPe4czu5gbU2AYk7lf
	k1WWgGtXgNDQiWKkRp0xjiNdmaAJxkVavOCj3sv7KYzNqZJbB+3H+3NgchgI2eaVgbJHsgN3wZuML
	8DjNrAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6mL-00000004Tec-0iJC;
	Fri, 10 Jul 2026 08:40:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6mJ-00000004Tdo-0Tru
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:40:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A7C1D70;
	Fri, 10 Jul 2026 01:40:04 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBF053F85F;
	Fri, 10 Jul 2026 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783672809; bh=Vrfha6a/wvRPJaZ4UkRBNv5gq9QhvAOUqgTI4ipo0mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg5JU9TKlCx8XNZ5bsggIPdE/EgxVBGKfQccZvkihY79vxpPQzPnW2Q9GzQC98UG5
	 m2O4kpoPfuJ1ZENVI3QVr5zpxVpelMiqemv9ma8XeM7+e+riIKno33WFmtxpi9EaFH
	 1W0fJ1si5wvzE5nuOuFH0JbYG7I9LmJ4S5JT8jsw=
Date: Fri, 10 Jul 2026 09:40:07 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Message-ID: <20260710084007.GI1024232@e132581.arm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_014011_194284_CF89B848 
X-CRM114-Status: UNSURE (   8.70  )
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

On Fri, Jul 10, 2026 at 10:39:01AM +0800, Jie Gan wrote:

[...]

> The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
> allocation for every platform-bus device. With the Aggregator TNOC now on
> the platform bus, that check would wrongly disable its ATID, even though
> the Aggregator TNOC owns the ATID that tags the whole aggregation path.
> The Interconnect TNOC aggregates trace within its subsystem but carries no
> ATID of its own, because the downstream Aggregator TNOC already owns the
> ATID for the path. So base the check on the "qcom,coresight-itnoc"
> compatible and let every other form allocate a trace ID.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

