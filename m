Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D610106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otHm6iBBdZTkONemlTEdVE3mcM2dyjGOi1lxF/VFDqU=; b=TvEoSFr2bNLJjoBDAnpLbUXOSi
	PvJFhtigjG/qek2nn64RR5f1HRn7JlfVI745cAjpIKQnnnZOMgcyXNnTKy1ixyUpejmZBeAMZ8go7
	hfmFgzMHYg69jZlrirp+eaW/pymz03da7KkU694LRQTQ6FHfsV5uljbMR+bU/R7CtVLkhO8BLDWhV
	Ec8msmEewQLdyDYWfhDSInbDqCYs6ubYp2pRJCfh4mg4E54kPM4CQUq8IghDOR+YcfK8aNSfg7Sq7
	1Vr32fTUsiy/aA9T93L+6LqVwtQZBUYS8MlIb37k0bvH1g8ZEPRB8CMBTmtBtpb8TPzLr3uuwwzy8
	/UqJqRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gq5-000000057fC-35qM;
	Thu, 26 Mar 2026 09:17:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gq3-000000057et-1alb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:17:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8315B4375E;
	Thu, 26 Mar 2026 09:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DC8C19423;
	Thu, 26 Mar 2026 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774516634;
	bh=G84K/2M3CxqOxKC7wFqRvw5LwHGm2WI3SpgTvoWdTSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXbBplnWaJ1/yqn6Q5pwHu63DJmf1A/wrAAGtBTZmoUNjsALP6A9ugvbzRMPO983W
	 QKVmbMTufJ8DEIXN0q/ofqgO0avz8haV+KlYnD+tOEAtLcpEraKR+P1FE4ouX2zAY4
	 6ll3Qck3faqm7e2ImgHmYMTOyvVLbqbCyoWNOqVc2wEO+4dOaB1N7NhXWDDJo442eY
	 LPw5fydYLQNf9UELoGZ+K1RM5bz6EnXxjpC/dgOjhipx0sGrIb0p1yp60eX+CK4/jW
	 4WpzAECLTQspALtlhFGToqkNNoLodEDdkYqbh5BfGRBfXl0LwgzqyHtZIs9nZf8S82
	 Nm00FCmfAmiuA==
Date: Thu, 26 Mar 2026 10:17:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bhargav Joshi <rougueprince47@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	xuwei5@hisilicon.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ulf.hansson@linaro.org, zhangfei.gao@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: hisilicon,hi3660-dw-mshc:
 Convert to DT schema
Message-ID: <20260326-overjoyed-chocolate-bobcat-6c41e6@quoll>
References: <20260325225439.68161-1-rougueprince47@gmail.com>
 <20260325225439.68161-2-rougueprince47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325225439.68161-2-rougueprince47@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_021715_463170_3CDE9CD2 
X-CRM114-Status: UNSURE (   9.99  )
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

On Thu, Mar 26, 2026 at 04:24:38AM +0530, Bhargav Joshi wrote:
> Convert the Hisilicon DesignWare Mobile Storage Host Controller
> (dw-mshc) bindings from text format to DT schema.
> 
> As part of this conversion, the binding file is renamed from
> k3-dw-mshc.txt to hisilicon,hi3660-dw-mshc.yaml to align with compatible
> string naming conventions. Examples have been updated to pass schema
> validation.
> 
> Note: synopsys-dw-mshc binding specifies clock names as "biu" followed
> by "ciu". However, this Hisilicon binding reverses the order to 'ciu'
> then 'biu' to match both the legacy text binding and in-kernel Hisilicon
> DTS board files.
> 
> Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> Acked-by: Zhangfei Gao <zhangfei.gao@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


