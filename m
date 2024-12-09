Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82ABE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpCLso0dvgt5vrfEayDrp9rsxggY7KzZAdV8T8BxB1g=; b=LcJ4RufMds+dAa1pAp2Y9W84Hw
	VZaxvz9F9w+couAivw5fIYi+SkAfvrlR9qLzbXnn30ndpFY0TJkWBbm3p9WPS+GMIIfhKprsWKOiZ
	D2hoZUZLoGZXilNaMgW0Mgw3fgNoBsu6QPuQ1oPYMOLLcCSS9hhS4V0r6gq9bLloknzo3d43LYcN+
	Ea2ukIKFWVVXQHVCmaHM563dpQeT2ZuL5ElNbUaDlQxxx/MV+/JjKTqYs7K/vIaTSMLld0K1BlpOS
	IBMyhqqKkcawvaSTINPlxMxwHJOdEd2lwPVQdzjXuKtLVJwCA0Jb3qo9A5obMNlTq01PcUYcDfVIz
	J/Eg95Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjSr-000000093kx-0mhU;
	Mon, 09 Dec 2024 19:30:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjQq-000000093DN-29eo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:28:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B4ADA41906;
	Mon,  9 Dec 2024 19:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94382C4CEDF;
	Mon,  9 Dec 2024 19:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733772515;
	bh=Ecr9Ga4tDbOcrE56razzN6OYgts0gggFDhJi6sp6Dpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oxqnPbwcHnk1nnKa2cdfHb/TUVTqC3KfD9jnGxhAtIpKN0El9mihuiwLY5kfa+HDb
	 iYEx80Fcf/yxaggoPZ/XaW9bF3epWOjCI3dAP2K7JxP8ewUQaSRX4ueGu0aqKANIlY
	 Gu+yS3O509kYDFhUaG+hUU9ypG4PE5G9083Ta5Tjg0Y6bMU+TNwGwH/r5hkOI58Uyz
	 VJFiIKTutSmq8KfYbtBkZD/2iQDup//pIsn3zxuhJe1Dc87ovOTqiQdlfK93sRLJcP
	 cAdcNWbv+JwDQvmRzSwTDcXRTWMNhgY8df7DzNqUxXwJSgSD9k129kcMb4lqQnsJym
	 kSSYdSgo+PACg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] dt-bindings: arm-smmu: Document SM8750 SMMU
Date: Mon,  9 Dec 2024 19:28:25 +0000
Message-Id: <173377196863.3924800.3062631537742309660.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241204-sm8750_master_smmu-v2-1-9e73e3fc15f2@quicinc.com>
References: <20241204-sm8750_master_smmu-v2-1-9e73e3fc15f2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_112836_612511_1B0F219A 
X-CRM114-Status: UNSURE (   5.47  )
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

On Wed, 04 Dec 2024 14:27:25 -0800, Melody Olvera wrote:
> Document the SM8750 SMMU block.
> 
> 

Applied to will (for-joerg/arm-smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Document SM8750 SMMU
      https://git.kernel.org/will/c/2593988fd00e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

