Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8682EE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 04:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8I2rQorK84jvjEJbcuaLRCvwwTP+qE8HLCkY4BTOCc=; b=uzAJxxnNbK+wuDe1RuILdOCX3L
	QvP319MXfkIhU400X6jHGz1B7SjEpCQd82+ydb9kYvOTH3egvByHXIN8SOcb2SbDq3ijy2TUiDJ0w
	q3abCcivKCtumfHM9aGH42Rp0t4oLwCMFcS+clkF9zRPetSerjTuvcXMCygHqr25tcZOAvhjlfbs9
	cX6fa7AbKwTubNYqXgRn0hgvdaZsoAvN7wtZIQSVJ0BxZJo5Ua9b900T6Mq9n6+TL1ZB9Wm6sMJ22
	6LHDVoqi9R69IUPQC4LYCNZba15+YbAh70jTElE9wOQaziKjbQdLbs2P+qwZdK5prJZWcBAS0WHR6
	CaBllMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNxY-000000078Le-1yYu;
	Wed, 08 Jan 2025 04:46:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVNvA-000000077vL-2aLb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 04:43:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3296DA40443;
	Wed,  8 Jan 2025 04:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CB8C4CEE0;
	Wed,  8 Jan 2025 04:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736311435;
	bh=Nt9n6OFFngcM6fJ+1coEAz3RG34SDG5OzdYvdtKxFTU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uIuHzube6FFXvTqSBOzhxqiJlv4sLDN/IO/7UVNe4xiq9EGI2p6cMdqm//I0dnAMz
	 fyJXuPnwAJ+9o7B+6mS5Vf+GA8e1YeGaMz/jrGLPmZl6IqqgqmB9d0XMUqTBwYr4MU
	 r6d2tBtIEESqBG786dCS9x2uNHqYYi6gVMKXy8x2mDhh1xPUVlZu37fbGn9uuPpw1p
	 PGL9B4ZhJ7VP9B38Ent5vXRtoJjEjYoZPBTnCb8KezQtz7FU1wnGOa9U4Lp8LZc+Ux
	 0wWJ2XX2pOFkldbNE+71BpKMy7nYI6Rk1DrVSC8WVS4LuZD5CQcXveSCjDRP8ygdMH
	 zsAfLOgXdsKfg==
From: Bjorn Andersson <andersson@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/2] arm64: dts: qcom: sm8450: Add coresight nodes
Date: Tue,  7 Jan 2025 22:43:44 -0600
Message-ID: <173631142080.110881.13477857225974895219.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
References: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_204356_728329_3FB72389 
X-CRM114-Status: UNSURE (   8.51  )
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


On Tue, 07 Jan 2025 17:00:29 +0800, Mao Jinlong wrote:
> Change since V5:
> 1. Fix the &CPUn vs &cpun issue in device tree file.
> 
> Change since V4:
> 1. Use ^ete(-[0-9]+)?$ for the pattern of node name -- comments from Krzysztof Kozlowski <krzk@kernel.org>
> 2. Update commit message --- comments from Rob Herring <robh@kernel.org>
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: sm8450: Add coresight nodes
      commit: 6e8637db89bf138a0533b5442d9a0b02afa5e3e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

