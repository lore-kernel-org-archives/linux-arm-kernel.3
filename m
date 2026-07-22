Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ADFC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6Ed1fhe7PW7ckJOG+hYO0SyywFktvNrPM+HhA2LjQo=; b=xmmL9hjkvUH+O9ej4hklN5zjaj
	0yP4lzhHVtrm1wRLmzkPOe2XX7UtkzPGDc7Sg8IWch3wuiTJgZLQraHtaAaqHGb6RhQAJ3uIXyUf7
	wJ7Q7YFCcj2Ol+HmrvHwZu6es2J1J3j0yQQAxIz4nAig4h+a3N0+2CO2Ar7lihbEeHoVK3bmkpZDs
	XHgi/s+x8ObZ/iIxdjemUjxjUI8ajES5rEw3+ETlKNT6oPQdcJq2flSqZRO67SsNZWfoYS9DQI6Yk
	f8NuNy2A5T1jWL70OhtKOPm+Sg+MVYRDoh67ce1DtnHyDoISVGEM42CH96CblaYq4SOv/rwuP8N1j
	2Auzf1hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmS7J-0000000BDS1-2rD6;
	Wed, 22 Jul 2026 08:15:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmS7H-0000000BDRU-2Tyo;
	Wed, 22 Jul 2026 08:15:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6D0D60A77;
	Wed, 22 Jul 2026 08:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E0C1F00A3A;
	Wed, 22 Jul 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708146;
	bh=I6Ed1fhe7PW7ckJOG+hYO0SyywFktvNrPM+HhA2LjQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m/UjfeqV7P0pT4AddZEvv2ntNn8VDrWWTYV3e+pKEv4pEe8sBrum5Ks/ifrw9ThMA
	 C8uH0jwfiimwFnbcpPD4eDTCjM3UW1B4R5icrhYreoVCK7mHao5Rax7eXU0l8pjTBg
	 YrSVusT2mFhtIiZm3ldNQgBLP4Ajt0oRkVmLBZVFtFVm0cteLUR5lFUefAo/d90boQ
	 H+81/pEhHWuArkrKZWP5Ynbqr/EoOD/GmRQwsmlTkCbonesDF8gJ5HWmT6Dj0s2eyl
	 43dl4lZFzlSaIdne+sYBR83G7UYQPmj7D3dvFdtr+tLq38DVBvRa2rm2+N44TcRfDm
	 gCuSOZInsw1hw==
Date: Wed, 22 Jul 2026 10:15:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Mao Jinlong <jinlong.mao@oss.qualcomm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: coresight-ctcu: document CTCU
 device for shikra
Message-ID: <20260722-astonishing-loud-labradoodle-bb59ce@quoll>
References: <20260722-add-coresight-nodes-for-shikra-v3-0-1400a3454e9f@oss.qualcomm.com>
 <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-add-coresight-nodes-for-shikra-v3-1-1400a3454e9f@oss.qualcomm.com>
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

On Wed, Jul 22, 2026 at 09:13:47AM +0800, Jie Gan wrote:
> The CTCU device for shikra shares the same configurations as SA8775p.
> Add a fallback to enable the CTCU for shikra to utilize the compatible
> of the SA8775p.
> 

This is not arm,coresight-ctcu. This is qcom,coresight-ctcu, so the
subject is:
dt-bindings: arm: qcom,coresight-ctcu: add Shikra

I already pointed out this problem at v2. Nothing in your subject is
telling this is Qualcomm! Not even mentioning such trivial mistakes as
lowercase shikra everywhere.

I also do not understand why you add so much redundant information to
subject. Subject space is precious.

No, at this point you should not make such mistakes.

Please take this feedback to your entire team, so I will not have to
repeat the same exactly next time.

Best regards,
Krzysztof


