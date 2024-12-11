Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2654CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH1rOE9whekIQJEwMaPyGRrQPculgugdyUvy6Sea6pI=; b=YZcIl+0Ifl3bKjVHMlw1vYzQkU
	5SKi2KaSbSD0ZQu7/q4qxMXUyj4Wb/UjO0ydMoUClDK05jBhSFDrfon+vj8vLlJDVGYiYvI3dNxgF
	6zPfvjjpeXsRhM/3qBQBoFBwoCIK0srhwQI83JnOFUdYbV47p6C9oYVoDUrK+eEKjD5wAPdGLYEIc
	aOT786VQVa8DtnyzADdXdPyBjup0X2mgI7RpfayukiUpdpksxroQgEKDmqtDMku6e4d8g8NndNqLo
	TicY+Z9UA5+aJVS0Icf0v99gmDDDMBXLwO7y2lVWytAJHSbWqtFZWZ2Q5f1sFa/isXMFFhUu2mOGG
	y3jpHtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIQ9-0000000EHcp-2Vjz;
	Wed, 11 Dec 2024 08:50:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLINv-0000000EH5O-33lE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B74DB5C664D;
	Wed, 11 Dec 2024 08:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CF0C4CED2;
	Wed, 11 Dec 2024 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733906874;
	bh=KVhmteNEHcOPz5cljjEj4xcA3NrjZZYzaVqrSUqxelc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnjETjGAk1VuEJZ9wePQ6s9JAtCq0q8SMrZkTWH+BYdJegNKLPcodnvnVyBZuNgt6
	 T0HNa4hYQgVyjFYRqfRkF7FszeC/y0r4evDD16peovgTNp6TUSXLFdo+wSwoO963Rj
	 CrrMEiwvodShjHOPwL6bqVFcmv5oRvH2hgkboNLf9DDfq4j6Jb5sisO0tJXEfKgJxn
	 sTFm7u5LS5HZR/8flFdsIH4Eo+v6TOTzxedqEZersA2BmF5IHxmtW/n+7N/21ObKJD
	 kyg0aBMmxye7nILu6Xm7WgjHC/1BwJd+8iYYmeXR8XJzZ/ED9YHn4a5Ty2M/iv0wA+
	 +MSd5n5vTXQag==
Date: Wed, 11 Dec 2024 09:47:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: Add label in the coresight
 components
Message-ID: <ee5g6cy3kpwwyhlop7ex7zm5fombbmqbvp34exhm6dv22v5fwh@5o4xxwam3mnk>
References: <20241210122253.31926-1-quic_jinlmao@quicinc.com>
 <20241210122253.31926-2-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210122253.31926-2-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_004755_808056_DC588648 
X-CRM114-Status: GOOD (  12.05  )
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

On Tue, Dec 10, 2024 at 08:22:52PM +0800, Mao Jinlong wrote:
> Current name of coresight component's folder consists of prefix of
> the device and the id in the device list. When run 'ls' command,
> we can get the register address of the device. Take CTI for example,
> if we want to set the config for modem CTI, but we can't know which
> CTI is modem CTI from all current information.
> 
> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
> 
> Add label to show hardware context information of each coresight
> device. There will be a sysfs node label in each device folder.
> 
> cat /sys/bus/coresight/devices/cti_sys0/label
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>

It is impossible to figure out what changed here comparing to previous
version (see details in cover letter). I will skip the review.

Best regards,
Krzysztof


