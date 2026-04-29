Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D969FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Mbs6nnSPAtYZH2MrtVmjuByqD6wfsEvVcDl8PKguno=; b=GjurfuafbgR3ownMzYLl7o6E6E
	yGFNSnASUdm80wiUmKmEPl4QVYjt9/0Q/9V9He7XvmgrAXcutk46r7tnmy2f1ZHkiqksn3j1UXDN0
	zpMlTrJCU6iVb7G5YCwBHDDJOIdDc4g9LKsrwKSiZKWbe+10iyKEsYCJver1f7n83cbfmVtb1VEUR
	0NlFYWNFRSm11meijY3hxnQW2Rv3mPh+AFxxpOHh7S7NtPReARXGu9MxCBtUqUMNdWygFxS4MQiq2
	M38Ciu2/ZclgWtEoEmRJN1JRfeOjlKwRuMc+Fjdj9cf26GNNwDjA5d3wTuXAXpGCiYAs7wJMizUWV
	VeH3Te4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzuG-00000003DG9-30Go;
	Wed, 29 Apr 2026 08:04:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzu7-00000003DF7-15Ju
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 08:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 710F540A38;
	Wed, 29 Apr 2026 08:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3870C19425;
	Wed, 29 Apr 2026 08:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777449858;
	bh=/Mbs6nnSPAtYZH2MrtVmjuByqD6wfsEvVcDl8PKguno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9TW56aaScXCHZWjY12alb2kTRIhAmOXkTywiKUTykAc2clCKHniHVQEouWegLuj7
	 V8eyVhzmFTrpwK62bkLZ+dyU6Qey7QSmRbwdUlPkWExOGmBSYiZGvg9Hb4nCKLdVBo
	 F85GYiDlf46r/1p7eOghAY9EB36txGkmqE7JDVdCAUeG5GR9KCacTbt/7FACPdUs0X
	 qYJgxuTPuNuIj7UURXS4b68k2f/qVWd4lGUQqBZhXRScizrdCOhDt1OEXEeCNZApdT
	 JI2teFdkNgKU3/JvLzuLFZh5LIOmg4q35LxmwB6NnUIxe0gL2VOOnNV8SljAp1pVAG
	 tbSdnROA8K4Tw==
Date: Wed, 29 Apr 2026 10:04:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, peng.fan@nxp.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: add imx-rproc-psci
 binding
Message-ID: <20260429-lyrical-chubby-cuttlefish-a69eae@quoll>
References: <20260429031047.30893-1-Jiafei.Pan@nxp.com>
 <20260429031047.30893-2-Jiafei.Pan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260429031047.30893-2-Jiafei.Pan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_010419_316350_5B15E046 
X-CRM114-Status: UNSURE (   6.10  )
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

On Wed, Apr 29, 2026 at 11:10:43AM +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.

So here is v2 and almost all comments apply.

Including one that it fails obviously testing.

Best regards,
Krzysztof


